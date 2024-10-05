
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Produto</title>
    <style>
        /* Estilos para o formulário */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
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
    <div class="form-container">
        <h2>Cadastrar Produto</h2>
        <form action="CadastrarProdutoServlet" method="post">
            <label for="codigoProduto">Codigo do Produto</label>
            <input type="text" id="codigoProduto" name="codigoProduto" required placeholder="Digite o codigo do produto">

            <label for="nome">Nome do Produto</label>
            <input type="text" id="nome" name="nome" required placeholder="Digite o nome do produto">

            <label for="descricao">Descrição</label>
            <input type="text" id="descricao" name="descricao" required placeholder="Digite uma breve descrição">

            <label for="preco">Preço (R$)</label>
            <input type="text" id="preco" name="preco" required placeholder="Ex: 99,99">

            <label for="quantidade">Quantidade</label>
            <input type="number" id="quantidade" name="quantidade" required placeholder="Digite a quantidade disponível">

            <button type="submit">Cadastrar Produto</button>
        </form>
        <h3>Lista de Produtos</h3>
        <!-- Aqui você pode listar os produtos com opções de alterar/excluir -->
    </div>
</body>
</html>
