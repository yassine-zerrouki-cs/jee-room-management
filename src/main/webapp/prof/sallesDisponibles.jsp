<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salles Disponibles</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f4f6f9;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
    margin-bottom:20px;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}
</style>

</head>

<body>

<div class="container mt-4">

<h1 class="mb-4">🏫 Salles et Équipements</h1>

<a href="${pageContext.request.contextPath}/DashboardServlet">
    ⬅ Retour Dashboard
</a>

<div class="row">

    <c:forEach var="s" items="${salles}">

        <div class="col-md-4">

            <div class="card p-3">

                <h4>${s.nom}</h4>

                <p><strong>Bloc :</strong> ${s.bloc}</p>
                <p><strong>Capacité :</strong> ${s.capacite}</p>

                <hr>

                <h6>🧰 Équipements disponibles</h6>

                <c:choose>

                    <c:when test="${empty s.equipements}">
                        <span style="color:gray;">Aucun équipement</span>
                    </c:when>

                    <c:otherwise>
                        <ul>
                            <c:forEach var="e" items="${s.equipements}">
                                <li>${e.nom} (${e.type})</li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>

                </c:choose>

                <a class="btn btn-success mt-2"
                   href="${pageContext.request.contextPath}/ReservationServlet?salleId=${s.id}">
                    📅 Réserver cette salle
                </a>

            </div>

        </div>

    </c:forEach>

</div>

</div>

</body>
</html>