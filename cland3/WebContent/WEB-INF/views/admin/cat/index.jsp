<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý danh mục</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/cat/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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
<div style="color:red;font-size:2-px;">
	${msg}
</div>
<div class="row">
    <div class="panel-body">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th class="text-center" width="10%">ID</th>
                    <th class="text-center">Tên danh mục</th>
                    <th class="text-center" width="30%">Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listCat}">
            		<c:forEach items="${listCat}" var = "objCat">
            			<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/cat/del/${objCat.cid}"></c:set>
            			<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/cat/edit/${objCat.cid}"></c:set>
		                <tr class="odd gradeX">
		                    <td class="text-center">${objCat.cid}</td>
		                    <td class="text-center">${objCat.cname}</td>
		                    <td class="center text-center">
		                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                        <a href="${urlDel}" onclick = "return confirm('Bạn chắc chắn xóa danh mục này?')" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                    </td>
		                </tr>
	                </c:forEach>
                </c:if>
            </tbody>
        </table>

        <!-- Pagination -->
    <!-- <nav class="text-center" aria-label="...">
        <ul class="pagination">
            <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        </ul>
    </nav> -->
    <!-- /.pagination -->

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
	document.getElementById('cat').classList.add('current');
</script>