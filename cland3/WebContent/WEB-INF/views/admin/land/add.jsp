<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thêm danh mục</div>
             </div>
             
             <div class="content-box-large box-with-header">
             <div>
             	${msg}
             </div>
                 <form action = "${pageContext.request.contextPath}/admin/land/add" method = "POST" enctype = "multipart/form-data">
                 	<div>
                     <div class="row mb-10"></div>

                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="name">Tên truyện</label>
                                 <input type="text" class="form-control" required name = "lname" placeholder="Nhập tên truyện">
                             </div>
							<c:if test="${not empty listCat}">
	                             <div class="form-group">
	                                 <label>Danh mục truyện</label>
	                                 <select class="form-control" name = "cid">
	                                 	<c:forEach var="objCat" items = "${listCat}">
										   <option value="${objCat.cid}">${objCat.cname}</option>
									   </c:forEach>
										</select>
	                             </div>
							</c:if>
                             <div class="form-group">
                                 <label>Thêm hình ảnh</label>
                                 <input type="file" class="btn btn-default" name = "image" id="exampleInputFile1">
                                 <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                             </div>

                             <div class="form-group">
                                 <label>Mô tả</label>
                                 <textarea name = "description" required class="form-control" rows="3"></textarea>
                                  <script>CKEDITOR.replace('description');</script>
                             </div>
                             
                            <div class="form-group">
                                 <label>Diện tích</label>
                                 <input type="number" required class="btn btn-default" name = "area" >
                                 <p class="help-block"><em>Diện tích : .... mét vuông</em></p>
                             </div>
                             <div class="form-group">
                                 <label>Địa chỉ</label>
                                 <input type="text" required class="btn btn-default" name = "address" >
                                 <p class="help-block"><em>Địa chỉ: 12 xxx Street....</em></p>
                             </div>


                         </div>

                         <div class="col-sm-6"></div>

                         <div class="col-sm-12">
                             <div class="form-group">
                                 <label>Chi tiết</label>
                                 <textarea name = "detail" required class="form-control" rows="7"></textarea>
                                 <script>CKEDITOR.replace('detail');</script>
                             </div>
                         </div>
                     </div>

                     <hr>

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Thêm" class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>

                 </div>
                 </form>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->