<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 24.
  Time: 오후 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  //로그인 체크
  if(session.getAttribute("memEmail")==null){
%>
      <jsp:forward page="${pageContext.request.contextPath}/login/loginPage.jsp" />
<%
  }
%>
<html>
<head>
  <title>Insta</title>
  <link href="assets/css/css_main.css" rel="stylesheet" type="text/css">
  <meta charset="utf-8">
</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/mainMenu.jsp" flush="false"></jsp:include>

<div class="content-area">
  <div class="post-box">
    <p class="post-top">
      <img src="${pageContext.request.contextPath}/images/profile_img.jpg" class="post-profile-img">
      <span class="post-top-name">
                  Throughkim
              </span>
    </p>
    <p>
      <img src="${pageContext.request.contextPath}/images/sample.png" class="post-img">
    </p>
    <div class="post-content">
      <p class="post-like">
        좋아요 32개
      </p>
      <p class="post-story">
        <b>Through_kim</b> 시험공부 하기 싫다  <br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
        in voluptate velit esse cillum dolor <br><br>
        #시험공부 #브롬톤 #맥북
      </p>
      <p class="post-comment">
        <i>댓글 8개 모두 보기</i> <br>
        <b>Stranger</b> 선팔하고 가요~<br>
        <b>Stranger</b> 선팔하고 가요~<br>
        <b>Stranger</b> 선팔하고 가요~<br>
        <b>Stranger</b> 선팔하고 가요~<br>
      </p>
      <hr>
      <div class="post-input">
        <img src="${pageContext.request.contextPath}/assets/icons/like_colored.png">
        <form>
          <input type="text" placeholder="댓글 달기..." class="post-input-comment-box comment-placeholder">
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
