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
        Quản lý Listen
      </h1>
      
      <ol class="breadcrumb">
        <li><a href="HomeAdmin"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="AdminListenGuideline">Quản lý Listen</a></li>
        <li><a href="AdminListenGuidelineContent">Nội dung</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div style="display: block;padding-top: 10px; padding-right: 10px; padding-left: 10px" >
<!--           		<div class="box-title"> -->
          			<div class="row">
          				<div class="col-sm-6" style="text-align: right;">
          					<input type="button" value="Thêm mới" class="btn btn-primary btn-flat add_data" style="width: 150px;"></input>
          				</div>
          			</div>
          	</div>
            <!-- /.box-header -->
            <div class="box-body" >
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Nội dung</th>
                  <th></th>
                </tr>
                </thead>
                <tbody id="box-body1">
                 <tr>
                  <td class="container">${Content.content}</td>
                  </td>
                  <td >
                   <a href="#" data-toggle="modal" data-target="#myModalEdit" ><span class="glyphicon glyphicon-pencil"></span> Sửa</a>                
                  </td> 
                </tr>
                </tbody>
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
  <div class="row">
	<div class="col-xs-12">
		<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-white btn-default btn-round">Thêm mới chủ đề</button>
	</div>
  </div>
<div class="row">
	<!-- page script -->
<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form id="add_form" action="addListenGuideline" method="post" enctype="multipart/form-data">
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
									<h5>Nội dung:</h5>
								</label>
								<div class="col-sm-10">
									<textarea id="content" class="ckeditor" name="content" class="col-xs-12" >
       							    </textarea>
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
 </div>
    <div class="modal fade" id="myModalEdit" role="dialog" >
		<div class="modal-dialog">
			<form action="editGMGLAction" method="post"
				enctype="multipart/form-data">
				<!-- Modal content-->
				<div class="modal-content" >
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Sửa nội dung chủ đề</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<textarea class="ckeditor" name="editor1" class="col-xs-12" >
       							</textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" type="submit">
							<i class="ace-icon fa fa-check bigger-110"></i> Sửa
						</button>
					</div>
				</div>
			</form>
		</div>
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
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
  $(document).ready(function() {
	  $("#Level").on('change',function(event){
		  var val= $("#Level").val();
		  $.ajax({
			 type:"GET",
			 url:"getListListenByLevelIdAjax",
			 data: {levelId: $("#Level").val()},
			 success:function(result)
			 {
				 $('#box-body1').html(result);
			 }
			 
		  })
	  });
	  $('#btn_add').on('click',function(event) {
		  debugger;
			event.preventDefault();
			var content= $("#content").val();
			$('#add_form').submit();
		});
	  $(document).on('click','.add_data',function() {
			 $("#content").val('');
			 $("#btn_add").show();
			 $("#btn_edit").hide();
			 $("#modal_title").text("Thêm mới chủ đề");
			 $("#myModal").modal('show');
		});
  })
</script>
</body>
</html>
