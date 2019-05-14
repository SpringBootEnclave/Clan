<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa thông tin người dùng</div>
             </div>
             <div class="content-box-large box-with-header">
	             	 <c:if test="${not empty msg}">
			    		<h4>${msg}</h4>
			    	</c:if>
			    	<form:errors path="objUser.*" cssClass="error"></form:errors>
	                 <div>
                 	<form action="" method="post">
                     <div class="row mb-10"></div>
                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="password">Username</label>
                                 <input name="password" type="text" class="form-control" value='<c:if test="${not empty objUser}">${objUser.username}</c:if>' disabled="disabled">
                             </div>
                             <div class="form-group">
                                 <label for="password">Fullname</label>
                                 <input name="password" type="text" class="form-control" value='<c:if test="${not empty objUser}">${objUser.fullname}</c:if>' disabled="disabled">
                             </div>
                             <div class="form-group">
                                 <label for="password">Password</label>
                                 <input name="password" type="password" class="form-control" value='<c:if test="${not empty objUser}">${objUser.password}</c:if>' disabled="disabled">
                             </div>
                             <div class="form-group">
                                 <label for="enable">Enable</label>
                                 <input name="enable" type="text" class="form-control" value='<c:if test="${not empty objUser}">${objUser.enable}</c:if>' disabled="disabled">
                             </div>
                             <div class="form-group">
                                 <label for="name">Chức năng</label>
                                 <select name="role_id">
                                 	<c:if test="${not empty roles}">
	                                 	<c:forEach items="roles" var="objRole">
	                                 		<option value="${objRole.role_id}" selected='<c:if test="${objUser.role_id == objRole.role_id}">selected</c:if>'>${objRole.name}</option>
	                                 	</c:forEach>
                                 	</c:if>
                                 </select>
                             </div>
                         </div>
                         
                     </div>
                     <!-- <hr> -->

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Sửa" class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>
					</form>
                 </div>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->