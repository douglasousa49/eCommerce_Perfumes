<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório Resumido - Vendas por Cliente</title>
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
        .custom-label {
    		background-color: #5d3ebc;
    		color: white;
    		padding: 10px 15px;
    		border: none;
    		border-radius: 4px;
    		display: inline-block; /* Para garantir que o estilo se aplique corretamente */
		}
</style>
</head>
<body>
    <h1>Relatório Resumido</h1>

    <!-- Formulário para selecionar a data -->
    <form action="RelatorioServlet" method="get">
        <label for="data" class="custom-label">Selecione a data:</label>
		<input type="date" id="data" name="data">
        <button type="submit">Gerar Relatório</button>
        <button type="button" onclick="window.location.href='Index.jsp'">Página Incial</button>
    </form>

    <!-- Tabela de resumo de vendas por cliente -->
    <table>
        <thead>
            <tr>
                <th>Cliente</th>
                <th>Pedido</th>
                <th>Valor Total</th>
            </tr>
        </thead>
        <tbody>
            <%-- Exibe o resumo das vendas por cliente --%>
            <c:forEach items="${resumoVendas}" var="resumo">
                <tr>
                    <td>${resumo.clienteNome}</td>
                    <td>${resumo.produto}</td>
                    <td>${resumo.quantidade}</td>
                    <td>R$ ${resumo.valorTotal}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${resumoVendas.size() == 0}">
        <p>Nenhuma venda encontrada para a data selecionada.</p>
    </c:if>

</body>
</html>