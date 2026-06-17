<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ page import="model.User" %>
		<%@ taglib prefix="c" uri="jakarta.tags.core" %>

			<% User user=(User) session.getAttribute("user"); if (user==null) { response.sendRedirect("login.jsp");
				return; } %>

				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Reservation</title>

					<!-- Bootstrap -->
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
						rel="stylesheet">

					<!-- SweetAlert -->
					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

				</head>

				<body class="bg-light">

					<!-- NAVBAR -->
					<nav class="navbar navbar-dark bg-dark px-3">
						<span class="navbar-brand">Gestion Salles TP</span>
						<span class="text-white">
							Bienvenue <%= user.getNom() %>
								<%= user.getPrenom() %>
						</span>
						<a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
					</nav>

					<div class="container mt-4">

						<!-- FORM CARD -->
						<div class="card shadow p-4 mb-4">

							<h4 class="mb-3">Nouvelle Réservation</h4>

							<form action="ReservationServlet" method="post">

								<div class="row">

									<div class="col-md-4">
										<label>Date</label>
										<input type="date" name="date" class="form-control" required>
									</div>

									<div class="col-md-4">
										<label>Heure début</label>
										<input type="time" name="heureDebut" class="form-control" required>
									</div>

									<div class="col-md-4">
										<label>Heure fin</label>
										<input type="time" name="heureFin" class="form-control" required>
									</div>

								</div>

								<br>

								<label>Salle</label>
								<select name="salleId" required>

    <option value="">-- Choisir une salle --</option>

    <c:forEach var="s" items="${salles}">

        <option value="${s.id}"
            <c:if test="${selectedSalle == s.id}">selected</c:if>>
            ${s.nom}
        </option>

    </c:forEach>

</select>

								<br>

								<button type="button" onclick="verifier()" class="btn btn-warning">
									Vérifier disponibilité
								</button>

								<button type="submit" id="reserveBtn" class="btn btn-success" disabled>
									Réserver
								</button>

							</form>

						</div>

						<!-- TABLE HISTORIQUE -->
						<div class="card shadow p-4">

							<h4>📌 Mes réservations</h4>

							<table class="table table-striped">

								<thead class="table-dark">
									<tr>
										<th>Date</th>
										<th>Début</th>
										<th>Fin</th>
										<th>Salle</th>
										<th>Statut</th>
									</tr>
								</thead>

								<tbody>

									<c:forEach var="r" items="${reservations}">
										<tr>
											<td>${r.date}</td>
											<td>${r.heureDebut}</td>
											<td>${r.heureFin}</td>
											<td>${r.salleId}</td>
											<td>
												<span class="badge bg-success">${r.statut}</span>
											</td>
										</tr>
									</c:forEach>

								</tbody>

							</table>

						</div>

					</div>

					<!-- POPUP SWEETALERT -->
					<% String msg=request.getParameter("msg"); %>

						<script>
							let msg = "<%= msg %>";

							if (msg === "success") {
								Swal.fire({
									icon: 'success',
									title: 'Réservation réussie',
									showConfirmButton: false,
									timer: 1500
								});
							}

							if (msg === "error") {
								Swal.fire({
									icon: 'error',
									title: 'Salle occupée',
									timer: 1500
								});
							}
						</script>

						<!-- JS -->
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

									.then(r => r.text())
									.then(data => {

										if (data === "OK") {
											document.getElementById("reserveBtn").disabled = false;
											Swal.fire("Disponible", "Salle libre", "success");
										} else {
											document.getElementById("reserveBtn").disabled = true;
											Swal.fire("Occupée", "Salle déjà réservée", "error");
										}
									});
							}
						</script>

				</body>

				</html>