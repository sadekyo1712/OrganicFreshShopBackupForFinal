<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="single_top">
    <div class="container">
        <div class="register">
            <form:form name="account" action="/register" method="post" modelAttribute="account">
                <div class="register-bottom-grid">
                    <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                    <c:if test="${message.length() > 0}">
                        <h6>* Tài khoản đã tồn tại</h6>
                    </c:if>
                    <div>
                        <span>User name<label>*</label></span>
                        <form:input path="username" required="true"/>
                    </div>
                    <div>
                        <span>Mật khẩu<label>*</label></span>
                        <form:input type="password" path="password" required="true"/>
                    </div>
                    <div>
                        <span>Loại tài khoản</span>
                        <form:select path="userRole">
                            <form:option value="USER">Người dùng thông thường</form:option>
                            <form:option value="SUPPLIER">Nhà cung cấp sản phẩm</form:option>
                        </form:select>
                    </div>
                    <div>
                        <span>Trạng thái tài khoản</span>
                        <form:select path="active">
                            <form:option value="true">KÍCH HOẠT</form:option>
                            <form:option value="false">VÔ HIỆU HÓA</form:option>
                        </form:select>
                    </div>
                </div>
                <div class="register-top-grid">
                    <h3>THÔNG TIN CÁ NHÂN</h3>
                    <div>
                        <span>Tên tài khoản<label>*</label></span>
                        <form:input path="name" required="true"/>
                    </div>
                    <div>
                        <span>Số điện thoại<label>*</label></span>
                        <form:input path="phone" required="true"/>
                    </div>
                    <div>
                        <span>Địa chỉ<label>*</label></span>
                        <form:input path="address" required="true"/>
                    </div>
                    <div>
                        <span>Email<label>*</label></span>
                        <form:input path="email" required="true" type="email"/>
                    </div>
                    <div class="clearfix"></div>
                    <a class="news-letter" href="${pageContext.request.contextPath}/intro">
                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Đăng ký để
                            nhận thông tin mới nhất qua email</label>
                    </a>
                </div>
                <div class="clearfix"></div>
                <div class="register-but">
                        <input type="submit" value="Hoàn thành đăng ký"/>
                        <div class="clearfix"></div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
