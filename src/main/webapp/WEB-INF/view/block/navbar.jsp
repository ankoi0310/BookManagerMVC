<%--
  Created by IntelliJ IDEA.
  User: Huỳnh Văn Hữu Ân
  Date: 11/12/2021
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">CRM</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto font-weight-bolder">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/book/list">BOOK</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/category/list">CATEGORY</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/list">USER</a>
            </li>
            <security:authorize access="hasRole('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin">ADMIN</a>
                </li>
            </security:authorize>
        </ul>
        <form:form method="post" action="${pageContext.request.contextPath}/logout" class="form-inline my-2 my-lg-0">
            <input class="btn btn-outline-danger font-weight-bolder" type="submit" value="Logout">
        </form:form>
    </div>
</nav>
