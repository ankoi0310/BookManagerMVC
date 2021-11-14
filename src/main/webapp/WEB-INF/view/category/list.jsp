<%@ page import="com.koi.bookmanager.constant.Sort" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>List Category</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
    <c:import url="../block/navbar.jsp"/>
    <security:authorize access="hasRole('EMPLOYEE')">
        <div class="d-flex justify-content-center pb-2">
            <h2>Welcome to CRM System - <security:authentication property="principal.username"/></h2>
        </div>
        <div class="d-flex justify-content-center pb-3">
            <h5>You have roles: <security:authentication property="principal.authorities"/></h5>
        </div>
    </security:authorize>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <input type="button" class="btn btn-primary form-group row" value="Add category"
               onclick="window.location.href='showFormForAdd'; return false;">
            <form:form action="search" method="get">
                <div class="form-group row">
                    <div class="col-6">
                        <input name="keyword" class="form-control mr-2" id="keyword" type="search" placeholder="Search" aria-label="Search">
                    </div>
                    <div class="col-6">
                        <input type="submit" class="btn btn-success" value="Search">
                    </div>
                </div>
            </form:form>
        </div>
        <div class="row">
            <table class="table table-bordered">
                <thead class="thead-dark text-center">
                    <%-- Links for sorting --%>
                    <c:url value="/category/list" var="idSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Category.ID)%>"/>
                    </c:url>
                    <c:url value="/category/list" var="nameSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Category.NAME)%>"/>
                    </c:url>
                    <th scope="col"><a href="${idSort}">ID</a></th>
                    <th scope="col"><a href="${nameSort}">Name</a></th>
                    <th scope="col">Action</th>
                </thead>
                <tbody>
                <c:forEach items="${categories}" var="category">
                    <%--  Example link: https://.../customer/showFormForUpdate?customerId=1 --%>
                    <c:url var="updateLink" value="/category/showFormForUpdate">
                        <c:param name="id" value="${category.id}" />
                    </c:url>

                    <c:url var="deleteLink" value="/category/delete">
                        <c:param name="id" value="${category.id}" />
                    </c:url>
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>
                            <a href="${updateLink}">Update</a> |
                            <a href="${deleteLink}" onclick="if (!confirm('Are you sure you want to delete this?')) return false;">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
