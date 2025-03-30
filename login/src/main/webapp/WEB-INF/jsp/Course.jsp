<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course</title>
</head>
<body>
<h1>Course</h1>


<c:if test="${fn:length(courses) == 0}">
    <p>There is no Courses yet.</p>
</c:if>
<c:if test="${fn:length(courses) > 0}">
    <ul>

    <c:forEach var="course" items="${courses}">
        <li>
            #${course.id} - ${course.name} :
            <c:url value="/Course/edit/${course.id}" var="myURL"/>
            [<a href="${myURL}">Edit</a>]
            <c:url value="/Course/delete/${course.id}" var="myURL"/>
            [<a href="${myURL}">Delete</a>]<br/>
        </li>
    </c:forEach>
    </ul>
</c:if>



<c:forEach var="addcoursecomment" items="${AddCourseComments}">
    <li>
        #${addcoursecomment.id} - ${addcoursecomment.name} - ${addcoursecomment.message}:
    </li>
</c:forEach>




<p><a href="<c:url value="/Course/add" />">Add Course</a></p>

<p><a href="<c:url value="/Course/addCourseComment" />">Add Course Comment</a></p>

<p><a href="<c:url value="/index" />">Back</a></p>


</body>
</html>