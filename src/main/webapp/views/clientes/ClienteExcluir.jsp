<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Cliente</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h2>Excluir Cliente</h2>
    <p>Tem certeza de que deseja excluir o cliente?</p>
    <p>ID: ${cliente.idCliente}</p>
    <p>Nome: ${cliente.nome}</p>
    <p>Email: ${cliente.email}</p>
    <p>Celular: ${cliente.celular}</p>

    <form action="${pageContext.request.contextPath}/clientes/excluir" method="post">
        <input type="hidden" name="idCliente" value="${cliente.idCliente}"/>
        <input type="submit" value="Excluir Cliente"/>
    </form>
    <input type="button" value="Cancelar" onclick="window.location.href='${pageContext.request.contextPath}/clientes/listar';"/>
</body>
</html>