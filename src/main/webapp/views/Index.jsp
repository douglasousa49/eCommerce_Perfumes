<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem-Vindo ao Luxis Cosmetic</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            text-align: center;
        }
        h1 {
            color: #5d3ebc;
            margin-bottom: 30px;
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
            transition: background-color 0.3s;
        }
        .menu a:hover {
            background-color: #4a2ea3;
        }
    </style>
</head>
<body>
    <h1>Bem-Vindo ao Luxis Cosmetic</h1>
    <div class="menu">
        <%
            // Obtendo a sessão atual
            session = request.getSession(false);
            String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;

            if ("ADMIN".equals(userRole)) {
        %>
        	<a href="CadastrarProdutos.jsp">Cadastrar Produtos</a>
        	<a href="CadastrarClientes.jsp">Cadastrar Clientes</a>
        	<a href="ManutencaoClientes.jsp">Manutenção Clientes</a>
            <a href="produtos.jsp">Visualizar Produtos</a>
            <a href="RelatorioDetalhado.jsp">Gerar Relatório</a>
        <%
            } else if ("CLIENT".equals(userRole)) {
        %>
            <a href="CadastrarClientes.jsp">Cadastre-se</a>
            <a href="comprarProdutos.jsp">Comprar Produtos</a>
            <a href="produtos.jsp">Visualizar Produtos</a>
        <%
            } else {
        %>
            <a href="login.jsp">Login</a>
        <%
            }
        %>
    </div>
</body>
</html>