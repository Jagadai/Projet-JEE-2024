<%--
  Created by IntelliJ IDEA.
  User: CYTech Student
  Date: 11/28/2024
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>
</head>
<body>
    <form method="get" action="CreateAccount">
    <label >Name : </label>
    <input type="text" name="name" id="name" />
    <br>
    <br>
    <label >Last Name : </label>
    <input type="text" name="lastname" id="lastname" />
    <br>
    <br>
    <label>Date of birth : </label>
    <input type="date" name="DateOfBirth" id="DateOfBirth" />
    <br>
    <br>
    <label >Mail : </label>
    <input type="text" name="mail" id="mail" />
    <br>
    <br>
    <label >Phone : </label>
    <input type="number" name="phone" id="phone" />
    <br>
    <br>
    <label >Address : </label>
    <input type="text" name="address" id="address" />
    <br>
    <br>
    <label >login : </label>
    <input type="text" name="login" id="login" />
    <br>
    <br>
    <label>Password : </label>
    <input type="password" name="password" id="password" />
        <br>
        <input type="radio" id="student" name="status" value="student">
        <label for="student">Student</label><br>
        <input type="radio" id="teacher" name="status" value="teacher">
        <label for="teacher">Teacher</label><br>
    <input type="submit" />
    </form>
</body>
</html>
