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
		
		function validation(){
			alert("abd");
// 			swal("Good job!", "You clicked the button!", "success");
		}
		
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to compare</a></li>
									</ul>
								</div>
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to compare</a></li>
									</ul>
								</div>
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to compare</a></li>
									</ul>
								</div>
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to compare</a></li>
									</ul>
								</div>
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to compare</a></li>
									</ul>
								</div>
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
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add
												to compare</a></li>
									</ul>
								</div>
							</div>
						</div>

					</div>
					<!--features_items-->

					<div class="category-tab">
						<!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tshirt" data-toggle="tab">T-Shirt</a></li>
								<li><a href="#blazers" data-toggle="tab">Blazers</a></li>
								<li><a href="#sunglass" data-toggle="tab">Sunglass</a></li>
								<li><a href="#kids" data-toggle="tab">Kids</a></li>
								<li><a href="#poloshirt" data-toggle="tab">Polo shirt</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="tshirt">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="blazers">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="sunglass">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="kids">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="poloshirt">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/category-tab-->

					<div class="recommended_items">
						<!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>

						<div id="recommended-item-carousel" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<a class="left recommended-item-control"
								href="#recommended-item-carousel" data-slide="prev"> <i
								class="fa fa-angle-left"></i>
							</a> <a class="right recommended-item-control"
								href="#recommended-item-carousel" data-slide="next"> <i
								class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>
					<!--/recommended_items-->

				</div>
			</div>
		</div>
	</section>

	<jsp:include page="include/footer.jsp"></jsp:include>
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


	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	<script src="js/sweetalert.min.js"></script>

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