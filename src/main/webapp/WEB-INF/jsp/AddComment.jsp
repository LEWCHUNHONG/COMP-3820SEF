<!DOCTYPE html>
<html>
<head>
  <title>Add Comment</title>
</head>
<body>
<h1>Add Comment</h1>
<form:form method="POST" modelAttribute="comment">
  <form:label path="name">Name:</form:label>
  <form:input path="name"/><br/>
  <form:label path="message">Comment:</form:label>
  <form:textarea path="message" rows="5" cols="30"/><br/><br/>
  <input type="submit" name="add" value="Add"/>
</form:form>
</body>
</html>