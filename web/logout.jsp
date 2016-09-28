<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 28.
  Time: 오후 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
    <jsp:forward page="${pageContext.request.contextPath}/login/loginPage.jsp" />
