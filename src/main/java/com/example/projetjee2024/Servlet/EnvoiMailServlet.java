package com.example.projetjee2024.Servlet;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EnvoiMailServlet", value = "/EnvoiMailServlet")
public class EnvoiMailServlet extends HttpServlet {
    public void init() {

    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        TLSEmail.main("lucasbedue@gmail.com");
        response.sendRedirect("Accueil.jsp");
    }
    public void destroy() {
    }
}
