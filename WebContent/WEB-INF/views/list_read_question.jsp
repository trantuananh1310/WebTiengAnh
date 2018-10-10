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
// 		$('#login_form').on('submit',function(event) {
// 			event.preventDefault();
// 			$.ajax({
// 				type : "POST",
// 				url : "loginAction",
// 				data : {
// 					username : $('#username').val(),
// 					password : $('#password').val()
// 				},
// 				success : function(result) {

// 					if (result == "USER") {
// 						window.location.reload();
// 					}else if(result=="ADMIN"){
// 						window.location.href = 'test';
// 					}else {
// 						$("#xyz").text("Tài khoản hoặc mật khẩu không đúng!");
// 					}
// // 						$("#xyz").html(result);
// // 						$("#xyz").slideToggle();
// 				}
// 			})
// 		});
		
// 		$('#register_form').on('submit',function(event) {
// 			event.preventDefault();
// 			$.ajax({
// 				type : "POST",
// 				url : "registerAction",
// 				data : {
// 					username : $('#user').val(),
// 					password : $('#pass').val(),
// 					fullname : $('#fullname').val(),
// 					email : $('#email').val(),
// 					confirmpass : $('#confirmpass').val(),
// 					phone : $('#phone').val(),
// 				},
// 				success : function(result) {
// 					if (result == "ErrConfirmPass") {
// 						swal("", "Mật khẩu không khớp. Hãy thử lại", "error");
// 					}else if(result=="ErrUserName"){
// 						swal(" ", "Tên người dùng đã được sử dụng. Hãy thử tên khác.", "error");
// 					}else if(result=="ErrPhone"){
// 						swal(" ", "Số điện thoại không đúng !!!", "error");
// 					}else{
// 						swal({
// 							  title: "Thành công",
// 							  text: "Đăng ký tài khoản thành công!",
// 							  type: "success",
// 							  confirmButtonText: "OK",
// //							  closeOnConfirm: false
// 							},
// 							function(){
// 							  window.location.reload();
// 						});
// 					}
// 				}
// 			})
// 		});
		$('#check_form').on('submit',function(event) {
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
						$("#check_Answer").html(result);
					}
				});
			}
		});
	});
</script>

</head>
<body>
<%int i=0; %>

<jsp:include page="include/header_middle.jsp"></jsp:include>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<jsp:include page="include/left_sidebar.jsp"></jsp:include>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Features Items</h2>
							<div class="container">
								<div id="check_Answer"></div>
<%-- 								<h4 style="color: red;">${msg}</h4> --%>
								<form action="" method="post" id="check_form">
									<c:forEach items="${lstReadQuestion }" var="item">
										<p><b><%=i+1 %>. ${item.question }</b></p>
										<div class="radio">
										  	<label><input type="radio" name="answer[<%=i %>]" value="${item.option1 }">A. ${item.option1 }</label>
										</div>
										<div class="radio">
										  <label><input type="radio" name="answer[<%=i %>]" value="${item.option2 }">B. ${item.option2 }</label>
										</div>
										<div class="radio">
										  <label><input type="radio" name="answer[<%=i %>]" value="${item.option3 }">C. ${item.option3 }</label>
										</div>
										<div class="radio">
										  <label><input type="radio" name="answer[<%=i %>]" value="${item.option4 }">D. ${item.option4 }</label>
										</div>
										<%i++; %>
									</c:forEach>
									<input type="hidden" name="readexerciseid" value="${readexerciseid }"/>
									<input type="submit" value="Tapescript" class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;">
								</form>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="include/footer.jsp"></jsp:include>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	<script src="js/sweetalert.min.js"></script>
	
</body>
</html>