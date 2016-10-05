<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 10. 4.
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

<%
    request.setCharacterEncoding("UTF-8");
    int postId = Integer.parseInt(request.getParameter("post_id"));
%>

<html>
<head>
    <title>Post View</title>
    <link href="${pageContext.request.contextPath}/assets/css/css_main.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/mainMenu.jsp" flush="false"></jsp:include>
<%
    PostDAO postDao = new PostDAO();
    PostDTO post = new PostDTO();
    MemberDAO memDao = new MemberDAO();


    post = postDao.getSinglePost(postId);

    int userId = post.getUser_id();
    String postImg = post.getImage();
    int cntLike = post.getCnt_like();
    String content = post.getContent();

    List<CommentDTO> commentList = null;
    CommentDAO commentDAO = new CommentDAO();
    commentList = commentDAO.getList(post.getId());
%>
<div class="content-area">
    <div class="post-box">
        <p class="post-top">
            <img src="${pageContext.request.contextPath}<%=memDao.getProfileImg(userId) %>" class="post-profile-img">
            <span class="post-top-name">
                <a href="${pageContext.request.contextPath}/profile/profilePage.jsp?user_id=<%= userId%>">
                      <%=memDao.getUsername(userId) %>
                  </a>
            </span>
        </p>
        <p>
            <img src="${pageContext.request.contextPath}<%= postImg%>" class="post-img">
        </p>
        <div class="single-post-contents">
            <div class="post-content">
                <p class="post-like">
                    좋아요 <%=cntLike %>개
                </p>
                <p class="post-story">
                    <b><a href="${pageContext.request.contextPath}/profile/profilePage.jsp?user_id=<%= userId%>">
                        <%=memDao.getUsername(userId) %></a></b> <%=content.replace("\r\n","<br>") %>
                    </a>
                </p>
                <p class="post-comment">
                    <%
                        for(int j=0; j<commentList.size(); j++){
                            CommentDTO comment = commentList.get(j);
                    %>
                    <b><a href="${pageContext.request.contextPath}/profile/profilePage.jsp?user_id=<%=comment.getUser_id()%>">
                        <%=memDao.getUsername(comment.getUser_id()) %></b> <%=comment.getContent() %>
                    </a><br>
                    <%
                        }
                    %>
                </p>
            </div>
        </div>
    </div>

</div>
</body>
</html>
