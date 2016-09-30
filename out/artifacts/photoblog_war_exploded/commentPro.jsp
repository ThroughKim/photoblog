<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 30.
  Time: 오후 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbControl.CommentDAO" %>

<%
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    int post_id = Integer.parseInt(request.getParameter("post_id"));
    String content = request.getParameter("content");

    CommentDAO commentDAO = new CommentDAO();

    int check = commentDAO.insertComment(user_id, post_id, content);

    if(check==1){
%>

<script>
    alert("댓글이 정상적으로 등록되었습니다.")
    location.href="${pageContext.request.contextPath}/index.jsp";
</script>
<%
    }else if(check==0){
%>
</<script>
    alert("댓글이 등록과정에서 오류가 발생했습니다.")
    location.href="${pageContext.request.contextPath}/index.jsp";
</script>
<%
    }
%>