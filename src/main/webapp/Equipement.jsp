<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion des équipements</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f4f6f9;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.table-container{
    background:white;
    padding:20px;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}
</style>

</head>

<body>

<div class="container mt-4">

<h2 class="mb-4">🧰 Gestion des équipements</h2>

<a href="${pageContext.request.contextPath}/DashboardServlet"
   class="btn btn-secondary mb-3">
   ⬅ Retour Dashboard
</a>

<!-- FORM AJOUT -->
<div class="card p-4 mb-4">

    <h5>➕ Ajouter un équipement</h5>

    <form action="EquipementServlet" method="post" class="row g-2">

        <div class="col-md-4">
            <input type="hidden" name="id" value="0">

            <input type="text" name="nom" class="form-control" placeholder="Nom" required>
        </div>

        <div class="col-md-3">
            <input type="text" name="type" class="form-control" placeholder="Type" required>
        </div>

        <div class="col-md-3">
            <input type="number" name="salleId" class="form-control" placeholder="Salle ID" required>
        </div>

        <div class="col-md-2">
            <button class="btn btn-success w-100">Enregistrer</button>
        </div>

    </form>

</div>

<!-- TABLE -->
<div class="table-container">

<table class="table table-striped">

<thead class="table-dark">
<tr>
    <th>ID</th>
    <th>Nom</th>
    <th>Type</th>
    <th>Salle</th>
    <th>Actions</th>
</tr>
</thead>

<tbody>

<c:forEach var="e" items="${equipements}">

<tr>
    <td>${e.id}</td>
    <td>${e.nom}</td>
    <td>${e.type}</td>
    <td>${e.salleId}</td>

    <td>

        <a class="btn btn-warning btn-sm"
           href="EditEquipementServlet?id=${e.id}">
            Modifier
        </a>

        <a class="btn btn-danger btn-sm"
           onclick="return confirm('Supprimer cet équipement ?')"
           href="DeleteEquipementServlet?id=${e.id}">
            Supprimer
        </a>

    </td>
</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>

</body>
</html>