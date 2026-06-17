<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
response.sendRedirect("../login.jsp");
return;
}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Professeur</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
}

.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:250px;
    height:100vh;
    background:#212529;
}

.sidebar h3{
    color:white;
    text-align:center;
    padding:20px;
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    padding:15px 20px;
}

.sidebar a:hover{
    background:#343a40;
}

.main{
    margin-left:260px;
    padding:30px;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

</style>

</head>

<body>

<div class="sidebar">


<h3>👨‍🏫 Professeur</h3>

<a href="${pageContext.request.contextPath}/ReservationServlet">
    📅 Réserver une salle
</a>

<a href="${pageContext.request.contextPath}/PlanningServlet">
    📅 Voir planning
</a>
<a href="${pageContext.request.contextPath}/SalleServlet">
    🏫 Voir les salles
</a>

<a href="${pageContext.request.contextPath}/LogoutServlet">
    🚪 Déconnexion
</a>


</div>

<div class="main">


<h1>Bienvenue <%= user.getPrenom() %> <%= user.getNom() %></h1>

<p class="text-muted">
    Tableau de bord professeur
</p>

<div class="row mt-4">

    <div class="col-md-4">
        <div class="card p-4">
            <h4>📅 Réservation</h4>
            <p>Réserver une salle de TP.</p>

            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/ReservationServlet">
                Ouvrir
            </a>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card p-4">
            <h4>🗓 Planning</h4>
            <p>Consulter toutes les réservations.</p>

            <a class="btn btn-success"
              href="${pageContext.request.contextPath}/PlanningServlet">
                Ouvrir
            </a>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card p-4">
            <h4>🏫 Salles & Équipements</h4>
            <p>Voir les salles disponibles.</p>

            <a class="btn btn-warning"
              href="${pageContext.request.contextPath}/SalleServlet">
                Ouvrir
            </a>
        </div>
    </div>

</div>

</div>

</body>
</html>
