<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() {
		$('#search').keypress(function(event){
			var key1= $('#search').val();
		    var keycode = (event.keyCode ? event.keyCode : event.which);
		    if(keycode == '13'){
		    	window.location.href = 'SearchAll?key='+key1 +'&page=1';
		    }

		});
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
						window.location.href = 'homeAdmin';
					}else {
						swal("", "Tài khoản hoặc mật khẩu không đúng!", "error");
					}
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

	<c:if test="${sessionuser !=null }">
		<div class="header-middle"><!--header-middle-->
			<div class="container header_bim">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="home"><img style="width: 170px;" src="images/home/logo.png" alt=""/></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#" data-toggle="modal" data-target="#">${sessionuser}</a></li>
								<li><a href="logoutAction"><i class="glyphicon glyphicon-log-out"></i>Đăng xuất</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	</c:if>
	
	<c:if test="${sessionuser == null }">
		<div class="header-middle"><!--header-middle-->
			<div class="container header_bim">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="home"><img style="width: 170px;" src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#" data-toggle="modal" data-target="#modelDangNhap"><i class="	glyphicon glyphicon-log-in"></i>Đăng nhập</a></li>
								<li><a href="#" data-toggle="modal" data-target="#modelDangKy"><i class="glyphicon glyphicon-edit"></i>Đăng ký</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	</c:if>
		
		<div class="header-bottom"><!--header-bottom-->
			<div class="container header_bim">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="home" class="active">Trang chủ</a></li>
								<li class="dropdown"><a href="#">Về chúng tôi<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">Products</a></li>
										<li><a href="product-details.html">Product Details</a></li> 
										<li><a href="checkout.html">Checkout</a></li> 
										<li><a href="cart.html">Cart</a></li> 
										<li><a href="login.html">Login</a></li> 
                                    </ul>
                                </li> 
								<li><a href="exam?stt=1">Thi thử</a>
<!--                                     <ul role="menu" class="sub-menu"> -->
<!--                                         <li><a href="blog.html">Blog List</a></li> -->
<!-- 										<li><a href="blog-single.html">Blog Single</a></li> -->
<!--                                     </ul> -->
                                </li> 
								<li><a href="contact-us.html">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input id ="search" type="text" placeholder="Tìm kiếm"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
		
		<!-- modal -->
		<div class="modal fade" id="modelDangNhap" role="dialog">
		<div class="modal-dialog" style="width: 400px">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #f3f3f4; border-top-left-radius: 10px; border-top-right-radius: 10px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="text-align: center; font-size: 20px;">Đăng nhập tài khoản</h4>
				</div>
				<div class="modal-body" style="padding: 10px 20px 0px 20px;">
					<div class="media">
						<div class="login-form">
							<!--login form-->
							<form method="post" id="login_form">
<!--								<input id="username" type="text" placeholder="Tên đăng nhập" class="user"> -->
								<input id="username" type="text" placeholder="Tên đăng nhập" class="user" required="">
<!-- 								<input id="password" type="password" placeholder="mật khẩu"> -->
								<input id="password" type="password" placeholder="mật khẩu" class="pass" required=""> 
								<span id="xyz" style="color: red;"></span> 
								<br /> 
								<span> 
									<input type="checkbox" class="checkbox"> Lưu mật khẩu
								</span> 
								<input type="submit" value="ĐĂNG NHẬP" class="btn btn-default" style="background: #FE980F; color: white; font-size: 15px; font-weight: bold;"></input>
							</form>
							<div style="text-align: right;">
								<span><a href="#" style="font-size: 12px;" id="dangNhap">Quên mật khẩu?</a></span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<span>Nếu chưa có tài khoản hãy </span>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#modelDangKy"
						style="background: #FE980F; color: white;">ĐĂNG KÝ</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modelDangKy" role="dialog">
		<div class="modal-dialog" style="width: 400px">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #f3f3f4; border-top-left-radius: 10px; border-top-right-radius: 10px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"
						style="text-align: center; font-size: 20px;">Đăng ký thành viên</h4>
				</div>
				<div class="modal-body" style="padding: 20px 20px 0px 20px;">
					<div class="media">
						<div class="login-form">
							<!--login form-->
<!-- 							<h2>Đăng nhập tài khoản của bạn</h2> -->
							<form  id="register_form">
								<input id="fullname" type="text" placeholder="Họ tên" required="" />
								<input id="email" type="email" placeholder="Email"  required="" />
								<input id="user" type="text" placeholder="Tên đăng nhập" required="" />
								<input id="pass" type="password" placeholder="Mật khẩu" required="" />
								<input id="confirmpass" type="password" placeholder="Xác nhận mật khẩu" required="" />
								<span id="err_confirm_pass" style="color: red;"></span> 
								<input id="phone" type="text" placeholder="Số điện thoại" required="" />
								<span id="err_username_exist" style="color: red;"></span> 
								<input type="submit" value="ĐĂNG KÝ" class="btn btn-default" 
									style="background: #FE980F; color: white; font-size: 15px; font-weight: bold;"></input>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<span>Nếu đã có tài khoản! </span>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#modelDangNhap"
						style="background: #FE980F; color: white;">ĐĂNG NHẬP</button>
				</div>
			</div>

		</div>
	</div>
	
	<style>
		#popup_login {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, .6);
			z-index: 99;
			display: none;
		}
		
		/*--main--*/
		.sub-main-w3 {
			width: 29%;
			margin: 125px auto;
			-webkit-box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.80);
			-moz-box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.80);
			box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.80);
			padding: 10px;
		}
		
		.sub-main-w3 h2 {
			color: #fff;
			/*font-size: 1.8em;*/
			letter-spacing: 1px;
			margin-bottom: 1em;
			font-weight: 300;
		}
		
		.pom-agile {
			padding: 12px 15px;
			border-bottom: 2px solid #fb6906;
			background: #fff;
		}
		
		.pom-agile:nth-child(1) {
			margin-bottom: 15px;
		}
		
		.pom-agile input[type="email"], .pom-agile input[type="password"] {
			outline: none;
			border: none;
			padding: 0px 12px;
			background: transparent;
			width: 93%;
			color: #000;
			font-family: 'Roboto', sans-serif;
			letter-spacing: 1px;
		}
		
		.right-w3l input[type="submit"] {
			color: #fff;
			background: #fb6906;
			border: none;
			padding: 12px 20px;
			outline: none;
			cursor: pointer;
			letter-spacing: 1px;
			font-family: 'Roboto', sans-serif;
			-webkit-transition: 0.5s all;
			-o-transition: 0.5s all;
			-moz-transition: 0.5s all;
			-ms-transition: 0.5s all;
			transition: 0.5s all;
		}
		
		span.fa {
			float: left;
			color: #000;
		}
		
		.sub-w3l {
			padding: 10px 0 20px;
		}
		
		.sub-agile {
			float: left;
		}
		
		.sub-w3l a {
			float: right;
			font-size: .9em;
			color: #fff;
		}
	</style>

</body>
</html>