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
<link rel="stylesheet" href="css/missHoa.css">
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
<script language="javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link rel="stylesheet" href="css/sweetalert.css">

<script type="text/javascript">
	$(document).ready(function() {
		$('#login_form').on('submit',function(event) {
			event.preventDefault();
			$.ajax({
				type : "POST",
				url : "loginAction",
				data : {
					username : $('#username').val(),
					password : $('#password').val()
				},
				success : function(result) {

					if (result == "USER") {
						window.location.reload();
					}else if(result=="ADMIN"){
						window.location.href = 'test';
					}else {
						$("#xyz").text("Tài khoản hoặc mật khẩu không đúng!");
					}
// 						$("#xyz").html(result);
// 						$("#xyz").slideToggle();
				}
			})
			
		});
		$('#Next').on('click',function(event){
			$.ajax({
				type:"GET",
				url:"ExamQuestion",
				data:{stt:$('#sttNext').val()},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		});
		
		$('#Prev').on('click',function(event){
			$.ajax({
				type:"GET",
				url:"ExamQuestion",
				data:{stt:$('#sttPrev').val()},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		});
		$('#NopBai').on('click',function(event){
			$.ajax({
				type:"POST",
				url:"NopBai",
				data : $('form').serialize(),
				success:function(result)
				 {
					swal("", result, "warning");
				 }
			})
		});
		 setInterval(function(){
			 var h=$('#hour').html();
			 var m=$('#min').html();
			 var s=$('#sec').html();
			 if(h==00 && m==00 && s==00){
			 	clearInterval();
			 }
			 else{
			 if(s>00){
			 	s--;
			 	if(s<10){
			 		s="0"+s;
			 	}
			 	$('#sec').html(s);
			 }
			 else if(m>00){
			 	m--;
			 	$('#sec').html(59);
			 	if(m<10){
			 		m="0"+m;
			 	}
			 	$('#min').html(m);
			 }
			 else{
			 	h--;
			 	$('#min').html(59);
			 	if(h<10){
			 		h="0"+h;
			 	}
			 	$('#hour').html(h);
			 }
			 }
			 },1000);
		 $('#Next').on('click',function(event){
				$.ajax({
					type:"GET",
					url:"ExamQuestion",
					data:{stt:$('#sttNext').val(),examinationId:$("#examinationId").val()},
					success:function(result)
					 {
						 $('#NoiDungCauHoi').html(result);
					 }
				})
			});
			
			$('#Prev').on('click',function(event){
				$.ajax({
					type:"GET",
					url:"ExamQuestion",
					data:{stt:$('#sttPrev').val(),examinationId:$("#examinationId").val()},
					success:function(result)
					 {
						 $('#NoiDungCauHoi').html(result);
					 }
				})
			});
			$('#NopBai').on('click',function(event){
				$.ajax({
					type:"POST",
					url:"NopBai",
					data : $('form').serialize(),
					success:function(result)
					 {
						swal("", result, "warning");
					 }
				})
			}); 
			$('#part1').on('click',function(event){
				clickPart(1);
			});
			$('#part2').on('click',function(event){
				clickPart(2);
			});
			$('#part3').on('click',function(event){
				clickPart(3);
			});
	
		$('#register_form').on('submit',function(event) {
			event.preventDefault();
			$.ajax({
				type : "POST",
				url : "registerAction",
				data : {
					username : $('#user').val(),
					password : $('#pass').val(),
					fullname : $('#fullname').val(),
					email : $('#email').val(),
					confirmpass : $('#confirmpass').val(),
					phone : $('#phone').val(),
				},
				success : function(result) {
					if (result == "ErrConfirmPass") {
						swal("", "Mật khẩu không khớp. Hãy thử lại", "error");
					}else if(result=="ErrUserName"){
						swal(" ", "Tên người dùng đã được sử dụng. Hãy thử tên khác.", "error");
					}else if(result=="ErrPhone"){
						swal(" ", "Số điện thoại không đúng !!!", "error");
					}else{
						swal({
							  title: "Thành công",
							  text: "Đăng ký tài khoản thành công!",
							  type: "success",
							  confirmButtonText: "OK",
//							  closeOnConfirm: false
							},
							function(){
							  window.location.reload();
						});
					}
				}
			})
		});
	});
</script>

</head>
<body>
    <div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.1&appId=725974994429230&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

<jsp:include page="include/header_middle.jsp"></jsp:include>

	<section >
		<div class="container" style="background-color: white;height: 600px;">
			<h2 class="title text-center">Practice Full Test TOEIC Reading, Listening </h2>
		<div class="row" style="background-color: white;">
		
			<div class="col-md-8 col-sm-8 col-xs-12" style="height: 500px;background-color: white;">
			<div class="clear col_box_baihoc_view" id="NoiDungCauHoi">
				<c:if test="${part eq '1'}">
					<button id="part1" type="button" class="btn-default btn active" style="margin-top: -50px; width: 150px;height: 50px;">Part1</button>
				</c:if>
				<c:if test="${part!='1'}">
					<button id="part1" type="button" class="btn-default btn " style="margin-top: -50px; width: 150px;height: 50px;">Part1</button>
				</c:if>
				<c:if test="${part eq '2'}">
					 <button id="part2" type="button" class="btn-default btn active" style="margin-top: -50px; width: 150px;height:50px;">Part2</button>
				</c:if>
				<c:if test="${part!='2'}">
					<button id="part2" type="button" class="btn-default btn " style=" margin-top: -50px;width: 150px;height: 50px;">Part2</button>
				</c:if>
				<c:if test="${part eq '3'}">
					 <button id="part3" type="button" class="btn-default btn active" style="margin-top: -50px; width: 150px;height: 50px;">Part3</button>
				</c:if>
				<c:if test="${part!='3'}">
					 <button id="part3" type="button" class="btn-default btn " style="margin-top: -50px; width: 150px;height: 50px;">Part3</button>
				</c:if>
					 <br>
			 <div class="col-md-12 col-sm-12 col-xs-12" style="height: 400px;border: 1px solid #ecebeb;">
			 <br>
			 <div><b>${stt}:${Question.question}</b></div>
			<c:if test="${not empty Question.imagequestion }">
			 <div style="text-align:center;height: 200px;">
			 	<img src="images/examinationquestion/${Question.imagequestion }" >
			 </div>
			 </c:if>
			 <c:if test="${not empty Question.audiomp3 }">
			 	 <div style="text-align:center"><audio src="Audio/examinationquestion/${Question.audiomp3} " controls=""></audio></div>
			 </c:if>
			 
			 <c:if test="${not empty Question.option1}">A:&nbsp&nbsp${Question.option1}<br></c:if>
			<c:if test="${not empty Question.option2}">B:&nbsp&nbsp${Question.option2}<br></c:if>
			<c:if test="${not empty Question.option3}">C:&nbsp&nbsp${Question.option3}<br></c:if>
			<c:if test="${not empty Question.option4}">D:&nbsp&nbsp${Question.option4}<br></c:if>
			</div>
			<div style="text-align:center">
			 <c:if test="${stt>1}">
            	      		<a id ="Prev" class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;">Prev</a>
		     </c:if>
			<c:if test="${stt<listQuestion.size()}">
		  				    <a id="Next" class="btn btn-default " style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" >Next</a>
		    </c:if>
			</div>
			<input id="sttPrev"type="hidden" value="${stt-1} " >
			<input id="sttNext"type="hidden" value="${stt+1} " >
			<input id="sttPrev"type="hidden" value="${stt} " name="stt">	
            </div>
           </div>
        <div class="col-md-4 col-sm-4 col-xs-12" id="test_col_right" style="position: relative;">
    
    <div class="box_ketqua" id="test_ketqua" style="position: relative; top: 0px; bottom: 0px; left: 0px; right: 0px; margin-top: 0px;">
        <div class="head">
            <a class="check" href="javascript:void(0)" id="test_result" onclick="return mshoatoeic.send_answer_fulltest()"><i></i><span>Chấm điểm</span></a>
            <div class="timer" id="show_count_down"><span id="hour">2</span>:<span id="min">00</span>:<span id="sec">00</span></div>
            <a href="javascript:;" onclick="return location.reload()" class="refresh"><i></i><span>Làm lại</span></a>
            <div class="clearfix"></div>
        </div>
        <% int i=0; %>
        <div class="list" style="height: 420px;">
            <div class="scrollbar-inner" id="fulltest_question_shortcut">
                     <table class="col-md-12 col-sm-12 col-xs-12">
            		<c:forEach var="item" items="${listQuestion}">
	            		<tr>
	            		<td><a href="javascript:clickSTT(<%=i+1%>)" class="hrefQuestion" value="<%=i%>" style="padding-left: 5px;"><%=i+1%>&nbsp&nbsp</a></td>
	            		<td>A.<input  type="radio" name="question[<%=i %>]" value="${item.option1 }">&nbsp&nbsp&nbsp</td>
	            		<td>B.<input  type="radio" name="question[<%=i %>]" value="${item.option2 }">&nbsp&nbsp&nbsp</td>
	            		<td>C.<input  type="radio" name="question[<%=i %>]" value="${item.option3 }">&nbsp&nbsp&nbsp</td>
	            		<td>D.<input  type="radio" name="question[<%=i %>]" value="${item.option4 }">&nbsp&nbsp</td>
	            		</tr>
	            		<%i++;%>              
                     </c:forEach> 
              	</table>      
              	<input id= "examinationId" type="hidden" name="examinationId" value="${examinationId}" >       
             </div>      
        </div>
        
		</div>	
		</div>
		</div>
		</div>
	</section>

	<jsp:include page="include/footer.jsp"></jsp:include>
	
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	<script src="js/sweetalert.min.js"></script>
	<script type="text/javascript">
	function clickSTT(stt)
	{
		{
			$.ajax({
				type:"GET",
				url:"ExamQuestion",
				data:{
					stt:stt,
					examinationId:$("#examinationId").val(),
					},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		}
	}
	function clickPart(part)
	{
		{
			$.ajax({
				type:"GET",
				url:"ExamQuestionByPart",
				data:{
					part:part,
					examinationId:$("#examinationId").val(),
					},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		}
	}
	
	</script>
	
</body>
</html>