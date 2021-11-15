<%@ page import="com.koi.bookmanager.constant.Sort" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Book - List</title>
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
    <div class="container" style="max-width: 90%;">
        <div class="d-flex justify-content-between align-items-center">
            <input type="button" class="btn btn-success form-group row font-weight-bolder" value="New item"
               onclick="window.location.href='showFormForAdd'; return false;">
            <form:form action="search" method="get">
                <div class="form-group row">
                    <div class="col-9">
                        <input name="keyword" class="form-control mr-2" id="keyword" type="search" placeholder="Search" aria-label="Search">
                    </div>
                    <div class="col-3">
                        <input type="submit" class="btn btn-primary font-weight-bolder" value="Search">
                    </div>
                </div>
            </form:form>
        </div>
        <div class="row">
            <table class="table table-bordered">
                <thead class="thead-dark text-center">
                    <%-- Links for sorting --%>
                    <c:url value="/book/list" var="idSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.ID)%>"/>
                    </c:url>
                    <c:url value="/book/list" var="titleSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.TITLE)%>"/>
                    </c:url>
                    <c:url value="/book/list" var="summaryContentSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.SUMMARY_CONTENT)%>"/>
                    </c:url>
                    <c:url value="/book/list" var="priceSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.PRICE)%>"/>
                    </c:url>
                    <c:url value="/book/list" var="authorSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.AUTHOR)%>"/>
                    </c:url>
                    <c:url value="/book/list" var="publicationDateSort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.PUBLICATION_DATE)%>"/>
                    </c:url>
                    <c:url value="/book/list" var="categorySort">
                        <c:param name="sort" value="<%=String.valueOf(Sort.Book.CATEGORY_ID)%>"/>
                    </c:url>
                    <th scope="col" style="width:5%;"><a href="${idSort}">ID</a></th>
                    <th scope="col" style="width:10%;"><a href="${titleSort}">Title</a></th>
                    <th scope="col" style="width:30%;"><a href="${summaryContentSort}">Summary Content</a></th>
                    <th scope="col"><a href="${priceSort}">Price</a></th>
                    <th scope="col"><a href="${authorSort}">Author</a></th>
                    <th scope="col"><a href="${publicationDateSort}">Published</a></th>
                    <th scope="col"><a href="#">Image</a></th>
                    <th scope="col"><a href="${categorySort}">Category</a></th>
                    <th scope="col">Action</th>
                </thead>
                <tbody>
                <c:forEach items="${books}" var="book">
                    <c:url var="updateLink" value="/book/showFormForUpdate">
                        <c:param name="id" value="${book.id}" />
                    </c:url>

                    <c:url var="deleteLink" value="/book/delete">
                        <c:param name="id" value="${book.id}" />
                    </c:url>
                    <tr>
                        <td class="text-center align-middle">${book.id}</td>
                        <td>${book.title}</td>
                        <td>${book.summaryContent}</td>
                        <td class="text-center">${book.price}</td>
                        <td>${book.author}</td>
                        <td><fmt:formatDate value="${book.publicationDate}" pattern="dd-MM-yyyy" /></td>
                        <td><img src="/resources/images/books/${book.image}" alt="${book.image}" width="100px" height="100px"/></td>
                        <td>${book.category.name}</td>
                        <td class="text-center">
                            <a href="${updateLink}" class="btn btn-warning font-weight-bolder">Update</a>
                            <a href="${deleteLink}" class="btn btn-danger font-weight-bolder" onclick="if (!confirm('Are you sure you want to delete this?')) return false;">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
