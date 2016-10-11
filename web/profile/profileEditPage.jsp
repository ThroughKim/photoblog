<%@ page import="dbControl.MemberDAO" %>
<%@ page import="dbControl.MemberDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 10. 6.
  Time: 오후 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    //로그인 체크
    if(session.getAttribute("memId")==null){
%>
<jsp:forward page="${pageContext.request.contextPath}/login/loginPage.jsp" />
<%
    }else if(request.getParameter("user_id")==null || request.getParameter("user_id")=="" || Integer.parseInt(request.getParameter("user_id")) != (Integer)session.getAttribute("memId")){
%>
<script>
    alert("잘못된 방식의 접근입니다.");
    history.go(-1);
</script>
<%
    }else{
        int memId = (Integer)session.getAttribute("memId");
        MemberDAO memDao = new MemberDAO();
        MemberDTO profile = memDao.getProfile(memId);
%>
<html>
<head>
    <title>프로필 편집</title>
    <link href="${pageContext.request.contextPath}/assets/css/css_main.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/mainMenu.jsp"></jsp:include>
<div class="content-area">
    <div class="profile-edit-box">
        <div class="profile-edit-header">
            <h1>프로필 편집</h1>
            <p>프로필 사진을 클릭해서 사진을 변경할 수 있습니다.</p>
            <hr>
        </div>
        <div class="profile-edit-main">
            <div class="profile-edit-img-div">
                <img src="${pageContext.request.contextPath}<%=profile.getProfile_img()%>" class="profile-edit-img">
            </div>
            <div class="profile-edit-content">
                <form class="profile-edit-form" action=${pageContext.request.contextPath}/profile/profileEditPro.jsp method="post">
                    <input type="hidden" value="<%=profile.getId()%>" name="id">
                    <br>
                    <p>
                        <label>Nick Name</label><br>
                        <input type="text" name="nick" value="<%=profile.getNick()%>">
                    </p>
                    <p>
                        <label>Password</label><br>
                        <input type="password" name="password" value="<%=profile.getPassword()%>">
                    </p>
                    <p>
                        <label>소개</label><br>
                        <input type="text" name="profile_comment" value="<%=profile.getProfile_comment()%>">
                    </p>
                    <p>
                        <button type="submit" class="profile-img-change-button">제출</button>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%
    }
%>