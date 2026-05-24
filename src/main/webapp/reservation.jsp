<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.User" %>
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

<form action="ReservationServlet" method ="post">
<input type="date" name="date"><br>


<label for="heureDebut">Heure début:</label>
<input type="time" id="heureDebut" name="heureDebut">


<br>
<label for="heureFin">Heure fin:</label>
<input type="time" id="heureFin" name="heureFin"><br>


<label for="salleId">Salle id:</label>
<input type="number" id="salleId" name="salleId"><br>



<button type="submit" >Réserver</button>
</form>
</body>
</html>