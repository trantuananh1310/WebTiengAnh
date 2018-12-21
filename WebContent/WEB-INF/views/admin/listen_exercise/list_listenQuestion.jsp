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
  <link rel="stylesheet" href="css/sweetalert.css">

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
        Quản lý bài tập nghe
      </h1>
      <div class="container" > 
      <div>
      <div class="col-sm-3" style=" padding-top: 10px;">
      <input type="hidden" id="idListenExercis" value="${idListenExercis}">
		</div>	
		<div class="col-sm-9 " style=" text-align: right;padding-right: 60px;">
			<div class="col-xs-9">
			<div class="col-xs-8">
			</div>
			<div class="col-xs-4">
			<button type="button" id="addexecl"  class="btn btn-block btn-primary btn-flat" >
				 Nhập từ execl</button>
			</div>
			</div>
			<div class="col-xs-3">
				
				<button id="addNew" type="button"  class="btn btn-block btn-primary btn-flat" >
				Thêm mới
				</button>
			</div>
		</div>
		</div>
		 
      </div>
      
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
            <div class="box-header">
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
            
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>STT</th>
                  <th>Câu hỏi</th>
                  <th>Hình Ảnh</th>
                  <th>File nghe</th>
                  <th>Câu trả lời </th>
                  <th>Đáp án</th>
                  <th></th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
                <c:forEach items="${listQuestion}" var="item">
                 <tr>
                  <td><%=i %></td>
                  <td class="container" style="text-align: center;">${item.question}</td>
                  <td class="container" style="text-align: center;">
               		   <img alt="" style="height: 50px; "src="images/ListenQuestion/${item.imagename }">
               		   <br>
               		   ${item.imagename}
				  </td>
				  <td class="container" style="text-align: center;">
				  	<audio controls style="width: 150px;"> <source src="Audio/listenquestion/${item.audiomp3 }" type="audio/mpeg"></audio>	
               		   <br>
               		   ${item.audiomp3}
						
				  </td>
<%-- 				 <td class="container"> <audio controls style="width: 250px;"> <source src="Audio/${item.audiomp3 }" type="audio/mpeg"></audio></td> --%>
				 <td class="container" style="text-align: center;">Đáp án 1: ${item.option1}<br>Đáp án 2: ${item.option2}<br>Đáp án 3: ${item.option3}<br>Đáp án 4: ${item.option4}</td>
				 <td class="container" style="text-align: center;">${item.correctanswer}</td>
                 <td class="container" style="text-align: center;"> 
                 		<button class="btn btn-primary edit_data" id="${item.listenquestionid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                	<button class="btn btn-danger delete_data" id="${item.listenquestionid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
                 </td>
                </tr>
                <%i++; %>
                </c:forEach>
               
                </tbody>
                <tfoot>
                <tr>
               
                </tr>
                
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
<div class="row">
 </div>
   	<div class="modal fade" id="AddNewWithFileExecl" role="dialog">
		<div class="modal-dialog">
			<form id="add_form_file" action="addListenQuestionExecl" method="post" enctype="multipart/form-data">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="modal_title" class="modal-title">Nhập dữ liệu từ file execl</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<table>
								<tr>
									<td class="col-sm-3"><br><label  for="form-field-1"><h5>Chọn file execl:</h5> <br /></label></td>
									<td class="col-sm-12">
										<div >
										<input id="file_execl" type="file" name="execl" class="form-control" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="col-sm-3"><br><label  for="form-field-1"><h5>Chọn file ảnh:</h5> <br /></label></td>
									<td class="col-sm-12">
										<div >
										<input id="file_image" type="file" name="image" class="form-control" multiple="multiple" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="col-sm-3"><br><label  for="form-field-1" multiple="multiple"><h5>Chọn file mp3:</h5> <br /></label></td>
									<td class="col-sm-12">
										<div >
										<input id="file_mp3" type="file" name="filemp3" class="form-control" />
										</div>
									</td>
								</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" value="Thêm mới" class="btn btn-primary btn-flat" id="btn_add_file"></input>
<!-- 						<button class="btn btn-info" type="submit" id="btn_add"> -->
<!-- 							<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới -->
<!-- 						</button> -->
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
<script src="js/sweetalert.min.js"></script>
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
			 url:"getListExrciseByLevelIdAjax",
			 data: {levelId: $("#Level").val()},
			 success:function(result)
			 {
				 $('#box-body1').html(result);
			 }
			 
		  })
	  })
	  $('#addNew').on('click',function(event){
		  var idListenExercis = $('#idListenExercis').val();
		  window.location.href = "addListenQuestion?listenexerciseid="+idListenExercis;
	  })
	  $('.edit_data').on('click',function(event){
		  debugger;
		  var listenQuestionId= $(this).attr("id");
		  var idListenExercis = $('#idListenExercis').val();
		  window.location.href = "editListenQuestion?listenQuestionid="+listenQuestionId+"&listenexerciseid="+idListenExercis;
	  })
	  $('.delete_data').on('click',function(event){
		  var listenQuestionId= $(this).attr("id");
		  var idListenExercis = $('#idListenExercis').val();
		 $.ajax({
			 type:"POST",
			 url:"deleteListenQuestion",
			 data:{listenQuestionId:listenQuestionId},
		 })
		 swal({
			  title: "Đã xóa thành công!",
			  type: "success",
			  confirmButtonText: "OK",
//			  closeOnConfirm: false
			},
			function(){
			  window.location.reload();
		});
	  })
	  $('#addexecl').on('click',function(event){
		  $('#AddNewWithFileExecl').modal('show');
	  })
	  $('#btn_add_file').on('click', function(event){
		  var file_execl=$('#file_execl').val();
		  var file_mp3 =$('#file_mp3').val();
		  var file_image=$('#file_image').val();
		  if(file_execl==''||file_mp3==''||file_image==''){
			swal("","Các trường không được để trống","warning");
		  }
		  else{
			  $('#add_form_file').submit();
		  }
			 
	  })
  })
</script>
<script src="js/sweetalert.min.js"></script>
</body>
</html>
