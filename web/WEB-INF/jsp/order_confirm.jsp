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
            <h1>Chi tiết hóa đơn :</h1>

            <c:forEach items="${cartForm.cartEntriesProducts}" var="orderDetailInfo">
                <div class="cart-header2">
                    <div class="cart-sec simpleCart_shelfItem">
                        <div class="cart-item cyc">
                            <img src="<c:url value="${orderDetailInfo.product.uri}" />" class="img-responsive" alt=""/>
                        </div>
                        <div class="cart-item-info">
                            <h3>
                                <a href="${pageContext.request.contextPath}/product_info?code=${orderDetailInfo.product.code}">
                                        ${orderDetailInfo.product.name}
                                </a>
                                <span>Mã sản phẩm : ${orderDetailInfo.product.code}</span>
                            </h3>
                            <ul class="qty">
                                <li>
                                    <p>Giá tiền : <format:formatNumber value="${orderDetailInfo.product.priceTag}" type="currency"/></p>
                                </li>
                                <li>
                                    <p>Số lượng : ${orderDetailInfo.quantity} Kg</p>
                                </li>
                            </ul>
                            <div class="delivery">
                                <p>Thành tiền : <format:formatNumber value="${orderDetailInfo.amount}" type="currency"/></p>
                                <span>Thời gian vận chuyển : 20 - 30 phút</span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="col-md-3 cart-total">
            <a class="continue" href="${pageContext.request.contextPath}/checkout">Thay đổi thông tin đơn hàng</a>
            <div class="price-details">
                <h4>Thông tin khách hàng</h4>
                <span>Tên khách hàng :</span>
                <span class="total1">${cartForm.customer.name}</span>
                <span>Email :</span>
                <span class="total1">${cartForm.customer.email}</span>
                <span>Số điện thoại :</span>
                <span class="total1">${cartForm.customer.phone}</span>
                <span>Địa chỉ :</span>
                <span class="total1">${cartForm.customer.address}</span>
                <span>Giảm giá :</span>
                <span class="total1">Không có chương trình</span>
                <span>Chi phí vận chuyển :</span>
                <span class="total1"><format:formatNumber value="${cartForm.amountTotalInCart * 0.01}" type="currency"/></span>
                <div class="clearfix"></div>
            </div>
            <ul class="total_price">
                <li class="last_price">
                    <h4>TỔNG TIỀN</h4></li>
                <li class="last_price"><span><format:formatNumber value="${cartForm.amountTotalInCart * 1.01}" type="currency"/></span></li>
                <div class="clearfix"></div>
            </ul>


            <div class="clearfix"></div>
            <form action="${pageContext.request.contextPath}/order_confirm" method="post">
                <div><input id="saveOrder" type="submit" class="hidden"/></div>
            </form>
            <a class="order">
                <label for="saveOrder">Đặt hàng và thanh toán</label>
            </a>
            <div class="total-item">
                <h3>TÙY CHỌN</h3>
                <h4>MÃ GIẢM GIÁ</h4>
                <a class="cpns" href="${pageContext.request.contextPath}/intro">Áp dụng giảm giá</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
