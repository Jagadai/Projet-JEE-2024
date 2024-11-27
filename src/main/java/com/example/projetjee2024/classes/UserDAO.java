package com.example.projetjee2024.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
    private String dbUrl;
    private String dbUsername;
    private String dbPassword;

    public UserDAO(String dbUrl, String dbUsername, String dbPassword) {
        this.dbUrl = dbUrl;
        this.dbUsername = dbUsername;
        this.dbPassword = dbPassword;
    }

    public boolean validateUser(String username, String password,String status) {
    	//Écriture de la requête
        String query = "SELECT * FROM "+ status + " WHERE login = ? AND password = ?";
        //Connexion à la base de donnée
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        	//Préparation de la requête
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            //Execution de la requête
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public double getId(String username, String password) {
    	String query = "SELECT id FROM users WHERE username = ? AND password = ?"; 
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
            	return rs.getDouble("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
