<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Poll Details</title>
    <style>
        .poll-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .poll-question {
            font-size: 1.5em;
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }
        .option-item {
            margin: 10px 0;
            padding: 10px;
            background: white;
            border-radius: 4px;
            display: flex;
            align-items: center;
        }
        .vote-count {
            margin-left: auto;
            color: #7f8c8d;
        }
        .vote-btn {
            background: #3498db;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        .success-message {
            color: #27ae60;
            margin: 15px 0;
        }
    </style>
</head>
<body>
<div class="poll-container">
    <!-- Display Poll Question -->
    <h1 class="poll-question">${poll.question}</h1>

    <!-- Success Message (if present) -->
    <c:if test="${not empty successMessage}">
        <div class="success-message">${successMessage}</div>
    </c:if>

    <!-- Voting Form -->
    <form action="${pageContext.request.contextPath}/Poll/${poll.id}/vote" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="options-list">
            <c:forEach items="${poll.optionsWithVotes}" var="option">
                <div class="option-item">
                    <input type="radio"
                           id="opt_${option.key}"
                           name="selectedOption"
                           value="${option.key}"
                           required>
                    <label for="opt_${option.key}">${option.key}</label>
                    <span class="vote-count">${option.value} votes</span>
                </div>
            </c:forEach>
        </div>

        <button type="submit" class="vote-btn">Submit Vote</button>
    </form>
    <br/>
    <br/>
    <a href="${pageContext.request.contextPath}/Poll">Back to Poll List</a>
</div>
</body>
</html>