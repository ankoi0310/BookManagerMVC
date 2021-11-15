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
    <title>Category - Add or Update</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
    <style>
        .container {
            width: 20%;
        }
    </style>
</head>
<body>
    <c:import url="../block/navbar.jsp"/>
    <div class="d-flex justify-content-center py-5">
        <h2 class="font-weight-bolder" style="font-family: 'Be Vietnam Pro ExtraBold', serif">Category Form</h2>
    </div>
    <div class="container justify-align-center">
        <form:form action="save" modelAttribute="category" method="post">
            <form:hidden path="id" />
            <div class="form-group row">
                <div class="col">
                    <spring:bind path="name">
                        <label for="name">Name</label>
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="name" id="name"
                                    placeholder="Name" aria-describedby="validationName"/>
                        <div id="validationName" class="invalid-feedback">
                            <form:errors path="name"/>
                        </div>
                    </spring:bind>
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <input type="submit" class="btn btn-primary btn-block font-weight-bolder" value="Submit"/>
                </div>
                <div class="col">
                    <a href="${pageContext.request.contextPath}/category/list" class="btn btn-danger btn-block font-weight-bolder">Cancel</a>
                </div>
            </div>
        </form:form>
    </div>
</body>
</html>
