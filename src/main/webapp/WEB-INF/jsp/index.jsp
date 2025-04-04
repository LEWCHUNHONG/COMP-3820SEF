<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Welcome to COMP 3820SEF	Web Application Development Dashboard</h1>
<security:authorize access="!hasAnyRole('USER', 'ADMIN')">
    <h3>Please Log In to join course!</h3>
</security:authorize>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
        <div>
                <a href="<c:url value="/Course" />" style="text-decoration: none;">
                    <button type="button">Course Info</button>
                </a>
        </div>
        <br />
        <div>
            <a href="<c:url value="/Poll" />" style="text-decoration: none;">
                <button type="button">Poll Info</button>
            </a>
        </div>
</security:authorize>
<br/>
<br/>
<security:authorize access="hasRole('ADMIN')">
    <div>
        <a href="<c:url value="/User/list" />" style="text-decoration: none;">
            <button type="button">User Info</button>
        </a>
    </div>
</security:authorize>
<br/>
<br/>
<security:authorize access="hasRole('USER')">
    <div>
        <a href="<c:url value="/User/profile/edit" />" style="text-decoration: none;">
            <button type="button">Edit Profile</button>
        </a>
    </div>
</security:authorize>
<br/>
<br/>
<security:authorize access="!hasAnyRole('USER', 'ADMIN')">
    <div>
        <a href="<c:url value="/login" />" style="text-decoration: none;">
            <button type="button">LogIn</button>
        </a>
    </div>
</security:authorize>
<br/>
<br/>
<div>
    <a href="<c:url value="/Register" />" style="text-decoration: none;">
        <button type="button">Register</button>
    </a>
</div>
<br/>
<br/>
<security:authorize access="hasAnyRole('USER', 'ADMIN')">
    <c:url var="logoutUrl" value="/logout"/>
    <form action="${logoutUrl}" method="post">
        <input type="submit" value="Log out" />
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</security:authorize>
</body>
</html>