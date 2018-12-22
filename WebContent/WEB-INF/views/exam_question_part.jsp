<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 <c:if test="${part eq '1'}">
	<button id="part1" type="button" class="btn-default btn active" style="margin-top: -50px; width: 150px;height: 50px;">Part1</button>
</c:if>
<c:if test="${part!='1'}">
	<button id="part1" type="button" class="btn-default btn " style="margin-top: -50px; width: 150px;height: 50px;">Part1</button>
</c:if>
<c:if test="${part eq '2'}">
	 <button id="part2" type="button" class="btn-default btn active" style="margin-top: -50px; width: 150px;height: 50px;">Part2</button>
</c:if>
<c:if test="${part!='2'}">
	<button id="part2" type="button" class="btn-default btn " style="margin-top: -50px; width: 150px;height: 50px;">Part2</button>
</c:if>
<c:if test="${part eq '3'}">
	 <button id="part3" type="button" class="btn-default btn active" style="margin-top: -50px; width: 150px;height: 50px;">Part3</button>
</c:if>
<c:if test="${part!='3'}">
	 <button id="part3" type="button" class="btn-default btn " style="margin-top: -50px; width: 150px;height: 50px;">Part3</button>
</c:if>
 <br>
<div class="col-md-12 col-sm-12 col-xs-12" style="height: 400px;border: 1px solid #ecebeb;">
			 <br>
<div><b>${stt}:${Question.question}</b></div>
	<c:if test="${not empty Question.imagequestion && Question.imagequestion!=' ' }">
	 <div style="text-align:center;height: 200px;">
	 	<img src="images/examinationquestion/${Question.imagequestion }" >
	 </div>
	 </c:if>
	 <c:if test="${not empty Question.audiomp3 && Question.audiomp3!=' '}">
	 	 <div style="text-align:center"><audio src="Audio/examinationquestion/${Question.audiomp3} " controls=""></audio></div>
	 </c:if>
	 
	 <c:if test="${not empty Question.option1 && Question.option1!=' '}">A:&nbsp&nbsp${Question.option1}<br></c:if>
	<c:if test="${not empty Question.option2 &&  Question.option2!=' '}">B:&nbsp&nbsp${Question.option2}<br></c:if>
	<c:if test="${not empty Question.option3 && Question.option3!=' '}">C:&nbsp&nbsp${Question.option3}<br></c:if>
	<c:if test="${not empty Question.option4 && Question.option4!=' '}">D:&nbsp&nbsp${Question.option4}<br></c:if>
	
</div>
<div style="text-align:center">

	 <c:if test="${stt>1}">
          	      		<a id ="Prev" class="btn btn-default" style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;">Prev</a>
     </c:if>
	<c:if test="${stt<listQuestion.size()}">
  				    <a id="Next" class="btn btn-default " style="background: #FE980F; color: white;margin-bottom: 10px;margin-top: 10px;" >Next</a>
    </c:if>
</div>		
	<input id="sttPrev"type="hidden" value="${stt-1} " >
	<input id="sttNext"type="hidden" value="${stt+1} " >
	<input id="sttPrev"type="hidden" value="${stt} " name="stt">	
<script type="text/javascript">
	$(document).ready(function(){
		$('#Next').on('click',function(event){
			$.ajax({
				type:"GET",
				url:"ExamQuestion",
				data:{stt:$('#sttNext').val(),examinationId:$("#examinationId").val()},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		});
		$('#part1').on('click',function(event){
			clickPart(1);
		});
		$('#part2').on('click',function(event){
			clickPart(2);
		});
		$('#part3').on('click',function(event){
			clickPart(3);
		});
		$('#Prev').on('click',function(event){
			$.ajax({
				type:"GET",
				url:"ExamQuestion",
				data:{stt:$('#sttPrev').val(),examinationId:$("#examinationId").val()},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		})
	});
	function clickPart(part)
	{
		{
			$.ajax({
				type:"GET",
				url:"ExamQuestionByPart",
				data:{
					part:part,
					examinationId:$("#examinationId").val(),
					},
				success:function(result)
				 {
					 $('#NoiDungCauHoi').html(result);
				 }
			})
		}
	}
	
	</script>
</html>