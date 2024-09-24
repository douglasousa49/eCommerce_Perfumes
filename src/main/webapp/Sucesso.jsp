<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro Realizado</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .message-container {
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #5d3ebc;
        }

        a {
            text-decoration: none;
            color: #5d3ebc;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2>Produto "<%= request.getAttribute("nomeProduto") %>" cadastrado com sucesso!</h2>
        <p><a href="cadastrarProduto.jsp">Cadastrar novo produto</a></p>
    </div>
</body>
</html>