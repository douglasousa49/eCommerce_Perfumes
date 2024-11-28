<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Clientes</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #dcdcdc;
	margin: 0;
	font-family: Arial, sans-serif;
}

.form-container {
	background-color: #fff;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	max-width: 600px;
	width: 100%;
	text-align: center;
	position: relative;
}

.logo-container img {
	max-width: 300px;
	margin: 0 auto 20px;
	display: block;
}

h2 {
	margin-bottom: 15px;
	font-size: 1.5rem;
	color: #333333;
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 10px;
}

.form-grid .full-width {
	grid-column: 1/-1; /* Faz o elemento ocupar toda a linha */
}

label {
	font-size: 0.9rem;
	color: #555555;
	margin-bottom: 5px;
}

input[type="text"], input[type="number"], input[type="password"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #cccccc;
	border-radius: 5px;
	font-size: 0.9rem;
	box-sizing: border-box;
}

.input-container {
	position: relative;
	width: 100%;
}

.eyes-icon {
	position: absolute;
	right: 10px; /* Posição do ícone de olho */
	top: 67%;
	transform: translateY(-50%);
	cursor: pointer;
	font-size: 1.5rem; /* Tamanho do ícone */
	color: #666;
}

.eyes-icon:hover {
	color: var(--text-color);
}

button {
	width: 100%;
	padding: 10px;
	background-color: #02ac70;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 0.9rem;
	cursor: pointer;
}

button:hover {
	background-color: #028a5a;
}

.back {
	display: block; /* Faz o link se comportar como um bloco */
    margin: 20px auto 0; /* Centraliza com margem superior e inferior */
    text-align: center;
	font-size: 0.9rem;
	color: #007bff;
	text-decoration: none;
}

.back:hover {
	text-decoration: underline;
}
</style>

<!-- JAVASCRIPT -->
<script>
	// Função para validar as senhas
	function validarSenha() {
		var senha = document.getElementById("senha").value;
		var confirmarSenha = document.getElementById("confirmarSenha").value;

		if (senha !== confirmarSenha) {
			alert("As senhas não coincidem.");
			return false;
		}
		return true;
	}

	// Função para alternar a visibilidade da senha
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
	function removeNumbers(input) {
		input.value = input.value.replace(/[0-9]/g, ''); // Substitui números por vazio
	}

	// Máscara para RG (ex: 12.345.678-9)
	function formatRG(input) {
		let value = input.value.replace(/\D/g, ''); // Remove caracteres não numéricos
		value = value.replace(/^(\d{2})(\d)/, '$1.$2'); // Primeiro ponto
		value = value.replace(/(\.\d{3})(\d)/, '$1.$2'); // Segundo ponto
		value = value.replace(/(\.\d{3})(\d{1,1})$/, '$1-$2'); // Hífen
		input.value = value;
	}

	// Máscara para CPF (ex: 123.456.789-00)
	function formatCPF(input) {
		let value = input.value.replace(/\D/g, ''); // Remove caracteres não numéricos
		value = value.replace(/^(\d{3})(\d)/, '$1.$2'); // Primeiro ponto
		value = value.replace(/(\.\d{3})(\d)/, '$1.$2'); // Segundo ponto
		value = value.replace(/(\.\d{3})(\d{2})$/, '$1-$2'); // Hífen
		input.value = value;
	}

	// Máscara para Telefone (ex: (12) 34567-8900)
	function formatTelefone(input) {
		let value = input.value.replace(/\D/g, ''); // Remove caracteres não numéricos
		value = value.replace(/^(\d{2})(\d)/, '($1) $2'); // Parênteses para DDD
		value = value.replace(/(\d{4})(\d)/, '$1-$2'); // Hífen no número
		input.value = value;
	}
	
	function formatCelular(input) {
		let value = input.value.replace(/\D/g, ''); // Remove caracteres não numéricos
		value = value.replace(/^(\d{2})(\d)/, '($1) $2'); // Parênteses para DDD
		value = value.replace(/(\d{5})(\d)/, '$1-$2'); // Hífen no número
		input.value = value;
	}
	
	// Máscara para CEP (ex: 04860-080)
	function formatCEP(input) {
		let value = input.value.replace(/\D/g, '');
		value = value.replace(/(\d{5})(\d)/, '$1-$2');
		input.value = value;
	}
</script>
</head>
<body>
	<div class="form-container">
		<!-- Logo -->
		<div class="logo-container">
			<img src="<%=request.getContextPath()%>/img/Logo/LUXUS NOVO.png"
				alt="Logo Luxus Cosmetics">
		</div>

		<h2>Faça seu cadastro</h2>
		<form action="<%=request.getContextPath()%>/clientes/novo" method="post" onsubmit="return validarSenha()">

			<div class="form-grid">
				<div class="full-width">
					<label for="nome">Nome</label> <input type="text" id="nome"
						name="nome" required placeholder="Digite seu nome"
						oninput="removeNumbers(this)">
				</div>
				<div class="full-width">
					<label for="email">E-mail</label> <input type="text" id="email"
						name="email" required placeholder="Digite o e-mail">
				</div>

				<div class="input-container">
					<label for="senha">Senha</label> <input type="password" id="senha"
						name="senha" required placeholder="Digite sua senha"> <i
						class='bx bx-hide eyes-icon' id="senha-icon"
						onclick="togglePasswordVisibility('senha', 'senha-icon')"></i>
				</div>

				<div class="input-container">
					<label for="confirmarSenha">Confirmar Senha</label> <input
						type="password" id="confirmarSenha" name="confirmarSenha" required
						placeholder="Confirme sua senha"> <i
						class='bx bx-hide eyes-icon' id="confirmarSenha-icon"
						onclick="togglePasswordVisibility('confirmarSenha', 'confirmarSenha-icon')"></i>
				</div>

				<div>
					<label for="rg">RG</label> <input type="text" id="rg" name="rg"
						required placeholder="Digite o RG" maxlength="12"
						oninput="formatRG(this)">
				</div>
				<div>
					<label for="cpf">CPF</label> <input type="text" id="cpf" name="cpf"
						required placeholder="Digite o CPF" maxlength="14"
						oninput="formatCPF(this)">
				</div>
				<div>
					<label for="telefone">Telefone</label> <input type="text"
						id="telefone" name="telefone" placeholder="Digite o telefone"
						maxlength="14" oninput="formatTelefone(this)">
				</div>
				<div>
					<label for="celular">Celular</label> <input type="text"
						id="celular" name="celular" placeholder="Digite o celular"
						maxlength="15" oninput="formatCelular(this)">
				</div>
				<div>
					<label for="cep">CEP</label> <input type="text" id="cep" name="cep"
						required maxlength="9" placeholder="Digite o CEP"
						oninput="formatCEP(this)">
				</div>
				<div>
					<label for="endereco">Endereço</label> <input type="text"
						id="endereco" name="endereco" placeholder="Digite o endereço"
						required>
				</div>
				<div>
					<label for="numero">Número</label> <input type="number" id="numero"
						name="numero" placeholder="Digite o número" required>
				</div>
				<div>
					<label for="complemento">Complemento</label> <input type="text"
						id="complemento" name="complemento"
						placeholder="Digite o complemento" required>
				</div>
				<div>
					<label for="bairro">Bairro</label> <input type="text" id="bairro"
						name="bairro" placeholder="Digite o bairro" required>
				</div>
				<div>
					<label for="cidade">Cidade</label> <input type="text" id="cidade"
						name="cidade" placeholder="Digite a cidade" required>
				</div>
				<div>
					<label for="uf">UF</label> <input type="text" id="uf" name="uf"
						placeholder="Digite o UF" required>
				</div>
				<div class="full-width">
					<button type="submit">Cadastrar</button>
				</div>
				<div class="full-width">
					<button type="button" onclick="window.location.href='<%=request.getContextPath() %>/Index.jsp'">Página
						Inicial</button>
				</div>
			</div>
		</form>
		<!-- Link para voltar -->
				<a href="<%=request.getContextPath()%>/views/Login.jsp"
					class="back">← Voltar</a>
	</div>
</body>
</html>