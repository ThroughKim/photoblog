<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dbControl.MemberDAO" %>

<%
    request.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    MemberDAO memberDao = new MemberDAO();
    int check = memberDao.userCheck(email, password);

    if(check==1){
        //인증성공
        session.setAttribute("memId", memberDao.getUser_id(email));
%>
        <script>
            location.href="${pageContext.request.contextPath}/index.jsp";
        </script>
<%
    }else if(check==0){
        //비밀번호 불일치
%>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
<%
    }else {
%>
        <script>
            alert("존재하지 않는 계정입니다.");
            history.go(-1);
        </script>
<%
    }
%>