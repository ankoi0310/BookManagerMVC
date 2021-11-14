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
    <title>Save Book</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
    <c:import url="../block/navbar.jsp"/>
    <div class="d-flex justify-content-center py-5">
        <h2>Book Form</h2>
    </div>
    <div class="container">
        <form:form action="${pageContext.request.contextPath}/book/save?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" modelAttribute="book" method="post">
            <form:hidden path="id" />
            <div class="form-group row">
                <label for="title" class="col-2 col-form-label">Title</label>
                <div class="col-4">
                    <spring:bind path="title">
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="title" id="title" placeholder="Title" aria-describedby="validationTitle"/>
                        <div id="validationTitle" class="invalid-feedback">
                            <form:errors path="title"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <label for="summary-content" class="col-2 col-form-label">Summary Content</label>
                <div class="col-4">
                    <spring:bind path="summaryContent">
                        <form:textarea cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="summaryContent" id="summary-content" placeholder="Summary Content" aria-describedby="validationSummaryContent"/>
                        <div id="validationSummaryContent" class="invalid-feedback">
                            <form:errors path="summaryContent"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <label for="price" class="col-2 col-form-label">Price</label>
                <div class="col-4">
                    <spring:bind path="price">
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="price" id="price" placeholder="Price" aria-describedby="validationPrice"/>
                        <div id="validationPrice" class="invalid-feedback">
                            <form:errors path="price"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <label for="author" class="col-2 col-form-label">Author</label>
                <div class="col-4">
                    <spring:bind path="author">
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="author" id="author" placeholder="Author" aria-describedby="validationAuthor"/>
                        <div id="validationAuthor" class="invalid-feedback">
                            <form:errors path="author"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <label for="publication-date" class="col-2 col-form-label">Publication Date</label>
                <div class="col-4">
                    <spring:bind path="publicationDate">
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="publicationDate" id="publication-date" type="date" aria-describedby="validationPublicationDate"/>
                        <div id="validationPublicationDate" class="invalid-feedback">
                            <form:errors path="publicationDate"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <c:choose >
                <c:when test="${oldImage != null }">
                    <div class="form-group row">
                        <label for="title" class="col-2 col-form-label">Image (current)</label>
                        <div class="col-4">
                            <img src="<c:url value="/FileDisplayServlet/${oldImage}" />" width="100px" height="100px"  alt=""/>
                        </div>
                    </div>
                </c:when>
            </c:choose>
            <div class="form-group row">
                <label for="image" class="col-2 col-form-label">Image</label>
                <div class="col-4">
                    <spring:bind path="fileData">
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="fileData" id="image" type="file"
                                    aria-describedby="validationImage"/>
                        <div id="validationImage" class="invalid-feedback">
                            <form:errors path="fileData"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <label for="category" class="col-2 col-form-label">Category</label>
                <div class="col-4">
                    <form:select id="category" path="category.id" class="form-control" placeholder="Category">
                        <form:options items="${categories}" itemValue="id" itemLabel="name" />
                    </form:select>
                </div>
            </div>
            <div class="form-group row">
                <div class="offset-2 col-4">
                    <input type="submit" class="btn btn-primary" value="Submit"/>
                </div>
            </div>
        </form:form>
    </div>
</body>
</html>
