<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
<div class="container">
    <h2>Register</h2>
    <form:form method="POST" action="/CSApp/Register" modelAttribute="register">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
            <label for="username">Username:</label>
            <form:input path="username" id="username" required="true"/>
            <form:errors path="username" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <form:password path="password" id="password" required="true"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="fullname">Full Name:</label>
            <form:input path="fullname" id="fullname" required="true"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" type="email" id="email" required="true"/>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <form:input path="phone" id="phone" required="true"/>
        </div>
        <form:hidden path="roles" value="ROLE_USER"/>
        <button type="submit">Register</button>
    </form:form>
</div>
</body>
</html>