<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Paramètres</title>

</head>
<body>
<div class="top_banner">
    <a href="RedirectionServlet?url=Accueil.jsp">
        <img alt="Accueil"/>
    </a>
</div>

<h1>Gestion des Parametres</h1>

<%
    String url = "jdbc:mysql://localhost:3306/projetjee";
    String user = "root";
    String password = "cytech0001";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();


        String query = "SELECT * FROM student";
        rs = stmt.executeQuery(query);

%>
<form action="MiseAJourServlet" method="post">
    <table>
        <thead>
        <tr>
            <th>Prenom</th>
            <th>nom</th>
            <th>Adresse</th>
            <th>Promotion</th>
            <th>Modifier</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
                int id = rs.getInt("id");
                String prenom = rs.getString("lastName");
                String nom = rs.getString("name");
                String adresse = rs.getString("adress");
                String promotion = rs.getString("degree");
        %>
        <tr>
            <input type="hidden" name="id_<%= id %>" value="<%= id %>"/>
            <td><input type="text" name="nom_<%= id %>" value="<%= prenom %>"/></td>
            <td><input type="text" name="prenom_<%= id %>" value="<%= nom %>"/></td>
            <td><input type="text" name="adresse_<%= id %>" value="<%= adresse %>"/></td>
            <td><input type="text" name="promotion_<%= id %>" value="<%= promotion %>"/></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <br/>
    <button type="submit">Enregistrer les modifications</button>
</form>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>