<!DOCTYPE html>
<html>
<head>
    <title>Course Material</title>
</head>
<body>
<h2>Course ID #${courseId}: </h2>
<i>Lecture Title - <c:out value="${course.name}"/></i><br/><br/>
    Lecture Notes :
    <c:forEach items="${course.attachments}" var="attachment" varStatus="status">
        <a href="<c:url value="/Course/${courseId}/attachment/${attachment.id}" />">
            <c:out value="${attachment.name}"/></a>
    </c:forEach><br/><br/>
    Information :
    <c:out value="${course.comment}"/><br/><br/>

<br/>


<c:if test="${fn:length(coursecomments) == 0}">
    <p>There are no comments yet.</p>
</c:if>

<c:if test="${fn:length(coursecomments) > 0}">
    <ul>
        <c:forEach var="coursecomment" items="${coursecomments}">
            <li class="coursecomment-item">
                <strong>Comment: <c:out value="${coursecomment.message}"/></strong><br/>
                <strong>User Name: <c:out value="${coursecomment.name}"/></strong>
                <c:url value="/Comment/delete/${coursecomment.id}" var="myURL"/>
                [<a href="${myURL}">Delete</a>]
            </li>
        </c:forEach>
    </ul>
</c:if>

<br/>

<div class="add-comment">
    <p><a href="<c:url value='/Comment/add' />">Add Comment</a></p>
</div>

<br/>

<c:url value="/Course/view/delete/${courseId}" var="myURL"/>
[<a href="${myURL}">Delete</a>]<br/>


[<a href="<c:url value="/Course" />">Return to Course Material]</a>
</body>
</html>
