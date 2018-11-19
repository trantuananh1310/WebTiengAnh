<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>DAKT</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success"></span>
            </a>
           
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning"></span>
            </a>
            
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger"></span>
            </a>
           
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="admin/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="admin/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="admin/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
                    
         <li class="treeview ">
          <a href="#">
            <i class="fa fa-book"></i> <span>Quản lý người dùng</span>
         	
          </a>   
        <li class="treeview ">
          <a href="#">
            <i class="fa fa-book"></i> <span>Quản lý chia sẻ </span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu ">
            <li><a href="new 1.html"><i class="fa fa-circle-o"></i> Quản lý chia sẻ từ vựng</a></li>
            <li ><a href="new 1.html"><i class="fa fa-circle-o"></i> Quản lý chia sẻ ngữ pháp</a></li>
            <li ><a href="new 1.html"><i class="fa fa-circle-o"></i> Quản lý chia sẻ nghe</a></li>
          </ul>
        </li>
           
        <li class="treeview ">
          <a href="#">
            <i class="fa fa-book"></i> <span>Quản lý bài tập</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>   
           <ul class="treeview-menu">
            <li><a href="new 1.html"><i class="fa fa-circle-o"></i> Quản lý bài tập đọc</a></li>
            <li ><a href="new 1.html"><i class="fa fa-circle-o"></i> Quản lý bài tập nghe</a></li>
          </ul>        
        </li>
          <li class="treeview ">
          <a href="#">
            <i class="fa fa-book"></i> <span>Quản lý đề thi</span>
          </a>           
        </li>
        
<!--             <ul class="treeview-menu"> -->
<!--             <li><a href="new 1.html"><i class="fa fa-circle-o"></i> Lý thuyết</a></li> -->
<!--             <li class="active"><a href="new 1.html"><i class="fa fa-circle-o"></i> Bài tập</a></li> -->
        
       
      
      
    </section>
    <!-- /.sidebar -->
  </aside>
</body>
</html>