<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Connexion utilisateur</h2>

<form method="post" action="LoginServlet">

    <label>Email :</label>
    <input type="email" name="email" required />
    <br><br>

    <label>Password :</label>
    <input type="password" name="password" required />
    <br><br>

    <button type="submit">Login</button>

</form>
</body>
</html>