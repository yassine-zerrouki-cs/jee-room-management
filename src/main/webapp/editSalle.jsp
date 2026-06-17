<%@ page contentType="text/html; charset=UTF-8" %>

<h2>Modifier Salle</h2>

<form action="UpdateSalleServlet" method="post">

    <input type="hidden" name="id" value="${salle.id}">

    Nom :
    <input type="text" name="nom" value="${salle.nom}"><br><br>

    Capacité :
    <input type="number" name="capacite" value="${salle.capacite}"><br><br>

    Bloc :
    <input type="number" name="bloc" value="${salle.bloc}"><br><br>

    <button type="submit">Modifier</button>

</form>