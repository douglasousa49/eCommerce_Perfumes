<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Compra de Produtos</title>
    <style>
        /* Estilos para o corpo */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center; /* Centraliza horizontalmente */
            align-items: center; /* Centraliza verticalmente */
            flex-direction: column; /* Empilha os elementos verticalmente */
            height: 100vh; /* Altura total da viewport */
            margin: 0; /* Remove margens padrão */
        }

        h2 {
            text-align: center; /* Centraliza o título */
            margin-bottom: 20px;
            width: 100%; /* Para ocupar toda a largura */
        }

        /* Estilo para o container de produtos */
        .produto {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* Espaço entre os produtos */
            width: 100%; /* Para ocupar toda a largura disponível */
            max-width: 400px; /* Limita a largura máxima */
        }

        label {
            font-size: 1rem;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #5d3ebc;
            outline: none;
        }

        /* Remove os botões de incremento e decremento */
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type="number"] {
            -moz-appearance: textfield;
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
    <h2>Selecione seus Produtos</h2>
    <c:forEach var="produto" items="${listaProdutos}">
        <div class="produto">
            <p><strong>Nome:</strong> ${produto.nome}</p>
            <p><strong>Preço:</strong> R$ ${produto.preco}</p>
            <p><strong>Estoque:</strong> ${produto.estoque}</p>
            <c:if test="${produto.estoque > 0}">
                <form action="CarrinhoServlet" method="post">
                    <input type="hidden" name="idProduto" value="${produto.id}">
                    <label for="quantidade">Quantidade:</label>
                    <input type="number" id="quantidade" name="quantidade" min="1" max="${produto.estoque}">
                    <button type="submit">Adicionar ao Carrinho</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</body>
</html>