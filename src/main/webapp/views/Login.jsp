<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
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
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Faça seu login</h2>
        <form action="${pageContext.request.contextPath}/Login" method="post">
            <label for="email">E-mail</label>
            <input type="text" id="email" name="email" required placeholder="Digite seu e-mail">
            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required placeholder="Digite sua senha" />
            <button type="submit">Confirmar</button>
            <button type="button" onclick="window.location.href='CadastrarCliente.jsp'">Cadastrar</button>
        </form>
        
        <% 
        	// Verifica se o parâmetro "error" está presente na solicitação
        	String error = request.getParameter("error");
        	if (error != null && error.equals("true")) { 
    	%>
        	<div style="color: red;">
            	<p>Email e/ou senha inválidos. Tente novamente.</p>
        	</div>
    	<%}%>
    
    </div>
</body>
</html>