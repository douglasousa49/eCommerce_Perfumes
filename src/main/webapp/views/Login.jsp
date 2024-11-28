<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #dcdcdc;
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
.input-container {
    position: relative;
    width: 94%;
    align-items: center; /* Alinha verticalmente o conteúdo */
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 0 auto 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}
input[type="password"] {
    padding-right: 35px; /* Espaço para o ícone de olho */
}
.eyes-icon {
    position: absolute;
    right: -30px;
    top: 57%;
    transform: translateY(-50%);
    cursor: pointer;
    font-size: 1.5rem;
    color: #666;
}

.eyes-icon:hover {
    color: var(--text-color);
}

button {
	width: 106%;
	background-color: #dcdcdc;
	color: var(--container-color);
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	cursor: pointer;
	margin: 10px 0;
}

button:hover {
	background-color: hsl(144, 32%, 45%);
}
</style>
<script>
function togglePasswordVisibility(id, iconId) {
	var senhaField = document.getElementById(id);
	var icon = document.getElementById(iconId);

	if (senhaField.type === "password") {
		senhaField.type = "text";
		icon.classList.replace("bx-hide", "bx-show");
	} else {
		senhaField.type = "password";
		icon.classList.replace("bx-show", "bx-hide");
	}
}
</script>
</head>
<body>
	<div class="form-container">
		<h2>Faça seu login</h2>
		<form action="/eCommerce_Perfumes/Login" method="post">
			<label for="email">E-mail</label> <input type="text" id="email"
				name="email" required placeholder="Digite seu e-mail">
			<div class="input-container">
				<label for="senha">Senha</label> <input type="password" id="senha"
					name="senha" required placeholder="Digite sua senha"> <i
					class='bx bx-hide eyes-icon' id="senha-icon"
					onclick="togglePasswordVisibility('senha', 'senha-icon')"></i>
			</div>
			<button type="submit">Confirmar</button>
			<button type="button"
				onclick="window.location.href='clientes/CadastrarCliente.jsp'">Cadastrar</button>
		</form>

		<%
		// Verifica se o parâmetro "error" está presente na solicitação
		String error = request.getParameter("error");
		if (error != null && error.equals("true")) {
		%>
		<div style="color: red;">
			<p>Email e/ou senha inválidos. Tente novamente.</p>
		</div>
		<%
		}
		%>

	</div>
</body>
</html>