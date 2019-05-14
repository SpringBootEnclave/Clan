<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="clearfix content">
    <h1>${objLand.lname}</h1>
    <div class="clearfix post-meta">
        <p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${objLand.address}</span> <span><i class="fa fa-folder"></i> Diện tích: ${objLand.area} m2</span></p>
    </div>
    <img class="img_top" src="${pageContext.request.contextPath}/files/${objLand.picture}" alt="" /></a>
	<div class="vnecontent">
        <p>${objLand.description}</p>
    </div>
    <div class="vnecontent">
        <p>${objLand.detail}</p>
    </div>
   
	<%-- <c:if test="${not empty landDAO}">
		 <c:set var="objLandOneItemPre" value="${landDAO.getItemPre(objLand.lid)}"></c:set>
		 <c:set var="objLandOneItemNext" value="${landDAO.getItemNext(objLand.lid)}"></c:set>
	     <a class="btn" href="${pageContext.request.contextPath }/single/${landDAO.getItemPre(objLand.lid).lid}">Bài trước</a>
   		 <a class="btn" href="${pageContext.request.contextPath }/single/${objLandOneItemNextt.lid}">Bài kế</a>
	</c:if> --%>

</div>

<%-- <div class="more_themes">
    <h2>Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i></h2>
    <div class="more_themes_container">
    <c:if test="${not empty landDAO}">
    	<c:set var="objLandLq" value="${landDAO.getItemLq(objLand.lid)}"></c:set>
	        <div class="single_more_themes floatleft">
	            <img src="http://dummyimage.com/220x150/000/fff&text=Thumbnail" alt="" />
	            <a href="">
	                <h2>Magazine Wp Template</h2>
	            </a>
	        </div>
    </c:if>
    </div>
</div> --%>