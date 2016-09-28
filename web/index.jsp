<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 24.
  Time: 오후 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbControl.PostDAO" %>
<%@ page import="dbControl.PostDTO" %>
<%@ page import="dbControl.MemberDAO" %>
<%@ page import="java.util.List" %>

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
<%
    List<PostDTO> postList = null;
    PostDAO postDao = new PostDAO();
    postList = postDao.getList();

    MemberDAO memDao = new MemberDAO();
%>
<div class="content-area">

<%
    for(int i =0; i<postList.size(); i++){
        PostDTO post = postList.get(i);

        int user_id = post.getUser_id();
%>
    <div class="post-box">
        <p class="post-top">
            <img src="${pageContext.request.contextPath}<%=memDao.getProfileImg(user_id) %>" class="post-profile-img">
            <span class="post-top-name">
                  <%=memDao.getUsername(user_id) %>
              </span>
        </p>
        <p>
            <img src="${pageContext.request.contextPath}<%= post.getImage()%>" class="post-img">
        </p>
        <div class="post-content">
            <p class="post-like">
                좋아요 <%= post.getCnt_like() %>개
            </p>
            <p class="post-story">
                <b>Through_kim</b> <%= post.getContent() %>
                #해시태그 #준비중
            </p>
            <p class="post-comment">
                <i>댓글 <%= post.getCnt_comment()%>개 모두 보기</i> <br>
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
<%
    }
%>

</div>
</body>
</html>
