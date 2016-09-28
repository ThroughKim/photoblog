<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 27.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insta</title>
    <link href="${pageContext.request.contextPath}/assets/css/css_main.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
</head>
<body>
<div class="content-area">
    <div class="login-box">
        <div class="login-greet">
            Welcome to Insta!
        </div>
        <div class="login-form">
            <form>
                <input type="email" placeholder="E-mail" class="login-box-input login-placeholder"><br>
                <input type="password" placeholder="Password" class="login-box-input login-placeholder"><br><br>
                <input type="submit" value="로그인" class="login-button">
            </form>
        </div>
        <div class="regist-recommend">
            <p>
                아직 Insta의 회원이 아니신가요?
            </p>
            <a href="../registration/registerPage.jsp">회원가입</a>
        </div>
    </div>
</div>
</body>
</html>
