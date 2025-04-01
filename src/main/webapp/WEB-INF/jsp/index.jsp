<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> <!-- Add your CSS file path here -->
</head>
<body>
<h1>Welcome to HKNU Dashboard</h1>

<div>
    <a href="<c:url value="/Course" />" style="text-decoration: none;">
        <button type="button">Course Info</button>
    </a>
</div>

<br />

<div>
    <a href="Poll" style="text-decoration: none;">
        <button type="button">Poll Info</button>
    </a>
</div>

<br />

[<a href="<c:url value="/Comment/history" />">History Comment]</a>
<br/>

<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

</body>
</html>
