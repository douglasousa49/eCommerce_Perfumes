<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.eCommerce_Perfumes.model.Produto" %>

<%
    // Verificar se o usuário está logado e se possui o papel ADMIN
    String userRole = (String) session.getAttribute("userRole");
    if (!"ADMIN".equals(userRole)) {
        // Redireciona para uma página de erro ou de login se não for ADMIN
        response.sendRedirect("error.jsp");
        return; // Para garantir que a execução pare aqui
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
        <button class="search-btn" onclick="window.location.href='CadastrarCliente.jsp'">Consultar Cliente</button>
        <button type="button" onclick="window.location.href='Index.jsp'">Página Incial</button>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%-- Loop pelos clientes e exibição dos dados --%>
            <c:forEach items="${clientes}" var="cliente">
                <tr>
                    <td>${cliente.id}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.telefone}</td>
                    <td>
                        <button class="action-btn edit-btn"
                            onclick="window.location.href='CadastrarClientes.jsp'">
                            Editar
                        </button>
                        <button class="action-btn delete-btn"
                            onclick="window.location.href='CadastrarClientes.jsp'">
                            Excluir
                        </button>
                    </td>
                </tr>
            </c:forEach>

            <%
                List<Produto> clientes = (List<Produto>) request.getAttribute("clientes");
                if (clientes == null || clientes.isEmpty()) {
            %>
                <tr>
                    <td colspan="5" style="text-align:center;">Nenhum cliente encontrado.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>