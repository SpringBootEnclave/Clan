<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý người dùng</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

    </div>
    <!-- <div class="col-md-4">
        <div class="input-group form">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
     <button class="btn btn-primary" type="button">Search</button>
   </span>
        </div>
    </div> -->
</div>
<p style="color:red; font-size:20px">${khongcoquyen }</p>
<p style="color:red; font-size:20px">${msg }</p>
<div class="row">
    <div class="panel-body">
    	
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Tên</th>
                    <th class="text-center">Username</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center">Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listUser}">
            		<c:forEach items="${listUser}" var="objUser">
            			<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/user/del/${objUser.id}"></c:set>
            			<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/user/edit/${objUser.id}"></c:set>
            			<tr class="odd gradeX">
		                    <td class="text-center">${objUser.id}</td>
		                    <td class="text-center">${objUser.fullname}</td>
		                    <td class="text-center">${objUser.username}</td>
		                    <td class="text-center">${objUser.enable}</td>
		                  <%--   <c:if test="${loginSession eq admin}"> --%>
		                    	<%-- <c:set var="" ></c:set> --%>
			                    <td class="center text-center">
			                    	<c:if test="${objUser.id != 1}">
				                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
				                        <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
			                    	</c:if>
			                    	<c:if test="${objUser.id == 1}">
				                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
			                    	</c:if>
			                    </td>
		                    <%-- </c:if> --%>
	               		 </tr>
            		</c:forEach>
            	</c:if>
            	<c:if test="${empty listUser}">
            		<tr>
            			<td colspan="6">Không có dữ liệu</td>
            		</tr>
            	</c:if>
            </tbody>
        </table>

        <%-- <!-- Pagination -->
			<nav class="text-center" aria-label="...">
				<ul class="pagination">
					<c:choose>
						<c:when test="${page eq 1}">
							<c:set var="classDisable" value="disabled"></c:set>
						</c:when>
						<c:when test="${page eq sumPage}">
							<c:set var="classDisable" value="disabled"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="classDisable" value="disabled"></c:set>
						</c:otherwise>
					</c:choose>
					
					<li class="${classDisable}"><a
						href="${pageContext.request.contextPath}/admin/land/index/${page - 1}"
						aria-label="Previous"><span aria-hidden="true">«</span></a>
					</li>
						
					<c:forEach begin="1" end="${sumPage}" var="i">
						<c:choose>
							<c:when test="${i eq page}">
								<c:set var="classActive" value="active"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="classActive" value=""></c:set>
							</c:otherwise>
						</c:choose>
						<li class="${classActive}"><a
							href="${pageContext.request.contextPath}/admin/land/index/${i}">${i}</a></li>
					</c:forEach>
					
					<li class="${classDisable}"><a
						href="${pageContext.request.contextPath}/admin/land/index/${page + 1}"
						aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</ul>
			</nav>
			<!-- /.pagination --> --%>

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
	document.getElementById('user').classList.add('current');
</script>