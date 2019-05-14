<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="content-box-large">
<div class="row">

    <div class="panel-heading">
        <div class="panel-title ">Quản lý liên hệ</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-4">
    </div> <div class="col-md-4">
    </div>
   
    <div class="col-md-4">
        <div class="input-group form">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
     <button class="btn btn-primary" type="button">Search</button>
   </span>
        </div>
    </div>
     <p style="color:red; font-size:20px; padding-left:50px">${msg}</p>
</div>

<div class="row">
    <div class="panel-body">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th class="text-center" width="3%">ID</th>
                    <th class="text-center" width="18%">Tên</th>
                    <th class="text-center" width="18%">Email</th>
                    <th class="text-center" width="23%">Subject</th>
                    <th class="text-center">Content</th>
                    <th class="text-center" width="7%">Chức năng</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${not empty listContact}">
            	<c:forEach var="objContact" items="${listContact}">
	                <tr class="odd gradeX">
	                    <td class="text-center">${objContact.cid}</td>
	                    <td class="text-center">${objContact.fullname}</td>
	                    <td class="text-center">${objContact.email}</td>
	                    <td class="text-center">${objContact.subject}</td>
	                    <td class="text-center">${objContact.content}</td>
	                    <td class="center text-center">
	                        <a href="${pageContext.request.contextPath}/admin/contact/del/${objContact.cid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
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
						<c:when test="${currentPage eq 1}">
							<c:set var="classDisable" value="disabled"></c:set>
						</c:when>
						<c:when test="${currentPage eq numberOfPage}">
							<c:set var="classDisable" value="disabled"></c:set>
						</c:when>
					</c:choose>
					
					<li class="${classDisable}"><a
						href="${pageContext.request.contextPath}/admin/contact/index/${currentPage - 1}"
						aria-label="Previous"><span aria-hidden="true">«</span></a>
					</li>
						
					<c:forEach begin="1" end="${numberOfPage}" var="i">
						<c:choose>
							<c:when test="${i eq currentPage}">
								<c:set var="classActive" value="active"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="classActive" value=""></c:set>
							</c:otherwise>
						</c:choose>
						<li class="${classActive}"><a
							href="${pageContext.request.contextPath}/admin/contact/index/${i}">${i}</a></li>
					</c:forEach>
					
					<li class="${classDisable}"><a
						href="${pageContext.request.contextPath}/admin/contact/index/${currentPage + 1}"
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