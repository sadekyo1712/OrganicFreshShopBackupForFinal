<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <h1>Giỏ hàng của tôi</h1>
            
            <c:if test="${ empty cartForm.cartEntriesProducts }">
                <div class="cart-header">
                    <h3>------>Không có mặt hàng nào trong giỏ hàng<------</h3>
                </div>
            </c:if>

            <c:if test="${ not empty cartForm and not empty cartForm.cartEntriesProducts }">
                <form:form method="post" modelAttribute="cartForm" action="${pageContext.request.contextPath}/checkout">
                    <c:forEach items="${cartForm.cartEntriesProducts}" var="cartEntry" varStatus="varStatus">
                        <div class="cart-header">
                            <a href="${pageContext.request.contextPath}/remove_product?code=${cartEntry.product.code}">
                                <div class="close1" ></div>
                            </a>
                            <div class="cart-sec simpleCart_shelfItem">
                                <div class="cart-item cyc">
                                    <img src="<c:url value="${cartEntry.product.uri}" />" class="img-responsive" alt=""/>
                                </div>
                                <div class="cart-item-info">
                                    <h3>
                                        <a href="${pageContext.request.contextPath}/product_info?code=${cartEntry.product.code}">${cartEntry.product.name}</a>
                                        <span>
                                            Mã sản phẩm: ${cartEntry.product.code}
                                            <form:hidden path="cartEntriesProducts[${varStatus.index}].product.code"/>
                                        </span>
                                    </h3>
                                    <ul class="qty">
                                        <li>
                                            <p>Giá tiền : <format:formatNumber value="${cartEntry.product.priceTag}" type="currency"/></p>
                                        </li>
                                        <li>
                                            <p>Số lượng : <form:input path="cartEntriesProducts[${varStatus.index}].quantity" size="1" required="true"/></p>
                                        </li>
                                        <li>
                                            <p>Thành tiền : <format:formatNumber value="${cartEntry.amount}" type="currency"/></p>
                                        </li>
                                    </ul>
                                    <div class="delivery">
                                        <p>Phí vận chuyển ( 10% giá trị hóa đơn ) : <format:formatNumber value="${cartForm.amountTotalInCart * 0.1}" type="currency"/></p>
                                        <span>Thời gian vận chuyển : 20 - 30 phút</span>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="register-but">
                        <input type="submit" value="Cập nhật giỏ hàng" />
                    </div>
                </form:form>
            </c:if>

            <%--<script>--%>
                <%--$(document).ready(function (c) {--%>
                    <%--$('.close1').on('click', function (c) {--%>
                        <%--$('.cart-header').fadeOut('slow', function (c) {--%>
                            <%--$('.cart-header').remove();--%>
                        <%--});--%>
                    <%--});--%>
                <%--});--%>
            <%--</script>--%>
        </div>

        <div class="col-md-3 cart-total">
            <a class="continue" href="${pageContext.request.contextPath}/product_list">Tiếp tục mua sắm</a>
            <a class="continue" href="${pageContext.request.contextPath}/checkout_customer">Nhập thông tin khách hàng</a>
            <div class="price-details">
                <h3>-------Chi tiết giỏ hàng------</h3>
                <span>Tổng tiền sản phẩm</span>
                <span class="total1"><format:formatNumber value="${cartForm.amountTotalInCart}" type="currency"/></span>
                <span>Giảm giá</span>
                <span class="total1">Không có chương trình</span>
                <span>Chi phí vận chuyển</span>
                <span class="total1"><format:formatNumber value="${cartForm.amountTotalInCart * 0.1}" type="currency"/></span>
                <c:if test="${cartForm.validCustomer}">
                    <h3>------Thông tin khách hàng------</h3>
                    <span>Tên khách hàng :</span>
                    <span class="total1">${cartForm.customer.name}</span>
                    <span>Email :</span>
                    <span class="total1">${cartForm.customer.email}</span>
                    <span>Số điện thoại :</span>
                    <span class="total1">${cartForm.customer.phone}</span>
                    <span>Địa chỉ :</span>
                    <span class="total1">${cartForm.customer.address}</span>
                </c:if>
                <div class="clearfix"></div>
            </div>
            <ul class="total_price">
                <li class="last_price">
                    <h4>TỔNG TIỀN</h4></li>
                <li class="last_price"><span><format:formatNumber value="${cartForm.amountTotalInCart * 1.1}" type="currency"/></span></li>
                <div class="clearfix"></div>
            </ul>


            <div class="clearfix"></div>
            <a class="order" href="${pageContext.request.contextPath}/checkout_confirm">Đặt hóa đơn</a>
            <div class="total-item">
                <h3>TÙY CHỌN</h3>
                <h4>MÃ GIẢM GIÁ</h4>
                <a class="cpns" href="${pageContext.request.contextPath}/intro">Áp dụng giảm giá</a>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <p><a href="${pageContext.request.contextPath}/login">Đăng nhập</a> để sử dụng tài khoản và hưởng các chính sách giảm giá.</p>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <p>Xem thông tin của <a href="${pageContext.request.contextPath}/account_info">${pageContext.request.userPrincipal.name}</a> để biết các chính sách hỗ trợ khách hàng.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
