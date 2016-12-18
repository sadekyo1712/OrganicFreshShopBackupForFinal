<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 12/8/16
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<format:setLocale value="vi_VN" scope="session"/>

<div class="container">
    <div class="check">
        <div class="col-md-9 cart-items">
            <h1 style="font-style: normal; font-weight: bold">Thông tin tài khoản :</h1>
            <div class="cart-header2">
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc">
                        <img src="<c:url value="/resources/images/user3.jpg" />" class="img-responsive" alt=""/>
                    </div>
                    <div class="cart-item-info">
                        <h3>
                            <a href="">Tài khoản ${user.username}</a>
                            <span>Loại tài khoản : ${user.userRole}</span>
                        </h3>
                        <ul class="qty">
                            <li>
                                <p>Giá trị băm : ${user.password}</p>
                            </li>
                        </ul>
                        <c:if test="${user.active == true}">
                            <div class="delivery">
                                <p style="color: #439e5f">Trạng thái tài khoản : ĐANG HOẠT ĐỘNG</p>
                                <div class="clearfix"></div>
                            </div>
                        </c:if>
                        <c:if test="${user.active == false}">
                            <div class="delivery">
                                <p style="color: #e85858">Trạng thái tài khoản : NGỪNG HOẠT ĐỘNG</p>
                                <div class="clearfix"></div>
                            </div>
                        </c:if>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="col-md-3 cart-total">
            <a class="continue" href="${pageContext.request.contextPath}/index">Trở về trang chủ</a>
            <div class="price-details">
                <h4>Thống kê về tài khoản</h4>
                <span>Lần đăng nhập cuối:</span>
                <span class="total1">unknown</span>
                <span>IP:</span>
                <span class="total1">127.0.0.1</span>
                <span>Dung lượng request:</span>
                <span class="total1">unknown Mb</span>
                <div class="clearfix"></div>
            </div>
            <ul class="total_price">
                <li class="last_price">
                    <h4>TRẠNG THÁI</h4></li>
                <c:if test="${user.active == true}">
                    <li class="last_price"><span style="color: #439e5f; font-weight: 500; text-transform: uppercase">HOẠT ĐỘNG</span></li>
                </c:if>
                <c:if test="${user.active == false}">
                    <li class="last_price"><span style="color: #e85858; font-weight: 500; text-transform: uppercase">VÔ HIỆU HÓA</span></li>
                </c:if>
                <div class="clearfix"></div>
            </ul>

            <div class="clearfix"></div>
            <c:if test="${user.active == true}">
                <form action="${pageContext.request.contextPath}/account_detail_info" method="post">
                    <input title="" name="username" value="${user.username}" class="hidden">
                    <input title="" name="active" value="false" class="hidden">
                    <input type="submit" class="set_up2" value="Vô hiệu hóa tài khoản">
                </form>
            </c:if>
            <c:if test="${user.active == false}">
                <form action="${pageContext.request.contextPath}/account_detail_info" method="post">
                    <input title="" name="username" value="${user.username}" class="hidden">
                    <input title="" name="active" value="true" class="hidden">
                    <input type="submit" class="set_up" value="Kích hoạt tài khoản">
                </form>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
