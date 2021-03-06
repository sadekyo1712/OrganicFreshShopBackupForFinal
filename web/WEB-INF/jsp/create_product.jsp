<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="single_top">
    <div class="container">
        <div class="register">
            <form:form name="create_product" action="${pageContext.request.contextPath}/create_product?user_name=${pageContext.request.userPrincipal.name}"
                       method="post" modelAttribute="productForm">
                <div class="register-top-grid">
                    <h3>TẠO SẢN PHẨM MỚI</h3>
                    <c:if test="${not empty message }">
                        <div>${message}</div>
                    </c:if>
                    <div>
                        <span>Họ cây</span>
                        <form:select path="productInfo.category">
                            <form:option value="CAY AN TRAI">Lựa chọn họ cây</form:option>
                            <form:option value="CAY AN TRAI">Cây ăn trái</form:option>
                            <form:option value="CAY GIA VI">Cây gia vị</form:option>
                            <form:option value="CAY HOA CANH">Cây hoa cảnh</form:option>
                            <form:option value="CAY RAU AN LA">Cây rau ăn lá</form:option>
                            <form:option value="CAY THAO DUOC VA RAU THUOC">Cây thảo dược và rau thuốc</form:option>
                        </form:select>
                    </div>
                    <div>
                        <span>Loại rau</span>
                        <form:select path="productInfo.type">
                            <form:option value="RAU AN THAN">Lựa chọn loai rau</form:option>
                            <form:option value="RAU AN THAN">Rau ăn thân</form:option>
                            <form:option value="RAU AN RE CU">Rau ăn rễ củ</form:option>
                            <form:option value="RAU AN HAT">Rau ăn hạt</form:option>
                            <form:option value="RAU MAM">Rau mầm</form:option>
                            <form:option value="HAT CAC LOAI">Hạt các loại</form:option>
                            <form:option value="RONG TAO BIEN">Rong tảo biển</form:option>
                            <form:option value="NAM AN">Nấm ăn</form:option>
                            <form:option value="RAU THOM">Rau thơm</form:option>
                            <form:option value="CAC LOAI RAU KHAC">Các loại rau khác</form:option>
                        </form:select>
                    </div>
                    <div>
                        <span>Nguồn gốc  sản phẩm</span>
                        <form:select path="productInfo.source">
                            <form:option value="CA NHAN / TIEU THUONG">Lựa chọn nguồn gốc sản phẩm</form:option>
                            <form:option value="CA NHAN / TIEU THUONG">Cá nhân / Tiểu thương</form:option>
                            <form:option value="NONG TRAI VINAGROUP">Nông trại Vingroup ©</form:option>
                            <form:option value="NONG TRAI VINARASA">Nông trại Vinarasa ©</form:option>
                            <form:option value="NONG TRAI PHU DIEN">Nông trại rau hữu cơ Phú Diễn ©</form:option>
                            <form:option value="RAU SACH BAC TOM">Rau sạch bác Tôm ©</form:option>
                            <form:option value="NONG TRAI NHAT TAN">Nông trại Nhật Tân ©</form:option>
                            <form:option value="NONG TRAI PHU THUONG">Nông trại rau sạch Phú Thượng ©</form:option>
                            <form:option value="ORGANIK FRESH">Nông trại hữu cơ OrganikFresh ©</form:option>
                            <form:option value="NONG TRAI KHAC">Các nông trại khác</form:option>
                        </form:select>
                    </div>
                    <div>
                        <span>Mức giảm giá hoặc chiết khấu</span>
                        <c:if test="${not empty productForm.productInfo.discount}">
                            <form:input path="productInfo.discount" placeholder="${productForm.productInfo.discount}" required="true"
                                        pattern="[1-9][\d]*" title="Require int value"/>
                        </c:if>
                        <c:if test="${empty productForm.productInfo.discount}">
                            <form:input path="productInfo.discount" required="true" placeholder="Ex: 20"
                                        pattern="[1-9][\d]*" title="Require int value"/>
                        </c:if>
                    </div>
                    <div>
                        <span>Tên sản phẩm<label>*</label></span>
                        <c:if test="${not empty productForm.name}">
                            <form:input path="name" placeholder="${productForm.name}" required="true"/>
                        </c:if>
                        <c:if test="${empty productForm.name}">
                            <form:input path="name" required="true" placeholder="Ex: Bưởi năm roi"/>
                        </c:if>
                        <span><form:errors path="name"/></span>
                    </div>
                    <div>
                        <span>Giá sản phẩm<label>*</label></span>
                        <c:if test="${not empty productForm.priceTag}">
                            <form:input path="priceTag" placeholder="${productForm.priceTag}" required="true"
                                        pattern="[1-9][\d]*(.[\d]+)?" title="Require number value, ex : 1 / 2 / 1.2 not 01,02,0,..."/>
                        </c:if>
                        <c:if test="${empty productForm.priceTag}">
                            <form:input path="priceTag" required="true" placeholder="Ex: 100000"
                                        pattern="[1-9][\d]*(.[\d]+)?" title="Require number value, ex : 1 / 2 / 1.2 not 01,02,0,..."/>
                        </c:if>
                        <span><form:errors path="priceTag"/></span>
                    </div>
                    <div>
                        <span>Mô tả sản phẩm<label>*</label></span>
                        <c:if test="${not empty productForm.description}">
                            <form:textarea path="description" rows="2" cols="30"
                                           placeholder="${productForm.description}" required="true"/>
                        </c:if>
                        <c:if test="${empty productForm.description}">
                            <form:textarea path="description" rows="2" cols="30" required="true"
                                           placeholder="Ex : Mô tả thông tin chi tiết của sản phẩm"/>
                        </c:if>
                    </div>
                    <div>
                        <span>Hình ảnh sản phẩm</span>
                        <c:if test="${not empty productForm.uri}">
                            <img src="${productForm.uri}" width="200" height="200"/>
                        </c:if>
                        <c:if test="${empty productForm.uri}">
                            <img src="<c:url value="/resources/images/spring.jpg"/>" width="376" height="200"/>
                        </c:if>
                    </div>
                    <div>
                        <span>Category sản phẩm</span>
                        <form:select path="uri">
                            <form:option value="/resources/images/background.jpg">Lựa chọn hình ảnh demo sản phẩm</form:option>
                            <form:option value="/resources/images/spring.jpg">DEMO SPRING 1</form:option>
                            <form:option value="/resources/images/spring2.jpg">DEMO SPRING 2</form:option>
                            <form:option value="/resources/images/spring3.png">DEMO SPRING 3</form:option>
                            <form:option value="/resources/images/1.jpg">DEMO PICTURE 1</form:option>
                            <form:option value="/resources/images/2.jpg">DEMO PICTURE 2</form:option>
                            <form:option value="/resources/images/3.jpg">DEMO PICTURE 3</form:option>
                            <form:option value="/resources/images/4.jpg">DEMO PICTURE 4</form:option>
                            <form:option value="/resources/images/5.jpg">DEMO PICTURE 5</form:option>
                            <form:option value="/resources/images/6.jpg">DEMO PICTURE 6</form:option>
                            <form:option value="/resources/images/7.jpg">DEMO PICTURE 7</form:option>
                            <form:option value="/resources/images/8.jpg">DEMO PICTURE 8</form:option>
                            <form:option value="/resources/images/9.jpg">DEMO PICTURE 9</form:option>
                            <form:option value="/resources/images/10.jpg">DEMO PICTURE 10</form:option>
                            <form:option value="/resources/images/11.jpg">DEMO PICTURE 11</form:option>
                            <form:option value="/resources/images/12.jpg">DEMO PICTURE 12</form:option>
                            <form:option value="/resources/images/13.jpg">DEMO PICTURE 13</form:option>
                            <form:option value="/resources/images/14.jpg">DEMO PICTURE 14</form:option>
                            <form:option value="/resources/images/15.jpg">DEMO PICTURE 15</form:option>
                            <form:option value="/resources/images/16.jpg">DEMO PICTURE 16</form:option>
                            <form:option value="/resources/images/17.jpg">DEMO PICTURE 17</form:option>
                            <form:option value="/resources/images/18.jpg">DEMO PICTURE 18</form:option>
                            <form:option value="/resources/images/19.jpg">DEMO PICTURE 19</form:option>
                            <form:option value="/resources/images/20.jpg">DEMO PICTURE 20</form:option>
                            <form:option value="/resources/images/21.jpg">DEMO PICTURE 21</form:option>
                            <form:option value="/resources/images/22.jpg">DEMO PICTURE 22</form:option>
                            <form:option value="/resources/images/23.jpg">DEMO PICTURE 23</form:option>
                            <form:option value="/resources/images/24.jpg">DEMO PICTURE 24</form:option>
                            <form:option value="/resources/images/25.jpg">DEMO PICTURE 25</form:option>
                            <form:option value="/resources/images/26.jpg">DEMO PICTURE 26</form:option>
                            <form:option value="/resources/images/27.jpg">DEMO PICTURE 27</form:option>
                            <form:option value="/resources/images/28.jpg">DEMO PICTURE 28</form:option>
                            <form:option value="/resources/images/29.jpg">DEMO PICTURE 29</form:option>
                            <form:option value="/resources/images/30.jpg">DEMO PICTURE 30</form:option>
                            <form:option value="/resources/images/31.jpg">DEMO PICTURE 31</form:option>
                            <form:option value="/resources/images/32.jpg">DEMO PICTURE 32</form:option>
                            <form:option value="/resources/images/33.jpg">DEMO PICTURE 33</form:option>
                            <form:option value="/resources/images/34.jpg">DEMO PICTURE 34</form:option>
                            <form:option value="/resources/images/35.jpg">DEMO PICTURE 35</form:option>
                            <form:option value="/resources/images/36.jpg">DEMO PICTURE 36</form:option>
                            <form:option value="/resources/images/37.jpg">DEMO PICTURE 37</form:option>
                            <form:option value="/resources/images/38.jpg">DEMO PICTURE 38</form:option>
                            <form:option value="/resources/images/39.jpg">DEMO PICTURE 39</form:option>
                            <form:option value="/resources/images/40.jpg">DEMO PICTURE 40</form:option>
                            <form:option value="/resources/images/41.jpg">DEMO PICTURE 41</form:option>
                            <form:option value="/resources/images/42.jpg">DEMO PICTURE 42</form:option>
                            <form:option value="/resources/images/43.jpg">DEMO PICTURE 43</form:option>
                            <form:option value="/resources/images/44.jpg">DEMO PICTURE 44</form:option>
                            <form:option value="/resources/images/45.jpg">DEMO PICTURE 45</form:option>
                            <form:option value="/resources/images/46.jpg">DEMO PICTURE 46</form:option>
                            <form:option value="/resources/images/cam.jpg">DEMO PICTURE 47</form:option>
                            <form:option value="/resources/images/cam_cara.jpg">DEMO PICTURE 48</form:option>
                            <form:option value="/resources/images/pic1.jpg">DEMO PICTURE 49</form:option>
                            <form:option value="/resources/images/pic2.jpg">DEMO PICTURE 50</form:option>
                            <form:option value="/resources/images/pic3.jpg">DEMO PICTURE 51</form:option>
                            <form:option value="/resources/images/pic4.jpg">DEMO PICTURE 52</form:option>
                            <form:option value="/resources/images/pic5.jpg">DEMO PICTURE 53</form:option>
                            <form:option value="/resources/images/pic6.jpg">DEMO PICTURE 54</form:option>
                            <form:option value="/resources/images/pic7.jpg">DEMO PICTURE 55</form:option>
                            <form:option value="/resources/images/pic8.jpg">DEMO PICTURE 56</form:option>
                        </form:select>
                    </div>
                    <div class="register-but">
                        <span>Upload hình ảnh sản phẩm</span>
                            <%--<form:input id="productImage" path="productImage" type="file" cssClass="hidden"/>--%>
                            <%--<form:label path="productImage" for="productImage">Chọn ảnh</form:label>--%>
                        <a href="${pageContext.request.contextPath}/intro">
                            <label>Chọn ảnh</label>
                        </a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <div class="register-but">
                    <input type="submit" value="Tạo sản phẩm mới"/>
                    <input type="reset" value="Reset"/>
                    <div class="clearfix"></div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
