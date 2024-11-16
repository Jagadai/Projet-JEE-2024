package com.example.projetjee2024.Servlet;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AccueilServlet", value = "/AccueilServlet")
public class AccueilServlet extends HttpServlet {


    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");


    }

    public void destroy() {
    }
}