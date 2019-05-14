<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm người dùng</div>
		</div>
		<div class="content-box-large box-with-header">

			<div>
				<form action="${pageContext.request.contextPath}/admin/user/add"
					method="post">
					<div class="row mb-10"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Tên người dùng</label> <input name="fullname"
									type="text" class="form-control"
									placeholder="Nhập tên người dùng">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Username</label> <input name="username"
									type="text" class="form-control"
									placeholder="Nhập username">
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
								<label>Quyền hạn</label> <select class="form-control"
									name="role_id">
									<option value="3">User</option>
									<option value="2">Editor</option>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<input type="submit" value="Thêm" class="btn btn-success" /> <input
								type="reset" value="Nhập lại" class="btn btn-default" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
