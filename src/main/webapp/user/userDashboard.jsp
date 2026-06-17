<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
    background: #f4f6f9;
}

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 250px;
    height: 100vh;
    background: #0d6efd;
}

.sidebar h3 {
    color: white;
    text-align: center;
    padding: 20px;
}

.sidebar a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 15px 20px;
}

.sidebar a:hover {
    background: #0b5ed7;
}

.main {
    margin-left: 260px;
    padding: 30px;
}

.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

</style>

</head>

<body>

<div class="sidebar">

    <h3>👤 User</h3>

    <a href="${pageContext.request.contextPath}/PlanningServlet">
    📅 Voir planning
</a>

    <a href="${pageContext.request.contextPath}/LogoutServlet">
        🚪 Déconnexion
    </a>

</div>

<div class="main">

    <h1>Bienvenue <%= user.getPrenom() %> <%= user.getNom() %></h1>

    <div class="row mt-4">

        <div class="col-md-6">
            <div class="card p-4">
                <h4>📅 Planning</h4>
                <p>Consulter les réservations des salles.</p>

                <a href="${pageContext.request.contextPath}/PlanningServlet">
    📅 Voir planning
</a>
            </div>
        </div>

    </div>

</div>

</body>
</html>