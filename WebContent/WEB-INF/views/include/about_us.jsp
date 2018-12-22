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

<jsp:include page="header_middle.jsp"></jsp:include>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 menu_sidebar_left">
					<jsp:include page="left_sidebar.jsp"></jsp:include>
				</div>
				<div class="col-sm-9 padding-right">
					<h2><p class="MsoNormal"><strong><span style="font-size:14.0pt;line-height:107%;font-family:Algerian;mso-bidi-font-family:
Calibri">DAKT-English<o:p></o:p></span></strong></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:
justify"><span style="font-size:14.0pt;line-height:107%;font-family:&quot;Cambria&quot;,serif;
mso-bidi-font-family:Calibri">&nbsp;&nbsp; Đời sống
xã hội được nâng cao, công nghệ phát triển theo từng giờ nhưng đi kèm theo đó
là khung thời gian của từng người càng ngày càng eo hẹp. Người ta tốn quá nhiều
thời gian vào các công việc khác nhau mà không đủ thời gian để đi đến các trung
tâm, lớp dạy tiếng Anh. Nhu cầu cần được học tập, nâng cao kiến thức mà không cần
phải tốn quá nhiều thời gian ở các trung tâm ngày một nhiều. Do đó, các trang
web, hệ thống học tiếng Anh online ra đời như một giải pháp giải quyết bài toán
thời gian.<o:p></o:p></span></p><span style="font-size:14.0pt;line-height:107%;font-family:&quot;Cambria&quot;,serif;
mso-bidi-font-family:Calibri"><o:p>&nbsp;</o:p></span><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:
justify"><span style="font-size:14.0pt;line-height:107%;font-family:&quot;Cambria&quot;,serif;
mso-bidi-font-family:Calibri">&nbsp;&nbsp; DAKT-English
chính là một trang web giúp người dùng học tiếng Anh mọi lúc, mọi nơi chỉ cần có
kết nối mạng.<o:p></o:p></span></p><span style="font-size:14.0pt;line-height:107%;font-family:&quot;Cambria&quot;,serif;
mso-bidi-font-family:Calibri"><o:p>&nbsp;</o:p></span><p class="MsoNormal" style="text-align:justify"><span style="font-size: 14pt; line-height: 107%; font-family: Cambria, serif; background: white;">&nbsp;&nbsp; Chúng
tôi không quan niệm là chúng ta “học tiếng Anh” mà “khám phá tiếng Anh”. Và để
khám phá tiếng Anh và yêu tiếng Anh thì các bạn hãy tạo ngôn ngữ theo cách cảm
nhận của riêng mình.Từ đó, chính các bạn
là người sáng tạo ra cách học ngôn ngữ của bản thân. Đừng quan tâm người khác
đánh giá bạn như thế nào, hãy là chính mình, đặt cảm xúc của mình vào ngôn ngữ ấy.
Mỗi ngày, bạn sẽ thấy mình phát hiện ra một điều gì đó thú vị, có thêm những niềm
vui mới để dần dần thấy mình lớn lên. Khi đó, học ngôn ngữ chính là việc khẳng
định giá trị của bản thân và làm cuộc sống của bạn trở nên tuyệt vời hơn rất
nhiều.<o:p></o:p></p><p class="MsoNormal" style="text-align:justify"><span style="font-size: 14pt; line-height: 107%; font-family: Cambria, serif; background: white;">&nbsp;&nbsp; Trang web
của chúng tôi đưa ra nhiều tính năng cho người học, người học có thể học lý
thuyết, học từ vựng, đọc các kinh nghiệm được chia sẻ để có một nền tảng kiến
thức tốt hơn:<o:p></o:p></span></p><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri;
mso-no-proof:yes"><img width="623" height="309" src="images/1.png" v:shapes="Picture_x0020_2"><!--[endif]--></span><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri"><o:p></o:p></span><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri"><o:p>&nbsp;</o:p></span><p class="MsoNormal" style="text-align:justify"><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri">&nbsp;&nbsp; Sau đó người dùng có thể làm các bài tập
nghe, bài tập đọc để nhằm luyện tập lại các kiến thức mình đã được học:<o:p></o:p></span></p><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri"><o:p>&nbsp;</o:p></span><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri;
mso-no-proof:yes"><img width="623" height="306" src="images/2.png" v:shapes="Picture_x0020_3"><!--[endif]--></span><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri"><o:p></o:p></span><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri"><o:p>&nbsp;</o:p></span><p class="MsoNormal" style="text-align:justify"><span style="font-size:14.0pt;
line-height:107%;font-family:&quot;Cambria&quot;,serif;mso-bidi-font-family:Calibri">&nbsp;&nbsp; Ngoài ra chúng tôi còn có hệ thống thi thử để
người dùng có thể tự đánh giá kiến thức bản thân.<o:p></o:p></span></p><p class="MsoNormal"><span style="font-size: 14pt; line-height: 107%; font-family: Cambria, serif; background: white;">&nbsp;&nbsp; Hi vọng
qua đây, các bạn có thể hiểu rõ hơn một chút về những gì chúng tôi đang làm. Đừng
ngại liên hệ với chúng tôi nếu bạn có bất cứ vấn đề gì trong quá trình học tiếng
Anh, hay có ý kiến muốn đóng góp, chúng tôi luôn sẵn sàng giải đáp.</span><span style="font-size: 14pt; line-height: 107%; font-family: Cambria, serif;"><br>
<br>
</span><span style="font-size:14.0pt;line-height:107%;font-family:&quot;Cambria&quot;,serif;
mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin">Cảm ơn các bạn đã
quan tâm và hãy cùng chúng tôi khám phá vẻ đẹp tiếng Anh nhé<span style="font-size: 14pt; line-height: 107%; background: white;">.&nbsp;</span></span><strong><span style="font-size:14.0pt;line-height:107%;
font-family:&quot;Calibri&quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-hansi-theme-font:
minor-latin;mso-bidi-theme-font:minor-latin;color:red;background:white">You don't know how amazing you
are when you study English with me!</span></strong><strong><span style="font-size:14.0pt;line-height:107%;font-family:&quot;Calibri&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:
minor-latin;font-weight:normal"><o:p></o:p></span></strong></p><span style="font-size:14.0pt;
line-height:107%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><o:p>&nbsp;</o:p></span>
<p class="MsoNormal" align="right" style="text-align:right"><span style="font-size:
14.0pt;line-height:107%;font-family:Algerian;mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin">DAKT Team<o:p></o:p></span></p></h2>
				</div>
				<div class="col-sm-3 menu_sidebar_right">
					<jsp:include page="right_sidebar.jsp"></jsp:include>
				</div>
				</div>
				
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	<script src="js/sweetalert.min.js"></script>
	
</body>
</html>