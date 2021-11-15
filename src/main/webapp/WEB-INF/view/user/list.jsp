<%@ page import="com.koi.bookmanager.constant.Sort" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
</head>
<body>
<c:import url="../block/navbar.jsp"/>
<security:authorize access="hasRole('EMPLOYEE')">
    <div class="d-flex justify-content-center pb-2">
        <h2 class="font-weight-bolder" style="font-family: 'Be Vietnam Pro ExtraBold', serif">Welcome to CRM System - <security:authentication property="principal.username"/></h2>
    </div>
    <div class="d-flex justify-content-center pb-3">
        <h5>You have roles: <security:authentication property="principal.authorities"/></h5>
    </div>
</security:authorize>
<div class="container">
    <div class="d-flex justify-content-end">
        <form:form action="search" method="get">
            <div class="form-group row">
                <div class="col-9">
                    <input name="keyword" class="form-control mr-2" id="keyword" type="search" placeholder="Search" aria-label="Search">
                </div>
                <div class="col-3">
                    <input type="submit" class="btn btn-success" value="Search">
                </div>
            </div>
        </form:form>
    </div>
    <div class="row">
        <table class="table table-bordered">
            <thead class="thead-dark text-center">
            <%-- Links for sorting --%>
            <c:url value="/user/list" var="idSort">
                <c:param name="sort" value="<%=String.valueOf(Sort.User.ID)%>"/>
            </c:url>
            <c:url value="/user/list" var="usernameSort">
                <c:param name="sort" value="<%=String.valueOf(Sort.User.USERNAME)%>"/>
            </c:url>
            <c:url value="/user/list" var="emailSort">
                <c:param name="sort" value="<%=String.valueOf(Sort.User.EMAIL)%>"/>
            </c:url>
            <c:url value="/user/list" var="enabledSort">
                <c:param name="sort" value="<%=String.valueOf(Sort.User.ENABLED)%>"/>
            </c:url>
            <th scope="col"><a href="${idSort}">ID</a></th>
            <th scope="col"><a href="${usernameSort}">Username</a></th>
            <th scope="col"><a href="${emailSort}">Email</a></th>
            <th scope="col"><a href="${enabledSort}">Enabled</a></th>
            <th scope="col" style="width: 15%;">Action</th>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <%--  Example link: https://.../customer/showFormForUpdate?customerId=1 --%>
<%--                <c:url var="changeStatus" value="/user/changeStatus">--%>
<%--                    <c:param name="id" value="${user.id}" />--%>
<%--                </c:url>--%>
                <tr>
                    <td class="text-center">${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td class="text-center font-weight-bolder ${user.enabled ? "text-success" : "text-danger"}">${user.enabled ? "Activing" : "Denied"}</td>
                    <td class="text-center">
                        <a href="${changeStatus}">Change status</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>