<%--
  Created by IntelliJ IDEA.
  User: CYTech Student
  Date: 11/25/2024
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Create Course</title>
    </head>
    <body>
        <form method="get" action="CreateCourseServlet" >

            <br> Name course <input type='text' name='name' required="True"/> </br>
            <br> Teacher <input type='text' name='teacher' required="True"/></br>
            <br> Matière <input type='text' name='matiere' required="True"/></br>
            <br> Durée <input type='number' name='durée' required="True"/></br>
            <br>
            <input type='submit' value='Valider'/>
        </form>
    </body>
</html>
