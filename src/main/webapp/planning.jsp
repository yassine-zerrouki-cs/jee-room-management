<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Planning des salles</title>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>

<style>
body{
    font-family: Arial;
    background:#f4f6f9;
}

#calendar{
    max-width: 1000px;
    margin: 40px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}
</style>

</head>

<body>

<h2 style="text-align:center;">📅 Planning des salles</h2>

<a href="${pageContext.request.contextPath}/DashboardServlet">
⬅ Retour Dashboard
</a>

<div id="calendar"></div>

<script>

document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {

        initialView: 'dayGridMonth',

        events: [

            <c:forEach var="r" items="${reservations}">
            {
                title: "Salle ${r.salleId}",
                start: "${r.date}",
                color: "${r.statut == 'ACCEPTEE' ? 'green' : 'red'}"
            },
            </c:forEach>

        ]
    });

    calendar.render();
});

</script>

</body>
</html>