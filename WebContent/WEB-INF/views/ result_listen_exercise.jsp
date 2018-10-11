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
						<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio" checked="checked">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option2.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A. ${listcorrectanswer.option1 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option3.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A. ${listcorrectanswer.option1 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
						<div class="radio">
						  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
						</div>
					</c:if>
					<c:if test="${listcorrectanswer.option4.toLowerCase() == listcorrectanswer.correctanswer.toLowerCase() }">
						<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
						<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
						<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
						<div class="radio">
						  	<label><input type="radio">A. ${listcorrectanswer.option1 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
						</div>
						<div class="radio">
						  <label><input type="radio" checked="checked">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/correct.png" style="width: 13px;">
						</div>
					</c:if>
					
				</c:if>
				
				<c:if test="${listcorrectanswer.correctanswer.toLowerCase() != listansweruser.answer.toLowerCase() }">
				
					<c:if test="${listcorrectanswer.correctanswer.toLowerCase() == listcorrectanswer.option1.toLowerCase() }">
						<c:if test="${listcorrectanswer.option2.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option3.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option4.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div class="radio">
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							  <label><input type="radio">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
						</c:if>
					</c:if>
					
					<c:if test="${listcorrectanswer.correctanswer.toLowerCase() == listcorrectanswer.option2.toLowerCase() }">
						<c:if test="${listcorrectanswer.option1.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio"  checked="checked">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option3.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option4.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
						</c:if>
					</c:if>
					
					<c:if test="${listcorrectanswer.correctanswer.toLowerCase() == listcorrectanswer.option3.toLowerCase() }">
						<c:if test="${listcorrectanswer.option1.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio"  checked="checked">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 }
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option2.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3}" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 }</label>
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option4.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
						</c:if>
					</c:if>
					
					<c:if test="${listcorrectanswer.correctanswer.toLowerCase() == listcorrectanswer.option4.toLowerCase() }">
						<c:if test="${listcorrectanswer.option1.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio"  checked="checked">A. ${listcorrectanswer.option1 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 }
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option2.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">B. ${listcorrectanswer.option2 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">C. ${listcorrectanswer.option3 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
						</c:if>
						<c:if test="${listcorrectanswer.option3.toLowerCase() == listansweruser.answer.toLowerCase() }">
							<p><b><%=i+1 %>. ${listcorrectanswer.question }</b></p>
							<div><img src="images/ListenQuestion/${listcorrectanswer.imagename }" width="240px" height="160px"> </div>
							<div> <audio controls> <source src="Audio/${listcorrectanswer.audiomp3 }" type="audio/mpeg"></audio></div>
							<div class="radio">
							  <label><input type="radio">A. ${listcorrectanswer.option1 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio">B. ${listcorrectanswer.option2 }</label>
							</div>
							<div class="radio">
							  <label><input type="radio" checked="checked">C. ${listcorrectanswer.option3 } </label><img alt="" src="images/incorrect.png" style="width: 13px;">
							</div>
							<div class="radio">
							  <label><input type="radio">D. ${listcorrectanswer.option4 } </label><img alt="" src="images/correct.png" style="width: 13px;">
							</div>
						</c:if>
					</c:if>
				
				</c:if>
			</c:if>
	
		</c:forEach>
		<%i++; %>
	</c:forEach>
	
</body>
</html>