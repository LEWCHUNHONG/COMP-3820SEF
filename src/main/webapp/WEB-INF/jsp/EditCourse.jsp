<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
</head>
<body>
<h1>Edit Course</h1>
<form:form method="POST" modelAttribute="course">
    <form:label path="name">Name:</form:label>
    <form:input path="name"/><br/>
    <input type="submit" name="edit" value="Save"/>
</form:form>
</body>
</html>