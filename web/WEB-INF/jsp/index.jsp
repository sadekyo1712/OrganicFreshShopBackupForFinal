<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/24/16
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Organic fresh shop</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<format:setLocale value="vi_VN" scope="session"/>
<%--banner--%>
<div class="banner">
    <div class="container">
        <div class="banner_desc">
            <h1>Thực phẩm hữu cơ sẽ thay đổi tương lai chúng ta !</h1>
            <h2>Cùng chúng tôi thay đổi cuộc sống</h2>
            <div class="button">
                <a href="${pageContext.request.contextPath}/product_list" class="hvr-shutter-out-horizontal">Ghé thăm gian hàng</a>
            </div>
        </div>
    </div>
</div>

<%--overview product--%>
<div class="content_top">
    <h3 class="m_1">Sản phẩm mới nhất</h3>
    <div class="container">
        <div class="box_1">
            <div class="col-md-7">
                <div class="section group">
                    <c:forEach items="${listProductDemo}" var="product">
                        <div class="col_1_of_3 span_1_of_3 simpleCart_shelfItem">
                            <div class="shop-holder">
                                <div class="product-img">
                                    <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                                        <img width="225" height="265" src="<c:url value="${product.uri}"/>"
                                             class="img-responsive" alt="item4"> </a>
                                    <a href="${pageContext.request.contextPath}/buy_product?code=${product.code}" class="button item_add"></a>
                                </div>
                            </div>
                            <div class="shop-content" style="height: 80px;">
                                <div><a href="${pageContext.request.contextPath}/product_list" rel="tag" style="font-size: 1em; font-weight: 400; color: #174f3e">Rau củ quả</a></div>
                                <h3><a href="${pageContext.request.contextPath}/product_info?code=${product.code}" style="font-size: 1em; font-weight: normal; color: #000000">${product.name}</a></h3>
                                <span class="amount item_price" style="font-weight: 500; font-size: 1.5em"><format:formatNumber value="${product.priceTag}" type="currency"/></span>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-5 row_3">
                <div class="about-block-content">
                    <div class="border-add"></div>
                    <h4>About Us</h4>
                    <p>Đây là kênh giúp mọi người trao đổi các sản phẩm hữu cơ, kết nối mọi người
                        lại với nhau và làm cuộc sống trong lành hơn.</p>
                    <p>Hope you have fun & relax with us.</p>
                    <p></p>
                </div>
                <img src="<c:url value="/resources/images/b5.jpg" />" class="img-responsive" alt=""/>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<%--blog--%>
<div class="content_bottom">
    <div class="container">
        <h2 class="m_3">Blog chia sẻ kinh nghiệm</h2>
        <div class="grid_1">
            <div class="col-md-6 blog_1">
                <a href="${pageContext.request.contextPath}/index_single" style="color: #ffffff">
                    <div class="item-inner">
                        <img src="<c:url value="/resources/images/blog4.jpg" />" class="img-responsive" alt=""/>
                        <div class="date-comments">
                            <div class="time">
                                <span class="date">
                                    Ngày&nbsp;
                                    <span class="word1">4</span>
                                    <span class="word2">December</span>
                                </span>
                            </div>
                            <div class="comments">
                                <span>
                                    <span class="word1">1</span>
									<span class="word2"> nhận xét</span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div><h3>Chọn mua rau hữu cơ cho bữa cơm gia đình an toàn</h3></div>
                </a>
            </div>
            <div class="col-md-6 row_2">
                <a href="${pageContext.request.contextPath}/index_single2" style="color: #ffffff">
                    <div class="item-inner">
                        <img src="<c:url value="/resources/images/b14.jpg" />" class="img-responsive" alt=""/>
                        <div class="date-comments">
                            <div class="time">
                                <span class="date">
                                    Ngày&nbsp;
                                    <span class="word1">17</span>
                                    <span class="word2">December</span>
                                </span>
                            </div>
                            <div class="comments">
									<span><span class="word1">2</span>
									<span class="word2"> nhận xét</span></span>
                            </div>
                        </div>
                    </div>
                    <div><h3>Sự hấp dẫn trong ẩm thực của các quốc gia</h3></div>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<%--product present--%>
<div class="content_bottom-grid">
    <div class="col-md-6 row_4"></div>
    <div class="col-md-6">
        <h2 style="color: #ffffff; text-align: center; font-style: normal; font-weight: 300 ; margin-top: 70px">Gợi ý ngẫu nhiên sản phẩm</h2>
        <div class="row_5">
            <c:forEach items="${listProductDemo2}" var="product">
                <div class="col_1_of_3 span_1_of_3">
                    <div class="shop-holder1">
                        <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                            <img src="<c:url value="${product.uri}" />" class="img-responsive" alt=""/>
                        </a>
                    </div>
                    <div class="shop-content" style="height: 80px;">
                        <h3>
                            <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">${product.name}</a>
                        </h3>
                        <span><span class="amount"><format:formatNumber value="${product.priceTag}" type="currency"/></span></span>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
