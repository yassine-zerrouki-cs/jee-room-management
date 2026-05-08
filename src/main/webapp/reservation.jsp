<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
</head>
<body>
<form action="ReservationServlet" method ="post">
<input type="date" name="date"><br>


<label for="heureDebut">Heure début:</label>
<input type="time" id="heureDebut" name="heureDebut">


<br>
<label for="heureFin">Heure fin:</label>
<input type="time" id="heureFin" name="heureFin"><br>


<label for="salleId">Salle id:</label>
<input type="number" id="salleId" name="salleId"><br>


<label for="utilisateurId">Utilisateur id:</label>
<input type="number" id="utilisateurId" name="utilisateurId"><br>


<button type="submit" >Réserver</button>
</form>
</body>
</html>