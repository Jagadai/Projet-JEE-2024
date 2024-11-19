package com.example.projetjee2024.Servlet;

import java.io.IOException;

import com.example.projetjee2024.classes.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "VerifLogin", value = "/VerifLogin")
public class VerifLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private UserDAO studentDAO;
    private UserDAO professorDAO;
    private UserDAO adminDAO;

    public VerifLogin() {
        super();
    }

    @Override
    public void init() throws ServletException {
	//Remplacer les noms de databases pour chaques types d'étudiants
    	studentDAO = new UserDAO("jdbc:mysql://localhost:3306/student_db", "root", "cytech0001");
        professorDAO = new UserDAO("jdbc:mysql://localhost:3306/professor_db", "root", "cytech0001");
        adminDAO = new UserDAO("jdbc:mysql://localhost:3306/admin_db", "root", "cytech0001");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//Getting sent data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

	//Initializing the message and redirect page
        String message = "Wrong username or password";
        String page = "/WEB-INF/Login.jsp";
        String permission = "None";
        double id = -1;

	//Checking credentials
        if (studentDAO.validateUser(username, password)) {
            message = "Student page";
            page = "/WEB-INF/Accueil.jsp";
            permission = "Élève";
            id = studentDAO.getId(username, password);
        } else if (professorDAO.validateUser(username, password)) {
            message = "Professor page";
            page = "/WEB-INF/Accueil.jsp";
            permission = "Professeur";
            id = professorDAO.getId(username, password);
        } else if (adminDAO.validateUser(username, password)) {
            message = "Admin page";
            page = "/WEB-INF/Accueil.jsp";
            permission = "Admin";
            id = adminDAO.getId(username, password);
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
