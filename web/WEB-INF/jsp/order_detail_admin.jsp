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

            <c:forEach items="${order.orderDetails}" var="orderDetailInfo">
                <div class="cart-header2">
                    <div class="cart-sec simpleCart_shelfItem">
                        <div class="cart-item cyc">
                            <img src="<c:url value="${orderDetailInfo.uri}" />" class="img-responsive" alt=""/>
                        </div>
                        <div class="cart-item-info">
                            <h3>
                                <a href="${pageContext.request.contextPath}/product_info?code=${orderDetailInfo.productCode}">
                                    ${orderDetailInfo.productName}
                                </a>
                                <span>Mã sản phẩm : ${orderDetailInfo.productCode}</span>
                            </h3>
                            <ul class="qty">
                                <li>
                                    <p>Giá tiền : <format:formatNumber value="${orderDetailInfo.price}" type="currency"/></p>
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
            <a class="continue" href="${pageContext.request.contextPath}/index">Trở về trang chủ</a>
            <div class="price-details">
                <h4>Thông tin hóa đơn</h4>
                <span>ID hóa đơn:</span>
                <span class="total1">${order.id}</span>
                <span>Số hóa đơn :</span>
                <span class="total1">${order.orderNumber}</span>
                <span>Ngày lập hóa đơn :</span>
                <span class="total1">${order.orderDate}</span>
                <div class="clearfix"></div>
            </div>
            <br>
            <div class="price-details">
                <h4>Thông tin khách hàng</h4>
                <span>Tên khách hàng :</span>
                <span class="total1">${order.customerName}</span>
                <span>Email :</span>
                <span class="total1">${order.customerEmail}</span>
                <span>Số điện thoại :</span>
                <span class="total1">${order.customerPhone}</span>
                <span>Địa chỉ :</span>
                <span class="total1">${order.customerAddress}</span>
                <span>Giảm giá :</span>
                <span class="total1">Không có chương trình</span>
                <span>Chi phí vận chuyển :</span>
                <span class="total1">1% giá trị hóa đơn</span>
                <div class="clearfix"></div>
            </div>
            <ul class="total_price">
                <li class="last_price">
                    <h4>TỔNG TIỀN</h4></li>
                <li class="last_price"><span><format:formatNumber value="${order.amount}" type="currency"/></span></li>
                <div class="clearfix"></div>
            </ul>


            <div class="clearfix"></div>
            <a class="order" href="${pageContext.request.contextPath}/order_list">Xem danh sách hóa đơn</a>
            <div class="total-item">
                <h3>TÙY CHỌN</h3>
                <h4>MÃ GIẢM GIÁ</h4>
                <a class="cpns" href="${pageContext.request.contextPath}/intro">Xem mã giảm giá</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
