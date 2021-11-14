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
    <title>Save Category</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
    <c:import url="../block/navbar.jsp"/>
    <div class="d-flex justify-content-center py-5">
        <h2>Category Form</h2>
    </div>
    <div class="container">
        <form:form action="save" modelAttribute="category" method="post">
            <form:hidden path="id" />
            <div class="form-group row">
                <label for="name" class="col-2 col-form-label">Name</label>
                <div class="col-4">
                    <spring:bind path="name">
                        <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="name" id="name"
                                    placeholder="Name" aria-describedby="validationName"/>
                        <div id="validationName" class="invalid-feedback">
                            <form:errors path="name"/>
                        </div>
                    </spring:bind>
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
