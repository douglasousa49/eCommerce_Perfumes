<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxis Cosmetic</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
    .dropdown-menu {
    display: none; /* Esconde o submenu por padrão */
    position: absolute;
    top: 100%; /* Exibe abaixo do botão */
    left: 0;
    background-color: #fff; /* Fundo do submenu */
    padding: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Sombra */
    list-style: none;
    border-radius: 4px;
    z-index: 10; /* Garante que o menu fique sobreposto */
    min-width: 150px; /* Para um tamanho mínimo adequado */
}

.dropdown:hover .dropdown-menu {
    display: block; /* Exibe o submenu ao passar o mouse */
}

.dropdown-menu li {
    margin: 5px 0;
}

.dropdown-menu li a {
    text-decoration: none;
    color: #333; /* Cor padrão dos links */
    display: block;
    padding: 5px 10px;
}

.dropdown-menu li a:hover {
    color: #fff; /* Cor ao passar o mouse */
    background-color: var(--text-color); /* Fundo ao passar o mouse */
}

.dropdown {
    position: relative; /* Para alinhar o submenu com o botão pai */
}
.nav-right {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}
.welcome-message {
    flex-grow: 1;  /* Garante que o elemento ocupe o espaço disponível */
    text-align: center;  /* Centraliza o texto */
    font-size: 16px;  /* Ajuste conforme necessário */
    font-weight: bold;  /* Ajuste conforme necessário */
}
    </style>
</head>
<body>
    <!-- Navbar -->
    <header>
        <div class="nav container">
            <div class="nav-left">
                <!-- Logo -->
                <a href="#" class="logo"></a> 
                <img src="img/Logo/LUXUS NOVO.png" alt="Logo" class="logo-icon">
            </div>
            <div class="nav-right">
    <% 
        String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;
        String userName = (session != null) ? (String) session.getAttribute("userName") : null;
    %>
    
    <% if (userRole == null ) { %>
        <!-- Botão de login se o usuário não estiver logado -->
        <a href="views/Login.jsp" class="btn-login">Entrar</a>
    <% } else { %>
        <!-- Exibição dinâmica para usuários logados -->  
        <div class="welcome-message">
            <span>Bem-vindo, <%= userName %>!</span>
        </div>
        
        <% if ("ADMIN".equals(userRole)) { %>
            <!-- Dropdown de Manutenção -->
            <div class="dropdown">
                <span class="menu-item">Cliente</span>
                <ul class="dropdown-menu">
                    <li><a href="views/clientes/ManutencaoCliente.jsp">Manutenção de Clientes</a></li>
                    <li><a href="views/clientes/ClienteListar.jsp">Listar Clientes</a></li>
                </ul>
            </div>
            <div class="dropdown">
                <span class="menu-item">Produto</span>
                <ul class="dropdown-menu">
                    <li><a href="views/produtos/CadastrarProduto.jsp">Cadastrar Produtos</a></li>
                    <li><a href="views/produtos/ManutencaoProduto.jsp">Manutenção de Produtos</a></li>
                </ul>
            </div>

            <!-- Dropdown de Relatórios -->
            <div class="dropdown">
                <span class="menu-item">Relatórios</span>
                <ul class="dropdown-menu">
                    <li><a href="views/Relatorio.jsp">Relatório Simples</a></li>
                    <li><a href="views/RelatorioDetalhado.jsp">Relatório Detalhado</a></li>
                </ul>
            </div>
        <% } %>


                    <!-- Botão de logout -->
                   <a href="<%= request.getContextPath() %>/Logout" class="btn-logout">Sair</a>
                <% } %> 

                <!-- Carrinho de compras -->
                <i class='bx bx-shopping-bag' id="cart-icon" data-quantity="0"></i>
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
                    <% if (userRole == null) { %>
                        <!-- Caso não esteja logado, redireciona para login -->
                        <button type="button" class="btn-buy" onclick="window.location.href='views/Login.jsp'">Fazer Pedido</button>
                    <% } else { %>
                        <!-- Caso esteja logado, leva para a página de finalizar pedido -->
                        <button type="button" class="btn-buy" onclick="window.location.href='<%= request.getContextPath() %>/views/FinalizarPedido.jsp'">Pague Agora</button>
                    <% } %>
                    <!-- Fechar Carrinho -->
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
                <span class="price">R$559.99</span> 
                <i class="bx bx-shopping-bag add-cart"></i>
            </div>
            <!-- box 2 -->
            <div class="product-box">
                <img src="img/Masculino/212 Vip Black – Carolina Herrera.jpg" alt=""
                    class="product-img">
                <h2 class="product-title">212 Vip Black – Carolina Herrera</h2>
                <span class="price">R$579.99</span> 
                <i class="bx bx-shopping-bag add-cart"></i>
            </div>
            <!-- box 3 -->
            <div class="product-box">
                <img src="img/Masculino/Invictus – Paco Rabanne.jpg" alt=""
                    class="product-img">
                <h2 class="product-title">Invictus – Paco Rabanne</h2>
                <span class="price">R$629.99</span> 
                <i class="bx bx-shopping-bag add-cart"></i>
            </div>
            <!-- box 4 -->
            <div class="product-box">
                <img src="img/Feminino/La Vie Est Belle – Lancôme.jpg" alt=""
                    class="product-img">
                <h2 class="product-title">La Vie Est Belle – Lancôme</h2>
                <span class="price">R$569.99</span> 
                <i class="bx bx-shopping-bag add-cart"></i>
            </div>
            <!-- box 5 -->
            <div class="product-box">
                <img src="img/Feminino/Olympéa Intense – Paco Rabanne.jpg" alt=""
                    class="product-img">
                <h2 class="product-title">Olympéa Intense – Paco Rabanne</h2>
                <span class="price">R$329.99</span> 
                <i class="bx bx-shopping-bag add-cart"></i>
            </div>
        </div>
    </section>

    <!-- Link JS -->
    <script src="js/main.js"></script>
</body>
</html>