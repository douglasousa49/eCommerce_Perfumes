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
        form {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
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
            background-color: #5d3ebc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        button {
            background-color: #5d3ebc;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #472a8a;
        }
        .custom-label {
            font-weight: bold;
        }
        input[type="date"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>Relatório Detalhado</h1>

    <!-- Formulário para selecionar o período -->
    <form action="RelatorioServlet" method="get">
        <div>
            <label for="dataInicio" class="custom-label">Data de Início:</label>
            <input type="date" id="dataInicio" name="dataInicio" required>
        </div>
        <div>
            <label for="dataFim" class="custom-label">Data de Fim:</label>
            <input type="date" id="dataFim" name="dataFim" required>
        </div>
        <div>
            <button type="submit">Ver Relatório</button>
            <button type="button" onclick="window.location.href='Index.jsp'">Página Inicial</button>
        </div>
    </form>

    <!-- Tabela de detalhes dos produtos das vendas -->
    <table>
        <thead>
            <tr>
                <th>ID Venda</th>
                <th>Cliente</th>
                <th>Data</th>
                <th>Produto</th>
                <th>Quantidade</th>
                <th>Preço Unitário</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <%-- Exibe os detalhes das vendas e produtos associados --%>
            <c:forEach items="${vendas}" var="venda">
                <c:forEach items="${venda.produtos}" var="produto">
                    <tr>
                        <td>${venda.id}</td>
                        <td>${venda.clienteNome}</td>
                        <td>${venda.dataVenda}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.quantidade}</td>
                        <td>R$ ${produto.precoUnitario}</td>
                        <td>R$ ${produto.quantidade * produto.precoUnitario}</td>
                    </tr>
                </c:forEach>
            </c:forEach>
        </tbody>
    </table>

    <!-- Mensagem caso nenhuma venda seja encontrada -->
    <c:if test="${vendas == null || vendas.size() == 0}">
        <p style="text-align: center; color: red; margin-top: 20px;">
            Nenhuma venda encontrada no período especificado.
        </p>
    </c:if>
</body>
</html>