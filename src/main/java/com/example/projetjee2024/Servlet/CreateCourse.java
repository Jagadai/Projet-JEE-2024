package com.example.projetjee2024.Servlet;

import com.example.projetjee2024.classes.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

import java.io.IOException;
@WebServlet(name = "CreateCourse", value = "/CreateCourseServlet")
public class CreateCourse extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            String name = request.getParameter("name");
            String teacher = request.getParameter("teacher");
            String matiere = request.getParameter("matiere");
            String day = request.getParameter("day");
            String duree = request.getParameter("durée");

            Class.forName("com.mysql.cj.jdbc.Driver");
            /**
             * Creates a connection between the Java class and Database instance
             */
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetjee", "root", "cytech0001");
            Statement statement = connection.createStatement();

            /**
             * Create table for each course
             */
            String line = "CREATE TABLE "+ matiere +"_"+ teacher +
                    "(name varchar(30) DEFAULT NULL,"+
                    "teacherName varchar(30) DEFAULT NULL,"+
                    "matiere varchar(30) DEFAULT NULL,"+
                    "duree varchar(30) DEFAULT NULL);";
            statement.execute(line);

            /**
             * Put course's information into the table
             */
            PreparedStatement statementInsert = connection.prepareStatement("SELECT * FROM "+ matiere +"_"+ teacher);
            StringBuilder query = new StringBuilder();
            query.append("INSERT INTO "+ matiere +"_"+ teacher +
                    " (`name`,`teacherName`,`matiere`,`duree`) " +
                    "VALUES (\""+name +"\", \"" + teacher +"\", \"" + matiere+"\", \""+duree +"\")");

            statementInsert.executeUpdate(query.toString());
        }
        catch (Exception e){
            /**
             * Error handling Statements
             */
            System.out.println(e.toString());
        }
    }
}
