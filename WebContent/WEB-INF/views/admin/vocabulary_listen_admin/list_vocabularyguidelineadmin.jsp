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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
	
  <!-- Google Font -->
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
        Quản lý Vocabulary
      </h1>
      <div class="container" > 
      <div>
      <div class="col-sm-6 " style=" padding-top: 10px;">
      <select id="Level" class="form-control" style="margin-left: -29px;width: 150px;">
      		<option value="0">Tất cả</option>
            <c:forEach items="${listLevel}" var="item">
			   <option value=${item.levelid }>${item.levelname}</option>
			 </c:forEach>
		</select>
		</div>	
		<div class="col-sm-6 " style=" text-align: right;padding-right: 60px;">
			<div class="col-xs-12">
				<h5 style="color: red">${msg }</h5>
				<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-block btn-primary btn-flat" 
				style="width: 200px;margin-left: 272px;">
				Thêm mới
				</button>
			</div>
		</div>
		</div>
		 
      </div>
      
      <ol class="breadcrumb">
        <li><a href="HomeAdmin"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="AdminVocabularyGuideline">Quản lý Vocabulary</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          

          <div class="box">
            <div class="box-header">
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
            
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>STT</th>
                  <th>Tên chủ đề</th>
                  <th>Hình Ảnh</th>
                  <th> </th>
                  <th> </th>
                  <th> </th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
                <c:forEach items="${listAdVocabGui}" var="item">
                 <tr>
                  <td><%=i %></td>
                  <td class="container">${item.vocabularyname}</td>
                  <td class="container"><img alt="" style="width: 150px; height: 100px; "
									src="images/Vocabgui/${item.vocabularyimage }"></td>
                 <td class=> <p>
                 		<a href="AdminVocabularyContent?vocabid=${item.vocabularyguidelineid}"><span class="glyphicon glyphicon-search"></span> Nội dung</a>
                 </td>
                 <td >
                 <a href="#" data-toggle="modal" data-target="#myModalEdit" ><span class="glyphicon glyphicon-pencil"></span> Sửa</a>                
                 </td>
                 <td>
                 <a href="#" ><span class="glyphicon glyphicon-trash"></span> Xóa</p></a>
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
  <div class="row">
	<div class="col-xs-12">
		<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-white btn-default btn-round">Thêm mới chủ đề</button>
	</div>

 </div>
    <div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form action="editGMGLAction" method="post"
				enctype="multipart/form-data">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm mới chủ đề</h4>
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
									<input type="text" id="form-field-2-1" placeholder="Tên tiêu đề bài tập" class="form-control" name="grammarname"  /> 
										<br />
										<input type="file" name="file" class="form-control" />
										<br />

									<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////- -->


									<div class="col-xs-12" >
										<!-- PAGE CONTENT BEGINS -->
										<div class="row" >

											<div class="widget-box widget-color-grey">

												<div class="widget-body">
													<div class="widget-main no-padding">
													<select id="Level" class="form-control" >
											            <c:forEach items="${listLevel}" var="item">
														   <option value=${item.levelid }>${item.levelname}</option>
														 </c:forEach>
													</select>													</div>

												</div>
											</div>
										</div>
									</div>

									<!-- <a href="#" id="btn-scroll-up"
											class="btn-scroll-up btn btn-sm btn-inverse"> <i
											class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
										</a> -->

									<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////- -->

								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" type="submit">
							<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<div class="row">
	

 </div>
    <div class="modal fade" id="myModalEdit" role="dialog">
		<div class="modal-dialog">
			<form action="editGMGLAction" method="post"
				enctype="multipart/form-data">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Sửa nội dung chủ đề</h4>
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
									<input type="text" id="form-field-2-1" placeholder="Tên tiêu đề bài tập" class="form-control" name="listenExerciseName"  /> 
										<br />
										<input type="file" name="file" class="form-control" />
										<br />

									<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////- -->


									<div class="col-xs-12" >
										<!-- PAGE CONTENT BEGINS -->
										<div class="row" >

											<div class="widget-box widget-color-grey">

												<div class="widget-body">
													<div class="widget-main no-padding">
													<select id="Level" class="form-control" name="levelId" >
											            <c:forEach items="${listLevel}" var="item">
														   <option value=${item.levelid }>${item.levelname}</option>
														 </c:forEach>
													</select> 
													</div>

												</div>
											</div>
										</div>
									</div>

									<!-- <a href="#" id="btn-scroll-up"
											class="btn-scroll-up btn btn-sm btn-inverse"> <i
											class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
										</a> -->

									<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////- -->

								</div>
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
			 url:"getListVocabByLevelIdAjax",
			 data: {levelId: $("#Level").val()},
			 success:function(result)
			 {
				 $('#box-body1').html(result);
			 }
			 
		  })
	  })
  })
</script>
</body>
</html>
