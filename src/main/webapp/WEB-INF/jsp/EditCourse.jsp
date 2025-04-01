<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
</head>
<body>
<h1>Edit Course</h1>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="editcourse">
    <form:label path="name">Lecture Title</form:label><br/>
    <form:input type="text" path="name"/><br/><br/>
    <form:label path="comment">Comment</form:label><br/>
    <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
    <b>Lecture Notes</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>