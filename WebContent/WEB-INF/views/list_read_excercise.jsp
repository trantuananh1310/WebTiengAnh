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

</head>
<body>

<jsp:include page="include/header_middle.jsp"></jsp:include>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 menu_sidebar_left">
					<jsp:include page="include/left_sidebar.jsp"></jsp:include>
				</div>
				<div class="col-sm-6 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Luyện tập</h2>
						<c:forEach items="${lstReadExcercise }" var="item">
							<div class="container col-sm-12">
								
									<div class="col-sm-3 header_bim">
										<a style="font-size: 18px;" href="listReadQuestion?readexercise=${item.readexeriseid }&page=1">
										<img alt="" style="width: 150px;" src="images/readexercises/${item.readimage }"></a>
									</div>
									
									<div class="col-sm-9 header_bim">
										<a style="font-size: 18px;" href="listReadQuestion?readexercise=${item.readexeriseid }&page=1">${item.readname }</a>
									</div>
							</div>
							<div class="container col-sm-12">
								<hr/>
							</div>
						</c:forEach>
						
						<div class="container col-sm-12">	
								<div class="container">
								  <ul class="pagination">
								  	 <c:if test="${Page!=1}" ><li class=><a  href="listReadExercise?level=${levelid }&Page=${Page-1}">Prev</a></li></c:if>
								  	 <c:forEach var="item" items="${ListPage}">
								  	 	<c:if test="${item==Page}" ><li class="active"><a  href="listReadExercise?level=${levelid }&Page=${item}">${item}</a></li></c:if>
								  		<c:if test="${item!=Page}" ><li><a href="listReadExercise?level=${levelid }&Page=${item}">${item}</a></li></c:if>
								  	 </c:forEach>
									<c:if test="${Page!=TotalPage}" ><li class=><a  href="listReadExercise?level=${levelid }&Page=${Page+1}">Next</a></li></c:if>
								  	 
								  </ul>
								</div>
							</div>
						
					</div>
				</div>
				<div class="col-sm-3 menu_sidebar_right">
					<jsp:include page="include/right_sidebar.jsp"></jsp:include>
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