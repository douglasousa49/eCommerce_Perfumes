<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Verifica se a sessão existe e se o usuário é ADMIN
    session = request.getSession(false);
    if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
        response.sendRedirect("error.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Editar Cliente</title>
</head>
<body>
    <h1>Editar Cliente</h1>  
    
    <form action="<%=request.getContextPath()%>/clientes/update" method="post">
        
        <input type="text" name="id" readonly value="<%out.print(request.getAttribute("id"));%>">
		
		<label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="${cliente.nome}" required><br>
		
		<label for="email">Email:</label>
		<input type="text" id="email" name="email" value="${cliente.email}" required><br>
        
        <label for="telefone">Telefone:</label>
        <input type="text" id="telefone" name="telefone" value="${cliente.telefone}"><br>
        
        <label for="celular">Celular:</label>
        <input type="text" id="celular" name="celular" value="${cliente.celular}"><br>
        
        <label for="cep">CEP:</label>
        <input type="text" id="cep" name="cep" value="${cliente.cep}" required><br>
        
        <label for="endereco">Endereço:</label>
        <input type="text" id="endereco" name="endereco" value="${cliente.endereco}" required><br>
        
        <label for="numero">Número:</label>
        <input type="number" id="numero" name="numero" value="${cliente.numero}" required><br>
        
        <label for="complemento">Complemento:</label>
        <input type="text" id="complemento" name="complemento" value="${cliente.complemento}"><br>
        
        <label for="bairro">Bairro:</label>
        <input type="text" id="bairro" name="bairro" value="${cliente.bairro}" required><br>
        
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade" value="${cliente.cidade}" required><br>
        
        <label for="uf">UF:</label>
        <input type="text" id="uf" name="uf" value="${cliente.uf}" required><br>
        
        <button type="submit">Salvar</button>
    </form>
</body>
</html>