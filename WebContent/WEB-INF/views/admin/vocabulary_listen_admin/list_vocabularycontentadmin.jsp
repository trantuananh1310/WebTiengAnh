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
        Quản lý Vocabulary
      </h1>
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
            <div style="display: block;padding-top: 10px; padding-right: 10px; padding-left: 10px">
<!--           		<div class="box-title"> -->
          			<div class="row">
          				<div class="col-sm-10">
          					<input type="hidden" id ="vocabid" value="${vocabid}"/>
          				</div>
          				<div class="col-sm-2" style="text-align: right;">
          					<button id="addNew" type="button"  class="btn btn-block btn-primary btn-flat" style="style="width: 150px;margin-left: 370px;" >
									Thêm mới
							</button>
          				</div>
          			</div>
          	</div>
            <!-- /.box-header -->
            <div class="box-body" >
            
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="text-align: center;">STT</th>
                  <th style="text-align: center;">Từ vựng</th>
                  <th style="text-align: center;">Phiên âm</th>
                  <th style="text-align: center;">Mp3</th>
                  <th style="text-align: center;">Hình Ảnh</th>
                  <th style="text-align: center;">Nghĩa Tiếng Việt </th>
                  	
                </tr>
                </thead>
                <tbody id="box-body1">
                <c:forEach items="${listAdVocabCon}" var="item">
                 <tr>
                  <td style="text-align: center;"><%=i %></td>
                  <td class="container" style="text-align: center;">${item.vocabularycontentname}</td>
                  <td class="container" style="text-align: center;">${item.transcribe}</td>
                  <td class="container" style="text-align: center;">${item.audiomp3}</td>
                  <td class="container" style="text-align: center;"><img alt="" style="width: 150px; height: 100px; "
									src="images/VocabContent/${item.image }"></td>
				 <td class="container" style="text-align: center;">${item.mean}</td>
                 <td class="container" style="text-align: center;">
			                
			                	<button class="btn btn-primary edit_data" id="${item.vocabularycontentid }">
									<i class="ace-icon fa fa-edit bigger-110"></i> Sửa
								</button>
			                
			                	<button class="btn btn-danger delete_data" id="${item.vocabularycontentid }">
									<i class="ace-icon fa fa-trash bigger-110"></i> Xóa
								</button>
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
			<form id="add_form" action="addVocabularyContent" method="post" enctype="multipart/form-data">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm mới nội dung chủ đề</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<label class="col-sm-2 " for="form-field-1">
									<h5>Từ vựng:</h5> <br />
									<h5>Phiên âm:</h5> <br />
<!-- 									<h5>Chọn mp3:</h5> <br /> -->
<!-- 									<h5>Chọn ảnh:</h5> <br /> -->
									<h5>Nghĩa tiếng Việt:</h5>
								</label>

								<div class="col-sm-10">
										<input type="text" id="vocabularycontentname" placeholder="Từ vựng" class="form-control" name="vocabularycontentname"  /> 
										<br />
										<input type="text" id="trancribe" placeholder="Phiên âm" class="form-control" name="trancribe"  /> 
										<br />
<!-- 										<input id ="file_mp3" type="file" name="filemp3" class="form-control" /> -->
<!-- 										<br /> -->
<!-- 										<input id="file_add" type="file" name="file" class="form-control" /> -->
<!-- 										<br /> -->
										<input type="text" id="mean" placeholder="Nghĩa của từ vựng" class="form-control" name="mean"  /> 
										<br />
										<input type="hidden" id="vocabularyguidelineid" class="form-control" name="vocabularyguidelineid" value="${vocabularyguidelineid }" />
									    <input type="hidden" name="vocabularycontentid" id="vocabulary_content_id"  /> 

									<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////- -->


									

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
<!--     <div class="modal fade" id="myModalEdit" role="dialog"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<form action="editGMGLAction" method="post" -->
<!-- 				enctype="multipart/form-data"> -->
<!-- 				Modal content -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 						<h4 class="modal-title">Sửa nội dung chủ đề</h4> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-xs-12"> -->
<!-- 								PAGE CONTENT BEGINS -->
<!-- 								<label class="col-sm-2 " for="form-field-1"> -->
<!-- 									<h5>Từ vựng:</h5> <br /> -->
<!-- 									<h5>Phiên âm:</h5> <br /> -->
<!-- 									<h5>Chọn mp3:</h5> <br /> -->
<!-- 									<h5>Chọn ảnh:</h5> <br /> -->
<!-- 									<h5>Nghĩa tiếng Việt:</h5> -->
<!-- 								</label> -->

<!-- 								<div class="col-sm-10"> -->
<!-- 									<input type="text" id="form-field-2-1" placeholder="Từ vựng" class="form-control" name="vocabularyname"  />  -->
<!-- 										<br /> -->
<!-- 										<input type="text" id="form-field-2-2" placeholder="Phiên âm" class="form-control" name="trancribe"  />  -->
<!-- 										<br /> -->
<!-- 										<input type="file" name="filemp3" class="form-control" /> -->
<!-- 										<br /> -->
<!-- 										<input type="file" name="fileimg" class="form-control" /> -->
<!-- 										<br /> -->
<!-- 										<input type="text" id="form-field-2-3" placeholder="Nghĩa của từ vựng" class="form-control" name="mean"  />  -->
<!-- 										<br /> -->

<!-- 									<a href="#" id="btn-scroll-up"
<!-- 											class="btn-scroll-up btn btn-sm btn-inverse"> <i -->
<!-- 											class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i> -->
<!-- 										</a> --> -->

<!-- 									///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////- -->

<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<button class="btn btn-info" type="submit"> -->
<!-- 							<i class="ace-icon fa fa-check bigger-110"></i> Sửa -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->


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
	  });
	  $('#addNew').on('click',function(event){
		  var vocabid = $('#vocabid').val();
		  window.location.href = "addVocabularyContent?vocabularyguidelineid="+vocabid;
	  })
	  $('.edit_data').on('click',function(event){
		  debugger;
		  var vocabularyContentId= $(this).attr("id");
		  var vocabid = $('#vocabid').val();
		  window.location.href = "editVocabularyContent?vocabularyContentid="+vocabularyContentId+"&vocabularyguidelineid="+vocabid;
	  })
	  $('.delete_data').on('click',function(event){
		  var vocabularyContentId= $(this).attr("id");
		  var vocabid = $('#vocabid').val();
		 $.ajax({
			 type:"POST",
			 url:"deleteVocabularyContent",
			 data:{vocabularyContentId:vocabularyContentId},
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
  })
</script>
<script src="js/sweetalert.min.js"></script>
</body>
</html>
