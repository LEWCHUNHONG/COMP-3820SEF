<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Poll</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            line-height: 1.6;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .question-input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        .options-container {
            margin: 20px 0;
        }
        .option-item {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .option-item input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.3);
        }
        .option-item label {
            font-weight: normal;
            margin-bottom: 0;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 15px;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Create New Poll</h1>
    <form:form modelAttribute="pollForm" action="${pageContext.request.contextPath}/Poll/add" method="post">

        <div class="form-group">
            <label for="question">Poll Question:</label>
            <form:textarea path="question" id="question" rows="5" cols="30" class="question-input" required="true"
                        placeholder="Enter your question here"/>
        </div>

        <div class="options-container">
            <h3>Select Multiple Choice Options:</h3>

            <div class="option-item">
                <input type="checkbox" id="option1" name="options" value="Option A" checked>
                <label for="option1">Option A</label>
            </div>

            <div class="option-item">
                <input type="checkbox" id="option2" name="options" value="Option B" checked>
                <label for="option2">Option B</label>
            </div>

            <div class="option-item">
                <input type="checkbox" id="option3" name="options" value="Option C" checked>
                <label for="option3">Option C</label>
            </div>

            <div class="option-item">
                <input type="checkbox" id="option4" name="options" value="Option D" checked>
                <label for="option4">Option D</label>
            </div>
        </div>

        <button type="submit" class="submit-btn">Create Poll</button>
    </form:form>

    <a href="${pageContext.request.contextPath}/Poll">Back to Poll List</a>
</div>
</body>
</html>