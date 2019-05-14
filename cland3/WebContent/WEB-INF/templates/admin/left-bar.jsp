<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Nav-bar -->
  <ul class="nav">
      <!-- Main menu class="current"-->
       <li id = "home"><a href="${pageContext.request.contextPath}/admin"><i class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
       <li id = "cat"><a href="${pageContext.request.contextPath}/admin/cat/index"><i class="glyphicon glyphicon-list"></i> Danh mục</a></li>
       <li id = "land"><a href="${pageContext.request.contextPath}/admin/land/index"><i class="glyphicon glyphicon-book"></i> Bài viết</a></li>
       <li id = "user"><a href="${pageContext.request.contextPath}/admin/user/index"><i class="glyphicon glyphicon-user"></i> Người dùng</a></li>
       <li id = "contact"><a href="${pageContext.request.contextPath}/admin/contact/index"><i class="glyphicon glyphicon-user"></i> Liên hệ</a></li>
      <!--  <li id = "add"><a href="add.php"><i class="glyphicon glyphicon-plus"></i> Thêm</a></li> -->
       <li class="submenu">
        	<a href="#"><i class="glyphicon glyphicon-list"></i> Pages
				<span class="caret pull-right"></span>
			</a>
              <!-- Sub menu -->
	       <ul>
	           <li><a href="login.php">Login</a></li>
	           <li><a href="javascript:void(0)">Signup</a></li>
	       </ul>
	   </li>
  </ul>
  <!-- /.nav-bar -->