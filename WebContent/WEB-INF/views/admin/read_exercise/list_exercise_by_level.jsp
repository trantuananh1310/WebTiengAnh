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
                 <c:forEach items="${lstReadEx}" var="item">
		                <tr>
			                <td  style="text-align: center;"><%=i %></td>
			                <td class="container">${item.readname}</td>
			                <td class="container" style="text-align: center;"><img alt="" style="height: 50px; "
												src="images/readexercises/${item.readimage }"></td>
							<c:forEach items="${listLevel}" var="level">
								<c:if test="${item.levelid eq level.levelid}">
									<td class="container" style="text-align: center;">${level.levelname}</td>
								</c:if>
							</c:forEach>
							<td class="container" style="text-align: center;">
								<a href="AdminListReadQuestion?readexerciseid=${item.readexeriseid}"><span class="glyphicon glyphicon-search"></span> Chi Tiết</a>
							</td>
			                <td class="container" style="text-align: center;">
			                
			                	<button class="btn btn-primary edit_data" id="${item.readexeriseid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                
			                	<button class="btn btn-danger delete_data" id="${item.readexeriseid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
			                </td>
		                </tr>
	                <%i++; %>
	                </c:forEach>
               
                </tbody>
                
</body>
</html>