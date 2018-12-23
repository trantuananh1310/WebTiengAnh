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
				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Read</h2>
						<c:forEach items="${lstGrammar }" var="item">
						<div class="container col-sm-12">
							<div class="col-sm-3 header_bim">
							<a href="contentGrammar?id=${item.grammarguidelineid }">
							        <img alt="" style="width: 150px; height: 100px;"
									src="images/grammargui/${item.grammarimage }">
						    </a>
								
							</div>
							<div class="col-sm-9 header_bim">
								<a href="contentGrammar?id=${item.grammarguidelineid }">${item.grammarname }</a>
								<br>Chào các em, Ms Anh Thư - DAKT ENGLISH gửi tới các em các kiến thức liên quan đến các thì trong tiếng anh.Trong tiếng anh có những thì nào, chúng được sử dụng ra sao, bài học này chúng ta hãy cùng đi tìm hiểu về chúng.
								C. Chúc các em học tốt!  
							</div>

						</div>
						<div class="container col-sm-12">
							<hr />
						</div>
					    </c:forEach>
					   <div>
					   <ul class="pagination">
					   <c:if test="${page>1 }">
					    <li><a href="listGrammarguideline?level=1&page=${page-1 }">Prev</a></li>
					   </c:if>
					   <c:forEach items="${List_Page }" var ="item">
					   <c:if test="${item==page }">
					   <li class="active"><a href="listGrammarguideline?level=1&page=${item }">${item}</a></li>
					   </c:if>
					   <c:if test="${item!=page }">
					    <li><a href="listGrammarguideline?level=1&page=${item }">${item}</a></li>
					   </c:if>
					   </c:forEach>
					   <c:if test="${page<TotalPage }">
					   <li><a href="listGrammarguideline?level=1&page=${page+1 }">Next</a></li>
					   </c:if>
						   
						</ul>
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