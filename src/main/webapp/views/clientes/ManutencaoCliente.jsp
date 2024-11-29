<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    String userRole = (String) session.getAttribute("userRole");
    String userName = (String) session.getAttribute("userName");
%>

<%
    // Verifica se a sessão existe
    session = request.getSession(false);
    if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
        // Redireciona para uma página de erro se o usuário não for ADMIN
        response.sendRedirect("error.jsp");
        return; // Garante que o código após isso não seja executado
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manutenção de Clientes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #5d3ebc;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #3498db;
            color: white;
        }
        .delete-btn {
            background-color: #e74c3c;
            color: white;
        }
        .add-btn {
            background-color: #2ecc71;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .search-btn {
            background-color: #808080;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-container {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }
        .disabled-btn {
            background-color: #95a5a6;
            color: white;
            cursor: not-allowed;
        }
        button {
            background-color: #5d3ebc;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Manutenção de Clientes</h1>

    <div class="button-container">
        <button class="add-btn" onclick="window.location.href='CadastrarCliente.jsp'">Incluir Novo Cliente</button>
        <button type="button" onclick="window.location.href='../Index.jsp'">Página Inicial</button> 
    </div>
	<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Celular</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
            <c:forEach var="cliente" items="${listaClientes}">
                <tr>
                    <td>${cliente.id}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.celular}</td>
                    <td>
                        <button class="action-btn edit-btn"
                                onclick="window.location.href='/eCommerce_Perfumes/clientes/editar?id=${cliente.id}'">
                            Editar
                        </button>
                        <form action="/eCommerce_Perfumes/clientes/excluir" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${cliente.id}">
                            <button class="action-btn delete-btn">Excluir</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5" style="text-align:center;">Nenhum cliente encontrado.</td>
            </tr>
    </tbody>
</table>
</body>
</html>