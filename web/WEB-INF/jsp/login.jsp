<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/27/16
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Orgnic Fresh Shop</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="single_top">
    <div class="container">
        <div class="register">
            <div class="col-md-6 login-right">
                <h3>ĐĂNG NHẬP</h3>
                <p>Hãy đăng nhập để sử dụng nếu đã có tài khoản.</p>
                <c:if test="${param.error == 'true'}">
                    <p>
                       <span>
                            Thông tin đăng nhập không chính xác<br>
                            Lý do : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                       </span>
                    </p>
                </c:if>
                <form method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
                    <div>
                        <span>Tên đăng nhập hoặc địa chỉ email<label>*</label></span>
                        <input type="text" name="username" required/>
                    </div>
                    <div>
                        <span>Mật khẩu<label>*</label></span>
                        <input type="password" name="password" required/>
                    </div>
                    <a class="forgot" href="${pageContext.request.contextPath}/intro">Bạn quên mật khẩu ?</a>
                    <input type="submit" value="Đăng nhập"/>
                    <input type="reset" value="Reset"/>
                </form>
            </div>
            <div class="col-md-6 login-left">
                <h3>LẬP TÀI KHOẢN</h3>
                <p>Bạn chưa có tài khoản ? Hãy lập ngay tài khoản mới để có trải nghiệm người dùng tốt nhất cùng chúng tôi</p>
                <a class="acount-btn" href="${pageContext.request.contextPath}/register">Tạo tài khoản mới</a>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
