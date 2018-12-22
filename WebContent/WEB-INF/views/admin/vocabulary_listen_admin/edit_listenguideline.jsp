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
            <form id= "editVocabularyContent" action="editVocabularyContent" method="post" enctype="multipart/form-data">
            	<table class="col-xs-12">
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Từ vựng:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="vocabularycontentname"  class="form-control" name="vocabularycontentname" value="${item.vocabularycontentname}" /><br> </td>
							<td class="col-sm-2 "></td>
						</tr>
						
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Phiên âm:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="transcribe"  class="form-control" name="transcribe"  value="${item.transcribe}"/> 
							 <br></td>
							<td class="col-sm-2 "></td>
						</tr>
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Nghĩa tiếng Việt:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="mean"  class="form-control" name="mean" value="${item.mean}" /><br> </td>
							<td class="col-sm-2 "></td>
						</tr>
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Hình ảnh:</h5><br></td>
							<td class="col-sm-5">
								<img alt="" style="height: 50px; "src="images/VocabContent/${item.image}">
			               		  <br>
			               		  ${item.image}
			               		  <br>
								<input id="file_picture" type="file" name="file_picture" multiple="multiple" class="form-control" />
								<br>
							 </td>
							 <td class="col-sm-2 "></td>
						</tr>
							<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>File nghe:</h5><br></td>
							<td class="col-sm-5">
								<audio controls style="width: 150px;"> <source src="Audio/${item.audiomp3 }" type="audio/mpeg"></audio>	
               		  			 <br>
               		 			 ${item.audiomp3}<br>
								<input id="file_mp3" type="file" name="file_mp3" multiple="multiple" class="form-control" />
								<br>
							 </td>
							 <td class="col-sm-2"></td>
						</tr>
						<tr>
							<td class="col-sm-2"></td>
							<td class="col-sm-3"><br></td>
							<td class="col-sm-5">
								
								<br>
							 </td>
							 <td class="col-sm-2 "></td>
						</tr>	
					</table>
					<input type="hidden"   class="form-control" name="vocabularyguidelineid"  value="${vocabularyguidelineid}" />
					<input type="hidden"   class="form-control" name="vocabularycontentid" value="${item.vocabularycontentid }" />
							
              </form>
              <div style="text-align: center;">
					<input  id='editContent' type="button" value="Lưu" class="btn btn-primary btn-flat add_data" style="width: 150px;"></input>
			</div>
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

  
  $(document).ready(function() {
	  $('#editContent').on('click',function(){
		    var vocabularycontentname= $('#vocabularycontentname').val();
		  	var transcribe= $('#transcribe').val();
		  	var mean= $('#mean').val();
		  	var file_mp3 = $('#file_mp3').val();
		  	var file_picture=$('#file_picture').val();
		  	if(vocabularycontentname==''||transcribe==''||mean=='')
		  		{
		  		swal("","Các trường không được để trống","warning");
		  		}
		  	else
		  		{
		 		    	$('#editVocabularyContent').submit()
		  		}
	  })
  })
</script>
<script src="js/sweetalert.min.js"></script>
</body>
</html>
