<%--
  Created by IntelliJ IDEA.
  User: Huỳnh Văn Hữu Ân
  Date: 11/3/2021
  Time: 8:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book - Add or Update</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
    <style>
        .container {
            width: 50%;
        }
    </style>
</head>
<body>
    <c:import url="../block/navbar.jsp"/>
    <div class="d-flex justify-content-center py-5">
        <h2 class="font-weight-bolder" style="font-family: 'Be Vietnam Pro ExtraBold', serif">Book Form</h2>
    </div>
    <div class="container justify-align-center">
        <form:form action="${pageContext.request.contextPath}/book/save?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" modelAttribute="book" method="post">
            <form:hidden path="id" />
            <form:hidden path="image" />
            <div class="form-group row">
                <div class="col-7">
                    <spring:bind path="title">
                        <label class="font-weight-bolder" for="title">Title</label>
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="title" id="title" placeholder="Title" aria-describedby="validationTitle"/>
                        <div id="validationTitle" class="invalid-feedback">
                            <form:errors path="title"/>
                        </div>
                    </spring:bind>
                </div>
                <div class="col-5">
                    <spring:bind path="author">
                        <label class="font-weight-bolder" for="author">Author</label>
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="author" id="author" placeholder="Author" aria-describedby="validationAuthor"/>
                        <div id="validationAuthor" class="invalid-feedback">
                            <form:errors path="author"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <label class="font-weight-bolder" for="category">Category</label>
                    <form:select id="category" path="category.id" class="form-control" placeholder="Category">
                        <form:options items="${categories}" itemValue="id" itemLabel="name" />
                    </form:select>
                </div>
                <div class="col">
                    <spring:bind path="price">
                        <label class="font-weight-bolder" for="price">Price</label>
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="price" id="price" placeholder="Price" aria-describedby="validationPrice"/>
                        <div id="validationPrice" class="invalid-feedback">
                            <form:errors path="price"/>
                        </div>
                    </spring:bind>
                </div>
                <div class="col">
                    <spring:bind path="publicationDate">
                        <label class="font-weight-bolder" for="publication-date">Published</label>
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="publicationDate" id="publication-date" type="date" aria-describedby="validationPublicationDate"/>
                        <div id="validationPublicationDate" class="invalid-feedback">
                            <form:errors path="publicationDate"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <c:choose >
                    <c:when test="${oldImage != null}">
                        <div class="col">
                            <label class="font-weight-bolder" for="title">Image (current)</label>
                            <img src="/resources/images/books/${book.image}" class="d-block" width="350px" height="350px"  alt="${oldImage}"/>
                        </div>
                    </c:when>
                </c:choose>
                <div class="col">
                    <spring:bind path="fileData">
                        <label class="font-weight-bolder" for="image">Image</label>
                        <form:input cssClass="form-control-file ${status.error ? 'is-invalid' : ''}" path="fileData" id="image" type="file"
                                    aria-describedby="validationImage"/>
                        <div id="validationImage" class="invalid-feedback">
                            <form:errors path="fileData"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <spring:bind path="summaryContent">
                        <label class="font-weight-bolder" for="summary-content">Summary Content</label>
                        <form:textarea cssClass="form-control ${status.error ? 'is-invalid' : ''}" rows="10" path="summaryContent" id="summary-content" placeholder="Summary Content" aria-describedby="validationSummaryContent"/>
                        <div id="validationSummaryContent" class="invalid-feedback">
                            <form:errors path="summaryContent"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <div class="offset-2 col-4">
                    <input type="submit" class="btn btn-primary btn-block font-weight-bolder" value="Submit"/>
                </div>
                <div class="col-4">
                    <a href="${pageContext.request.contextPath}/book/list" class="btn btn-danger btn-block font-weight-bolder">Cancel</a>
                </div>
            </div>
        </form:form>
    </div>
</body>
</html>
