<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/24/16
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>footer</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/resources/css/etalage.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/resources/css/megamenu.css" />" rel="stylesheet" type='text/css' media="all">

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
    <!-- Custom Theme files -->
    <!--webfont-->
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
<div class="footer">
    <div class="container">
        <div class="footer_top">
            <div class="col-md-4 box_3">
                <h3>Liên hệ</h3>
                <address class="address">
                    <p>Tầng 7 Vincom Tower , <br>Chùa Láng, Đống Đa, Hà Nội.</p>
                    <dl>
                        <dt></dt>
                        <dd>Di động :<span> +84 167 753 3388</span></dd>
                        <dd>SĐT cố định :<span> +1 800 547 5478</span></dd>
                        <dd>FAX: <span>+1 800 658 5784</span></dd>
                        <dd>E-mail:&nbsp; <a href="http://google.com/gmail">info(at)OrganicFresh.com</a></dd>
                    </dl>
                </address>
                <ul class="footer_social">
                    <li>
                        <a href="https://facebook.com.vn"> <i class="fb"> </i> </a>
                    </li>
                    <li><a href="https://twitter.com"><i class="tw"> </i> </a></li>
                    <li><a href="https://plus.google.com"><i class="google"> </i> </a></li>
                    <li><a href="https://www.instagram.com"><i class="instagram"> </i> </a></li>
                </ul>
            </div>
            <div class="col-md-4 box_3">
                <h3>Cẩm nang</h3>
                <h4><a href="${pageContext.request.contextPath}/404">Lạ miệng với canh thân Atiso nấu sườn non</a></h4>
                <p>Canh atisô không chỉ ngon, lạ miệng mà còn bổ dưỡng, có tác dụng thanh nhiệt..</p>
                <h4><a href="${pageContext.request.contextPath}/404">Xào rau muống ngon xanh như nhà hàng</a></h4>
                <p>Nguyên liệu: - Rau muống: 500gr - 3- 4 tép tỏi lớn băm nhuyễn. - Muối, hạt..</p>
                <h4><a href="${pageContext.request.contextPath}/404">Mẹo vặt làm đẹp từ bơ và mật ong</a></h4>
                <p>Chống lão hóa, mặc dù chất chống oxy hóa cũng có nhiều trong rau quả như cà rốt</p>
            </div>
            <div class="col-md-4 box_3">
                <h3>Hỗ trợ khách hàng</h3>
                <ul class="list_1">
                    <li><a href="${pageContext.request.contextPath}/about">Terms & Conditions</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">FAQ</a></li>
                    <li><a href="${pageContext.request.contextPath}/index">Payment</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Refunds</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Track Order</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Services</a></li>
                </ul>
                <ul class="list_1">
                    <li><a href="${pageContext.request.contextPath}/contact">Services</a></li>
                    <li><a href="${pageContext.request.contextPath}/index">Press</a></li>
                    <li><a href="${pageContext.request.contextPath}/404">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="footer_bottom">
            <div class="copy">
                <p>Copyright © 2016 Organic Fresh Shop. All Rights Reserved.&nbsp;<a href="${pageContext.request.contextPath}/index" target="_blank">ORGanikFreshShop</a>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
