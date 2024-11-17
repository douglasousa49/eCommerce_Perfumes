<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Luxis Cosmetic</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

</head>
<body>
	<!-- Navbar -->
	<header>
		<div class="nav container">
			<div class="nav-left">
			<!-- Logo -->
			<a href="#" class="logo"></a> <img src="img/Logo/LUXUS NOVO.png"
				alt="Logo" class="logo-icon">
			</div>
			<div class="nav-right">
			<!-- Entrar -->
			<a href="views/Login.jsp" class="btn-login">Entrar</a>
			<!--Carrinho-Icon -->
			<i class='bx bx-shopping-bag' id="cart-icon" data-quantitiy="0"></i>	
			<!-- carrinho -->
			<div class="cart">
				<h2 class="cart-title">Seu Carrinho</h2>
				<!-- content -->
				<div class="cart-content"></div>
				<!-- total -->
				<div class="total">
					<div class="total-title">Total</div>
					<div class="total-price">R$0</div>
				</div>
				<!-- Botão de Compra -->
				<button type="button" class="btn-buy">Pague Agora</button>
				<!-- Fechar Carrinho-->
				<i class="bx bx-x" id="close-cart"></i>
			</div>
			</div>
		</div>
	</header>
	<!-- Produtos -->
	<section class="shop container">
		<h2 class="section-title">Produtos da loja</h2>
		<!-- Conteúdo da Loja -->
		<div class="shop-content">
			<!-- box 1 -->
			<div class="product-box">
				<img src="img/Masculino/1 Million – Paco Rabanne.jpg" alt=""
					class="product-img">
				<h2 class="product-title">1 Milion - Paco Rabanne</h2>
				<span class="price">R$559.99</span> <i
					class="bx bx-shopping-bag add-cart"></i>
			</div>
			<!-- box 2 -->
			<div class="product-box">
				<img src="img/Masculino/212 Vip Black – Carolina Herrera.jpg" alt=""
					class="product-img">
				<h2 class="product-title">212 Vip Black – Carolina Herrera</h2>
				<span class="price">R$579.99</span> <i
					class="bx bx-shopping-bag add-cart"></i>
			</div>
			<!-- box 3 -->
			<div class="product-box">
				<img src="img/Masculino/Invictus – Paco Rabanne.jpg" alt=""
					class="product-img">
				<h2 class="product-title">Invictus – Paco Rabanne</h2>
				<span class="price">R$629.99</span> <i
					class="bx bx-shopping-bag add-cart"></i>
			</div>
			<!-- box 4 -->
			<div class="product-box">
				<img src="img/Feminino/La Vie Est Belle en Rose – Lancôme.jpg"
					alt="" class="product-img">
				<h2 class="product-title">La Vie Est Belle en Rose – Lancôme</h2>
				<span class="price">R$569.99</span> <i
					class="bx bx-shopping-bag add-cart"></i>
			</div>
			<!-- box 5 -->
			<div class="product-box">
				<img src="img/Feminino/Olympéa Intense – Paco Rabanne.jpg" alt=""
					class="product-img">
				<h2 class="product-title">Olympéa Intense – Paco Rabanne</h2>
				<span class="price">R$329.99</span> <i
					class="bx bx-shopping-bag add-cart"></i>
			</div>
		</div>
	</section>
	<!-- Link JS -->
	<script src="js/main.js"></script>
</body>
</html>