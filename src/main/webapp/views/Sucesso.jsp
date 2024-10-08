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
        
        /* Estilos para o botão */
        button {
            width: 100%;
            background-color: #5d3ebc;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            margin: 10px 0;
        }

        button:hover {
            background-color: #4a2ea3;
        }

        button:active {
            transform: translateY(1px);
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2>Produto "${nomeProduto}" cadastrado com sucesso!</h2>
        <p>Código do Produto: ${codigoProduto}</p>
        <p>Descrição: ${descricao}</p>
        <p>Preço: R$ ${preco}</p>
        <p>Quantidade: ${quantidade}</p>

        <button onclick="window.location.href='views/CadastrarProdutos.jsp'">Cadastrar novo produto</button>
        <button onclick="window.location.href='views/menu.jsp'">Página Inicial</button>
    </div>
</body>
</html>