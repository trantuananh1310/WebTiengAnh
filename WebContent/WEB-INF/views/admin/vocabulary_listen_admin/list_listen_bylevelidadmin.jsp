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
                <c:forEach items="${listAdListenGui}" var="item">
                 <tr>
                  <td style="text-align: center;"><%=i %></td>
                  <td class="container">${item.listenname}</td>
                  <td class="container" style="text-align: center;"><img alt="" style="width: 150px; height: 100px; "
									src="images/Listengui/${item.listenimage }">
				  </td>
				  <c:forEach items="${listLevel}" var="level">
								<c:if test="${item.levelid eq level.levelid}">
									<td class="container" style="text-align: center;">${level.levelname}</td>
								</c:if>
				  </c:forEach>
                  <td class="container" style="text-align: center;"> <p>
                 		<a href="AdminListenGuidelineContent?id=${item.listenguidelineid}"><span class="glyphicon glyphicon-search"></span> Nội dung</a>               		
                 </td>
                 <td class="container" style="text-align: center;">
                 <a href="#" data-toggle="modal" data-target="#myModalEdit" ><span class="glyphicon glyphicon-pencil"></span> Sửa</a>                
                 </td>
                 <td class="container" style="text-align: center;">
                 <a href="#" ><span class="glyphicon glyphicon-trash"></span> Xóa</p></a>
                 </td>
                  
                 
                </tr>
                <%i++; %>
                </c:forEach>
                </tbody>
                
</body>
</html>