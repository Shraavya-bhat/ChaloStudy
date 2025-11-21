<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,java.nio.file.*" %>

<%
  String subj = request.getParameter("subj");
  String cat  = request.getParameter("cat");
  if (subj == null) subj = "Advanced Java";
  if (cat  == null) cat  = "Model Question Papers";

  // ---- list files on disk ----
  Path folder = Paths.get(application.getRealPath("/"), "uploads", subj, cat);
  List<String> files = Files.exists(folder)
          ? Files.list(folder).map(p -> p.getFileName().toString()).sorted().toList()
          : List.of();

  // Message for successful upload (coming from redirect)
  String msg = request.getParameter("msg");
%>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ChaloStudy</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<header>ChaloStudy</header>

<div class="wrap">
  <h2><%=subj%> - <%=cat%></h2>

  <!-- SUCCESS MESSAGE -->
  <% if (msg != null) { %>
      <p style="color: green; font-weight: bold;"><%= msg %></p>
  <% } %>

  <p><strong>Available Materials</strong></p>

  <% if (files.isEmpty()) { %>
      <p style="color:#666">No materials available in this category yet.<br>Be the first to upload and help your peers!</p>
  <% } else { %>
      <ul style="margin:10px 0 20px 20px">
      <% for (String f : files) {
           String downPath = request.getContextPath() + "/uploads/" + subj + "/" + cat + "/" + f; %>
          <li><a href="<%=downPath%>" download><%=f%></a></li>
      <% } %>
      </ul>
  <% } %>

<form action="${pageContext.request.contextPath}/upload"
      method="post"
      enctype="multipart/form-data">

    <label>Select File *<br>
        <input type="file" name="file" required>
    </label><br><br>

    <label>Subject *<br>
        <input type="text" name="subject" value="<%=subj%>" readonly>
    </label><br><br>

    <label>Category *<br>
        <input type="text" name="category" value="<%=cat%>" readonly>
    </label><br><br>

    <label>Your Name (Optional)<br>
        <input type="text" name="name" placeholder="e.g., John Doe">
    </label><br><br>

    <button type="submit">Upload Material</button>
</form>


  <footer>
    Instant Access, No Login!<br>
    Effortlessly upload and download study materials.<br>
    Quick Uploads · Easy Downloads · Centralized Resources
  </footer>
</div>

</body>
</html>
