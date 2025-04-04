<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deleted Polls</title>
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
    <h1>Deleted Polls History</h1>
    <c:choose>
        <c:when test="${empty deletedPolls}">
            <p>No deleted polls found</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Deleted At</th>
                    <security:authorize access="hasRole('ADMIN')"><th>Actions</th></security:authorize>
                </tr>
                <c:forEach items="${deletedPolls}" var="poll">
                    <tr>
                        <td>${poll.id}</td>
                        <td>${poll.question}</td>
                        <td>${poll.deletedAt}</td>
                        <td><security:authorize access="hasRole('ADMIN')">
                            <a href="${pageContext.request.contextPath}/PollHistory/restore/${poll.id}">Restore</a> |
                            <a href="${pageContext.request.contextPath}/PollHistory/permanent-delete/${poll.id}"
                               onclick="return confirm('Permanently delete this poll?')">
                                Delete Permanently
                            </a>
                            </security:authorize>
                        </td>

                    </tr>
                    <br/>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <div class="Back-active-poll">
        <a href="${pageContext.request.contextPath}/Poll">Back to Active Polls</a>
    </div>
</div>
</body>
</html>