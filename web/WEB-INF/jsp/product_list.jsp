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
                <a href="${pageContext.request.contextPath}/product_list">
                    <h4>Danh mục sản phẩm - <span>${totalProduct} sản phẩm &nbsp;</span></h4>
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
                                <div>Qty : <input title="Must integer value, ex: 2,3,4..." form="buy_product${status.index}" type="text" name="quantity"
                                                  class="item_quantity quantity_1" value="1"
                                                  pattern="[1-9][\d]*" required/> kg</div>
                                <div class="size_2-left">
                                    <form id="buy_product${status.index}" action="${pageContext.request.contextPath}/buy_product" method="get">
                                        <input title="" type="text" name="code" value="${product.code}" class="hidden">
                                        <input type="submit" class="item_add add3" value="">
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
                                <div>Qty : <input title="Must integer value, ex: 2,3,4..." form="buy_product${status.index}" type="text" name="quantity"
                                                  class="item_quantity quantity_1" value="1"
                                                  pattern="[1-9][\d]*" required/> kg</div>
                                <div class="size_2-left">
                                    <form id="buy_product${status.index}" action="${pageContext.request.contextPath}/buy_product" method="get">
                                        <input title="" type="text" name="code" value="${product.code}" class="hidden">
                                        <input type="submit" class="item_add add3" value="">
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
                            <div>Qty : <input title="Must integer value, ex: 2,3,4..." form="buy_product${status.index}" type="text" name="quantity"
                                              class="item_quantity quantity_1" value="1"
                                              pattern="[1-9][\d]*" required/> kg</div>
                            <div class="size_2-left">
                                <form id="buy_product${status.index}" action="${pageContext.request.contextPath}/buy_product" method="get">
                                    <input title="" type="text" name="code" value="${product.code}" class="hidden">
                                    <input type="submit" class="item_add add3" value="">
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
                <span style="color: #319e46">TRANG</span>&nbsp;
                <c:if test="${paginatorProduct.totaLPage > 1}">
                    <c:forEach items="${paginatorProduct.navigateBar}" var="page">
                        <c:if test="${page != -1 && page == paginatorProduct.currentPage}">
                            <c:if test="${!pageContext.request.queryString.contains('page')}">
                                <c:if test="${pageContext.request.queryString.contains('name')}">
                                    <a style="color: #3bc69c; font-weight: bold" href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString}&page=${page}">${page} </a>|
                                </c:if>
                                <c:if test="${!pageContext.request.queryString.contains('name')}">
                                    <a style="color: #3bc69c; font-weight: bold" href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString}&page=${page}&name=${pageContext.request.getParameter("name")}">${page} </a>|
                                </c:if>
                            </c:if>
                            <c:if test="${pageContext.request.queryString.contains('page')}">
                                <c:if test="${pageContext.request.queryString.contains('name')}">
                                    <a style="color: #3bc69c; font-weight: bold" href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString.replace("page=".concat(paginatorProduct.currentPage), "page=".concat(page))}">${page} </a>|
                                </c:if>
                                <c:if test="${!pageContext.request.queryString.contains('name')}">
                                    <a style="color: #3bc69c; font-weight: bold" href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString.replace("page=".concat(paginatorProduct.currentPage), "page=".concat(page))}&name=${pageContext.request.getParameter("name")}">${page} </a>|
                                </c:if>
                            </c:if>
                        </c:if>
                        <c:if test="${page != -1 && page != paginatorProduct.currentPage}">
                            <c:if test="${!pageContext.request.queryString.contains('page')}">
                                <c:if test="${pageContext.request.queryString.contains('name')}">
                                    <a href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString}&page=${page}">${page} </a>|
                                </c:if>
                                <c:if test="${!pageContext.request.queryString.contains('name')}">
                                    <a href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString}&page=${page}&name=${pageContext.request.getParameter("name")}">${page} </a>|
                                </c:if>
                            </c:if>
                            <c:if test="${pageContext.request.queryString.contains('page')}">
                                <c:if test="${pageContext.request.queryString.contains('name')}">
                                    <a href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString.replace("page=".concat(paginatorProduct.currentPage), "page=".concat(page))}">${page} </a>|
                                </c:if>
                                <c:if test="${!pageContext.request.queryString.contains('name')}">
                                    <a href="${pageContext.request.contextPath}/product_list?${pageContext.request.queryString.replace("page=".concat(paginatorProduct.currentPage), "page=".concat(page))}&name=${pageContext.request.getParameter("name")}">${page} </a>|
                                </c:if>
                            </c:if>
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
        <section class="sky-form">
            <h4>họ cây</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                <c:if test="${pageContext.request.getParameter('category') != null}">
                    <c:if test="${pageContext.request.getParameter('category') == 'CAY AN TRAI'}">
                        <label class="radio"><input form="filter" type="radio" name="category" value="TAT CA"><i></i>Tất cả các họ cây</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY AN TRAI" checked><i></i>Cây ăn trái</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY GIA VI"><i></i>Cây gia vị</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY HOA CANH"><i></i>Cây hoa cảnh</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY RAU AN LA"><i></i>Cây rau ăn lá</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY THAO DUOC VA RAU THUOC"><i></i>Cây thảo dược & rau thuốc</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('category') == 'CAY GIA VI'}">
                        <label class="radio"><input form="filter" type="radio" name="category" value="TAT CA"><i></i>Tất cả các họ cây</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY AN TRAI"><i></i>Cây ăn trái</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY GIA VI" checked><i></i>Cây gia vị</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY HOA CANH"><i></i>Cây hoa cảnh</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY RAU AN LA"><i></i>Cây rau ăn lá</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY THAO DUOC VA RAU THUOC"><i></i>Cây thảo dược & rau thuốc</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('category') == 'CAY HOA CANH'}">
                        <label class="radio"><input form="filter" type="radio" name="category" value="TAT CA"><i></i>Tất cả các họ cây</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY AN TRAI"><i></i>Cây ăn trái</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY GIA VI"><i></i>Cây gia vị</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY HOA CANH" checked><i></i>Cây hoa cảnh</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY RAU AN LA"><i></i>Cây rau ăn lá</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY THAO DUOC VA RAU THUOC"><i></i>Cây thảo dược & rau thuốc</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('category') == 'CAY RAU AN LA'}">
                        <label class="radio"><input form="filter" type="radio" name="category" value="TAT CA"><i></i>Tất cả các họ cây</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY AN TRAI"><i></i>Cây ăn trái</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY GIA VI"><i></i>Cây gia vị</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY HOA CANH"><i></i>Cây hoa cảnh</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY RAU AN LA" checked><i></i>Cây rau ăn lá</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY THAO DUOC VA RAU THUOC"><i></i>Cây thảo dược & rau thuốc</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('category') == 'CAY THAO DUOC VA RAU THUOC'}">
                        <label class="radio"><input form="filter" type="radio" name="category" value="TAT CA"><i></i>Tất cả các họ cây</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY AN TRAI"><i></i>Cây ăn trái</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY GIA VI"><i></i>Cây gia vị</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY HOA CANH"><i></i>Cây hoa cảnh</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY RAU AN LA"><i></i>Cây rau ăn lá</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY THAO DUOC VA RAU THUOC" checked><i></i>Cây thảo dược & rau thuốc</label>
                    </c:if>
                </c:if>
                <c:if test="${pageContext.request.getParameter('category') == null || pageContext.request.getParameter('category') == 'TAT CA'}">
                        <label class="radio"><input form="filter" type="radio" name="category" value="TAT CA" checked><i></i>Tất cả các họ cây</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY AN TRAI"><i></i>Cây ăn trái</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY GIA VI"><i></i>Cây gia vị</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY HOA CANH"><i></i>Cây hoa cảnh</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY RAU AN LA"><i></i>Cây rau ăn lá</label>
                        <label class="radio"><input form="filter" type="radio" name="category" value="CAY THAO DUOC VA RAU THUOC"><i></i>Cây thảo dược & rau thuốc</label>
                </c:if>
                </div>
            </div>
        </section>
        <h3></h3>
        <h3>filter by</h3>
        <section class="sky-form">
            <h4>loại rau</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                    <c:if test="${pageContext.request.getParameter('type1') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type1" value="RAU AN THAN" checked><i></i>Rau ăn thân</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type1') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type1" value="RAU AN THAN"><i></i>Rau ăn thân</label>
                    </c:if>
                    <%--<label class="checkbox"><input form="filter" type="checkbox" name="type1" value="RAU AN THAN"><i></i>Rau ăn thân</label>--%>
                </div>
                <div class="col col-4">
                    <c:if test="${pageContext.request.getParameter('type2') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type2" value="RAU AN RE CU" checked><i></i>Rau ăn rễ củ</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type2') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type2" value="RAU AN RE CU"><i></i>Rau ăn rễ củ</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type3') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type3" value="RAU AN HAT" checked><i></i>Rau ăn hạt</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type3') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type3" value="RAU AN HAT"><i></i>Rau ăn hạt</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type4') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type4" value="RAU MAM" checked><i></i>Rau mầm</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type4') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type4" value="RAU MAM"><i></i>Rau mầm</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type5') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type5" value="HAT CAC LOAI" checked><i></i>Hạt các loại</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type5') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type5" value="HAT CAC LOAI"><i></i>Hạt các loại</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type6') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type6" value="RONG TAO BIEN" checked><i></i>Rong tảo biển</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type6') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type6" value="RONG TAO BIEN"><i></i>Rong tảo biển</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type7') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type7" value="NAM AN" checked><i></i>Nấm ăn</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type7') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type7" value="NAM AN"><i></i>Nấm ăn</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type8') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type8" value="RAU THOM" checked><i></i>Rau thơm</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type8') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type8" value="RAU THOM"><i></i>Rau thơm</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type9') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type9" value="CAC LOAI RAU KHAC" checked><i></i>Các loại rau khác</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('type9') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="type9" value="CAC LOAI RAU KHAC"><i></i>Các loại rau khác</label>
                    </c:if>
                </div>
            </div>
        </section>
        <section class="sky-form">
            <h4>nguồn gốc sản phẩm</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                    <c:if test="${pageContext.request.getParameter('source1') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source1" value="CA NHAN / TIEU THUONG" checked><i></i>Cá nhân / Tiểu thương</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source1') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source1" value="CA NHAN / TIEU THUONG"><i></i>Cá nhân / Tiểu thương</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source2') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source2" value="NONG TRAI VINAGROUP" checked><i></i>Nông trại Vingroup ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source2') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source2" value="NONG TRAI VINAGROUP"><i></i>Nông trại Vingroup ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source3') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source3" value="NONG TRAI VINARASA" checked><i></i>Nông trại Vinarasa ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source3') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source3" value="NONG TRAI VINARASA"><i></i>Nông trại Vinarasa ©</label>
                    </c:if>
                </div>
                <div class="col col-4">
                    <c:if test="${pageContext.request.getParameter('source4') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source4" value="NONG TRAI PHU DIEN" checked><i></i>Nông trại rau hữu cơ Phú Diễn ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source4') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source4" value="NONG TRAI PHU DIEN"><i></i>Nông trại rau hữu cơ Phú Diễn ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source5') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source5" value="RAU SACH BAC TOM" checked><i></i>Rau sạch bác Tôm ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source5') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source5" value="RAU SACH BAC TOM"><i></i>Rau sạch bác Tôm ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source6') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source6" value="NONG TRAI NHAT TAN" checked><i></i>Nông trại Nhật Tân ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source6') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source6" value="NONG TRAI NHAT TAN"><i></i>Nông trại Nhật Tân ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source7') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source7" value="NONG TRAI PHU THUONG" checked><i></i>Nông trại rau sạch Phú Thượng ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source7') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source7" value="NONG TRAI PHU THUONG"><i></i>Nông trại rau sạch Phú Thượng ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source8') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source8" value="ORGANIK FRESH" checked><i></i>Nông trại hữu cơ OrganikFresh ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source8') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source8" value="ORGANIK FRESH"><i></i>Nông trại hữu cơ OrganikFresh ©</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source9') != null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source9" value="NONG TRAI KHAC" checked><i></i>Các nông trại khác</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('source9') == null}">
                        <label class="checkbox"><input form="filter" type="checkbox" name="source9" value="NONG TRAI KHAC"><i></i>Các nông trại khác</label>
                    </c:if>
                </div>
            </div>
        </section>
        <section class="sky-form">
            <h4>màu sắc đóng gói sản phẩm</h4>
            <ul class="w_nav2">
                <li>
                    <a class="color1" href=""></a>
                </li>
                <li>
                    <a class="color2" href=""></a>
                </li>
                <li>
                    <a class="color3" href=""></a>
                </li>
                <li>
                    <a class="color4" href=""></a>
                </li>
                <li>
                    <a class="color5" href=""></a>
                </li>
                <li>
                    <a class="color6" href=""></a>
                </li>
                <li>
                    <a class="color7" href=""></a>
                </li>
                <li>
                    <a class="color8" href=""></a>
                </li>
                <li>
                    <a class="color9" href=""></a>
                </li>
                <li>
                    <a class="color10" href=""></a>
                </li>
                <li>
                    <a class="color12" href=""></a>
                </li>
                <li>
                    <a class="color13" href=""></a>
                </li>
                <li>
                    <a class="color14" href=""></a>
                </li>
                <li>
                    <a class="color15" href=""></a>
                </li>
                <li>
                    <a class="color5" href=""></a>
                </li>
                <li>
                    <a class="color6" href=""></a>
                </li>
                <li>
                    <a class="color7" href=""></a>
                </li>
                <li>
                    <a class="color8" href=""></a>
                </li>
                <li>
                    <a class="color9" href=""></a>
                </li>
                <li>
                    <a class="color10" href=""></a>
                </li>
            </ul>
        </section>
        <section class="sky-form">
            <h4>giảm giá & chiết khấu</h4>
            <div class="row1 scroll-pane">
                <div class="col col-4">
                    <c:if test="${pageContext.request.getParameter('discount') == '101' || pageContext.request.getParameter('discount') == null}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101" checked><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60"><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50"><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40"><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30"><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20"><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10"><i></i>10 % trở lên</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('discount') == '60'}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101"><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60" checked><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50"><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40"><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30"><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20"><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10"><i></i>10 % trở lên</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('discount') == '50'}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101"><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60"><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50" checked><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40"><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30"><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20"><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10"><i></i>10 % trở lên</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('discount') == '40'}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101"><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60"><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50"><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40" checked><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30"><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20"><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10"><i></i>10 % trở lên</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('discount') == '30'}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101"><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60"><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50"><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40"><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30" checked><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20"><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10"><i></i>10 % trở lên</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('discount') == '20'}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101"><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60"><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50"><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40"><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30"><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20" checked><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10"><i></i>10 % trở lên</label>
                    </c:if>
                    <c:if test="${pageContext.request.getParameter('discount') == '10'}">
                        <label class="radio"><input form="filter" type="radio" name="discount" value="101"><i></i>Tất cả mức giảm giá</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="60"><i></i>60 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="50"><i></i>50 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="40"><i></i>40 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="30"><i></i>30 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="20"><i></i>20 % trở lên</label>
                        <label class="radio"><input form="filter" type="radio" name="discount" value="10" checked><i></i>10 % trở lên</label>
                    </c:if>
                </div>
            </div>
        </section>
    </div>
    <form id="filter" action="${pageContext.request.contextPath}/product_list" method="get">
        <input type="submit" class="filter" value="LỌC DANH SÁCH SẢN PHẨM" >
    </form>
</div>
<!-- start content -->
<div class="clearfix"></div>
<!-- end content -->
</div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
