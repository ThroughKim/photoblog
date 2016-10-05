<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 9. 28.
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-menu-bar">
          <span>
              <a href="${pageContext.request.contextPath}/index.jsp">
                  <img src="${pageContext.request.contextPath}/assets/icons/logo.png" class="logo-image">
              </a>
          </span>
    <span>
              <form>
                  <input type="text" placeholder="검색" class="main-menu-search-box search-placeholder">
              </form>
          </span>
    <span>
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/assets/icons/explore.png">
        </a>
        <a href="${pageContext.request.contextPath}/profile/profilePage.jsp?user_id=<%=session.getAttribute("memId")%>">
            <img src="${pageContext.request.contextPath}/assets/icons/profile.png">
        </a>
        <a href="${pageContext.request.contextPath}/postEdit/imageSelectPage.jsp">
            <img src="${pageContext.request.contextPath}/assets/icons/upload.png">
        </a>
    </span>
</div>
