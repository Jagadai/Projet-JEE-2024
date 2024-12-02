<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
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
  <meta charset="UTF-8">
  <title>Gestion des Parametres</title>

</head>
<body>
<button class="btn btn-primary" onclick="window.location.href = 'RedirectionServlet?url=Accueil.jsp';">Accueil</button>


<h1>Affiche professeur</h1>

<%
  String url = "jdbc:mysql://localhost:3306/projetjee";
  String user = "root";
  String password = "cytech0001";
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  Class.forName("com.mysql.cj.jdbc.Driver");
  conn = DriverManager.getConnection(url, user, password);
  stmt = conn.createStatement();


  String query = "SELECT * FROM teacher;";
  rs = stmt.executeQuery(query);
%>
  <table>
    <thead>
    <tr>
      <th>Prenom</th>
      <th>nom</th>
      <th>Adresse</th>
      <th>Mail</th>
      <th>Cours</th>
    </tr>
    </thead>
    <tbody>
    <%
      try {
      while (rs.next()) {
        int id = rs.getInt("id");
        String prenom = rs.getString("lastName");
        String nom = rs.getString("name");
        String adresse = rs.getString("adress");
        String mail = rs.getString("mail");
        String subject = rs.getString("subject");
        int phone = rs.getInt("phone");
    %>
    <tr>
      <input type="hidden" name="id_<%= id %>" value="<%= id %>"/>
      <td><input type="text" name="nom_<%= id %>" value="<%= prenom %>"/></td>
      <td><input type="text" name="prenom_<%= id %>" value="<%= nom %>"/></td>
      <td><input type="text" name="adresse_<%= id %>" value="<%= adresse %>"/></td>
      <td><input type="text" name="mail_<%= id %>" value="<%= mail %>"/></td>

      <td><input type="text" name="subject_<%= id %>" value="<%= subject %>"/></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <br/>
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
<div class="footer">
  <span>© 2024 Mon Projet JEE</span>
  <span>    Site réalisé par Baptiste MOISSERON | Emilien MASSI | Baptiste RUELLAN | Lucas BÉDUÉ</span>
  <br><a href="https://github.com/Jagadai/Projet-JEE-2024" target="_blank">GitHub</a>
  <a href="RedirectionServlet?url=https://cytech.cyu.fr" >CY Tech</a>
  <a href="RedirectionServlet?url=Faq.jsp" >FAQ</a>
</div>
</body>
</html>
