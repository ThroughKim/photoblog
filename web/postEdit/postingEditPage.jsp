<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 28.
  Time: 오후 1:52
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
<%
    request.setCharacterEncoding("UTF-8");

    String filepath = request.getParameter("filepath");
%>
<html>
<head>
    <title>이미지 선택</title>
    <link href="../assets/css/css_main.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/mainMenu.jsp" flush="false"></jsp:include>
<div class="content-area">
    <div class="upload-box">
        <p>
            포스팅 편집 <%= filepath%>
        </p>
        <hr>
        <p>
            <img src="${pageContext.request.contextPath}<%=filepath %>" class="uploading-image">
        </p>
        <form>
            <p>
                <textarea placeholder="하고싶은 말을 입력해주세요" class="uploading-story"></textarea>
            </p>
            <p>
                <input type="submit" value="작성" class="upload-button">
                <input type="button" value="취소" class="upload-button">
            </p>
        </form>
    </div>
</div>
</body>
</html>