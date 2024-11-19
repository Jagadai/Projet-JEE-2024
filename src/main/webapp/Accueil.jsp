<%--
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

<div class="top_banner"><?-- Bannière du haut -->
    <a href="RedirectionServlet?url=Accueil.jsp" >
        <img src="./"/>
    </a>
<div class="onglets">
    <table>
        <tr>
            <td>
                <a href="RedirectionServlet?url=CourseGestion.jsp" >Gerer ses cours</a>
            </td>
            <td>
                <a href="RedirectionServlet?url=TimeTable.jsp" >Emplois du temps</a>
            </td>
            <td>
                <a href="RedirectionServlet?url=Notes.jsp" >Notes</a>
            </td>
            <td>
                <a href="RedirectionServlet?url=Parameters.jsp" >Parameters</a>
            </td>
        </tr>
    </table>
</div>
</div>


<div class="central_container"></div><?-- La page -->


<div class="bottom_banner"><?-- Bannière du bas -->
    <a href="RedirectionServlet?url=Faq.jsp" >FAQ</a>
    Copiright...
        <a href="RedirectionServlet?url=https://cytech.cyu.fr" >lien vers cytech</a>
</div>
</body>
</html>
