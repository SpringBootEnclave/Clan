<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa bài viết</div>
             </div>
             
             <div class="content-box-large box-with-header">
             <div>
             	${msg}
             </div>
             	<c:if test="${not empty objLand}">
                 <form action = "${pageContext.request.contextPath}/admin/land/edit/${objLand.lid}" method = "POST" enctype = "multipart/form-data">
                 	<div>
                     <div class="row mb-10"></div>

                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="name">Tên bài viết</label>
                                 <input type="text" class="form-control" value="${objLand.lname }" name = "lname" placeholder="Nhập tên truyện">
                             </div>
							
	                         <div class="form-group">
	                                 <label>Danh mục tin</label>
	                                 <c:if test="${not empty listCat}">
	                               		<select class="form-control" name="cid">
	                               			<c:forEach var="objCat" items="${listCat}">
	                               				  <c:choose>
	                               				  	<c:when test="${objCat.cid == objLand.cid}">
	                               				  		<option value="${objCat.cid}" selected="selected">${objCat.cname }</option>
	                               				  	</c:when>
	                               				  	<c:otherwise>
	                               				  		<option value="${objCat.cid}">${objCat.cname }</option>
	                               				  	</c:otherwise>
	                               				  </c:choose>
	                               			</c:forEach>
	                               		</select>
									 </c:if>
	                         </div>
                             <div class="form-group">
                                 <label>Thêm hình ảnh</label>
                                 <input type="file" class="btn btn-default" name="image" value="${objLand.picture}" id="exampleInputFile1"><br>
                                 <label>Ảnh cũ</label>
                                 <img alt="" src="${pageContext.request.contextPath}/files/${objLand.picture}">
                                 <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                             </div>

                             <div class="form-group">
                                 <label>Mô tả</label>
                                 <textarea name = "description" class="form-control" rows="3">${objLand.description }</textarea>
                                  <script>CKEDITOR.replace('description');</script>
                             </div>
                             
                            <div class="form-group">
                                 <label>Diện tích</label>
                                 <input type="number" class="btn btn-default" name = "area" value="${objLand.area }">
                                 <p class="help-block"><em>Diện tích : .... mét vuông</em></p>
                             </div>
                             <div class="form-group">
                                 <label>Địa chỉ</label>
                                 <input type="text" class="btn btn-default" name = "address" value="${objLand.address }">
                                 <p class="help-block"><em>Địa chỉ: 12 xxx Street....</em></p>
                             </div>


                         </div>

                         <div class="col-sm-6"></div>

                         <div class="col-sm-12">
                             <div class="form-group">
                                 <label>Chi tiết</label>
                                 <textarea name = "detail" class="form-control" rows="7">${objLand.detail }</textarea>
                                  <script>CKEDITOR.replace('detail');</script>
                             </div>
                         </div>
                     </div>

                     <hr>

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Sửa" class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>

                 </div>
                 </form>
                 </c:if>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->