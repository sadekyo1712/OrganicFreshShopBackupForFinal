<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>

<jsp:include page="header.jsp"/>
<format:setLocale value="vi_VN" scope="session"/>

<script type="text/javascript" id="sourcecode">
    $(function() {
        $('.scroll-pane').jScrollPane();
    });
</script>

<div class="container">
    <div class="women_main">
        <div class="col-md-9 w_content">
            <div class="women">
                <a href="${pageContext.request.contextPath}/supplier_product_list?user_name=${pageContext.request.userPrincipal.name}">
                    <h4>Sản phẩm đã tạo - <span>${totalProduct} sản phẩm &nbsp;</span></h4>
                </a>
                <ul class="w_nav">
                    <li>Sắp xếp :</li>
                    <li><a class="active" href="${pageContext.request.contextPath}/intro">phổ biến </a></li>
                    |
                    <li><a href="${pageContext.request.contextPath}/intro">mới </a></li>
                    |
                    <li><a href="${pageContext.request.contextPath}/intro">giảm giá</a></li>
                    |
                    <li><a href="${pageContext.request.contextPath}/intro">giá: Cao Thấp </a></li>
                    <div class="clear"></div>
                </ul>
                <div class="clearfix"></div>
            </div>

            <c:forEach items="${paginatorProduct.list}" var="product" varStatus="status">
            <c:if test="${ status.index == 0 }">
                <div class="grids_of_4">
                    <div class="grid1_of_4 simpleCart_shelfItem">
                        <div class="content_box">
                            <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                                <div class="view view-fifth">
                                    <img src="<c:url value="${product.uri}" />" class="img-responsive" alt=""/>
                                    <div class="mask1">
                                        <div class="info"></div>
                                    </div>
                            </a>
                        </div>
                        <h5>
                            <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">${product.name}</a>
                        </h5>
                        <h6>
                            Thuế GTGT: 10%<br>
                            Mã sản phẩm : ${product.code}
                        </h6>
                        <div class="size_1">
                            <span class="item_price"><format:formatNumber value="${product.priceTag}" currencySymbol="VNĐ" type="currency"/></span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="size_2">
                            <div class="size_2-left">
                                <form action="${pageContext.request.contextPath}/product_admin" method="get">
                                    <input title="" type="text" name="user_name" value="${pageContext.request.userPrincipal.name}" class="hidden">
                                    <input title="" type="text" name="code" value="${product.code}" class="hidden">
                                    <input type="submit" class="item_add edit3" value="">
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${ ( status.index != 0 ) && ( ( status.index % 4 ) == 0 ) }">
            <div class="clearfix"></div>
        </div>
        <div class="grids_of_4">
            <div class="grid1_of_4 simpleCart_shelfItem">
                <div class="content_box">
                    <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                        <div class="view view-fifth">
                            <img src="<c:url value="${product.uri}" />" class="img-responsive" alt=""/>
                            <div class="mask1">
                                <div class="info"></div>
                            </div>
                    </a>
                </div>
                <h5><a href="${pageContext.request.contextPath}/product_info?code=${product.code}">${product.name}</a></h5>
                <h6>
                    Thuế GTGT: 10%<br>
                    Mã sản phẩm : ${product.code}
                </h6>
                <div class="size_1">
                    <span class="item_price"><format:formatNumber value="${product.priceTag}" currencySymbol="VNĐ" type="currency"/></span>
                    <div class="clearfix"></div>
                </div>
                <div class="size_2">
                    <div class="size_2-left">
                        <form action="${pageContext.request.contextPath}/product_admin" method="get">
                            <input title="" type="text" name="user_name" value="${pageContext.request.userPrincipal.name}" class="hidden">
                            <input title="" type="text" name="code" value="${product.code}" class="hidden">
                            <input type="submit" class="item_add edit3" value="">
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        </c:if>
        <c:if test="${( (status.index ) % 4 ) != 0}">
        <div class="grid1_of_4 simpleCart_shelfItem">
            <div class="content_box">
                <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                    <div class="view view-fifth">
                        <img src="<c:url value="${product.uri}" />" class="img-responsive" alt=""/>
                        <div class="mask1">
                            <div class="info"></div>
                        </div>
                </a>
            </div>
            <h5><a href="${pageContext.request.contextPath}/product_info?code=${product.code}">${product.name}</a></h5>
            <h6>
                Thuế GTGT: 10%<br>
                Mã sản phẩm : ${product.code}
            </h6>
            <div class="size_1">
                <span class="item_price"><format:formatNumber value="${product.priceTag}" currencySymbol="VNĐ" type="currency"/></span>
                <div class="clearfix"></div>
            </div>
            <div class="size_2">
                <div class="size_2-left">
                    <form action="${pageContext.request.contextPath}/product_admin" method="get">
                        <input title="" type="text" name="user_name" value="${pageContext.request.userPrincipal.name}" class="hidden">
                        <input title="" type="text" name="code" value="${product.code}" class="hidden">
                        <input type="submit" class="item_add edit3" value="">
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    </c:if>
    </c:forEach>
    <div class="clearfix"></div>
    <div class="women_bottom">
        <c:if test="${paginatorProduct.totaLPage > 1}">
            <span>
                TRANG&nbsp;
                <c:if test="${paginatorProduct.totaLPage > 1}">
                    <c:forEach items="${paginatorProduct.navigateBar}" var="page">
                        <c:if test="${page != -1}">
                            <a href="${pageContext.request.contextPath}/supplier_product_list?user_name=${pageContext.request.userPrincipal.name}&page=${page}">${page} </a>|
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
</div>

<!-- start sidebar -->
<div class="col-md-3">
    <div class="w_sidebar">
        <div class="w_nav1">
            <h4>TẤT CẢ</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/product_list">Cây ăn trái</a></li>
                <li><a href="${pageContext.request.contextPath}/product_list">Cây gia vị</a></li>
                <li><a href="${pageContext.request.contextPath}/product_list">Cây hoa cảnh</a></li>
                <li><a href="${pageContext.request.contextPath}/product_list">Cây rau ăn lá</a></li>
                <li><a href="${pageContext.request.contextPath}/product_list">Cây thảo dược & rau thuốc</a></li>
            </ul>
        </div>
        <h3>filter by</h3>
        <section class="sky-form">
            <h4>phân loại rau</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Rau ăn thân</label>
                </div>
                <div class="col col-4">
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rau ăn rễ củ</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rau ăn hạt</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rau mầm</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Hạt các loại</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rong tảo biển</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nấm ăn</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rau thơm</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Các loại rau khác</label>
                </div>
            </div>
        </section>
        <section class="sky-form">
            <h4>nguồn gốc sản phẩm</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Cá nhân / Tiểu thương</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nông trại Vingroup ©</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nông trại Vinarasa ©</label>
                </div>
                <div class="col col-4">
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nông trại rau hữu cơ Phú Diễn ©</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rau sạch bác Tôm ©</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nông trại Nhật Tân ©</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nông trại rau sạch Phú Thượng ©</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nông trại hữu cơ OrganikFresh ©</label>
                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Các nông trại khác</label>
                </div>
            </div>
        </section>
        <section class="sky-form">
            <h4>màu sắc đóng gói sản phẩm</h4>
            <ul class="w_nav2">
                <li>
                    <a class="color1" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color2" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color3" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color4" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color5" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color6" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color7" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color8" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color9" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color10" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color12" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color13" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color14" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color15" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color5" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color6" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color7" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color8" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color9" href="${pageContext.request.contextPath}/intro"></a>
                </li>
                <li>
                    <a class="color10" href="${pageContext.request.contextPath}/intro"></a>
                </li>
            </ul>
        </section>
        <section class="sky-form">
            <h4>giảm giá & chiết khấu</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                    <label class="radio"><input type="radio" name="radio" checked=""><i></i>60 % trở lên</label>
                    <label class="radio"><input type="radio" name="radio"><i></i>50 % trở lên</label>
                    <label class="radio"><input type="radio" name="radio"><i></i>40 % trở lên</label>
                </div>
                <div class="col col-4">
                    <label class="radio"><input type="radio" name="radio"><i></i>30 % trở lên</label>
                    <label class="radio"><input type="radio" name="radio"><i></i>20 % trở lên</label>
                    <label class="radio"><input type="radio" name="radio"><i></i>10 % trở lên</label>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- start content -->
<div class="clearfix"></div>
<!-- end content -->
</div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
