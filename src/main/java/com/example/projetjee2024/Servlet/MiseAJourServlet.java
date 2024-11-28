package com.example.projetjee2024.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/MiseAJourServlet")
public class MiseAJourServlet extends HttpServlet {

    private int id = 0;
    private String status = null;
    private String name = null;
    private String lastName = null;
    private String address = null;
    private String degree = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/projetjee";
        String user = "root";
        String password = "cytech0001";

        Connection conn = null;

        try {
            // Connexion à la base de données
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String updateQuery = "UPDATE student SET name=?, lastName=?, adress=?, degree=?, mail=?, password=? WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            // Boucle pour traiter chaque ligne du formulaire
            for (String key : request.getParameterMap().keySet()) {
                if (key.startsWith("id_")) {
                    int id = Integer.parseInt(request.getParameter(key));
                    pstmt.setString(1, request.getParameter("nom_" + id));
                    pstmt.setString(2, request.getParameter("prenom_" + id));
                    pstmt.setString(3, request.getParameter("adresse_" + id));
                    pstmt.setString(4, request.getParameter("promotion_" + id));
                    pstmt.setString(5, request.getParameter("mail_" + id));
                    //pstmt.setInt(6, request.getParameter(id);
                    pstmt.setString(6, request.getParameter("password_" + id));
                    pstmt.setInt(7, id);

                    this.id = id;
                    this.name = request.getParameter("prenom_" + id);
                    this.lastName = request.getParameter("nom_" + id);
                    this.address = request.getParameter("adresse_" + id);
                    this.degree = request.getParameter("promotion_" + id);

                    pstmt.executeUpdate();
                }
            }
            response.sendRedirect("/Projet_JEE_2024_war/Accueil.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception ignored) {
            }
        }
    }
}
