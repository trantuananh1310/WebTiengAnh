<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Data Tables</title>
  <link rel="stylesheet" href="css/sweetalert.css">
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
          	<div style="display: block;padding-top: 10px; padding-right: 10px">
<!--           		<div class="box-title"> -->
          			<div class="row">
          				<div class="col-sm-12" style="text-align: right;">
          					<input type="button" value="Nhập từ excel" id="add_excel" class="btn btn-primary btn-flat" style="width: 150px;"></input>
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
                  <th style="text-align: center;">Câu hỏi</th>
                  <th style="text-align: center;">Đáp án 1</th>
                  <th style="text-align: center;">Đáp án 2</th>
                  <th style="text-align: center;">Đáp án 3</th>
                  <th style="text-align: center;">Đáp án 4</th>
                  <th style="text-align: center;">Đáp án đúng</th>
<!--                   <th style="text-align: center;"></th> -->
                  <th style="text-align: center;"></th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
	                <c:forEach items="${lstReadQuestion}" var="item">
		                <tr>
			                <td  style="text-align: center;"><%=i %></td>
			                <td class="container">${item.question}</td>
			                <td class="container" style="text-align: center;">${item.option1}</td>
			                <td class="container" style="text-align: center;">${item.option2}</td>
			                <td class="container" style="text-align: center;">${item.option3}</td>
			                <td class="container" style="text-align: center;">${item.option4}</td>
			                <td class="container" style="text-align: center;">${item.correctanswer}</td>
<!-- 							<td class="container" style="text-align: center;"><a href="#" data-toggle="modal" data-target="#myModalEdit" ><span class="glyphicon glyphicon-pencil"></span> Sửa</a></td> -->
			                <td class="container" style="text-align: center;">
			                	<button class="btn btn-primary edit_data" id="${item.readquestionid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                
			                	<button class="btn btn-danger delete_data" id="${item.readquestionid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
<!-- 			                	<a href="#" ><span class="glyphicon glyphicon-trash"></span> Xóa</a> -->
			                </td>
		                </tr>
	                <%i++; %>
	                </c:forEach>
                </tbody>
                <tfoot>
                </tfoot>
                
              </table>
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
			<form action="" method="post" id="add_form">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="modal_title">Thêm mới câu hỏi</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<label class="col-sm-3 " for="form-field-1">
									<h5 rows="3">Câu hỏi:</h5> <br /><br /><br />
									<h5>Đáp án 1:</h5> <br />
									<h5>Đáp án 2:</h5> <br />
									<h5>Đáp án 3:</h5> <br />
									<h5>Đáp án 4:</h5> <br />
									<h5>Đáp án đúng:</h5>
								</label>

								<div class="col-sm-9">
									<textarea class="form-control" rows="3" placeholder="Câu hỏi" id="question" name="question"></textarea>
									<br />
<!-- 									<input type="text" id="question" placeholder="Câu hỏi" class="form-control" name="question"  />  -->
<!-- 									<br /> -->
									<input type="text" id="option1" placeholder="Đáp án 1" class="form-control" name="option1"  /> 
									<br />
									<input type="text" id="option2" placeholder="Đáp án 2" class="form-control" name="option2"  /> 
									<br />
									<input type="text" id="option3" placeholder="Đáp án 3" class="form-control" name="option3"  /> 
									<br />
									<input type="text" id="option4" placeholder="Đáp án 4" class="form-control" name="option4"  /> 
									<br />
									<input type="text" id="correctanswer" placeholder="Đáp án đúng" class="form-control" name="correctanswer"  />
									<input type="hidden" id="readexerciseid" class="form-control" name="readexerciseid" value="${readexerciseid }" />
									<input type="hidden" name="readquesid" id="read_question_id"  /> 
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
<!-- 						<button class="btn btn-info" type="submit" id="btn_edit"> -->
<!-- 							<i class="ace-icon fa fa-check bigger-110"></i> Sửa -->
<!-- 						</button> -->
						<button class="btn btn-info" type="submit" id="btn_add" >
							<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<div class="row">
</div>

<div class="modal fade" id="AddNewWithFileExecl" role="dialog">
		<div class="modal-dialog">
			<form id="add_form_file" action="addReadQuestionExcel" method="post" enctype="multipart/form-data">
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
										<input id="file_excel" type="file" name="excel" class="form-control" />
										</div>
									</td>
								</tr>
								</table>
							</div>
						</div>
						<input type="hidden" id="readexerciseid" class="form-control" name="readexerciseid" value="${readexerciseid }" />
					</div>
					
					<div class="modal-footer">
						<input type="button" value="Thêm mới" class="btn btn-primary btn-flat" id="btn_add_file"></input>
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
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : true,
      'info'        : false,
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
	  
	  $('#btn_add').on('click',function(event) {
			event.preventDefault();
			var question= $("#question").val().toLowerCase();
			var option1= $("#option1").val().toLowerCase();
			var option2= $("#option2").val().toLowerCase();
			var option3= $("#option3").val().toLowerCase();
			var option4= $("#option4").val().toLowerCase();
			var correctanswer= $("#correctanswer").val().toLowerCase();
			if(question=='' || option1=='' || option2=='' || option3=='' || option4=='' || correctanswer==''){
				swal("", "Các trường không được để trống", "warning");
			}
			else if(option1!=correctanswer && option2!=correctanswer && 
					option3!=correctanswer && option4!=correctanswer){
				swal("", "Đáp án đúng phải trùng 1 trong 4 đáp án", "warning");
			}
			else if(option1==option2 || option1==option3 || option1==option4 || 
					option2==option3 || option2==option4 || option3==option4){
				swal("", "Các đáp án không được trùng nhau", "warning");
			}
			else{
				$.ajax({
					type: "POST",
					url: "addReadQuestion",
					data: $('#add_form').serialize(),
					success:function(result){
						swal({
							  title: "Thành công!",
							  type: "success",
							  confirmButtonText: "OK",
							  closeOnConfirm: false
							},
							function(){
							  window.location.reload();
						});
					}
				})
			}
		});
		  
		$(document).on('click','.edit_data',function() {
			var readQuestionId = $(this).attr("id");
			$.ajax({
				 type:"GET",
				 contentType : "application/json",
				 url:"editReadQuestion",
				 data: {readQuestionId: readQuestionId},
				 dataType:"json",
				 success:function(result){
					 $("#question").val(result.question);
					 $("#option1").val(result.option1);
					 $("#option2").val(result.option2);
					 $("#option3").val(result.option3);
					 $("#option4").val(result.option4);
					 $("#correctanswer").val(result.correctanswer);
					 $("#read_question_id").val(result.readquestionid);
					 $("#modal_title").text("Sửa câu hỏi");
					 $("#btn_add").text("Sửa");
					 $("#myModal").modal('show');
				 }
			  })
		});
		
		$(document).on('click','.add_data',function() {
			 $("#question").val('');
			 $("#option1").val('');
			 $("#option2").val('');
			 $("#option3").val('');
			 $("#option4").val('');
			 $("#correctanswer").val('');
			 $("#read_question_id").val('');
			 $("#btn_add").text("Thêm mới");
// 			 $("#btn_edit").hide();
			 $("#modal_title").text("Thêm mới chủ đề");
			 $("#myModal").modal('show');
		});
		
		$(document).on('click','.delete_data',function() {
			var readQuestionId = $(this).attr("id");
			  swal({
				  title: "Bạn có chắc chắn muốn xóa?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "Yes, delete it!",
				  closeOnConfirm: false
				},
				function(){
					$.ajax({
						 type:"POST",
						 url:"deleteReadQuestion",
						 data: {readQuestionId: readQuestionId},
					})
					swal({
						  title: "Đã xóa thành công!",
						  type: "success",
						  confirmButtonText: "OK",
//						  closeOnConfirm: false
						},
						function(){
						  window.location.reload();
					});
				});
			  
		  });
		
		$('#add_excel').on('click',function(event){
			  $('#AddNewWithFileExecl').modal('show');
		});
		
		$('#btn_add_file').on('click', function(event){
			  var file_excel=$('#file_excel').val();
			  if(file_excel==''){
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
