package com.example.projetjee2024.Servlet;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "RedirectionServlet", value = "/RedirectionServlet")
public class RedirectionServlet extends HttpServlet {


    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();

        String URL=request.getParameter("url");


        if(URL==null || URL==""){
;            response.sendRedirect("http://login.jsp");
        }
        else{
            response.sendRedirect(URL);

        }
    }

    public void destroy() {
    }
}