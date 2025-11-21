# ChaloStudy – Study Material Sharing Web App

A simple Java-based web application for 5th semester students to *upload, share, and access study materials* in an organized and centralized way.

---

## 🚀 Features

- Upload notes, internal papers, and model question papers (MQP).  
- Categorized by *Subject → Category → Files*.  
- Auto-folder creation based on subject and category.  
- Simple, clean, and responsive UI.  
- Centralized platform for students to access materials easily.

---

## 💻 Tech Stack

- *Frontend:* HTML, CSS, JSP  
- *Backend:* Java Servlets  
- *Server:* Apache Tomcat 10  
- *Database:* MySQL (optional, for storing file metadata)  
- *Tools:* VS Code / Eclipse

---

## 🗂 Project Structure


ChaloStudy/
│
├── src/
│   └── com/chalostudy/
│       ├── Servlet.java        # Front controller for page navigation
│       ├── UploadServlet.java  # Handles file uploads
│       └── FileUtil.java       # Helper class for listing files
│
├── WebContent/
│   ├── index.jsp
│   ├── subjects.jsp
│   ├── categories.jsp
│   ├── upload.jsp
│   ├── materials.jsp
│   └── css/
│       └── style.css
│
├── WEB-INF/
│   └── web.xml
│
└── uploads/                     # Auto-generated folders for storing uploaded files


---

## ⚙ How to Run Locally

1. *Clone the repo:*
   bash
   git clone https://github.com/yourusername/ChaloStudy.git
   

2. *Deploy to Tomcat:*
   - Copy the project folder or WAR file into apache-tomcat-10.1.49/webapps/
   - Start Tomcat server.

3. *Access in browser:*
   
   http://localhost:8081/ChaloStudy/
   

4. *Usage:*
   - Click on 5th Semester → Select Subject → Select Category → Upload Material.  
   - Files will be stored in uploads/Subject/Category.

---

## 📂 File Upload Storage

Files are stored on the server filesystem:  

uploads/<Subject>/<Category>/<file_name>


- Example: uploads/Advanced Java/Notes/Java_OOP.pdf

---

## 📝 Notes

- Make sure uploads/ folder has write permissions.  
- MySQL is optional, only if you want to store metadata about files (uploader, timestamp, etc.).  
- Designed for *5th Semester students*, but easily extendable for other semesters.

---

## 🔮 Future Enhancements

- User authentication (login/signup).  
- Role-based access control.  
- File download tracking and analytics.  
- Multi-semester support.  
- Notifications for new uploads.

---