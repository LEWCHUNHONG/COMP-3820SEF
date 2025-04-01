<!DOCTYPE html>
<html>
<head>
    <title>Course list</title>
</head>
<body>
<h2>Course list</h2>

<c:choose>
    <c:when test="${fn:length(CourseNotesDatabase) == 0}">
        <i>There are no Course in the system.</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${CourseNotesDatabase}" var="entry">
            Course ID : ${entry.key}: <br />
            <a href="<c:url value="/Course/view/${entry.key}" />">
                <c:out value="${entry.value.name}"/></a><br />
        </c:forEach>
    </c:otherwise>
</c:choose>

<p><a href="<c:url value="/Course/add" />">Create a Course</a></p><br/><br/>
<p><a href="<c:url value="/index" />">Back</a></p>

</body>
</html>
