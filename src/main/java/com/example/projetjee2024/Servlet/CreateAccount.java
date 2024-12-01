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
import java.sql.Statement;

@WebServlet(name = "CreateAccount", value = "/CreateAccount")
public class CreateAccount extends HttpServlet {
    int id = 3;

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastname");
            String dateOfBirth = request.getParameter("DateOfBirth");
            String mail = request.getParameter("mail");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String degree = request.getParameter("degree");
            String classe = request.getParameter("classe");

            int phonNum = Integer.parseInt(phone);
            int deg = Integer.parseInt(degree);


            Class.forName("com.mysql.cj.jdbc.Driver");
            /**
             * Creates a connection between the Java class and Database instance
             */
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetjee", "root", "cytech0001");
            Statement statement = connection.createStatement();
            id ++;

            PreparedStatement statementInsert = connection.prepareStatement("SELECT * FROM student");

            StringBuilder query = new StringBuilder();
            query.append("INSERT INTO student"+
                    " (`id`,`name`,`lastName`,`dateOfBirth`,`mail`,`phone`,`adress`,`login`,`password`,`degree`,`class`) " +
                    "VALUES (\""+ id +"\", \""+name +"\", \"" + lastName +"\", \"" + dateOfBirth+"\", \""+mail + "\", \"" + phonNum +"\", \"" + address+"\", \"" + login +"\", \"" + password+"\", \"" + deg +"\", \"" + classe+"\")");
            statementInsert.executeUpdate(query.toString());

            /**
             * Redirection vers la page de connexion
             */
            response.sendRedirect("/Projet_JEE_2024_war/Login.jsp");
        }
        catch (Exception e){
            /**
             * Error handling Statements
             */
            System.out.println(e.toString());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
