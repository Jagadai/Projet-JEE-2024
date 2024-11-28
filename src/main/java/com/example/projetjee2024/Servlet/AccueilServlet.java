package com.example.projetjee2024.Servlet;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AccueilServlet", value = "/AccueilServlet")
public class AccueilServlet extends HttpServlet {


    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String permission = request.getParameter("permission");
        String id = request.getParameter("id");
        String message = request.getParameter("message");

        request.setAttribute("message", message);
        request.setAttribute("permission", permission);
        request.setAttribute("id", id);

        response.setContentType("text/html");


    }

    public void destroy() {
    }
}