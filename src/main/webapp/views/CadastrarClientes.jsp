
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Clientes</title>
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
            margin-top: 300px;
            padding: 30px;
            padding-right: 53px;
            border-radius: 20px;
            box-shadow: 10px 4px 6px rgba(0, 0, 0, 0.1);
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
            width: 106%;
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
    <div class="form-container">
        <h2>Cadastrar Clientes</h2>
        <form action="CadastrarClientesServlet" method="post">
        
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required placeholder="Digite o nome do produto">

            <label for="rg">RG:</label>
            <input type="text" id="rg" name="rg" required placeholder="Digite o RG:">

            <label for="cpf">CPF</label>
            <input type="text" id="cpf" name="cpf" required placeholder="Digite o CPF:">
            
            <label for="e-mail">E-mail</label>
            <input type="text" id="e-mail" name="e-mail" required placeholder="Digite o E-mail:">
            
            <label for="telefone">Telefone</label>
            <input type="text" id="telefone" name="telefone" placeholder="Digite o telefone:">
            
            <label for="celular">Celular</label>
            <input type="text" id="celular" name="celular" required placeholder="Digite o celular:">
            
            <label for="cep">CEP</label>
            <input type="text" id="cep" name="cep" required placeholder="Digite o CEP:">
            
            <label for="endereco">Endereco</label>
            <input type="text" id="endereco" name="endereco" required placeholder="Digite o endereço:">

            <label for="numero">Numero</label>
            <input type="number" id="numero" name="numero" required placeholder="Digite o número:">
            
            <label for="complemento">Complemento</label>
            <input type="text" id="complemento" name="complemento" placeholder="Digite o complemento:">
            
            <label for="bairro">Bairro</label>
            <input type="text" id="bairro" name="bairro" required placeholder="Digite o bairro:">
            
            <label for="cidade">Cidade</label>
            <input type="text" id="cidade" name="cidade" required placeholder="Digite a cidade:">
            
            <label for="uf">UF</label>
            <input type="text" id="uf" name="uf" required placeholder="Digite o UF:">

            <button type="submit">Cadastrar</button>
        </form>
    </div>
</body>
</html>