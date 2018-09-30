<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
		<table border=1>
    	<tr>
            <th>Name</th>
            <th>Email</th>
            <th>Company</th>
        </tr>
	    <c:forEach var="m" items="${list }" varStatus="stt">
	    	<tr class="${stt.index % 2==0 ? 'even' : 'odd'}">
	            <td><a href="editEmp?id=${m.memberid }">${m.name}</a></td>
	            <td>${m.membername}</td>
	            <td>${m.categorymember.categorymembername}</td>
	        </tr>
   	    </c:forEach>
</table>
</body>
</html>