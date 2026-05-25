<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="model.User" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
</head>

<body>

<h3>Bienvenue, <%= user.getNom() %> <%= user.getPrenom() %></h3>

<a href="LogoutServlet">Logout</a>

<br><br>

<form action="ReservationServlet" method="post">

    <label>Date :</label>
    <input type="date" name="date"><br><br>

    <label>Heure début :</label>
    <input type="time" name="heureDebut"><br><br>

    <label>Heure fin :</label>
    <input type="time" name="heureFin"><br><br>
<h3>Bloc5 size = ${sallesBloc5.size()}
Bloc6 size = ${sallesBloc6.size()}</h3>
<h3>Nombre salles bloc 5 : ${sallesBloc5.size()}</h3>


    <label>Salle :</label>

<select name="salleId">

    <optgroup label="Bloc 5">
        <c:forEach var="s" items="${sallesBloc5}">
            <option value="${s.id}">
                ${s.nom} - ${s.capacite}
            </option>
        </c:forEach>
    </optgroup>

    <optgroup label="Bloc 6">
        <c:forEach var="s" items="${sallesBloc6}">
            <option value="${s.id}">
                ${s.nom} - ${s.capacite}
            </option>
        </c:forEach>
    </optgroup>

</select>

    <br><br>
    <button type="button" onclick="verifier()">
    Vérifier disponibilité
</button>

    <button type="submit" id="reserveBtn">
    Réserver
</button>

</form>

<script>
function verifier() {

    let date = document.querySelector("[name='date']").value;
    let debut = document.querySelector("[name='heureDebut']").value;
    let fin = document.querySelector("[name='heureFin']").value;
    let salle = document.querySelector("[name='salleId']").value;

    fetch("CheckAvailabilityServlet?date=" + date +
          "&heureDebut=" + debut +
          "&heureFin=" + fin +
          "&salleId=" + salle)
    .then(response => response.text())
    .then(data => {

        if (data === "OK") {
            document.getElementById("reserveBtn").disabled = false;
            alert("Salle disponible ✅");
        } else {
            document.getElementById("reserveBtn").disabled = true;
            alert("Salle occupée ❌");
        }
    });
}
</script>

</body>
</html>