package com.chalostudy;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.net.URLEncoder;

@jakarta.servlet.annotation.WebServlet("/upload")
@jakarta.servlet.annotation.MultipartConfig
public class UploadServlet extends HttpServlet {

        private static final String UPLOAD_DIR = "uploads";

        protected void doPost(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {

                String subject = req.getParameter("subject");
                String category = req.getParameter("category");

                // Create upload folder
                Path uploadPath = Paths.get(
                                getServletContext().getRealPath("/"),
                                UPLOAD_DIR, subject, category);
                Files.createDirectories(uploadPath);

                // File upload
                Part filePart = req.getPart("file");
                String fileName = Paths.get(filePart.getSubmittedFileName())
                                .getFileName().toString();

                filePart.write(uploadPath.resolve(fileName).toString());

                // Reload SAME PAGE
                String redirectURL = "materials.jsp?subj=" +
                                URLEncoder.encode(subject, "UTF-8") +
                                "&cat=" +
                                URLEncoder.encode(category, "UTF-8") +
                                "&msg=" + URLEncoder.encode("File uploaded successfully!", "UTF-8");

                resp.sendRedirect(redirectURL);
        }
}
