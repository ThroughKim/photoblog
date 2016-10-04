<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 10. 4.
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%  //로그인 체크
    if(session.getAttribute("memId")==null){
%>
<jsp:forward page="${pageContext.request.contextPath}/login/loginPage.jsp" />
<%
    }
%>

<html>
<head>
    <title>Post View</title>
    <link href="${pageContext.request.contextPath}/assets/css/css_main.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/mainMenu.jsp" flush="false"></jsp:include>
<div class="content-area">
    <div class="post-box">
        <p class="post-top">
            <img src="${pageContext.request.contextPath}/images/profile_img.jpg" class="post-profile-img">
            <span class="post-top-name">
                Through_Kim
            </span>
        </p>
        <p>
            <img src="${pageContext.request.contextPath}/images/sample3.jpg" class="post-img">
        </p>
        <div class="single-post-contents">
            <div class="post-content">
                <p class="post-like">
                    좋아요 10개
                </p>
                <p class="post-story">
                    <b>Through_kim</b>
                    dddddd
                </p>
                <p class="post-comment">
                    <b>user1</b>안녕하세요<br>
                    <b>user2</b>선팔하고갑니다<br>
                </p>
            </div>
        </div>
    </div>

</div>
</body>
</html>
