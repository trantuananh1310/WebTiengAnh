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
                  <th style="text-align: center;">STT</th>
                  <th style="text-align: center;">Tên chủ đề</th>
                  <th style="text-align: center;">Hình Ảnh</th>
                  <th style="text-align: center;">Level</th>
                  <th style="text-align: center;"></th>
                  <th style="text-align: center;"></th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
	                <c:forEach items="${listListenExer}" var="item">
		                <tr>
			                <td  style="text-align: center;"><%=i %></td>
			                <td class="container">${item.listenexercisename}</td>
			                <td class="container" style="text-align: center;"><img alt="" style="height: 50px; "
												src="images/listenexercises/${item.listenexerciseimage }"></td>
							<c:forEach items="${listLevel}" var="level">
								<c:if test="${item.levelid eq level.levelid}">
									<td class="container" style="text-align: center;">${level.levelname}</td>
								</c:if>
							</c:forEach>
							<td class="container" style="text-align: center;">
								<a href="AdminListListenQuestion?idListenExercis=${item.listenexerciseid}"><span class="glyphicon glyphicon-search"></span> Chi Tiết</a>
							</td>
<!-- 							<td class="container" style="text-align: center;"> -->
							
<%-- 								<button class="btn btn-primary edit_data" id="${item.readexeriseid }"> --%>
<!-- 									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa -->
<!-- 								</button> -->
							
<%-- 								<input type="button" value="Sửa" class="btn btn-primary btn-flat edit_data" id="${item.readexeriseid }"></input> --%>
<%-- 								<a href="" id="${item.readexeriseid }" class="edit_data"><span class="glyphicon glyphicon-pencil"></span> Sửa</a> --%>
<!-- 							</td> -->
			                <td class="container" style="text-align: center;">
			                
			                	<button class="btn btn-primary edit_data" id="${item.listenexerciseid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                
			                	<button class="btn btn-danger delete_data" id="${item.listenexerciseid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
<%-- 			                	<input type="button" value="Xóa" class="btn btn-primary btn-flat delete_data" id="${item.readexeriseid }"></input> --%>
<!-- 			                	<a href="#" ><span class="glyphicon glyphicon-trash"></span> Xóa</a> -->
			                </td>
		                </tr>
	                <%i++; %>
	                </c:forEach>
                </tbody>
                <tfoot>
                </tfoot>
                
              </table>
                
</body>
<script type="text/javascript">
<script type="text/javascript">
$('#example1').DataTable()
</script>  
</html>