<!DOCTYPE html>
<html>
<head>
    <title>Add Poll</title>
</head>
<body>
<h1>Add Poll</h1>
<form:form method="POST" modelAttribute="poll">
    <form:label path="question">Question:</form:label>
    <form:input path="question"/><br/>
    <form:label path="choices">Choices:</form:label>
    <form:input path="choices"/><br/>
    <input type="submit" name="add" value="Add"/>
</form:form>
</body>
</html>