<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 12/4/16
  Time: 7:46 PM
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
            <form:form name="customer_form" action="${pageContext.request.contextPath}/checkout_customer" method="post" modelAttribute="customerForm">
                <div class="register-top-grid">
                    <h3>NHẬP THÔNG TIN KHÁCH HÀNG</h3>
                    <div>
                        <span>Tên khách hàng<label>*</label></span>
                        <form:input path="name" required="true"/>
                        <form:errors path="name" cssClass="error-message"/>
                    </div>
                    <div>
                        <span>Số điện thoại<label>*</label></span>
                        <form:input path="phone" required="true" pattern="\(?[+]?\d+\)?[-.\s]?\d+[-.\s]?\d+"
                                    title="Must in form : (555) 444-6789 / 555-444-6789 / 555.444.6789 / 555 444 6789 / +5554446789 / 5554446789"/>
                        <form:errors path="phone" cssClass="error-message"/>
                    </div>
                    <div>
                        <span>Địa chỉ<label>*</label></span>
                        <form:input path="address" required="true"/>
                        <form:errors path="address" cssClass="error-message"/>
                    </div>
                    <div>
                        <span>Email<label>*</label></span>
                        <form:input path="email" type="email" required="true"/>
                        <form:errors path="email" cssClass="error-message"/>
                    </div>
                    <div class="clearfix"></div>
                    <a class="news-letter" href="${pageContext.request.contextPath}/intro">
                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Đăng ký để
                            nhận thông tin mới nhất của OrganikShop</label>
                    </a>
                </div>
                <div class="clearfix"></div>
                <div class="register-but">
                    <input type="submit" value="Lưu thông tin khách hàng"/>
                    <input type="reset" value="Reset"/>
                    <div class="clearfix"></div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
