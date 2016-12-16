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
            <form:form name="account" action="/account_change_info" method="post" modelAttribute="account">
                <div class="register-bottom-grid">
                    <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                    <div>
                        <span>Tên đăng nhập</span>
                        <form:hidden path="username"/>${account.username}
                    </div>
                    <div>
                        <span>Mật khẩu</span>
                        <form:input type="password" path="password" placeholder="${account.password}" required="true"/>
                    </div>
                    <div>
                        <span>Loại tài khoản</span>
                        <form:select path="userRole">
                            <form:option value="USER">USER</form:option>
                            <form:option value="SUPPLIER">SUPPLIER</form:option>
                        </form:select>
                    </div>
                    <div>
                        <span>Trạng thái tài khoản</span>
                        <form:select path="active">
                            <form:option value="true">HOẠT ĐỘNG</form:option>
                            <form:option value="false">VÔ HIỆU HÓA</form:option>
                        </form:select>
                    </div>
                </div>
                <div class="register-top-grid">
                    <h3>THÔNG TIN CÁ NHÂN</h3>
                    <div>
                        <span>Tên tài khoản</span>
                        <form:input path="name" placeholder="${account.name}" required="true"/>
                    </div>
                    <div>
                        <span>Số điện thoại</span>
                        <form:input path="phone" placeholder="${account.phone}" required="true"/>
                    </div>
                    <div>
                        <span>Địa chỉ</span>
                        <form:input path="address" placeholder="${account.address}" required="true"/>
                    </div>
                    <div>
                        <span>Email</span>
                        <form:input type="email" path="email" placeholder="${account.email}" required="true"/>
                    </div>
                    <div>
                        <span>* Đăng nhập lại tài khoản "${pageContext.request.userPrincipal.name}" để cập nhật việc thay đổi cấu hình</span>
                    </div>
                    <div class="clearfix"></div>
                    <a class="news-letter" href="${pageContext.request.contextPath}/intro">
                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Đăng ký để
                            nhận thông tin mới nhất qua email</label>
                    </a>
                </div>
                <div class="clearfix"></div>
                <div class="register-but">
                    <input type="submit" value="Cập nhật thông tin tài khoản"/>
                    <div class="clearfix"></div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
