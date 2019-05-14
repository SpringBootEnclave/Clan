<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="clearfix content">
    <div class="content_title">
        <h2>abc</h2>
    </div>

    <div class="clearfix single_work_container">
		<c:if test="${not empty listLandByIdCat}">
			<c:forEach var="objLand" items = "${listLandByIdCat}">
				<div class="clearfix single_work">
					<a href="${pageContext.request.contextPath}/single/${objLand.lid}"><img class="img_top" src="${pageContext.request.contextPath}/files/${objLand.picture}" alt="" /></a>
					<h2>${objLand.lname}</h2>
					<a href="${pageContext.request.contextPath}/single/${objLand.lid}">
						<p class="caption">${objLand.description}</p>
					</a>
				</div>
			</c:forEach>
		</c:if>


		<div class="clearfix work_pagination">
            <nav>
                <a class="newer floatleft" href="">
                    < -- Trang trước</a>
                        <a class="older floatright" href="">Trang kế -- ></a>
            </nav>
        </div>

    </div>
</div>