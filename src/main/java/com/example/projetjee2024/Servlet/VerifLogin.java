package com.example.projetjee2024.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.example.projetjee2024.classes.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "VerifLogin", value = "/VerifLogin")
public class VerifLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private UserDAO loginDAO;

    public VerifLogin() {
        super();
    }

    @Override
    public void init() throws ServletException {
	//Remplacer les noms de databases pour chaques types d'étudiants
        loginDAO = new UserDAO("jdbc:mysql://localhost:3306/projetjee", "root", "cytech0001");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//Getting sent data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String status = request.getParameter("status");

	//Initializing the message and redirect page
        String message = "Wrong username or password";
        String page = "/Login.jsp";
        String permission = "None";
        double id = -1;

	//Checking credentials
        if (loginDAO.validateUser(username, password,status)) {
            if(status.equals("student")){
                permission = "Élève";
                message = "Student page";
            } else if (status.equals("professor")) {
                message = "Professor page";
                permission = "Professeur";
            }else if (status.equals("administrator")) {
                message = "Admin page";
                permission = "Admin";
            }
            page = "/Accueil.jsp";
            id = 2;//!!!changer l'id une fois que j'ai fait la fonction pour le recuperer
            //id = loginDAO.getId(username, password);
        }
	
	//Adding attributes to the redirect
        request.setAttribute("message", message);
        request.setAttribute("permission", permission);
        request.setAttribute("id", id);
        this.getServletContext().getRequestDispatcher(page).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
