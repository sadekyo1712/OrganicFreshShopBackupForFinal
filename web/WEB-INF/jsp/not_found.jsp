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

<div class="single_top_not_found">
    <div class="container">
        <div class="error-404 text-center">
            <h6>____________________________</h6>
            <p>Không tìm thấy sản phẩm</p>
            <a class="b-home" href="${pageContext.request.contextPath}/product_list">Quay lại danh mục sản phẩm :)</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
