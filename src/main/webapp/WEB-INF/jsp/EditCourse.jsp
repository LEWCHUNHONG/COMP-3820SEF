<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <style>
        .attachment-item {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }
        .delete-btn {
            margin-left: 10px;
            color: red;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Edit Course</h1>
<form action="${pageContext.request.contextPath}/Course/view/edit/${courseId}"
      method="post" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <div>
        <label for="name">Course Name:</label>
        <input type="text" id="name" name="name" value="${courseForm.name}" required>
    </div>
    <div>
        <label for="comment">Comment:</label>
        <textarea id="comment" name="comment" required>${courseForm.comment}</textarea>
    </div>

    <h3>Existing Attachments</h3>
    <ul>
        <c:forEach items="${course.attachments}" var="attachment">
            <li class="attachment-item">
                <span>${attachment.name}</span>
                <span class="delete-btn"
                      onclick="deleteAttachment('${courseId}', '${attachment.id}')">
                        [Delete]
                    </span>
            </li>
        </c:forEach>
    </ul>

    <h3>Add New Attachments</h3>
    <div>
        <label for="attachments">Attachments:</label>
        <input type="file" id="attachments" name="attachments" multiple>
    </div>

    <button type="submit">Save Changes</button>
</form>
<a href="${pageContext.request.contextPath}/Course/view/${courseId}">Cancel</a>

<script>
    function deleteAttachment(courseId, attachmentId) {
        if (confirm('Are you sure you want to delete this attachment?')) {
            fetch('${pageContext.request.contextPath}/Course/${courseId}/deleteAttachment/' + attachmentId, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: '_csrf=${_csrf.token}'
            })
                .then(response => {
                    if (response.ok) {
                        location.reload();
                    } else {
                        alert('Failed to delete attachment');
                    }
            });
        }
    }
</script>
</body>
</html>