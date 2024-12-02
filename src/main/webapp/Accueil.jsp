<%@ page import="com.example.projetjee2024.Servlet.AccueilServlet" %>
<%@ page import="com.example.projetjee2024.classes.StudentEntity" %><%--
  Created by IntelliJ IDEA.
  User: cytech
  Date: 15/11/2024
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title></title>
    </head>
<body>

<br>
<%
    Integer id= (Integer) session.getAttribute("id");
    String permission = (String) session.getAttribute("permission");
%>
<div class="central_container">
    <h1>Test session</h1>
    <p>Votre ID : <%= id != null ? id : "Non défini" %></p>
    <p>Votre statut : <%= permission != null ? permission : "Non défini" %></p>
</div>
<br>

<div class="top_banner"><?-- Bannière du haut -->
    <a href="RedirectionServlet?url=Accueil.jsp" >
        <img src="./IMAGE/img_CYTECH_logo.png" heigth="200px" width="200px"/>
    </a>
<div class="onglets">
    <table>
        <tr>
            <td>
                 <a href="RedirectionServlet?url=CourseGestion.jsp">Gerer ses cours</a>
            </td>
            <td>
                <a href="RedirectionServlet?url=TimeTable.jsp" >Emplois du temps</a>
            </td>
            <td>
                <a href="RedirectionServlet?url=Notes.jsp" >Notes</a>
            </td>
            <td>
                <a href="RedirectionServlet?url=Login.jsp" >Déconnexion </a>
            </td>
            <td>
                <a href="RedirectionServlet?url=CreateCourse.jsp" >Crée un cours </a>
            </td>
            <td>
                <a href="RedirectionServlet?url=Settings.jsp" >Paramètre </a>
            </td>
        </tr>
    </table>
</div>
</div>

<div class="central_container"></div><?-- La page -->
<% if(request.getAttribute("message")!=null){ %>
<%=request.getAttribute("message")%>
<%}%>


<div class="bottom_banner"><?-- Bannière du bas -->
    <a href="RedirectionServlet?url=Faq.jsp" >FAQ</a><br>
    Site réalisé par Baptiste MOISSERON | Emilien MASSI | Baptiste RUELLAN | Lucas BÉDUÉ <br>
    <a href="RedirectionServlet?url=https://cytech.cyu.fr" >Lien vers Cy-tech.fr</a>
</div>
</body>
</html>