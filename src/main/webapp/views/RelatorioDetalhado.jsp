<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório Detalhado - Produtos por Venda</title>
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
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Relatório Detalhado</h1>

    <!-- Seleciona a venda específica -->
    <form action="RelatorioServlet" method="get">
        <label for="vendaId">Selecione a Venda:</label>
        <select id="vendaId" name="vendaId">
            <%-- Exibe as vendas disponíveis para seleção --%>
            <c:forEach items="${vendas}" var="venda">
                <option value="${venda.id}">Venda ID: ${venda.id} - Cliente: ${venda.clienteNome}</option>
            </c:forEach>
        </select>
        <button type="submit">Ver Detalhes</button>
    </form>

    <!-- Tabela de detalhes dos produtos da venda -->
    <table>
        <thead>
            <tr>
                <th>Produto</th>
                <th>Quantidade</th>
                <th>Preço Unitário</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <%-- Exibe os detalhes dos produtos comprados na venda selecionada --%>
            <c:forEach items="${detalhesProdutos}" var="produto">
                <tr>
                    <td>${produto.nome}</td>
                    <td>${produto.quantidade}</td>
                    <td>R$ ${produto.precoUnitario}</td>
                    <td>R$ ${produto.quantidade * produto.precoUnitario}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${detalhesProdutos.size() == 0}">
        <p>Nenhum detalhe encontrado para a venda selecionada.</p>
    </c:if>

</body>
</html>