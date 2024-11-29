<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.eCommerce_Perfumes.webjbdc.model.Produto" %>


<%
    // Obtém a sessão e o papel do usuário
    session = request.getSession(false);
    String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;

    // Verifica se o usuário é ADMIN, se não for, redireciona para login
    if (userRole == null || !userRole.equals("ADMIN")) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=accessDenied");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manutenção de Produtos</title>
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
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .delete-btn {
            background-color: #e74c3c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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
    <h1>Manutenção de Produtos</h1>

    <div class="button-container">
        <button class="add-btn" onclick="window.location.href='CadastrarProduto.jsp'">Incluir Novo Produto</button>
        <button class="search-btn" onclick="window.location.href='CadastrarProduto.jsp'">Consultar Produto</button>
        <button type="button" onclick="window.location.href='../Index.jsp'">Página Inicial</button>		
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Quantidade</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%-- Loop pelos clientes e exibição dos dados --%>
            <c:forEach items="${produto}" var="produto">
                <tr>
                    <td>${produto.codigoProduto}</td>
                    <td>${produto.nomeProduto}</td>
                    <td>${produto.descricao}</td>
                    <td>${produto.quantidade}</td>
                    <td>${produto.preco}</td>
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
                List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                if (produtos == null || produtos.isEmpty()) {
            %>
                <tr>
                    <td colspan="5" style="text-align:center;">Nenhum produto encontrado.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>