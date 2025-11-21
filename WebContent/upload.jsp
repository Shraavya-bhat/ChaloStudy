<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Upload Material</title>
  <link rel="stylesheet" href="css/style.css"> <!-- FIXED PATH -->
</head>
<body>
  <div class="container">
    <a class="back" href="index.jsp">&larr; Back</a>
    <h1>Upload Material</h1>

    <!-- FIXED: method="post" -->
    <form id="uploadForm" method="post" enctype="multipart/form-data">

      <label>Subject *
        <select name="subject" required>
          <option value="Computer Networks">Computer Networks</option>
          <option value="Advanced Java">Advanced Java</option>
          <option value="Theory of Computation">Theory of Computation</option>
          <option value="Fundamentals of Management">Fundamentals of Management</option>
          <option value="Research Methodology and IPR">Research Methodology and IPR</option>
          <option value="Environmental Studies & E-Waste Management">Environmental Studies & E-Waste Management</option>
        </select>
      </label>

      <label>Category *
        <select name="category" required>
          <option value="Notes">Notes</option>
          <option value="Internal Papers">Internal Papers</option>
          <option value="MQP">MQP</option>
        </select>
      </label>

      <label>Your Name (Optional)
        <input type="text" name="uploader" placeholder="John">
      </label>

      <label>Select File *
        <input type="file" name="file" required>
      </label>

      <button type="submit">Upload Material</button>
    </form>

    <p id="msg"></p>
  </div>

  <script>
    document.getElementById("uploadForm").addEventListener("submit", async (e) => {
      e.preventDefault();

      const form = new FormData(e.target);

      const res = await fetch("<%= request.getContextPath() %>/upload", {
        method: "POST",
        body: form
      });

      document.getElementById("msg").textContent =
        res.ok ? "Upload successful!" : "Upload failed";
    });
  </script>
</body>
</html>
