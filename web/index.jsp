<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/22/16
  Time: 1:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Trang thử nghiệm cấu hình Tomcat</title>
  </head>
  <body>
  <h1>
    Nếu thấy trang này nghĩa là web server đã được cấu hình chính xác và chạy ổn định
  </h1>
  <h2>Click vào đây để truy cập vào trang chủ của OrganikFreshShop</h2>
  <form action="${pageContext.request.contextPath}/index" method="get" class="hidden">
    <div><input id="home" type="submit" value="Truy cap vao OrganikFreshShop" class="hidden"/></div>
  </form>
  <label for="home">---->Truy cập vào trang chủ OrgShop.vn<----</label>
  </body>
</html>
