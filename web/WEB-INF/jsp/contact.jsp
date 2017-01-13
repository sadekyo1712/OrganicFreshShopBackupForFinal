<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Organic Fresh Shop</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="single_top">
    <div class="container">
        <div class="map">
            <iframe width="600" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJKd_uTV2rNTERJpeAAAd3_wc&key=AIzaSyAuQHyWoSEk_fQpxPJ79huklWtREruw164" allowfullscreen></iframe>
        </div>
        <div class="col-md-9 contact_left">
            <h1>Liên hệ đại lý của chúng tôi</h1>
            <p>Liên hệ với đại lý của chúng tôi để có sự hỗ trợ bán hàng và các dịch vụ tốt nhất đi kèm các chính sách hỗ
            trợ quảng cáo với chi phí hợp lý.</p>
            <form>
                <div class="column_2">
                    <input form="message" type="text" class="text" placeholder="" value="Tên" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Tên';}">
                    <input form="message" type="text" class="text" placeholder="" value="Email" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Email';}" style="margin-left:2.7%">
                    <input form="message" type="text" class="text" placeholder="" value="Chủ đề" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Chủ đề';}" style="margin-left:2.7%">
                </div>
                <div class="column_3">
                    <textarea value="Tin nhắn" placeholder="" onfocus="this.value = '';"
                              onblur="if (this.value == '') {this.value = 'Tin nhắn';}">Tin nhắn cho chúng tôi</textarea>
                </div>
                <div class="form-submit1">
                    <form id="message" action="" method="post">
                        <input type="submit" value="Gửi cho chúng tôi">
                    </form>
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
        <div class="col-md-3 contact_right">
            <h2>Thông tin liên hệ</h2>
            <address class="address">
                <p>Tầng 7 Vincom Tower, <br>số 1 Chùa Láng.</p>
                <dl>
                    <dt></dt>
                    <dd>Di động:<span> +84 167 753 3389</span></dd>
                    <dd>Cố định:<span> +1 800 547 5478</span></dd>
                    <dd>FAX: <span>+1 800 658 5784</span></dd>
                    <dd>E-mail:&nbsp; <a href="https://google.com/gmail">info@Organicfreshshop.com</a></dd>
                </dl>
            </address>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
