<%--
  Created by IntelliJ IDEA.
  User: CYTech Student
  Date: 11/28/2024
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    body {
        height: 90%;
        margin: 0;
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    .header {
        background-color: #2c3e50;
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .header-title {
        font-size: 1.5em;
        font-weight: bold;
    }
    .header-buttons {
        display: flex;
        gap: 15px;
    }
    .body {
        height: 90%;
        flex-grow: 1;
        background-color: #ecf0f1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 50px;
    }
    .footer {
        position: absolute;
        background-color: #34495e;
        color: white;
        padding: 20px;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        bottom: 0; left: 0; right: 0;
    }
    .footer a {
        color: #3498db;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
        bottom: 0; left: 0; right: 0;
    }
    .footer a:hover {
        color: #2ecc71;
        bottom: 0; left: 0; right: 0;
    }
    .btn {
        padding: 12px 25px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
    }
    .btn-primary {
        background-color: #3498db;
        color: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .btn-primary:hover {
        background-color: #2980b9;
        transform: translateY(-3px);
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
    }
    .btn-success {
        background-color: #2ecc71;
        color: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .btn-success:hover {
        background-color: #27ae60;
        transform: translateY(-3px);
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
    }
    .btn-danger {
        background-color: #e74c3c;
        color: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-danger:hover {
        background-color: #c0392b;
        transform: translateY(-3px);
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
    }

    .btn-outline {
        background-color: transparent;
        border: 2px solid #3498db;
        color: #3498db;
    }

    .btn-outline:hover {
        background-color: #3498db;
        color: white;
    }
</style>
<head>
    <title>Create Account</title>
    <button class="btn btn-primary" onclick="window.location.href = 'RedirectionServlet?url=Login.jsp';">Login</button>
</head>
<body>
    <br>
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
    <div class="footer">
        <span>© 2024 Mon Projet JEE</span>
        <span>    Site réalisé par Baptiste MOISSERON | Emilien MASSI | Baptiste RUELLAN | Lucas BÉDUÉ</span>
        <br><a href="https://github.com/Jagadai/Projet-JEE-2024" target="_blank">GitHub</a>
        <a href="RedirectionServlet?url=https://cytech.cyu.fr" >CY Tech</a>
        <a href="RedirectionServlet?url=Faq.jsp" >FAQ</a>
    </div>

</body>
</html>
