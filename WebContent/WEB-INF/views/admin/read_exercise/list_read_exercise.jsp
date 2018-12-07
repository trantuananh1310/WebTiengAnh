<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Data Tables</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="css/sweetalert.css">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="admin/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="admin/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="admin/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="admin/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="admin/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the admin/css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="admin/css/_all-skins.min.css">

  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%int i=1;%>
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <jsp:include page="../include/Header.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Quản lý bài tập đọc
      </h1>
      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
          	<div style="display: block;padding-top: 10px; padding-right: 10px; padding-left: 10px">
<!--           		<div class="box-title"> -->
          			<div class="row">
          				<div class="col-sm-6">
          					<select id="Level" class="form-control" style="width: 150px;">
							    <option value="0">Tất cả</option>
							    <c:forEach items="${listLevel}" var="item">
									<option value=${item.levelid }>${item.levelname}</option>
								</c:forEach>
							</select>
          				</div>
          			
          				<div class="col-sm-6" style="text-align: right;">
          					<input type="button" value="Thêm mới" class="btn btn-primary btn-flat add_data" style="width: 150px;"></input>
<!--           					<a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-flat" style="width: 150px;">Thêm mới</a> -->
          				</div>
          			</div>
          	</div>
            <!-- /.box-header -->
            <div class="box-body" >
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="text-align: center;">STT</th>
                  <th style="text-align: center;">Tên chủ đề</th>
                  <th style="text-align: center;">Hình Ảnh</th>
                  <th style="text-align: center;">Level</th>
                  <th style="text-align: center;"></th>
                  <th style="text-align: center;"></th>
                  <th style="text-align: center;"></th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
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
								<input type="button" value="Sửa" class="btn btn-primary btn-flat edit_data" id="${item.readexeriseid }"></input>
<%-- 								<a href="" id="${item.readexeriseid }" class="edit_data"><span class="glyphicon glyphicon-pencil"></span> Sửa</a> --%>
							</td>
			                <td class="container" style="text-align: center;">
			                	<input type="button" value="Xóa" class="btn btn-primary btn-flat delete_data" id="${item.readexeriseid }"></input>
<!-- 			                	<a href="#" ><span class="glyphicon glyphicon-trash"></span> Xóa</a> -->
			                </td>
		                </tr>
	                <%i++; %>
	                </c:forEach>
                </tbody>
                <tfoot>
                </tfoot>
                
              </table>
<!--               <textarea class="form-textarea" id="noiDung">Chào mừng bạn đến với Blog Kênh Lập Trình</textarea> -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!--Modal-->
    <div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form id="add_form" action="addReadExercise" method="post" enctype="multipart/form-data">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="modal_title" class="modal-title">Thêm mới chủ đề</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<label class="col-sm-2 " for="form-field-1">
									<h5>Nhập tên:</h5> <br />
									<h5>Chọn ảnh:</h5> <br />
									<h5>Level:</h5>
								</label>

								<div class="col-sm-10">
									<input type="text" id="readname" placeholder="Tên tiêu đề bài tập" class="form-control" name="readname"  /> 
									<br />
									<input id="file_add" type="file" name="file" class="form-control" />
									<br />
									<input type="hidden" name="readexeriseidd" id="read_exerise_id"  />
									<div class="col-xs-12" >
										<!-- PAGE CONTENT BEGINS -->
										<div class="row" >
											<div class="widget-box widget-color-grey">
												<div class="widget-body">
													<div class="widget-main no-padding">
														<select id="add_level" name="levelid" class="form-control" >
												            <c:forEach items="${listLevel}" var="item">
																<option value=${item.levelid }>${item.levelname}</option>
															</c:forEach>
														</select>													
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="Thêm mới" class="btn btn-primary btn-flat" id="btn_add"></input>
<!-- 						<button class="btn btn-info" type="submit" id="btn_add"> -->
<!-- 							<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới -->
<!-- 						</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>
<div class="row">
</div>


  <!-- Control Sidebar -->
 <jsp:include page="../include/footer.jsp"></jsp:include>
 
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="admin/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="admin/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="admin/js/jquery.dataTables.min.js"></script>
<script src="admin/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="admin/js/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="admin/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="admin/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="admin/js/demo.js"></script>
<!-- page script -->
<script src="admin/js/ckeditor/ckeditor.js" ></script>

<script type="text/javascript" language="javascript">
//    CKEDITOR.replace('noiDung');
</script>
<script>
  $(function () {
	  
    $('#example1').DataTable({
    	'scrollY': true
    })
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : true,
      'info'        : false,
      'autoWidth'   : false
    })
  })
  $(document).ready(function() {
// 	  swal("", "Các trường không được để trống", "warning");
	  $("#Level").on('change',function(event){
		  var val= $("#Level").val();
		  $.ajax({
			 type:"GET",
			 url:"getListExrciseByLevelIdAjax",
			 data: {levelId: $("#Level").val()},
			 success:function(result)
			 {
				 $('#box-body1').html(result);
			 }
			 
		  })
	  });
	  
	  $('#btn_add').on('click',function(event) {
			event.preventDefault();
			var readname= $("#readname").val();
			var filename= $("#file_add").val();
			if(readname=='' || filename==''){
				swal("", "Các trường không được để trống", "warning");
			}
			else{
				$('#add_form').submit();
			}
				
		});
	  
	  $(document).on('click','.edit_data',function() {
			var readExerciseId = $(this).attr("id");
			$.ajax({
				 type:"GET",
				 contentType : "application/json",
				 url:"editReadExercise",
				 data: {readExerciseId: readExerciseId},
				 dataType:"json",
				 success:function(result){
					 $("#readname").val(result.readname);
					 $("#add_level").val(result.levelid);
					 $("#read_exerise_id").val(result.readexeriseid);
					 $("#modal_title").text("Sửa chủ đề");
					 $("#btn_add").val("Sửa");
					 $("#myModal").modal('show');
				 }
			  })
	  });
	  
	  $(document).on('click','.add_data',function() {
					 $("#readname").val('');
					 $("#add_level").val("1");
					 $("#read_exerise_id").val('');
					 $("#btn_add").val("Thêm");
					 $("#modal_title").text("Thêm mới chủ đề");
					 $("#myModal").modal('show');
	  });
	  
	  $(document).on('click','.delete_data',function() {
		  debugger;
		  var readExerciseId = $(this).attr("id");
		  swal({
			  title: "Bạn có chắc chắn muốn xóa?",
// 			  text: "Your will not be able to recover this imaginary file!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "Yes, delete it!",
			  closeOnConfirm: false
			},
			function(){
				$.ajax({
					 type:"POST",
					 url:"deleteReadExercise",
					 data: {readExerciseId: readExerciseId},
				})
				swal({
					  title: "Đã xóa thành công!",
					  type: "success",
					  confirmButtonText: "OK",
//					  closeOnConfirm: false
					},
					function(){
					  window.location.reload();
				});
				
// 			  swal("Đã xóa thành công!", "", "success");
			});
		  
	  });
	  
// 	  $('#add_form').on('submit',function(event) {
// 			event.preventDefault();
// 			var readname= $("#form-file_add-2-1").val();
// 			var filename= $("#file_add").val();
// 			if(readname=='' || filename==''){
// 				swal("", "Các trường không được để trống", "warning");
// 			}
// 			else{
// 				$('#add_form').submit();
// 				swal("", "ngon rồi", "success");
// 				$.ajax({
// 					type: "POST",
// 					url: "addReadExercise",
// 					data:{},
// 					success:function(result){
// 						alert("dm");
// 					}
// 				})
// 			}
// 		});
  });
</script>
<script src="js/sweetalert.min.js"></script>
</body>
</html>
