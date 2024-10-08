<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Perfumaria</title>
    <style>
        /* Estilo geral da página */
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
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #5d3ebc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1c40f;
            color: white;
        }
        td input[type="checkbox"] {
            transform: scale(1.2);
        }
        button {
            background-color: #5d3ebc;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            display: block;
            width: 100%;
        }
        button:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <h1>Selecionar Produto</h1>
    <form action="PurchaseServlet" method="post">
        <table>
            <tr>
                <th>Nome do Produto</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Selecionar</th>
            </tr>
            <%-- Loop through the products and display them in a table --%>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td><input type="checkbox" name="selectedProducts" value="${product.id}"></td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit">Comprar</button>
    </form>
</body>
</html>
