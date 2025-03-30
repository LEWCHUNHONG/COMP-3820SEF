<!DOCTYPE html>
<html>
<head>
    <title>Add Course Comment</title>
</head>
<body>
<h1>Add Course Comment</h1>
<form:form method="POST" modelAttribute="addcoursecomment">
    <form:label path="name">Name:</form:label>
    <form:input path="name"/><br/>
    <form:label path="message">Message:</form:label>
    <form:textarea path="message"/><br/>
    <input type="submit" name="add" value="Add"/>
</form:form>
</body>
</html>