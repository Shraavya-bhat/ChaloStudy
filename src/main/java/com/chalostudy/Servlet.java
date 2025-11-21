package com.chalostudy;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        if (page == null) page = "index";
        req.getRequestDispatcher("/" + page + ".jsp").forward(req, resp);
    }
}