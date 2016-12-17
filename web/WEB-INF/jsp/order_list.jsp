<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 12/4/16
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1 style="font-style: normal; font-weight: bold">Danh sách hóa đơn :</h1>

            <c:forEach items="${paginatorResult.list}" var="order">
                <div class="cart-header2">
                    <div class="cart-sec simpleCart_shelfItem">
                        <div class="cart-item cyc">
                            <img src="<c:url value="/resources/images/order_3.png"/>" class="img-responsive" alt=""/>
                        </div>
                        <div class="cart-item-info">
                            <h3>
                                <a href="${pageContext.request.contextPath}/order?orderID=${order.id}">
                                        Hóa đơn ${order.orderNumber}
                                </a>
                                <span>ID hóa đơn : ${order.id}</span>
                            </h3>
                            <ul class="qty">
                                <li>
                                    <p>Tổng tiền hóa đơn : <format:formatNumber value="${order.amount}" type="currency"/></p>
                                </li>
                                <li>
                                    <p>Số hóa đơn : ${order.orderNumber}</p>
                                </li>
                            </ul>
                            <div class="delivery">
                                <p>Ngày lập hóa đơn : ${order.orderDate}</p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </c:forEach>
            <h4>Trang&nbsp;
            <c:if test="${paginatorResult.totaLPage > 1}">
                <c:forEach items="${paginatorResult.navigateBar}" var="page">
                    <c:if test="${page != -1}">
                        <a href="${pageContext.request.contextPath}/order_list?page=${page}">${page} </a>|
                    </c:if>
                    <c:if test="${page == -1}">
                        <span>... |</span>
                    </c:if>
                </c:forEach>
            </c:if></h4>
        </div>

        <div class="col-md-3 cart-total">
            <a class="continue" href="${pageContext.request.contextPath}/index">Trở về trang chủ</a>
            <div class="price-details">
                <h3>Danh sách hóa đơn</h3>
                <span>Số lượng hóa đơn :</span>
                <span class="total1">${paginatorResult.totalRecord}</span>
                <div class="clearfix"></div>
            </div>
            <br>
            <div class="price-details">
                <h3>Thống kê hệ thống</h3>
                <span>Địa chỉ IP hiện tại :</span>
                <span class="total1">127.0.0.1</span>
                <span>Số lượng truy cập :</span>
                <span class="total1">...</span>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
            <a class="order" href="${pageContext.request.contextPath}/product_list">Xem danh sách sản phẩm</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
