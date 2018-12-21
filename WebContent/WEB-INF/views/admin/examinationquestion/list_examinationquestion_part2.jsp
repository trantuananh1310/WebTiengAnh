<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%int i=1;%>
    <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>STT</th>
                  <th>Câu hỏi</th>
                  <th>File nghe</th>
                  <th>Đáp án</th>
                  <th></th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
	                 <c:forEach items="${list}" var="item">
                 <tr>
                  <td><%=i %></td>
                  <td class="container" style="text-align: center;">${item.question}</td>
				  <td class="container" style="text-align: center;">
				  	<audio controls style="width: 150px;"> <source src="Audio/examinationquestion/${item.audiomp3 }" type="audio/mpeg"></audio>	
               		   <br>
               		   ${item.audiomp3}
						
				  </td>
<%-- 				 <td class="container"> <audio controls style="width: 250px;"> <source src="Audio/${item.audiomp3 }" type="audio/mpeg"></audio></td> --%>
				 <td class="container" style="text-align: center;">Đáp án 1: ${item.option1}<br>Đáp án 2: ${item.option2}<br>Đáp án 3: ${item.option3}<br>Đáp án 4: ${item.option4}</td>
                 <td class="container" style="text-align: center;"> 
                 		<button class="btn btn-primary edit_data" id="${item.examinationquestionid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                	<button class="btn btn-danger delete_data" id="${item.examinationquestionid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
                 </td>
                </tr>
                <%i++; %>
                </c:forEach>
                </tbody>
                <tfoot>
                </tfoot>
                
              </table>
<script type="text/javascript">
$('#example1').DataTable()
</script>                
</body>
</html>