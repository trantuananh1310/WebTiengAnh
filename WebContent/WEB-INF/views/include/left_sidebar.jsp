<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="left-sidebar">
	<!-- Chia sẻ -->
		<h2>Chia sẻ</h2>
		<div class="panel-group category-products" id="accordian">
			<!--category-productsr-->
			<c:forEach items="${lstLevel }" var="m">
				<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordian"
									href="#share${m.levelid }"> <span class="badge pull-right"><i
										class="fa fa-angle-down"></i></span> ${m.levelname }
								</a>
							</h4>
						</div>
					<div id="share${m.levelid }" class="panel-collapse collapse">
						<div class="panel-body" style="padding-bottom: 0px;">
							<ul>
								<li><a href="listGrammarguideline?level=${m.levelid }">Reading </a></li>
								<li><a href="listListenguideline?level=${m.levelid }">Listening </a></li>
								<li><a href="listVocabularyguideline?level=${m.levelid }">Vocabulary </a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- Luyện tập -->
		<h2>Luyện tập</h2>
		<div class="panel-group category-products" id="accordian1">
			<c:forEach items="${lstLevel }" var="m">
				<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordian1"
									href="#exercise${m.levelid }"> <span class="badge pull-right"><i
										class="fa fa-angle-down"></i></span> ${m.levelname }
								</a>
							</h4>
						</div>
					<div id="exercise${m.levelid }" class="panel-collapse collapse">
						<div class="panel-body" style="padding-bottom: 0px;">
							<ul>
								<li><a href="listReadExercise?level=${m.levelid }">Reading </a></li>
								<li><a href="listListenExcercise?level=${m.levelid }&Page=1">Listening </a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>