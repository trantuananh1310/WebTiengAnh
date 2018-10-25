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
	<%int i=0; %>
							
	<c:forEach items="${lstListenQuestion }" var="listcorrectanswer">

		<c:forEach items="${lstAnswerUser }" var="listansweruser">

			<c:if test="${listcorrectanswer.listenquestionid == listansweruser.number }" >
			
				<c:if test="${listcorrectanswer.correctanswer.toLowerCase() == listansweruser.answer.toLowerCase() }">
					<c:if test="${listcorrectanswer.option1.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio" checked="checked">A </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">B</label>
						</div>
						<div class="radio">
						  <label><input type="radio">C</label>
						</div>
						<div class="radio">
						  <label><input type="radio">D</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option2.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">B </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">C</label>
						</div>
						<div class="radio">
						  <label><input type="radio">D</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option3.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A</label>
						</div>
						<div class="radio">
						  <label><input type="radio">B</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">C </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">D</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option4.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A</label>
						</div>
						<div class="radio">
						  <label><input type="radio">B</label>
						</div>
						<div class="radio">
						  <label><input type="radio">C</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">D</label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
					</c:if>
				</c:if>
				
				<c:if test="${listcorrectanswer.correctanswer.toLowerCase() != listansweruser.answer.toLowerCase() }">
					<c:if test="${listcorrectanswer.option1.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio" checked="checked">A </label><img alt="" src="images/incorrect.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">B</label>
						</div>
						<div class="radio">
						  <label><input type="radio">C</label>
						</div>
						<div class="radio">
						  <label><input type="radio">D</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option2.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">B </label><img alt="" src="images/incorrect.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">C</label>
						</div>
						<div class="radio">
						  <label><input type="radio">D</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option3.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A</label>
						</div>
						<div class="radio">
						  <label><input type="radio">B</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">C </label><img alt="" src="images/incorrect.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">D</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option4.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img class="img_listening" src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A</label>
						</div>
						<div class="radio">
						  <label><input type="radio">B</label>
						</div>
						<div class="radio">
						  <label><input type="radio">C</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">D </label><img alt="" src="images/incorrect.png" style="width: 13px;">
						</div>
					</c:if>
				</c:if>
				
			</c:if>
	
		</c:forEach>
		<%i++; %>
	</c:forEach>
	
</body>
</html>