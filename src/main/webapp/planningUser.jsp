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
<title>Planning User</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="container mt-4">

<h2>📅 Planning des salles</h2>

<!-- ❌ PAS de réservation ici -->
<a href="${pageContext.request.contextPath}/DashboardServlet">
    ⬅ Retour Dashboard
</a>

<table class="table table-bordered">
    <tr>
        <th>Salle</th>
        <th>Date</th>
        <th>Heure début</th>
        <th>Heure fin</th>
        <th>Statut</th>
    </tr>

    <c:forEach var="r" items="${reservations}">
        <tr>
            <td>${r.salleNom}</td>
            <td>${r.date}</td>
            <td>${r.heureDebut}</td>
            <td>${r.heureFin}</td>
            <td>${r.statut}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>