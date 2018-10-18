<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12 header_bim">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
<!-- 						<ol class="carousel-indicators"> -->
<!-- 							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li> -->
<!-- 							<li data-target="#slider-carousel" data-slide-to="1"></li> -->
<!-- 							<li data-target="#slider-carousel" data-slide-to="2"></li> -->
<!-- 						</ol> -->
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>DAKT</span>-ENGLISH</h1>
									<h2>${slideActive.slidename }</h2>
									<p>${slideActive.slidecontent }</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img style="height: 300px;" src="images/home/${slideActive.slideimage }" class="girl img-responsive" alt="" />
								</div>
							</div>
							
							<c:forEach items="${lstSlide}" var="list">
								<div class="item">
									<div class="col-sm-6">
										<h1><span>DAKT</span>-ENGLISH</h1>
										<h2>${list.slidename }</h2>
										<p>${list.slidecontent } </p>
										<button type="button" class="btn btn-default get">Get it now</button>
									</div>
									<div class="col-sm-6">
										<img style="height: 300px;" src="images/home/${list.slideimage }" class="girl img-responsive" alt="" />
									</div>
								</div>
							</c:forEach>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
</body>
</html>