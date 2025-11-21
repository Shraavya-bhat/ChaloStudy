<%@ page contentType="text/html;charset=UTF-8" %>
<%
  String sub = request.getParameter("sub");
  if (sub == null) sub = "Advanced Java";
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
  <p class="bread"><a href="subjects.jsp">&larr; Back</a> / 5th Semester / <%=sub%></p>

  <h2 class="tag">Designed for 5th Semester Students</h2>
  <p class="sub-tag">Simplify your study material access and sharing.</p>
  <p class="sub-tag">Your centralized, clutter-free, and student-friendly space for academic resources</p>

  <h3>Select a Category for <%=sub%></h3>
  <div class="grid">
    <a class="card" href="materials.jsp?subj=<%=java.net.URLEncoder.encode(sub,"UTF-8")%>&cat=Notes">Notes</a>
    <a class="card" href="materials.jsp?subj=<%=java.net.URLEncoder.encode(sub,"UTF-8")%>&cat=Internal Question Papers">Internal Question Papers</a>
    <a class="card" href="materials.jsp?subj=<%=java.net.URLEncoder.encode(sub,"UTF-8")%>&cat=Model Question Papers">Model Question Papers</a>
  </div>

  <footer>
    @ 2025 5th Semester Study Hub. All rights reserved.<br>
    Disclaimer: This platform is for academic sharing only. Please respect intellectual property.
  </footer>
</div>
</body>
</html>