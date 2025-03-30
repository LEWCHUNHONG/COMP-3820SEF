<!DOCTYPE html>
<html>
<head>
    <title>Add Course</title>
</head>
<body>
<h1>Add Course</h1>
<form:form method="POST" modelAttribute="course">
    <form:label path="name">Name:</form:label>
    <form:input path="name"/><br/>
    <input type="submit" name="add" value="Add"/>
</form:form>
</body>
</html>