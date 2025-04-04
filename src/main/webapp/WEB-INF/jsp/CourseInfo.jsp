<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Information</title>
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
<h1>${course.name}</h1>
<p>${course.comment}</p>
<security:authorize access="hasRole('ADMIN')">
    <a href="${pageContext.request.contextPath}/Course/view/edit/${courseId}">Edit Course</a>
</security:authorize>


<h2>Course Materials </h2>
<ul>
    <c:forEach items="${course.attachments}" var="attachment">
        <li class="attachment-item">
            <a href="${pageContext.request.contextPath}/Course/${courseId}/attachment/${attachment.id}">
                    ${attachment.name}
            </a>
            <span class="delete-btn"
                  onclick="deleteAttachment('${courseId}', '${attachment.id}')">
                        [Delete]
                    </span>
        </li>
    </c:forEach>
</ul>
<h2>Comments</h2>
<div class="comments-section">
    <c:if test="${empty coursecomments}">
        <p>There are no comments yet.</p>
    </c:if>

    <c:if test="${not empty coursecomments}">
        <c:forEach var="comment" items="${coursecomments}">
            <div class="comment-box">
                <div class="comment-header">
                    <span class="user-badge ${comment.name eq currentUsername ? 'current-user' : ''}">
                        <c:choose>
                            <c:when test="${comment.name eq currentUsername}">
                                You
                            </c:when>
                            <c:otherwise>
                                <c:out value="${comment.name}"/>
                            </c:otherwise>
                        </c:choose>
                    </span>
                    <c:if test="${not empty currentUser and currentUser.username ne null}">
                        <small>(<c:out value="${currentUser.username}"/>)</small>
                    </c:if>
                </div>
                <p><c:out value="${comment.message}"/></p>

                <security:authorize access="hasRole('ADMIN')">
                     <c:url value="/Comment/delete/${comment.id}" var="deleteUrl"/>
                            [<a href="${deleteUrl}" onclick="return confirm('Are you sure?')">Delete</a>]
                </security:authorize>
            </div>
        </c:forEach>
    </c:if>
</div>

<br/>

<div class="add-comment">
    <p><a href="<c:url value='/Comment/add' />">Add Comment</a></p>
</div>
<br/>
<security:authorize access="hasRole('ADMIN')">
    <c:url value="/Course/view/delete/${courseId}" var="myURL"/>
    [<a href="${myURL}">Delete</a>]<br/>
</security:authorize>
<br/>

<a href="${pageContext.request.contextPath}/Course">Back to Courses</a>


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
                        location.reload(); // Refresh the page after deletion
                    } else {
                        alert('Failed to delete attachment');
                    }
                });
        }
    }
</script>
</body>
</html>