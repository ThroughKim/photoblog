<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 10. 3.
  Time: 오후 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="dbControl.PostDAO" %>
<%@ page import="dbControl.PostDTO" %>
<%@ page import="dbControl.MemberDAO" %>
<%@ page import="java.util.List" %>
<%
    request.setCharacterEncoding("UTF-8");
    //로그인 체크
    if(session.getAttribute("memId")==null){
%>
<jsp:forward page="${pageContext.request.contextPath}/login/loginPage.jsp" />
<%
    }else if(request.getParameter("user_id")==null || request.getParameter("user_id")==""){
%>
<script>
    alert("잘못된 방식의 접근입니다.");
    history.go(-1);
</script>
<%
    }else{
        int requestedUserId = Integer.parseInt(request.getParameter("user_id"));
        boolean isMyself = false;

        //본인의 프로필인지 여부 확인

        if((Integer)session.getAttribute("memId") == requestedUserId){
            isMyself = true;
        }else {
            isMyself = false;
        }

        MemberDAO memDao = new MemberDAO();
%>

<html>
<head>
    <title>Profile</title>
    <link href="${pageContext.request.contextPath}/assets/css/css_main.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/assets/js/main_js.js" type=text/javascript></script>
    <meta charset="utf-8">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/mainMenu.jsp" flush="false"></jsp:include>
<div class="content-area">


    <div class="profile-contents">
        <div class="profile-header">
            <div class="profile-header-image">
                <img class="profile-image" src="${pageContext.request.contextPath}<%=memDao.getProfileImg(requestedUserId) %>">
            </div>
            <div class="profile-header-contents">
                <div class="profile-header-nick">
                    <h1><%= memDao.getUsername(requestedUserId)%></h1>
                    <span class="follow-button-span">
<%
        if(isMyself == true){   //본인일 경우에만 해당 버튼이 표시됨
%>
                        <button class="profile-button">프로필 편집</button>&nbsp;
                        <div class="dropdown">
                            <button onclick="dropDown()" class="dropbtn profile-button">&nabla;</button>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>
                            </div>
                        </div>
<%
        }else {
%>
                        <button class="following-button">팔로잉</button>
<%
        }
%>
                    </span>
                </div>
                <div class="profile-stat">
                    <span>게시물 2개</span>
                    <span>팔로워 2명</span>
                    <span>팔로잉 3명</span>
                </div>
                <div class="profile-comment">
                    <%= memDao.getProfileComment(requestedUserId) %>
                </div>
            </div>
        </div>

<%
        List<PostDTO> postList = null;
        PostDAO postDao = new PostDAO();
        postList = postDao.getList(requestedUserId);

%>

        <div class="profile-posts">
            <div class="profile-posts-row">
<%
        for(int i=0; i<postList.size(); i++){

            PostDTO post = postList.get(i);
            String postImg = post.getImage();
            int postId = post.getId();
%>
                <div class="profile-post">
                    <a href="${pageContext.request.contextPath}/singlePostView.jsp?post_id=<%=postId %>">
                        <img src="${pageContext.request.contextPath}<%=postImg%>">
                    </a>
                </div>
<%
        }
%>
            </div>
        </div>
    </div>


</div>
</body>
</html>
<%
    }
%>
