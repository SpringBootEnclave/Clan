<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="clearfix sidebar">
    <div class="clearfix single_sidebar category_items">
        <h2>Danh mục bất động sản</h2>
        <c:if test="${not empty listCatHeader}">
	        <ul>
	        	<c:forEach var="objCat" items="${listCatHeader}">
	        		<c:if test="${not empty landDAO}">
	            		<li class="cat-item"><a href="${pageContext.request.contextPath }/cat/${objCat.cid}">${objCat.cname}</a>(${landDAO.getCountItemCat(objCat.cid)})</li>
	            	</c:if>
	            </c:forEach>
	        </ul>
        </c:if>
    </div>

    <div class="clearfix single_sidebar">
        <div class="popular_post">
            <div class="sidebar_title">
                <h2>Xem nhiều</h2>
            </div>
            <c:if test="${not empty listMostView}">
	            <ul>
	            	<c:forEach var = "objLand" items="${listMostView}"> 
		                <li><a href="${pageContext.request.contextPath }/single/${objLand.lid}">${objLand.lname}</a></li>
	                </c:forEach>
	            </ul>
            </c:if>
        </div>
    </div>

   <%--  <div class="clearfix single_sidebar">
        <h2>Danh mục hot</h2>
        <c:if test="${not empty listCatHeader}">
	        <ul>
	        	<c:forEach var = "objCat" items = "${listCatHeader}">
		        	<c:if test="${not empty landDAO}">
		            	<li><a href="">${objCat.cname} <span>(${landDAO.getCountItemCat(objCat.cid)})</span></a></li>
		            </c:if>
	            </c:forEach>
	        </ul>
        </c:if>
    </div> --%>
</div>
