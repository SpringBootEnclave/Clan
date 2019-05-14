<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Sửa người dùng</div>
		</div>
		<p>
			${khongcoquyen}
			${msg}
		</p>
		<div class="content-box-large box-with-header">
			<c:if test="${not empty objUser}">
			<div>
				<form action="${pageContext.request.contextPath}/admin/user/edit/${objUser.id}"
					method="post">
					<div class="row mb-10"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Tên người dùng</label> <input value="${objUser.fullname}" name="fullname"
									type="text" class="form-control"
									placeholder="Nhập tên người dùng">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Username</label> <input value="${objUser.username}" name="username"
									type="text" class="form-control"
									disabled>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Mật khẩu</label> <input name="password"
									type="text" class="form-control"
									placeholder="Nhập vào mật khẩu">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Quyền hạn</label> 
								<c:if test="${not empty listRole}">
									<select class="form-control"
										name="role_id">
										<c:forEach var="objRole" items="${listRole}">
			                                 	<c:choose>
		                               				  	<c:when test="${objUser.role_id == objRole.role_id}">
		                               				  		<option value="${objRole.role_id}" selected="selected">${objRole.name }</option>
		                               				  	</c:when>
		                               				  	<c:otherwise>
		                               				  		<option value="${objRole.role_id}">${objRole.name }</option>
		                               				  	</c:otherwise>
		                               			</c:choose>
	                                 	</c:forEach>
									</select>
								</c:if>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<input type="submit" value="Sửa" class="btn btn-success" /> <input
								type="reset" value="Nhập lại" class="btn btn-default" />
						</div>
					</div>
				</form>
			</div>
			</c:if>
		</div>
	</div>
</div>
