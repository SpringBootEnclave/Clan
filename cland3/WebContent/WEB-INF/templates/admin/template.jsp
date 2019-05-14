<%@include file="/WEB-INF/templates/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Admin Theme v3</title>
    <link rel="shortcut icon" type="image/ico" href="images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/adminUrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/adminUrl/css/style1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/adminUrl/ckeditor/ckeditor.js"></script>
</head>
<body>
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
    <div class="page-content">
        <div class="row">
            <div class="col-md-2">
                <div class="sidebar content-box" style="display: block;">
                   <tiles:insertAttribute name="left-bar"></tiles:insertAttribute>
                </div>
            </div>
            <div class="col-md-10">
                <tiles:insertAttribute name="main"></tiles:insertAttribute>
            </div>
            <!-- /.col-md-10 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.page-content -->
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
<!-- /.footer -->