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

                <tbody >
                <c:forEach items="${listAdVocabGui}" var="item">
                 <tr>
                  <td><%=i %></td>
                  <td class="container">${item.vocabularyname}</td>
                  <td class="container"><img alt="" style="width: 150px; height: 100px; "
									src="images/Vocabgui/${item.vocabularyimage }"></td>
				<td class="container">${item.level.levelname}</td>
                 <td class="container"> <p>
                 		<a href="AdminVocabularyContent?id=${item.vocabularyguidelineid}"><span class="glyphicon glyphicon-search"></span> DS câu hỏi</a>
                 		<a href="#" data-toggle="modal" data-target="#myModalEdit" ><span class="glyphicon glyphicon-pencil"></span> </a>Sửa
                 		<a href="#" ><span class="glyphicon glyphicon-trash"></span> </a>Xóa</p>
                 </td>
                  
                 
                </tr>
                <%i++;%>
                </c:forEach>
               
                </tbody>
                
</body>
</html>