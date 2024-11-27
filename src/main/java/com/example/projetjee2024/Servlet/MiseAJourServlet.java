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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/votre_base";
        String user = "votre_utilisateur";
        String password = "votre_mot_de_passe";

        Connection conn = null;

        try {
            // Connexion à la base de données
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String updateQuery = "UPDATE etudiants SET nom=?, prenom=?, adresse=?, notes=?, filiere=?, promotion=? WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            // Boucle pour traiter chaque ligne du formulaire
            for (String key : request.getParameterMap().keySet()) {
                if (key.startsWith("id_")) {
                    int id = Integer.parseInt(request.getParameter(key));
                    pstmt.setString(1, request.getParameter("nom_" + id));
                    pstmt.setString(2, request.getParameter("prenom_" + id));
                    pstmt.setString(3, request.getParameter("adresse_" + id));
                    pstmt.setString(4, request.getParameter("notes_" + id));
                    pstmt.setString(5, request.getParameter("filiere_" + id));
                    pstmt.setString(6, request.getParameter("promotion_" + id));
                    pstmt.setInt(7, id);
                    pstmt.executeUpdate();
                }
            }
            response.sendRedirect("AffichageEtModification.jsp");
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
