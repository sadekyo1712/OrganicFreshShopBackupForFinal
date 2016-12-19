<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="single_top_successful">
    <div class="container">
        <div class="error-404 text-center">
            <h6></h6>
            <p>Yêu cầu đã thành công !</p>
            <a class="b-home" href="${pageContext.request.contextPath}/index">Quay lại trang chủ nhé :)</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
