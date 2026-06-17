<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion des Salles</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f4f6f9;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
    margin-bottom:15px;
}

.badge-eq{
    background:#0d6efd;
    color:white;
    padding:3px 8px;
    border-radius:10px;
}
</style>

</head>

<body>

<div class="container mt-4">

<h2 class="mb-4">🏫 Gestion des salles (ADMIN)</h2>

<a class="btn btn-secondary mb-3" href="${pageContext.request.contextPath}/DashboardServlet">
⬅ Retour Dashboard
</a>

<div class="row">

<c:forEach var="s" items="${salles}">

    <div class="col-md-4">

        <div class="card p-3">

            <h5>${s.nom}</h5>

            <p>📍 Bloc : ${s.bloc}</p>
            <p>👥 Capacité : ${s.capacite}</p>

            <hr>

            <h6>🧰 Équipements</h6>

            <c:choose>

                <c:when test="${empty s.equipements}">
                    <span class="text-muted">Aucun équipement</span>
                </c:when>

                <c:otherwise>
                    <c:forEach var="e" items="${s.equipements}">
                        <div>
                            • ${e.nom} (${e.type})
                        </div>
                    </c:forEach>
                </c:otherwise>

            </c:choose>

            <hr>

            <div class="d-flex justify-content-between">

                <a class="btn btn-warning btn-sm"
                   href="EditSalleServlet?id=${s.id}">
                    Modifier
                </a>

                <a class="btn btn-danger btn-sm"
                   onclick="return confirm('Supprimer cette salle ?')"
                   href="DeleteSalleServlet?id=${s.id}">
                    Supprimer
                </a>

            </div>

        </div>

    </div>

</c:forEach>

</div>

<hr>

<h4>➕ Ajouter une salle</h4>

<form action="AddSalleServlet" method="post" class="row g-2">

    <div class="col-md-4">
        <input type="text" name="nom" class="form-control" placeholder="Nom" required>
    </div>

    <div class="col-md-4">
        <input type="number" name="capacite" class="form-control" placeholder="Capacité" required>
    </div>

    <div class="col-md-4">
        <input type="number" name="bloc" class="form-control" placeholder="Bloc" required>
    </div>

    <div class="col-12">
        <button class="btn btn-success">Ajouter</button>
    </div>

</form>

</div>

</body>
</html>