<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Organic Fresh Shop</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<format:setLocale value="vi_VN" scope="session"/>
<%--Start script--%>
<script>
    jQuery(document).ready(function($) {

        $('#etalage').etalage({
            thumb_image_width: 300,
            thumb_image_height: 400,
            source_image_width: 900,
            source_image_height: 1200,
            show_hint: true,
            click_callback: function(image_anchor, instance_id) {
                alert('Callback example:\nYou clicked on an image with the anchor: "' +
                        image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
            }
        });

    });
</script>
<!--initiate accordion-->
<script type="text/javascript">
    $(function() {

        var menu_ul = $('.menu_drop > li > ul'),
                menu_a = $('.menu_drop > li > a');

        menu_ul.hide();

        menu_a.click(function(e) {
            e.preventDefault();
            if (!$(this).hasClass('active')) {
                menu_a.removeClass('active');
                menu_ul.filter(':visible').slideUp('normal');
                $(this).addClass('active').next().stop(true, true).slideDown('normal');
            } else {
                $(this).removeClass('active');
                $(this).next().stop(true, true).slideUp('normal');
            }
        });

    });
</script>
<%--End Script--%>

<div class="single_top">
    <div class="container">

        <div class="single_grid">
            <div class="grid images_3_of_2">
                <ul id="etalage">
                    <li>
                        <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                            <img class="etalage_thumb_image" src="<c:url value="${product.uri}" />" class="img-responsive" />
                            <img class="etalage_source_image" src="<c:url value="${product.uri}" />" class="img-responsive" title="" />
                        </a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="desc1 span_3_of_2">
                <ul class="back">
                    <li><i class="back_arrow"> </i>Quay lại trang <a href="${pageContext.request.contextPath}/product_list">Danh mục sản phẩm</a></li>
                </ul>
                <h1>${product.name}</h1>
                <p>${product.description}</p>
                <div class="dropdown_top">
                    <div class="dropdown_left">
                        <select title="dropbox_buy_product" form="buy_product" class="dropdown" name="quantity" tabindex="10" data-settings='{"wrapperClass":"metro1"}'>
                            <option value="1">Số lượng( kg )</option>
                            <option value="1">1 kg</option>
                            <option value="2">2 kg</option>
                            <option value="3">3 kg</option>
                            <option value="4">4 kg</option>
                            <option value="5">5 kg</option>
                            <option value="6">6 kg</option>
                            <option value="7">7 kg</option>
                            <option value="8">8 kg</option>
                            <option value="9">9 kg</option>
                            <option value="10">10 kg</option>
                            <option value="20">20 kg</option>
                            <option value="30">30 kg</option>
                            <option value="40">40 kg</option>
                            <option value="50">50 kg</option>
                        </select>
                    </div>
                    <ul class="color_list">
                        <li>
                            <p>Màu bao bì đóng gói sản phẩm&nbsp;</p>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/intro"> <span class="color1"> </span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/intro"> <span class="color2"> </span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/intro"> <span class="color3"> </span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/intro"> <span class="color4"> </span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/intro"> <span class="color5"> </span></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="simpleCart_shelfItem">
                    <div class="price_single">
                        <div class="head">
                            <h2><span class="amount item_price">
                                <format:formatNumber value="${product.priceTag}" currencySymbol="VNĐ" type="currency"/></span></h2></div>
                        <div class="head_desc"><a href="${pageContext.request.contextPath}/intro">Reviews</a><img src="<c:url value="/resources/images/review.png" />" alt=""/></li>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="size_2-right">
                        <form id="buy_product" action="${pageContext.request.contextPath}/buy_product" method="get">
                            <input title="code" class="hidden" name="code" value="${product.code}">
                            <input type="submit" class="item_add1 btn_5" value="Đưa vào giỏ hàng">
                        </form>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="single_social_top">
            <ul class="single_social">
                <li>
                    <a href="http://facebook.com.vn"> <i class="s_fb"> </i>
                        <div class="social_desc">Chia sẻ<br> trên Facebook</div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <li>
                    <a href="http://twitter.com"> <i class="s_twt"> </i>
                        <div class="social_desc">Tweet<br> trên Twitter</div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <li>
                    <a href="http://plus.google.com"> <i class="s_google"> </i>
                        <div class="social_desc">Google+<br> sản phẩm này</div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <li class="last">
                    <a href="http://google.com/gmail/"> <i class="s_email"> </i>
                        <div class="social_desc">Giới thiệu<br> cho bạn bè</div>
                        <div class="clearfix"></div>
                    </a>
                </li>
            </ul>
        </div>
        <ul class="menu_drop">
            <li class="item1">
                <a href="#"><img src="<c:url value="/resources/images/product_arrow.png" />">Mô tả sản phẩm</a>
                <ul>
                    <li class="subitem1">
                        &nbsp;&nbsp;-----> Mã sản phẩm : ${product.code}<br>
                        &nbsp;&nbsp;-----> Ngày tạo sản phẩm : ${product.timestamp}<br>
                        &nbsp;&nbsp;-----> Tên đầy đủ của sản phẩm : ${product.name}<br>
                        &nbsp;&nbsp;-----> Giá sản phẩm : <format:formatNumber value="${product.priceTag}" currencySymbol="VNĐ" type="currency"/><br>
                        &nbsp;&nbsp;-----> Mô tả sản phẩm : ${product.description}<br>
                    </li>
                </ul>
            </li>
            <li class="item2">
                <a href="#"><img src="<c:url value="/resources/images/product_arrow.png" />">Thông tin người cung cấp sản phẩm</a>
                <ul>
                    <li class="subitem1" style="color: #ffffff">
                        &nbsp;&nbsp;Thông tin nhà cung cấp
                        &nbsp;&nbsp;--------------------------------------------------------------------------------<br>
                        &nbsp;&nbsp;|---> Username nhà cung cấp sản phẩm : ${created_user}<br>
                        &nbsp;&nbsp;|---> Họ tên nhà cung cấp sản phẩm : ${created_user_name}<br>
                        &nbsp;&nbsp;|---> Email liên hệ : ${created_user_email}<br>
                        &nbsp;&nbsp;|---> Số điện thoại / Số tài khoản : ${created_user_phone}<br>
                        &nbsp;&nbsp;-------------------------------------------------------------------------------------------------------------<br>
                    </li>
                    <li class="subitem1" style="color: #ffffff">
                        &nbsp;&nbsp;Thống kê kết quả trả về
                        &nbsp;&nbsp;---------------------------------------------------------------------------------<br>
                        &nbsp;&nbsp;|---> Thời điểm vào xem thông tin sản phẩm : ${time}<br>
                        &nbsp;&nbsp;|---> Thời gian trả về thông tin sản phẩm : ${time_to_get_product_info} ms<br>
                        &nbsp;&nbsp;|---> Thời gian trả về thông tin nhà cung cấp : ${time_to_get_account_assoc_info} ms<br>
                        &nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------<br>
                    </li>
                    <li class="subitem2" style="color: #ffffff">
                        &nbsp;&nbsp;Thông tin bổ sung cho sản phẩm
                        &nbsp;&nbsp;-----------------------------------<br>
                        &nbsp;&nbsp;|---> Không có thông tin bổ sung<br>
                        &nbsp;&nbsp;----------------------------------------------------------------------------<br>
                    </li>
                    <li class="subitem3" style="color: #ffffff">
                        &nbsp;&nbsp;Thông tin chuyển khoản cho OrganikFreshSHOP
                        &nbsp;&nbsp;---------------------------------------------------------------------------------<br>
                        &nbsp;&nbsp;---> Chúng tôi sẽ hỗ trợ bạn chuyển khoản đến nhà cung cấp<br>
                        &nbsp;&nbsp;---> Ngân hàng VietinBank - Chi nhánh Chùa Láng<br>
                        &nbsp;&nbsp;---> Chủ tài khoản: <a style="color: #ffffff" href="${pageContext.request.contextPath}/about">Bùi Đức Hưng</a><br>
                        &nbsp;&nbsp;---> Số tài khoản: 6150 205 150 343<br>
                        &nbsp;&nbsp;---> Liên hệ : 01677533389 để quảng cáo<br>
                        &nbsp;&nbsp;---> Phí giao dịch và chuyển khoản là 1% giá trị sản phẩm tức : <format:formatNumber value="${ product.priceTag * 0.01 }" currencySymbol="VNĐ" type="currency"/><br>
                        &nbsp;&nbsp;----------------------------------------------------------------------------------------------------------------------------------------------<br>
                    </li>
                </ul>
            </li>
            <li class="item3">
                <a href="#"><img src="<c:url value="/resources/images/product_arrow.png" />">Đánh giá</a>
                <ul style="color: #ffffff">
                    <li><img src="<c:url value="/resources/images/ava1.jpg" />" class="img-responsive" alt="" width="40" height="40" >Ăn khá ngon !!!!</li>
                    <li><img src="<c:url value="/resources/images/ava2.jpg" />" class="img-responsive" alt="" width="40" height="40" >Vị rất dở chất lượng phục vụ không tốt.</li>
                    <li><img src="<c:url value="/resources/images/ava3.jpg" />" class="img-responsive" alt="" width="40" height="40" >Thanh toán rất khó khăn.</li>
                </ul>
            </li>
            <li class="item4">
                <a href="#"><img src="<c:url value="/resources/images/product_arrow.png" />">Các trang tham khảo</a>
                <ul>
                    <li class="subitem2" style="color: #ffffff">
                        &nbsp;&nbsp;---><a href="http://rausachonline.vn/" style="color: #ffffff">Rau sạch online</a><br>
                        &nbsp;&nbsp;---><a href="https://www.facebook.com/CuaHangRauSachOnline/" style="color: #ffffff">Cửa hàng rau sạch online </a><br>
                    </li>
                </ul>
            </li>
            <li class="item5">
                <a href="#"><img src="<c:url value="/resources/images/product_arrow.png" />">Lấy mã giảm giá và voucher</a>
                <ul>
                    <li class="subitem1">
                        &nbsp;&nbsp;--->Lấy <a href="${pageContext.request.contextPath}/intro">"Coupon Code"</a> từ OrganikFreshShop
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <h3 class="m_2">Gợi ý ngẫu nhiên các sản phẩm </h3>
    <div class="container">
        <div class="box_3">
            <c:forEach items="${listRandomProductDemo}" var="product">
                <div class="col-md-3">
                    <div class="content_box">
                        <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                            <img src="<c:url value="${product.uri}" />" class="img-responsive" alt="">
                        </a>
                    </div>
                    <h4><a href="${pageContext.request.contextPath}/product_info?code=${product.code}">${product.name}</a></h4>
                    <p>
                        Mã sản phẩm : ${product.code}<br>
                        Giá : <format:formatNumber value="${product.priceTag}" currencySymbol="VNĐ" type="currency"/>
                    </p>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
