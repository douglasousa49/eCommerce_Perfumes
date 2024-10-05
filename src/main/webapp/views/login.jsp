<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
            padding-right: 53px;
            border-radius: 20px;
            box-shadow: 10px 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        label {
            font-size: 1rem;
            display: block;
            margin-bottom: 5px;
            text-align: left;
            width: 100%;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 0 auto 15px;
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
            margin: 0 auto;
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
        <h2>Faça seu login:</h2>
        <form action="LoginServlet" method="post">
            <label for="email">E-mail</label>
            <input type="text" id="email" name="email" required placeholder="Digite seu e-mail">

            <label for="senha" >Senha: </label>
<input type="password" id="senha" name="senha" style="display: block;" />

            <button type="submit">Confirmar</button>
        </form>
    </div>
</body>
</html>