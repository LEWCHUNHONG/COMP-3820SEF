


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poll</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .poll-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .poll-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .poll-item:last-child {
            border-bottom: none;
        }
        .poll-item a {
            text-decoration: none;
            color: #007bff;
        }
        .poll-item a:hover {
            text-decoration: underline;
        }
        .add-poll {
            text-align: center;
            margin-top: 20px;
        }
        .add-poll a {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
        }
        .add-poll a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="poll-container">
    <h1>Poll Information</h1>


    <ul>
        <strong>Question: ${pollinfo.question}</strong> <br />
        <strong>Choices: ${pollinfo.choices}</strong> <br />

    </ul>


    <div class="back-index">
        <p><a href="<c:url value='/Poll' />">Back</a></p>
    </div>
</div>
</body>
</html>