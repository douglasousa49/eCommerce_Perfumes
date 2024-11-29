<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produto Cadastrado</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div class="sc-container">
		<h1>Produto cadastrado com sucesso</h1>
		<p></p>
		<img src="${pageContext.request.contextPath}/img/Logo/success.png" alt="">
		<a href="#" class="sc-btn" onclick="window.location.href='<%=request.getContextPath() %>/Index.jsp'">Voltar Para o Menu</a>
	</div>
</body>
</html>