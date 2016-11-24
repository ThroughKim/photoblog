<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
    <jsp:forward page="${pageContext.request.contextPath}/login/loginPage.jsp" />
