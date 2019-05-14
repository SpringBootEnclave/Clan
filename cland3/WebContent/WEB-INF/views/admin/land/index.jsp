<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}/files/"></c:set>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý bài viết</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/land/add/${objLand.lid}" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

    </div>
    <div class="col-md-4">
        <div class="input-group form">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
     <button class="btn btn-primary" type="button">Search</button>
   </span>
        </div>
    </div>
</div>

<div class="row">
    <div class="panel-body">
    	<c:if test="${not empty msg }">
    		<p style="color:red">${msg}</p>
    	</c:if>
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Danh mục</th>
                    <th>Lượt đọc</th>
                    <th>Hình ảnh</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${not empty listLand}">
            	<c:forEach var="objLand" items="${listLand}">
	                <tr class="odd gradeX">
	                    <td class="text-center">${objLand.lid}</td>
	                    <td class="text-center">${objLand.lname}</td>
	                    <td class="text-center">${objLand.cname}</td>
	                    <td class="center">${objLand.count_views}</td>
	                    <td class="center text-center">
	                        <img width = "200px" height = "200px" src="${pageContext.request.contextPath}/files/${objLand.picture}" />
	                    </td>
	                    <td class="center text-center">
	                        <a href="${pageContext.request.contextPath}/admin/land/edit/${objLand.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                        <a href="${pageContext.request.contextPath}/admin/land/del/${objLand.lid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                    </td>
	                </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>

        <!-- Pagination -->
			<nav class="text-center" aria-label="...">
				<ul class="pagination">
					<c:choose>
						<c:when test="${page eq 1}">
							<c:set var="classDisable" value="disabled"></c:set>
						</c:when>
						<c:when test="${page eq sumPage}">
							<c:set var="classDisable" value="disabled"></c:set>
						</c:when><%-- 
						<c:otherwise>
							<c:set var="classDisable" value="disabled"></c:set>
						</c:otherwise> --%>
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
			<!-- /.pagination -->

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
	document.getElementById('land').classList.add('current');
</script>