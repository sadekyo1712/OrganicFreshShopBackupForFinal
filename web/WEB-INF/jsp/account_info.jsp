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

<div class="single_top_account_info">
    <div class="container">
        <div class="account-info text-left" style="margin-top: 77px">
            <h2>Thông tin tài khoản :</h2>
            <ul>
                <li><span>Tài khoản : </span>${pageContext.request.userPrincipal.name}</li>
                <li>
                    <ul>
                        <c:forEach items="${userDetail.authorities}" var="userAuthority">
                            <li><span>Permission : </span>${userAuthority.authority}</li>
                        </c:forEach>
                    </ul>
                    <ul>
                        <li><span>Mật khẩu : </span>*********${userDetail.password}</li>
                        <li><span>Chuỗi băm mật khẩu : </span>${account.password}</li>
                        <li><span>Account non expired : </span>${userDetail.accountNonExpired}</li>
                        <li><span>Account non locked : </span>${userDetail.accountNonLocked}</li>
                        <li><span>Credentials non locked : </span>${userDetail.credentialsNonExpired}</li>
                        <li><span>Tài khoản được kích hoạt : </span>${userDetail.enabled}</li>
                    </ul>
                </li>
            </ul>
            <h2><br></h2>
            <h2>Thông tin cá nhân :</h2>
            <ul>
                <li><span>Tên chủ tài khoản : </span>${account.name}</li>
                <li><span>Địa chỉ : </span>${account.address}</li>
                <li><span>Email : </span>${account.email}</li>
                <li><span>Số điện thoại : </span>${account.phone}</li>
            </ul>
            <a class="b-home" href="${pageContext.request.contextPath}/index">Trở về trang chủ</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
