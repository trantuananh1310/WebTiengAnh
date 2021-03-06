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
	<link rel="stylesheet" href="css/sweetalert.css">
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
            <form id= "addListenQuestion" action="addListenQuestion1" method="post" enctype="multipart/form-data">
            	<table class="col-xs-12">
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Câu hỏi:</h5><br></td>
							<td class="col-sm-5"><textarea  name="question" class="form-control" required="" style="height: 100px;" ></textarea><br>
							<td class="col-sm-2 "></td>
						</tr>
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Đáp án 1:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="option1" placeholder="Đáp án 1" class="form-control" name="option1" required="" /><br> </td>
							<td class="col-sm-2 "></td>
						</tr>
						
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Đáp án 2:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="option2" placeholder="Đáp án 2" class="form-control" name="option2" required="" /> 
							 <br></td>
							<td class="col-sm-2 "></td>
						</tr>
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Đáp án 3:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="option3" placeholder="Đáp án 3" class="form-control" name="option3"  required=""/><br> </td>
							<td class="col-sm-2 "></td>
						</tr>
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Đáp án 4:</h5><br></td>
							<td class="col-sm-5"><input type="text" id="option4" placeholder="Đáp án 4" class="form-control" name="option4" required="" /><br> </td>
							<td class="col-sm-2 "></td>
						</tr>
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Đáp án đúng:</h5><br></td>
							<td class="col-sm-5">
								<div class="col-sm-3">A.<input id="radio1"  type="radio"name="correctanswer" value="" ></div>
			            		<div class="col-sm-3">B.<input id="radio2" type="radio" name="correctanswer" value=""></div>
			            		<div class="col-sm-3">C.<input id="radio3" type="radio" name="correctanswer" value=""></div>
			            		<div class="col-sm-3">D.<input id="radio4" type="radio" name="correctanswer" value=""></div>
							 </td>
							<td class="col-sm-2 "></td>
						</tr> 
						<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>Hình ảnh:</h5><br></td>
							<td class="col-sm-5">
								<input id="file_picture" type="file" name="file_picture" multiple="multiple" class="form-control" />
								<br>
							 </td>
							 <td class="col-sm-2 "></td>
						</tr>
							<tr>
							<td class="col-sm-2 "></td>
							<td class="col-sm-3 "><h5>File nghe:</h5><br></td>
							<td class="col-sm-5">
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
					<input type="hidden"   class="form-control" name="listenexerciseid"  value="${listenexerciseid}" />
					<input type="hidden"   class="form-control" name="listenquestionid"  />
							
              </form>
              <div style="text-align: center;">
                   <button  id="addnew" class="btn btn-primary btn-flat" style="width: 150px;">Thêm mới</button>
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
<script src="js/sweetalert.min.js"></script>
<script type="text/javascript" language="javascript">
//    CKEDITOR.replace('noiDung');
</script>
<script src="js/main.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script>

	
  $(document).ready(function() {
// 	  $('#addListenQuestion').on('submit',function(){
// 		  var option1= $('#option1').val();
// 		  var option2= $('#option2').val();
// 		  var option3= $('#option3').val();
// 		  var option4= $('#option4').val();
		
// 	  })
	  $('#addnew').on('click',function(){
		  var option1= $('#option1').val();
		  	var option2= $('#option2').val();
		  	var option3= $('#option3').val();
		  	var option4= $('#option4').val();
		  	var question= $('#question').val();
		  	var file_mp3 = $('#file_mp3').val();
		  	var file_picture=$('#file_picture').val();
		  	if(question==''||option1==''||option2==''||option3==''||option4==''||file_mp3==''||file_picture=='')
		  		{
		  		swal("","Các trường không được để trống","warning");
		  		}
		  	else
		  		{
			  		if(option1!=option2&&option1!=option3&&option1!=option4&&option2!=option3&&option2!=option4&&option3!=option4) {
				    	  $('#radio1').val(option1); $('#radio2').val(option2);
						  $('#radio3').val(option3); $('#radio4').val(option4);
		 		    	$('#addListenQuestion').submit()
				    }
				    else
			    	{
				 	  swal("","Câu trả lời phải khác nhau","warning");
			    	}
		  		}
	  })
// 	  $('#submit').on('click',function(event){
// 		  debugger;
// 		  var option1= $('#option1').val();
// 		  var option2= $('#option2').val();
// 		  var option3= $('#option3').val();
// 		  var option4= $('#option4').val();
// 		  var form = $("#addListenQuestion");
// 		  var params = form.serializeArray();
// 		  $('#radio1').val(option1); $('#radio2').val(option2);
// 		  $('#radio3').val(option3); $('#radio4').val(option4);
// // 		  var filemp3=$('#file_mp3')[0].files();
// // 		  var image=$('#file_picture')[0].files();
// 		  var formData = new FormData();
// // 		  for (var i = 0; i < filemp3.length; i++) {
// //               formData.append(filemp3[i].name, filemp3[i]);
// //           }
// // 		  for (var i = 0; i < image.length; i++) {
// //               formData.append(image[i].name, image[i]);
// //           }
//           //Now Looping the parameters for all form input fields and assigning them as Name Value pairs. 
// //           $(params).each(function (index, element) {
// //               formData.append(element.name, element.value);
// //           });

// 		  $.ajax({
// 				type:"POST",
// 				url:"addListenQuestion1",
// 				data:formData,
// 				async: false,
// 				success:function(result)
// 				 {
// 					swal({
// 						  title: "Kết quả",
// 						  text: "Bạn đã hoàn thành bài thi với kết quả :"+result,
// 						  type: "success",
// 						  confirmButtonText: "OK",
// //						  closeOnConfirm: false
// 						},
// 						function(){
// 							window.location.href = "home"
// 					});

// 				 },
// 				  cache: false,
// 			        contentType: false,
// 			        processData: false
// 			})
// 	  })
	  
  })
</script>
</body>
</html>
