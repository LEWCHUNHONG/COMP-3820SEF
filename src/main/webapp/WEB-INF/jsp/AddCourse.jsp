<!DOCTYPE html>
<html>
<head>
    <title>Course Material</title>
</head>
<body>
<h2>Create a Course Material</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="courseForm">
    <form:label path="name">Lecture Title</form:label><br/>
    <form:input type="text" path="name"/><br/><br/>
    <form:label path="comment">Message</form:label><br/>
    <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
    <b>Lecture Notes</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>