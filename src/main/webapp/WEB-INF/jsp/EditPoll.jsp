<!DOCTYPE html>
<html>
<head>
    <title>Edit pollinfo</title>
</head>
<body>
<h1>Edit pollinfo</h1>
<form:form method="POST" modelAttribute="poll">
    <form:label path="question">Question:</form:label>
    <form:input path="question"/><br/>
    <form:label path="choices">Choices:</form:label>
    <form:input path="choices"/><br/>
    <input type="submit" name="edit" value="Save"/>
</form:form>

</body>
</html>