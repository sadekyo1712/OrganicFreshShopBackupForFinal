<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 12/4/16
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="single_top">
    <div class="container">
        <div class="account-info text-center">
            <h2>Thông tin tài khoản :</h2>
            <ul>
                <li><span>Tài khoản : </span>${pageContext.request.userPrincipal.name}</li>
                <li>
                    <ul>
                        <c:forEach items="${userDetail.authorities}" var="userAuthority">
                            <li><span>Permission : </span>${userAuthority.authority}</li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
            <a class="b-home" href="${pageContext.request.contextPath}/index">Trở về trang chủ</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
