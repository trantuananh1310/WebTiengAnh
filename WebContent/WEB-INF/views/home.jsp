<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home</title>
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
<!--/head-->

<body>
	<jsp:include page="include/header_middle.jsp"></jsp:include>
	<jsp:include page="include/slider.jsp"></jsp:include>

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
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
									<a href="#"><img src="images/home/product1.jpg" alt="" /></a>
										
										<h2>$56</h2>
										<p>Easy Polo Black Edition</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
<!-- 									<div class="product-overlay"> -->
<!-- 										<div class="overlay-content"> -->
<!-- 											<h2>$56</h2> -->
<!-- 											<p>Easy Polo Black Edition</p> -->
<!-- 											<a href="#" class="btn btn-default add-to-cart"><i -->
<!-- 												class="fa fa-shopping-cart"></i>Add to cart</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
<!-- 								<div class="choose"> -->
<!-- 									<ul class="nav nav-pills nav-justified"> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to wishlist</a></li> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to compare</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product2.jpg" alt="" />
										<h2>$56</h2>
										<p>Easy Polo Black Edition</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
<!-- 									<div class="product-overlay"> -->
<!-- 										<div class="overlay-content"> -->
<!-- 											<h2>$56</h2> -->
<!-- 											<p>Easy Polo Black Edition</p> -->
<!-- 											<a href="#" class="btn btn-default add-to-cart"><i -->
<!-- 												class="fa fa-shopping-cart"></i>Add to cart</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
<!-- 								<div class="choose"> -->
<!-- 									<ul class="nav nav-pills nav-justified"> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to wishlist</a></li> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to compare</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product3.jpg" alt="" />
										<h2>$56</h2>
										<p>Easy Polo Black Edition</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
<!-- 									<div class="product-overlay"> -->
<!-- 										<div class="overlay-content"> -->
<!-- 											<h2>$56</h2> -->
<!-- 											<p>Easy Polo Black Edition</p> -->
<!-- 											<a href="#" class="btn btn-default add-to-cart"><i -->
<!-- 												class="fa fa-shopping-cart"></i>Add to cart</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
<!-- 								<div class="choose"> -->
<!-- 									<ul class="nav nav-pills nav-justified"> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to wishlist</a></li> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to compare</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product4.jpg" alt="" />
										<h2>$56</h2>
										<p>Easy Polo Black Edition</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
									<img src="images/home/new.png" class="new" alt="" />
								</div>
<!-- 								<div class="choose"> -->
<!-- 									<ul class="nav nav-pills nav-justified"> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to wishlist</a></li> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to compare</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product5.jpg" alt="" />
										<h2>$56</h2>
										<p>Easy Polo Black Edition</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
									<img src="images/home/sale.png" class="new" alt="" />
								</div>
<!-- 								<div class="choose"> -->
<!-- 									<ul class="nav nav-pills nav-justified"> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to wishlist</a></li> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to compare</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product6.jpg" alt="" />
										<h2>$56</h2>
										<p>Easy Polo Black Edition</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
<!-- 								<div class="choose"> -->
<!-- 									<ul class="nav nav-pills nav-justified"> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to wishlist</a></li> -->
<!-- 										<li><a href="#"><i class="fa fa-plus-square"></i>Add -->
<!-- 												to compare</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
							</div>
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