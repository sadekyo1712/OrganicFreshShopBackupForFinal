<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:32 PM
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

<div class="single_top">
    <div class="container">
        <div class="box_4">
            <div class="col-md-8 about_left">
                <h1>Giới thiệu về chúng tôi </h1>
                <img src="<c:url value="/resources/images/introduction.jpg" />" class="img-responsive" alt=""/>
                <p>Chúng tôi là một nhóm sinh viên năm cuối trường đại học Bách Khoa Hà Nội. Chúng tôi muốn
                    xây dựng website này như một kênh trao đổi thực phẩm hữu cơ sạch và thân thiện với mọi người
                    đồng thời giúp các bà nội trợ có thêm nguồn tham khảo thực phẩm an toàn cho gia đình mình. Hy vọng
                    mọi người sẽ yêu thích.</p>
                <div class="faqs">
                    <h2>Tại sao là chúng tôi ?</h2>
                    <div class="questions">
                        <h3>1.Chúng tôi có gì thú vị ?</h3>
                        <p>Thực ra đây là một sản phẩm phi lợi nhuận để kết nối mọi người và mong muốn mang lại
                            chất lượng cuộc sống tốt hơn nên có lẽ sẽ dễ tiếp cận mọi người hơn.</p>
                    </div>
                    <div class="questions">
                        <h3>2.Rau hữu cơ là gì ?</h3>
                        <p> Rau hữu cơ là loại rau canh tác trong điều kiện hoàn toàn tự nhiên :

                            <br>&#9679; Không bón phân hoá học

                            <br>&#9679; Không phun thuốc bảo vệ thực vật

                            <br>&#9679; Không phun thuốc kích thích sinh trưởng

                            <br>&#9679; Không sử dụng thuốc diệt cỏ

                            <br>&#9679; Không sử dụng sản phẩm biến đổi gen

                            <br>Người trồng rau hữu cơ được đào tạo chuyên sâu về cách trồng, chăm sóc và bảo quản rau,
                            đất trồng và nguồn nước tưới được lựa chọn không bị ô nhiễm bởi các kim loại nặng (thủy ngân, asen...),
                            không bị ảnh hưởng của nước thải công nghiệp (do ở gần các xí nghiệp, nhà máy nước thải chưa được xử lý).</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 sidebar">
                <h2>Some aspect of life :)</h2>
                <div class="testimonials">
                    <h3>William Arthur Ward<span><a href="https://en.wikipedia.org/wiki/William_Arthur_Ward">Famous Poet</a></span></h3>
                    <p><span class="quotes"></span>Người lạc quan sống trên bán đảo của những khả năng vô tận,
                        người bi quan kẹt trên hòn đào của những do dự vô cùng.<span
                                class="quotes-down"></span></p>
                </div>
                <div class="testimonials">
                    <h3>Francis Quarles<span><a href="https://en.wikipedia.org/wiki/Francis_Quarles">Famous Poet</a></span></h3>
                    <p><span class="quotes"></span>Nếu số phận chia cho bạn những quân bài xấu, hãy để sự khôn ngoan biến bạn thành người chơi giỏi.<span
                                class="quotes-down"></span></p>
                </div>
                <div class="testimonials">
                    <h3>Bill Gates<span><a href="https://en.wikipedia.org/wiki/Bill_Gates">Microsoft Founder</a></span></h3>
                    <p><span class="quotes"></span>Đừng so sánh mình với bất cứ ai trong thế giới này.
                        Nếu bạn làm như vậy có nghĩa bạn đang sỉ nhục chính bản thân mình.<span
                                class="quotes-down"></span></p>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>
        <h3 class="m_2">Tham khảo một số sản phẩm</h3>
        <div class="container">
            <div class="box_3">
                <c:forEach items="${listProductDemo}" var="product">
                    <div class="col-md-3">
                        <div class="content_box">
                            <a href="${pageContext.request.contextPath}/product_info?code=${product.code}">
                                <img src="<c:url value="${product.uri}" />" class="img-responsive" alt="">
                            </a>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/product_info?code=${product.code}">${product.name}</a></h4>
                        <p><format:formatNumber value="${product.priceTag}" type="currency"/></p>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
