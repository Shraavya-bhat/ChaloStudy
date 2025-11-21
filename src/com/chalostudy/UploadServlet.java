package com.chalostudy;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.net.URLEncoder;

@jakarta.servlet.annotation.WebServlet("/upload")
@jakarta.servlet.annotation.MultipartConfig
public class UploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // folder inside your web-app

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String subject = req.getParameter("subject");
        String category = req.getParameter("category");

        // FIXED: this field is "uploader" in your HTML
        String uploader = req.getParameter("uploader");

        // Create folder like uploads/Subject/Category
        Path uploadPath = Paths.get(
                getServletContext().getRealPath("/"),
                UPLOAD_DIR, subject, category);
        Files.createDirectories(uploadPath);

        // File upload
        Part filePart = req.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName())
                .getFileName().toString();

        filePart.write(uploadPath.resolve(fileName).toString());

        // Redirect to materials page
        resp.sendRedirect("materials.jsp?subj=" +
                URLEncoder.encode(subject, "UTF-8") +
                "&cat=" +
                URLEncoder.encode(category, "UTF-8"));
    }
}
