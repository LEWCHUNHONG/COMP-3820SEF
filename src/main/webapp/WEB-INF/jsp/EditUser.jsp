<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Edit User</title>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 120px; }
        .error { color: red; }
        .role-option { margin-right: 10px; }
    </style>
</head>
<body>
<h1>Edit User</h1>

<form:form modelAttribute="userForm" method="post" action="${pageContext.request.contextPath}/User/update">
    <input type="hidden" name="originalUsername" value="${originalUsername}">

    <div class="form-group">
        <label>Username:</label>
        <form:input path="username" required="true"/>
        <form:errors path="username" cssClass="error"/>
    </div>

    <div class="form-group">
        <label>Password:</label>
        <form:password path="password" required="true"/>
        <form:errors path="password" cssClass="error"/>
    </div>

    <div class="form-group">
        <label>Full Name:</label>
        <form:input path="fullname" required="true"/>
        <form:errors path="fullname" cssClass="error"/>
    </div>

    <div class="form-group">
        <label>Email:</label>
        <form:input path="email" type="email" required="true"/>
        <form:errors path="email" cssClass="error"/>
    </div>

    <div class="form-group">
        <label>Phone:</label>
        <form:input path="phone" required="true"/>
        <form:errors path="phone" cssClass="error"/>
    </div>

    <div class="form-group">
        <label>Roles:</label>
        <c:forEach items="${userForm.userRoles}" var="role">
            <span class="role-option">
                <input type="checkbox" name="roles" value="${role.role}" checked>
                ${role.role}
            </span>
        </c:forEach>
    </div>

    <div class="form-group">
        <button type="submit">Update User</button>
        <a href="${pageContext.request.contextPath}/User/list">Cancel</a>
    </div>
</form:form>
</body>
</html>