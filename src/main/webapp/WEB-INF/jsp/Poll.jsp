<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poll List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .poll-item {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .poll-actions a {
            margin-left: 10px;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
        }
        .edit-btn {
            background-color: #4CAF50;
            color: white;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        .add-poll {
            text-align: center;
            margin-top: 20px;
        }
        .add-poll a {
            background-color: #2196F3;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Poll List</h1>
    <c:choose>
        <c:when test="${empty polles || fn:length(polles) == 0}">
            <p>There is no Poll yet.</p>
        </c:when>
        <c:otherwise>
            <c:forEach var="poll" items="${polles}">
                <div class="poll-item">
                    Question: <c:url value="/Poll/${poll.id}" var="myURL"/>
                    <a href="${myURL}">${poll.question}</a>
                    <security:authorize access="hasRole('ADMIN')">
                        <div class="poll-actions">
                            <a href="${pageContext.request.contextPath}/Poll/edit/${poll.id}" class="edit-btn">Edit</a>
                            <a href="${pageContext.request.contextPath}/Poll/delete/${poll.id}"
                               class="delete-btn"
                               onclick="return confirm('Are you sure you want to delete this poll?')">Delete</a>
                        </div>
                    </security:authorize>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <security:authorize access="hasRole('ADMIN')">
        <div class="add-poll">
            <a href="${pageContext.request.contextPath}/Poll/add">Add New Poll</a>
        </div>
    </security:authorize>
        <div class="History-poll">
            <p><a href="<c:url value="/PollHistory" />">History Polls</a></p>
        </div>
    <div class="back-index">
        <p><a href="<c:url value='/index' />">Back</a></p>
    </div>
</div>
</body>
</html>