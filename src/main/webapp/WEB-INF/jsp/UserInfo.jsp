<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            line-height: 1.6;
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9e9e9;
        }
        .action-btn {
            padding: 6px 12px;
            margin-right: 5px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.3s;
        }
        .edit-btn {
            background-color: #2196F3;
            color: white;
            border: 1px solid #2196F3;
        }
        .edit-btn:hover {
            background-color: #0b7dda;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
            border: 1px solid #f44336;
        }
        .delete-btn:hover {
            background-color: #da190b;
        }
        .add-btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .add-btn:hover {
            background-color: #45a049;
        }
        .back-btn {
            display: inline-block;
            background-color: #555;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
        }
        .back-btn:hover {
            background-color: #333;
        }
        .password-mask {
            font-family: monospace;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>
<h1>User Management</h1>

<a href="${pageContext.request.contextPath}/Register" class="add-btn">Add New User</a>

<table>
    <thead>
    <tr>
        <th>Username</th>
        <th>Password</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Roles</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td class="password-mask">••••••••</td>
            <td>${user.fullname}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>
            <td>
                <c:forEach items="${user.roles}" var="role" varStatus="loop">
                    ${role.role}<c:if test="${!loop.last}">, </c:if>
                </c:forEach>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/User/edit/${user.username}"
                   class="action-btn edit-btn">Edit</a>
                <a href="${pageContext.request.contextPath}/User/delete/${user.username}"
                   class="action-btn delete-btn"
                   onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="${pageContext.request.contextPath}/index" class="back-btn">Back to Home</a>
<script>
    document.querySelectorAll('.delete-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to delete this user?')) {
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>