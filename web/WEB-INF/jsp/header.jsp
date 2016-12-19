<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/24/16
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Organic Fresh Shop</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/resources/css/etalage.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/resources/css/megamenu.css" />" rel="stylesheet" type='text/css'>

    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/jquery.easydropdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/jquery.etalage.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/jquery.jscrollpane.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/megamenu.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/simpleCart.min.js"/>" type="text/javascript"></script>

    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet'
          type='text/css'>
    <!-- start menu -->
    <script>
        $(document).ready(function () {
            $(".megamenu").megamenu();
        });
    </script>

</head>
<body>
<format:setLocale value="vi_VN" scope="session"/>
<div class="header_top">
    <div class="container">
        <div class="one-fifth column row_1">
				<span class="selection-box">
                    <select class="domains valid" name="domains">
                        <option>Vietnam</option>
                        <option>English</option>
                        <option>French</option>
                    </select>
                </span>
        </div>
        <div class="cssmenu">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <ul>
                    <li>
                        Chào mừng <a href="${pageContext.request.contextPath}/account_info">${pageContext.request.userPrincipal.name}</a> quay trở lại với OrganikShop
                    </li>
                </ul>
            </c:if>
            <%--<ul>--%>
            <%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
            <%--<li>--%>
            <%--&nbsp;Xin chào&nbsp;--%>
            <%--<a href="${pageContext.request.contextPath}/account_info">--%>
            <%--${pageContext.request.userPrincipal.name}--%>
            <%--</a>--%>
            <%--&nbsp;quay trở lại với OrganikShop&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/account_change_info?user_name=${pageContext.request.userPrincipal.name}">--%>
            <%--Thay đổi thông tin tài khoản</a>&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>--%>
            <%--</li>--%>
            <%--</c:if>--%>
            <%--</ul>--%>
            <%--<ul>--%>
            <%--<security:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">--%>
            <%--Dành cho Người quản lý và Nhân viên--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/order_list">Danh sách hóa đơn</a>&nbsp;&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--</security:authorize>--%>
            <%--<security:authorize access="hasAnyRole('ROLE_MANAGER')">--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/product_admin">Sửa thông tin sản phẩm</a>&nbsp;&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--</security:authorize>--%>
            <%--<security:authorize access="hasAnyRole('ROLE_MANAGER')">--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/create_product">Tạo sản phẩm mới</a>&nbsp;&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--</security:authorize>--%>
            <%--<security:authorize access="hasAnyRole('ROLE_SUPPLIER')">--%>
            <%--Dành cho Nhà cung cấp--%>
            <%--<li>--%>
            <%--Nhà cung cấp :--%>
            <%--<a href="${pageContext.request.contextPath}/create_product"> thêm sản phẩm mới</a>&nbsp;&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/supplier_product_list?user_name=${pageContext.request.userPrincipal.name}"> xem sản phẩm đã tạo</a>&nbsp;&nbsp;|&nbsp;--%>
            <%--</li>--%>
            <%--</security:authorize>--%>
            <%--</ul>--%>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                </ul>
            </c:if>
        </div>
    </div>
</div>
<div class="wrap-box"></div>
<div class="header_bottom">
    <div class="container">
        <div class="col-xs-8 header-bottom-left">
            <div class="col-xs-2 logo">
                <h1><a href="${pageContext.request.contextPath}/index"><span>Organik</span><b>Fresh</b>SHOP</a></h1>
            </div>
            <div class="col-xs-6 menu">
                <ul class="megamenu skyblue">
                    <li class="active grid"><a class="color2" href="${pageContext.request.contextPath}/index">Rau củ quả</a>
                        <div class="megapanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4></h4>
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Cây ăn trái</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Cây gia vị</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Cây hoa cảnh</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Cây rau ăn lá</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Cây thảo dược & rau thuốc</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Rau ăn thân</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Rau ăn rễ củ</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Rau ăn hạt</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Rau mầm</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Hạt các loại</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4></h4>
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Rong tảo biển</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Nấm ăn</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Rau thơm</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Sản phẩm hỗ trợ</h4>
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Chậu và kệ trồng các loại</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Dinh dưỡng cho cây</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Dụng cụ làm vườn</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Dụng cụ ươm hạt</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Vườn đứng( vertical garden )</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product_list">Đất sạch dinh dưỡng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a class="color1" href="${pageContext.request.contextPath}/index_single">Blog</a></li>
                    <%--<li class="grid"><a class="color1" href="${pageContext.request.contextPath}/index">Cẩm nang Organik</a>--%>
                    <%--<div class="megapanel">--%>
                    <%--<div class="row">--%>
                    <%--<div class="col1">--%>
                    <%--<div class="h_nav">--%>
                    <%--<ul>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/index">Cách trồng rau</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/index">Kinh nghiệm làm vườn</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/index">Vườn đẹp</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/index">Mẹo vặt</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col1">--%>
                    <%--<div class="h_nav">--%>
                    <%--<ul>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/product_list">Chậu và kệ trồng các loại</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/product_list">Dinh dưỡng cho cây</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/product_list">Dụng cụ làm vườn</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/product_list">Dụng cụ ươm hạt</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/product_list">Vườn đứng( vertical garden )</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/product_list">Đất sạch dinh dưỡng</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col1">--%>
                    <%--<div class="h_nav">--%>
                    <%--<h4>Góc OrganikFresh</h4>--%>
                    <%--<ul>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/intro">Rau sạch Organic</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/intro">Quy trình sản xuất</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/intro">Kênh phân phối</a></li>--%>
                    <%--<li><a href="${pageContext.request.contextPath}/intro">OrganikFresh Store</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</li>--%>
                    <li><a class="color4" href="${pageContext.request.contextPath}/about">About</a></li>
                    <li><a class="color5" href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="grid"><a class="color2" href="${pageContext.request.contextPath}/index">Tài khoản</a>
                            <div class="megapanel">
                                <div class="row">
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4></h4>
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/account_info">Xem thông tin tài khoản</a></li>
                                                <li><a href="${pageContext.request.contextPath}/account_change_info?user_name=${pageContext.request.userPrincipal.name}">Thay đổi thông tin tài khoản</a></li>
                                                <li><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4>Dành cho nhà cung cấp</h4>
                                            <security:authorize access="hasAnyRole('ROLE_USER','ROLE_EMPLOYEE','ROLE_MANAGER')">
                                                <ul>
                                                    <li>( Chức năng chỉ dành cho nhà cung cấp )</li>
                                                </ul>
                                            </security:authorize>
                                            <ul>
                                                <security:authorize access="hasAnyRole('ROLE_SUPPLIER')">
                                                    <li><a href="${pageContext.request.contextPath}/create_product">Tạo sản phẩm mới</a></li>
                                                </security:authorize>
                                                <security:authorize access="hasAnyRole('ROLE_SUPPLIER')">
                                                    <li><a href="${pageContext.request.contextPath}/supplier_product_list?user_name=${pageContext.request.userPrincipal.name}">Danh sách sản phẩm đã tạo</a></li>
                                                </security:authorize>
                                            </ul>
                                        </div>
                                    </div>
                                        <%--<div class="col1">--%>
                                        <%--<div class="h_nav">--%>
                                        <%--<ul>--%>
                                        <%--<li><a href="${pageContext.request.contextPath}/product_list">Chậu và kệ trồng các loại</a></li>--%>
                                        <%--<li><a href="${pageContext.request.contextPath}/product_list">Dinh dưỡng cho cây</a></li>--%>
                                        <%--<li><a href="${pageContext.request.contextPath}/product_list">Dụng cụ làm vườn</a></li>--%>
                                        <%--<li><a href="${pageContext.request.contextPath}/product_list">Dụng cụ ươm hạt</a></li>--%>
                                        <%--<li><a href="${pageContext.request.contextPath}/product_list">Vườn đứng( vertical garden )</a></li>--%>
                                        <%--<li><a href="${pageContext.request.contextPath}/product_list">Đất sạch dinh dưỡng</a></li>--%>
                                        <%--</ul>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4>Dành cho người quản lý</h4>
                                            <security:authorize access="hasAnyRole('ROLE_USER','ROLE_SUPPLIER')">
                                                <ul>
                                                    <li>( Chức năng chỉ dành cho người quản lý )</li>
                                                </ul>
                                            </security:authorize>
                                            <ul>
                                                <security:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
                                                    <li><a href="${pageContext.request.contextPath}/order_list">Danh sách hóa đơn</a></li>
                                                </security:authorize>
                                                <security:authorize access="hasAnyRole('ROLE_MANAGER')">
                                                    <li><a href="${pageContext.request.contextPath}/account_list">Danh sách tài khoản</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/intro">Tạo bài viết mới</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/intro">Xem các bài đăng</a></li>
                                                </security:authorize>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="col-xs-4 header-bottom-right">
            <div class="box_1-cart">
                <div class="box_11">
                    <a href="${pageContext.request.contextPath}/checkout">
                        <h4><p>Giỏ hàng: <format:formatNumber value="${cartForm.amountTotalInCart * 1.01}" type="currency"/></p>
                            <img src="<c:url value="/resources/images/bag_16.png" />" width="26" height="26" alt=""/>
                            <div class="clearfix"></div>
                        </h4>
                    </a>
                </div>
                <p class="empty"><a href="${pageContext.request.contextPath}/empty_cart" class="simpleCart_empty">Làm trống giỏ hàng</a></p>
                <div class="clearfix"></div>
            </div>
            <form action="${pageContext.request.contextPath}/product_list" method="get">
                <div class="search">
                    <input title="Hãy dùng tôi để tìm kiếm" type="text" name="name" class="textbox"
                           placeholder="Tìm kiếm" onfocus="this.value = '';">
                    <input type="submit">
                </div>
            </form>
            <div id="response"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
</div>
</body>
</html>
