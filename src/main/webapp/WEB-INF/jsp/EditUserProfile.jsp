<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 120px; }
        .readonly { background-color: #f0f0f0; }
    </style>
</head>
<body>
<h2>Edit My Profile</h2>

<c:if test="${param.success != null}">
    <p style="color:green;">Profile updated successfully!</p>
</c:if>

<form action="${pageContext.request.contextPath}/User/profile/update" method="post">
    <div class="form-group">
        <label>Username:</label>
        <input type="text" value="${username}" readonly class="readonly">
    </div>

    <div class="form-group">
        <label>Password:</label>
        <input type="password" name="password" value="${password}" required>
    </div>

    <div class="form-group">
        <label>Full Name:</label>
        <input type="text" name="fullname" value="${fullname}" required>
    </div>

    <div class="form-group">
        <label>Email:</label>
        <input type="email" name="email" value="${email}" required>
    </div>

    <div class="form-group">
        <label>Phone:</label>
        <input type="text" name="phone" value="${phone}" required>
    </div>

    <input type="submit" value="Save Changes">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<br/><br/>
<p><a href="${pageContext.request.contextPath}/index">Back</a></p>

</body>
</html>