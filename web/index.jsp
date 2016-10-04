<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 24.
  Time: 오후 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="dbControl.PostDAO" %>
<%@ page import="dbControl.PostDTO" %>
<%@ page import="dbControl.MemberDAO" %>
<%@ page import="dbControl.CommentDAO" %>
<%@ page import="dbControl.CommentDTO" %>
<%@ page import="java.util.List" %>

<%  //로그인 체크
  if(session.getAttribute("memId")==null){
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
    for(int i=0; i<postList.size(); i++){
        PostDTO post = postList.get(i);

        List<CommentDTO> commentList = null;
        CommentDAO commentDAO = new CommentDAO();
        commentList = commentDAO.getList(post.getId());

        int userId = post.getUser_id();
        String postImg = post.getImage();
        int cntLike = post.getCnt_like();
        String content = post.getContent();
        int postId = post.getId();
%>
    <div class="post-box">
        <p class="post-top">
            <img src="${pageContext.request.contextPath}<%=memDao.getProfileImg(userId) %>" class="post-profile-img">
            <span class="post-top-name">
                  <%=memDao.getUsername(userId) %>
              </span>
        </p>
        <p>
            <img src="${pageContext.request.contextPath}<%= postImg%>" class="post-img">
        </p>
        <div class="post-content">
            <p class="post-like">
                좋아요 <%=cntLike %>개
            </p>
            <p class="post-story">
                <b><%=memDao.getUsername(post.getUser_id()) %></b> <%=content.replace("\r\n","<br>") %>
            </p>
            <p class="post-comment">
<%
    for(int j=0; j<commentList.size(); j++){
        CommentDTO comment = commentList.get(j);
%>
                <b><%=memDao.getUsername(comment.getUser_id()) %></b> <%=comment.getContent() %><br>
<%
    }
%>
            </p>
            <hr>
            <div class="post-input">
                <img src="${pageContext.request.contextPath}/assets/icons/like_colored.png">
                <form action="commentPro.jsp" method="post">
                    <input type="text" placeholder="댓글 달기..." class="post-input-comment-box comment-placeholder" name="content">
                    <input type="hidden" name="post_id" value="<%=postId %>">
                    <input type="hidden" name="user_id" value="<%=session.getAttribute("memId")%>">
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
