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
        Quản lý đề thi
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
          				<div class="col-sm-12" style="text-align: right;">
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
                  <th style="text-align: center;"></th>
                  <th style="text-align: center;"></th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
	                <c:forEach items="${list}" var="item">
		                <tr>
			                <td  style="text-align: center;"><%=i %></td>
			                <td class="container">${item.examinationame}</td>
			                <td class="container" style="text-align: center;"><img alt="" style="height: 50px; "
												src="images/examination/${item.examinatioimage }"></td>
							<td class="container" style="text-align: center;">
								<a href="Examinationquestion?examinationid=${item.examinationid}"><span class="glyphicon glyphicon-search"></span> DS câu hỏi</a>
							</td>
<!-- 							<td class="container" style="text-align: center;"> -->
							
<%-- 								<button class="btn btn-primary edit_data" id="${item.examinationid }"> --%>
<!-- 									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa -->
<!-- 								</button> -->
							
<%-- 								<input type="button" value="Sửa" class="btn btn-primary btn-flat edit_data" id="${item.examinationid }"></input> --%>
<%-- 								<a href="" id="${item.examinationid }" class="edit_data"><span class="glyphicon glyphicon-pencil"></span> Sửa</a> --%>
<!-- 							</td> -->
			                <td class="container" style="text-align: center;">
			                
			                	<button class="btn btn-primary edit_data" id="${item.examinationid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                
			                	<button class="btn btn-danger delete_data" id="${item.examinationid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
<%-- 			                	<input type="button" value="Xóa" class="btn btn-primary btn-flat delete_data" id="${item.examinationid }"></input> --%>
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
			<form id="add_form" action="addAndEditExamination" method="post" enctype="multipart/form-data">
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
								</label>

								<div class="col-sm-10">
									<input type="text" id="examinationame" placeholder="Tên bài thi" class="form-control" name="examinationame"  /> 
									<br />
									<input id="file_add" type="file" name="file" class="form-control" />
									<br />
									<input type="hidden" name="examinationidd" id="examination_id"  />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
<!-- 						<input type="submit" value="Thêm mới" class="btn btn-primary btn-flat" id="btn_add"></input> -->
						<button class="btn btn-info" type="submit" id="btn_edit">
							<i class="ace-icon fa fa-check bigger-110"></i> Sửa
						</button>
						<button class="btn btn-info" type="submit" id="btn_add">
							<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới
						</button>
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
	  
    $('#example1').DataTable()
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
// 	  $("#Level").on('change',function(event){
// 		  var val= $("#Level").val();
// 		  $.ajax({
// 			 type:"GET",
// 			 url:"getListExrciseByLevelIdAjax",
// 			 //data: {levelId: $("#Level").val()},
// 			 success:function(result)
// 			 {
// 				 $('#box-body1').html(result);
// 			 }
			 
// 		  })
// 	  });
	  
	  $('#btn_add').on('click',function(event) {
			event.preventDefault();
			var examinationame= $("#examinationame").val();
			//var examinationid= $("#examinationid").val();
			
			var filename= $("#file_add").val();
			if(examinationame=='' || filename==''){
				swal("", "Các trường không được để trống", "warning");
			}
			else{
				$('#add_form').submit();
			}
		});
	  
	  $(document).on('click','.edit_data',function() {
			var examinationId = $(this).attr("id");
			$.ajax({
				 type:"GET",
				 contentType : "application/json",
				 url:"editExamination",
				 data: {examinationId: examinationId},
				 dataType:"json",
				 success:function(result){
					 $("#examinationame").val(result.examinationame);
					// $("#examinationid").val(result.examinationid);
					// $("#add_level").val(result.levelid);
					 $("#examination_id").val(result.examinationid);
					 $("#modal_title").text("Sửa chủ đề");
					 $("#btn_edit").show();
					 $("#btn_add").hide();
					 $("#myModal").modal('show');
				 }
			  })
	  });
	  
	  $(document).on('click','.add_data',function() {
					 $("#examinationame").val('');
					// $("#add_level").val("1");
					 $("#examination_id").val('');
					 $("#btn_add").show();
					 $("#btn_edit").hide();
					 $("#modal_title").text("Thêm mới chủ đề");
					 $("#myModal").modal('show');
	  });
	  
	  $(document).on('click','.delete_data',function() {
		  debugger;
		  var examinationId = $(this).attr("id");
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
					 url:"deleteExamination",
					 data: {examinationId: examinationId},
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
// 			var examinationid= $("#form-file_add-2-1").val();
// 			var filename= $("#file_add").val();
// 			if(examinationid=='' || filename==''){
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
