<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edição de Cliente</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h2>Edição de Cliente</h2>    
    <form action="${pageContext.request.contextPath}/clientes/update" method="post">
    <input type="hidden" name="idCliente" value="${cliente.idCliente}"/>
    <p>Nome: ${cliente.nome}</p>
    <p>Email: ${cliente.email}</p>
    <p>Celular: ${cliente.celular}</p>
    Novo Nome: <input type="text" name="nome" value="${cliente.nome}" required/><br>
    Novo Email: <input type="text" name="email" value="${cliente.email}" required/><br>
    Novo Celular: <input type="text" name="celular" value="${cliente.celular}" required/><br>
    <input type="submit" value="Salvar Alterações"/>
    <input type="button" value="Cancelar" onclick="window.location.href='listar'"/>
</form> 
</body>
</html>