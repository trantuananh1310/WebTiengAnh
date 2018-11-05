<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/sweetalert.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
<script language="javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script>

<link rel="stylesheet" href="css/sweetalert.css">

<script type="text/javascript">
	$(document).ready(function() {

		$("#btn_score").on('click',function(event) {
			event.preventDefault();
			var countInput=$("input[type='radio']").length;
			var countQuestion= (countInput/4);
			var countCheck=$("input[type='radio']:checked").length;
			var input=$("input[type='radio'][name='answer[0]']:checked").val();
			
			if(countCheck < countQuestion){
				swal("", "Bạn chưa trả lời hết các câu hỏi", "warning");
			}
			else{
				$.ajax({
					type : "POST",
					url : "checkScoreReadQuestion",
					data : $('form').serialize(),
					success : function(result) {
						$('#check_form').hide();
						$("#btn_score").hide();
						$("#btn_tapescript").hide();
						$('#result_score').html(result);
					}
				});
			}
		});
		
		$("#btn_again").on('click',function(event) {
			event.preventDefault();
			window.location.reload();
		});
		
		$("#btn_tapescript").on('click',function(event) {
			event.preventDefault();
			var countInput=$("input[type='radio']").length;
			var countQuestion= (countInput/4);
			var countCheck=$("input[type='radio']:checked").length;
			var input=$("input[type='radio'][name='answer[0]']:checked").val();
			
			if(countCheck < countQuestion){
				swal("", "Bạn chưa trả lời hết các câu hỏi", "warning");
			}
			else{
// 				$("input[type='radio']:checked").each(function( index ) {
// 					alert(index);
// 					alert( index + ": " + $("input[type='radio'][name='answer["+index+"]']:checked").val());
// 				});
				
				$.ajax({
					type : "POST",
					url : "checkAction",
					data : $('form').serialize(),
					success : function(result) {
						$('#check_form').hide();
						$("#btn_score").hide();
						$("#btn_tapescript").hide();
						$('#result_score').html(result);
					}
				});
			}
		});
	});
</script>

</head>
<body>
<%int i=0; %>

<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.1&appId=725974994429230&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

<jsp:include page="../include/header_middle.jsp"></jsp:include>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 menu_sidebar_left">
					<jsp:include page="../include/left_sidebar.jsp"></jsp:include>
				</div>
				
				<div class="col-sm-6 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Vocabulary</h2>
						<c:forEach items="${lstContent}" var="item">
						<div class="container col-sm-12">
							<div class="col-sm-3 header_bim">
							<img alt="" style="width: 150px; height: 125px;"
									src="images/VocabContent/${item.image }">								
							</div>
							<div class="col-sm-9 header_bim">
								    <b style="font-size: 21px;">${item.vocabularycontentname}</b>
									<br/>
<%-- 									<span style="font-size: 16px;">${item.audiogg}</span> --%>
<!-- 									<br/> -->
									<span style="color:red; font-size: 16px;">${item.transcribe}</span>
									<br/>
									<span style="font-size: 16px;">${item.mean}</span>
									<br/>
									<span><audio controls> <source src="Audio/${item.audiomp3 }" type="audio/mpeg"></audio></span>
							</div>
						</div>
						<div class="container col-sm-12">
							<hr />
						</div>
					    </c:forEach>
					    <input type="hidden" id="vocabularyid" name="vocabularyid" value="${vocabularyid }"/>
						<input type="hidden" id="pageid" name="page" value="${page }"/>	
						
						<div class="col-sm-6 padding-right">
								<c:if test="${page ==1 }">
									<a class="btn btn-default disabled" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" href="contentvocabulary?vocabid=${vocabularyid }&page=${page-1 }">Prev</a>
									<a class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" href="contentvocabulary?vocabid=${vocabularyid }&page=${page+1 }">Next</a>
								</c:if>
								<c:if test="${page>1 && page<maxpage }">
									<a class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" href="contentvocabulary?vocabid=${vocabularyid }&page=${page-1 }">Prev</a>
									<a class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" href="contentvocabulary?vocabid=${vocabularyid }&page=${page+1 }">Next</a>
								</c:if>
								<c:if test="${page == maxpage }">
									<a class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" href="contentvocabulary?vocabid=${vocabularyid }&page=${page-1 }">Prev</a>
									<a class="btn btn-default disabled" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" href="contentvocabulary?vocabid=${vocabularyid }&page=${page+1 }">Next</a>
								</c:if>								
						</div>
						
					    <div class="fb-comments" data-href="http://localhost:8080/WebTiengAnh/" data-numposts="5">
				        </div>
					</div>
				</div>
				
				<div class="col-sm-3 menu_sidebar_right">
					<jsp:include page="../include/right_sidebar.jsp"></jsp:include>
				</div>
				
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	<script src="js/sweetalert.min.js"></script>
	
</body>
</html>