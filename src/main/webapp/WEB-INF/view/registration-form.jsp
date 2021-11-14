<%--
  Created by IntelliJ IDEA.
  User: Huỳnh Văn Hữu Ân
  Date: 11/12/2021
  Time: 11:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Registration form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <style>
        .error {color: red}
    </style>
</head>
<body>

<div class="d-flex justify-content-center py-5">
    <h2>Registration form</h2>
</div>

<div class="container">
    <form:form modelAttribute="registeredUser" method="post"
               action="${pageContext.request.contextPath}/register/processRegistrationForm">
        <div class="form-group row">
            <label for="username" class="col-2 col-form-label">Username:</label>
            <div class="col-4">
                <spring:bind path="userName">
                    <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="userName" id="username" type="text"
                                aria-describedby="validationUserName"/>
                    <div id="validationUserName" class="invalid-feedback">
                        <form:errors path="userName"/>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="form-group row">
            <label for="password" class="col-2 col-form-label">Password:</label>
            <div class="col-4">
                <spring:bind path="password">
                    <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="password" id="password" type="text"
                                aria-describedby="validationPassword"/>
                    <div id="validationPassword" class="invalid-feedback">
                        <form:errors path="password"/>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="form-group row">
            <label for="matchingPassword" class="col-2 col-form-label">Repeat Password:</label>
            <div class="col-4">
                <spring:bind path="matchingPassword">
                    <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="matchingPassword" id="matchingPassword" type="text"
                                aria-describedby="validationMatchingPassword"/>
                    <div id="validationMatchingPassword" class="invalid-feedback">
                        <form:errors path="matchingPassword"/>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-2 col-form-label">Email:</label>
            <div class="col-4">
                <spring:bind path="email">
                    <form:input cssClass="form-control ${status.error ? 'is-invalid' : ''}" path="email" id="email" type="text"
                                aria-describedby="validationEmail"/>
                    <div id="validationEmail" class="invalid-feedback">
                        <form:errors path="email"/>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="form-group row">
            <div class="offset-sm-2 col-sm-4">
                <input class="btn btn-primary btn-sm" type="submit" value="Register">
            </div>
        </div>
    </form:form>
</div>
</body>
</html>
