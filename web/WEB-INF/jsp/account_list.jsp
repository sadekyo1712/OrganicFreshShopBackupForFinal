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
            <h1 style="font-style: normal; font-weight: bold">Danh sách tài khoản trong hệ thống :</h1>

            <c:forEach items="${paginatorResult.list}" var="account" varStatus="status">
                <div class="cart-header2">
                    <div class="cart-sec simpleCart_shelfItem">
                        <div class="cart-item cyc">
                            <img src="<c:url value="/resources/images/user13.png"/>" class="img-responsive" alt=""/>
                        </div>
                        <div class="cart-item-info">
                            <h3>
                                <a href="${pageContext.request.contextPath}/account_detail_info?username=${account.username}">
                                    Tài khoản ${offset + status.index + 1}
                                </a>
                                <span>Username : ${account.username}</span>
                            </h3>
                            <ul class="qty">
                                <li>
                                    <p>Loại tài khoản : ${account.userRole}</p>
                                </li>
                                <li>
                                    <p>Mật khẩu được bảo vệ : TRUE</p>
                                </li>
                                <li>
                                    <p>Thuật toán băm : Bcrypt</p>
                                </li>
                                <li>
                                    <p>Kích thước chuỗi băm : 60</p>
                                </li>
                            </ul>
                            <div class="delivery">
                                <c:if test="${account.active == true}">
                                    <p>Trạng thái tài khoản : ĐANG HOẠT ĐỘNG</p>
                                </c:if>
                                <c:if test="${account.active == false}">
                                    <p>Trạng thái tài khoản : VÔ HIỆU HÓA</p>
                                </c:if>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </c:forEach>
                <div class="women_bottom" style="margin-bottom: 55px; padding: 10px">
                    <c:if test="${paginatorResult.totaLPage > 1}">
                        <span>
                            <span style="color: #319e46">TRANG</span>&nbsp;
                            <c:if test="${paginatorResult.totaLPage > 1}">
                                <c:forEach items="${paginatorResult.navigateBar}" var="page">
                                    <c:if test="${page != -1}">
                                        <a href="${pageContext.request.contextPath}/account_list?page=${page}">${page} </a>|
                                    </c:if>
                                    <c:if test="${page == -1}">
                                        <span>... |</span>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </span>
                        <div class="clearfix"></div>
                    </c:if>
                </div>
        </div>

        <div class="col-md-3 cart-total">
            <a class="continue" href="${pageContext.request.contextPath}/index">Trở về trang chủ</a>
            <div class="price-details">
                <h3>Danh sách tài khoản</h3>
                <span>Số lượng tài khoản :</span>
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
            <a class="order" href="${pageContext.request.contextPath}/intro">Vô hiệu hóa tài khoản</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
