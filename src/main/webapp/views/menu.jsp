<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Luxis Cosmetic</title>
<style>
body {
	font-family: 'Arial', sans-serif; /* Fonte do texto */
	background-color: #f0f2f5; /* Cor de fundo */
	display: flex; /* se o elemento é exibido e o espaço é reservado para ele. */
	flex-direction: column; /* Define como os itens são colocados no container*/
	align-items: center; /* Alinhar os itens */
	justify-content: center;
	height: 100vh;
	margin: 0;
}

h1 {
	margin-bottom: 30px; 
	color: #5d3ebc;
}

.menu {
	display: flex;
	 
	flex-direction: column;
	align-items: center;
}

.menu a {
	text-decoration: none;
	background-color: #5d3ebc;
	color: white;
	padding: 15px 25px;
	border-radius: 5px;
	margin: 10px 0;
	width: 200px;
	text-align: center;
	transition: background-color 0.3s;
}

.menu a:hover {
backgroud-color: #4a2ea3;
}

</style>
</head>
<body>
	<h1>Bem-Vindo ao Luxis Cosmetic</h1>
	<div class="menu">
		<a href="login.jsp">Login</a>
	</div>
</body>
</html>