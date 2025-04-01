<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>Register</h1>
<form action="Register" method="POST">
    Username: <input type="text" name="username"><br />
    Password: <input type="password" name="password" /><br />
    Full Name: <input type="text" name="fullname"><br />

    Email: <input type="text" name="email"><br />
    Phone: <input type="text" name="phone"><br />
    User Type: <input type="text" name="role"><br />

    <input name="Register" type="submit" value="register" /><br />
</form>


<p><a href="<c:url value="/Register/add" />">Add Register</a></p>


</body>
</html>


</body>
</html>