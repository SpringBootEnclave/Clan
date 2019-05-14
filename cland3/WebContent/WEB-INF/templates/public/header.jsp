<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
 <section id="header_area">
        <div class="wrapper header">
            <div class="clearfix header_top">
                <div class="clearfix logo floatleft">
                    <a href="${pageContext.request.contextPath }">
                        <h1><span>C</span>Land</h1>
                    </a>
                </div>
                <div class="clearfix search floatright">
                    <form id="searchform" action="${pageContext.request.contextPath}/search.html" method="GET">
                        <input type="text" name="search" value='<c:if test="${not empty search}">${search}</c:if>' placeholder="Search" />
                        <input type="submit" name="submit"/>
                    </form>
                    <script type="text/javascript">
                    $(document).ready(function(){
            			$('#searchform').validate({
            				rules:{
            					search:{
            						required: true
            					}
            				},
            				name:{
            					search:{
            						required:'Nhập vào từ khóa!'
            					}
            				}
            			})
            		});
					</script>
                </div>
            </div>
            <div class="header_bottom">
                <nav>
                    <ul id="nav">
                        <li><a href="${pageContext.request.contextPath }">Trang chủ</a></li>
                        <li id="dropdown"><a href="${pageContext.request.contextPath }">Danh mục</a>
                            <ul>
                            <c:if test="${not empty listCatHeader}">
								<c:forEach var="objCat" items="${listCatHeader}">
									<li><a href="${pageContext.request.contextPath}/cat/${objCat.cid}">${objCat.cname}</a></li>
								</c:forEach>
							</c:if>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>