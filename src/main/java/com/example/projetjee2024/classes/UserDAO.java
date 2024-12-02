package com.example.projetjee2024.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    	//Creation of the query to send to the database
        String query = "SELECT * FROM "+ status + " WHERE login = ? AND password = ?";
        //Test needed to make sure that we don't get a driver error by loading the MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //Connection to the database
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        	//Modification of the query to add variables
            //We can't put the table name as a variable in setstring to not trigger error
            PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            //Execution of the query
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Integer getUserId(String username, String password,String status) {
        //Creation of the query to send to the database
        String query = "SELECT id FROM "+ status + " WHERE login = ? AND password = ?";
        //Test needed to make sure that we don't get a driver error by loading the MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //Connection to the database
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             //Modification of the query to add variables
             //We can't put the table name as a variable in setstring to not trigger error
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            //Execution of the query
            try (ResultSet rs = stmt.executeQuery()) {
                if(rs.next()) {
                    return rs.getInt("id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Map<String, Object>> getTableData(String tableName) {
        //Creation of the query to send to the database
        String query = "SELECT * FROM " + tableName;

        //Arraylist to save result
        List<Map<String, Object>> results = new ArrayList<>();

        //Test needed to make sure that we don't get a driver error by loading the MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        // Connection to the database
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement stmt = conn.prepareStatement(query);
             //Execution of the query
             ResultSet rs = stmt.executeQuery()) {

            //Retrieving of the tables variable
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            //While they are entity in the table
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    //Add them & their value to the map
                    row.put(metaData.getColumnName(i), rs.getObject(i));
                }
                results.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return results;
    }


}
