<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="clearfix slider">
     <ul class="pgwSlider">
         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/megamind_07.jpg" alt="Paris, France" data-description="Eiffel Tower and Champ de Mars" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/megamind_07.jpg" /></li>
         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/wall-e.jpg" alt="Montréal, QC, Canada" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/wall-e.jpg" data-description="Eiffel Tower and Champ de Mars" /></li>
         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/up-official-trailer-fake.jpg" alt="Shanghai, China" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/up-official-trailer-fake.jpg" data-description="Shanghai ,chaina"></li>
     </ul>
 </div>

 <div class="clearfix content">
     <div class="content_title">
         <h2>Bài viết mới</h2>
     </div>
	<c:if test="${not empty listLand}">
		<c:forEach var="objLand" items="${listLand}">
		     <div class="clearfix single_content">
		         <div class="clearfix post_date floatleft">
		             <div class="date">
		                 <h3>27</h3>
		                 <p>Tháng 3</p>
		             </div>
		         </div>
		         <div class="clearfix post_detail">
		             <h2><a href="${pageContext.request.contextPath}/single/${objLand.lid}">${objLand.lname}</a></h2>
		             <div class="clearfix post-meta">
		                 <p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${objLand.address}</span> <span><i class="fa fa-folder"></i> Diện tích: ${objLand.area}m2</span></p>
		             </div>
		             <div class="clearfix post_excerpt">
		                 <img src="${pageContext.request.contextPath}/files/${objLand.picture}" alt="" />
		                 <p>${objLand.description}</p>
		             </div>
		             <a href="${pageContext.request.contextPath }/single/${objLand.lid}">Đọc thêm</a>
		         </div>
		     </div>
	     </c:forEach>
     </c:if>

 </div>

 <div class="pagination">
     <nav>
         <ul>
             <li>
                 <a href="${pageContext.request.contextPath}/${page -1}"> << </a>
             </li>
             <c:forEach begin="1" end = "${sumPage}" var ="i">
             	<li><a href="${pageContext.request.contextPath}/${i}">${i}</a></li>
             </c:forEach>
             <!-- <li><a href="">1</a></li>
             <li><a href="">2</a></li>
             <li><a href="">3</a></li>
             <li><a href="">4</a></li> -->
             <li><a href="${pageContext.request.contextPath}/${page + 1}"> >> </a></li>
         </ul>
     </nav>
 </div>