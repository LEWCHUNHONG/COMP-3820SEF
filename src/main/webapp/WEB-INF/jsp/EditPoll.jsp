<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Poll</title>
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Edit Poll</h1>

    <form:form modelAttribute="pollForm" action="${pageContext.request.contextPath}/Poll/edit/${pollId}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="form-group">
            <label>Question:</label>
            <form:input path="question" required="true"/>
        </div>

        <div class="form-group">
            <h3>Options:</h3>
            <c:forEach items="${pollForm.options}" var="option" varStatus="status">
                <input type="text" name="options" value="${option}" required>
            </c:forEach>
        </div>

        <button type="submit">Save Changes</button>
    </form:form>

    <a href="${pageContext.request.contextPath}/Poll">Cancel</a>
</div>
</body>
</html>