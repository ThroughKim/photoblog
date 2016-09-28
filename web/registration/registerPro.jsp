<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 28.
  Time: 오후 6:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dbControl.*" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="dbControl.memberDTO" />
    <jsp:setProperty name="dto" property="*" />     <%--모든 값을 DTO에 집어넣음, 후에 Getter메소드로 호출가능--%>

<%
    memberDAO memberDao = new memberDAO();
    memberDao.insertMember(dto);
%>

<script>
    alert("가입이 완료되었습니다.");
    location.href="${pageContext.request.contextPath}/index.jsp"
</script>