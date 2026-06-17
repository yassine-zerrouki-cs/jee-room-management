<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.SalleDAO, dao.EquipementDAO, dao.ReservationDAO" %>

<%
if (session == null || session.getAttribute("user") == null) {
response.sendRedirect(request.getContextPath() + "/login.jsp");
return;
}

int nbSalles = SalleDAO.countSalles();
int nbEquipements = EquipementDAO.countEquipements();
int nbReservations = ReservationDAO.countReservations();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Admin</title>

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
    padding-top:20px;
}

.sidebar h3{
    color:white;
    text-align:center;
    margin-bottom:30px;
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    padding:15px 25px;
}

.sidebar a:hover{
    background:#343a40;
}

.main{
    margin-left:260px;
    padding:30px;
}

.card-stat{
    border:none;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.big-number{
    font-size:35px;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="sidebar">


<h3>⚙ Admin</h3>


<a href="${pageContext.request.contextPath}/SalleServlet">
    🏫 Gérer les salles
</a>

<a href="${pageContext.request.contextPath}/EquipementServlet">
    🧰 Gérer les équipements
</a>

<a href="${pageContext.request.contextPath}/PlanningServlet">
    📅 Voir planning
</a>

<a href="${pageContext.request.contextPath}/ReservationServlet">
    📖 Réservations
</a>

<a href="${pageContext.request.contextPath}/LogoutServlet">
    🚪 Déconnexion
</a>

</div>

<div class="main">


<h1 class="mb-4">📊 Dashboard Administrateur</h1>

<div class="row">

    <div class="col-md-4">
        <div class="card card-stat text-center p-3">
            <h4>🏫 Salles</h4>
            <div class="big-number">
                <%= nbSalles %>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card card-stat text-center p-3">
            <h4>🧰 Équipements</h4>
            <div class="big-number">
                <%= nbEquipements %>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card card-stat text-center p-3">
            <h4>📅 Réservations</h4>
            <div class="big-number">
                <%= nbReservations %>
            </div>
        </div>
    </div>

</div>

<div class="card mt-5 p-4">

    <h3>📌 Résumé du système</h3>

    <ul>
        <li>Gestion des salles de TP</li>
        <li>Gestion des équipements</li>
        <li>Réservation des salles</li>
        <li>Planning global</li>
        <li>Historique des réservations</li>
    </ul>

</div>


</div>

</body>
</html>
