<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.eCommerce_Perfumes.webjbdc.model.Produto" %>
<%@ page import="br.com.eCommerce_Perfumes.webjbdc.model.ProdutoItem" %>
<%@ page import="br.com.eCommerce_Perfumes.webjbdc.model.Cliente" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizar Pedido - Luxus Cosmetic</title>
    <style>
    /* Reset de estilo padrão */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Corpo da página */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    color: #333;
}

/* Container geral */
.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
}

/* Navbar */
header {
    background-color: #fff;
    padding: 20px 0;
}

.logo-icon {
    width: 150px;
}

/* Estilo para a seção de finalizar pedido */
.checkout {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 30px;
    margin-top: 20px;
}

.section-title {
    text-align: center;
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

/* Conteúdo da seção de checkout */
.checkout-content {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap; /* Para garantir que o conteúdo se ajuste em telas menores */
}

.order-summary, .shipping-info, .payment-method {
    width: 48%;
    margin-bottom: 20px; /* Adiciona um pequeno espaçamento entre as colunas */
}

.order-summary {
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
}

.order-items {
    margin-bottom: 20px;
}

.order-item {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #ddd;
}

.order-total {
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    padding-top: 10px;
}

.shipping-info form, .payment-method form {
    display: flex;
    flex-direction: column;
}

.shipping-info label, .payment-method label {
    margin-bottom: 8px;
    font-weight: bold;
}

/* Aumenta o espaçamento entre os campos de formulário */
.shipping-info input, .payment-method input {
    padding: 12px;
    margin-bottom: 20px; /* Ajustado para maior espaçamento entre os campos */
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* Botão de finalização */
.checkout-actions {
    display: flex;
    justify-content: center;
    margin-top: 20px; /* Espaçamento para o botão ficar afastado dos campos */
}

.btn-submit {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 15px 30px;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
    max-width: 300px;
}

.btn-submit:hover {
    background-color: #218838;
}
    </style>
</head>
<body>
    <!-- Navbar -->
    <header>
        <div class="nav container">
            <div class="nav-left">
                <a href="index.jsp" class="logo">
                    <img src="<%=request.getContextPath()%>/img/Logo/LUXUS NOVO.png" alt="Logo" class="logo-icon">
                </a>
            </div>
        </div>
    </header>

    <!-- Seção de Finalizar Pedido -->
<section class="checkout container">
    <h2 class="section-title">Finalizar Pedido</h2>
    
    <div class="checkout-content">
        <!-- Resumo do Pedido -->
        <div class="order-summary">
            <h3>Resumo do Pedido</h3>
            <div class="order-items">
                <%-- Exibir os produtos do carrinho --%>
                <%
                List<ProdutoItem> produtosCarrinho = (List<ProdutoItem>) request.getAttribute("produtosCarrinho");
                BigDecimal total = BigDecimal.ZERO;

                if (produtosCarrinho != null && !produtosCarrinho.isEmpty()) {
                    for (ProdutoItem item : produtosCarrinho) {
                        // Recupera o subtotal do ProdutoItem
                        BigDecimal subtotal = item.getSubtotal().setScale(2, RoundingMode.HALF_UP); // Arredondamento

                        // Soma o subtotal ao total
                        total = total.add(subtotal);

                        // Exibe informações do item
                %>
                        <div class="order-item">
                            <span>Produto ID: <%= item.getProdutoId() %></span>
                            <span>Subtotal: R$ <%= subtotal %></span>
                            <span>Qtd: <%= item.getQuantidade() %></span>
                        </div>
                <%
                    }
                %>
                    <div class="order-total">
                        <span>Total</span>
                        <span>R$ <%= total.setScale(2, RoundingMode.HALF_UP) %></span> <!-- Total com 2 casas decimais -->
                    </div>
                <%
                } else {
                %>
                    <p>O carrinho está vazio.</p>
                <%
                }
                %>
            </div>
        </div>
    </div>
</section>

           <!-- Seção de Informações de Envio -->
<div class="shipping-info">
    <h3>Informações de Envio</h3>

    <!-- Não é mais um formulário para preenchimento, apenas envio de dados -->
    <form action="${pageContext.request.contextPath}/finalizarPedido" method="post">
        <% Cliente cliente = (Cliente) request.getAttribute("cliente"); %>

        <label for="id">ID</label>
        <input type="text" id="id" name="id" value="<%= cliente != null ? cliente.getId() : "" %>" readonly>

        <label for="nome">Nome Completo</label>
        <input type="text" id="nome" name="nome" value="<%= cliente != null ? cliente.getNome() : "" %>" readonly>

        <label for="cpf">CPF</label>
        <input type="text" id="cpf" name="cpf" value="<%= cliente != null ? cliente.getCpf() : "" %>" readonly>

        <label for="email">E-mail</label>
        <input type="email" id="email" name="email" value="<%= cliente != null ? cliente.getEmail() : "" %>" readonly>

        <label for="celular">Celular</label>
        <input type="text" id="celular" name="celular" value="<%= cliente != null ? cliente.getCelular() : "" %>" readonly>

        <label for="cep">CEP</label>
        <input type="text" id="cep" name="cep" value="<%= cliente != null ? cliente.getCep() : "" %>" readonly>

        <label for="endereco">Endereço</label>
        <input type="text" id="endereco" name="endereco" value="<%= cliente != null ? cliente.getEndereco() : "" %>" readonly>

        <label for="numero">Número</label>
        <input type="number" id="numero" name="numero" value="<%= cliente != null ? cliente.getNumero() : "" %>" readonly>

        <label for="complemento">Complemento</label>
        <input type="text" id="complemento" name="complemento" value="<%= cliente != null ? cliente.getComplemento() : "" %>" readonly>

        <label for="bairro">Bairro</label>
        <input type="text" id="bairro" name="bairro" value="<%= cliente != null ? cliente.getBairro() : "" %>" readonly>

        <label for="cidade">Cidade</label>
        <input type="text" id="cidade" name="cidade" value="<%= cliente != null ? cliente.getCidade() : "" %>" readonly>

        <label for="uf">Estado</label>
        <input type="text" id="uf" name="uf" value="<%= cliente != null ? cliente.getUf() : "" %>" readonly>

        <!-- Campos ocultos para envio -->
        <input type="hidden" name="usuarioId" value="<%= cliente != null ? cliente.getId() : "" %>">
        <input type="hidden" name="totalVenda" value="<%= total != null ? total : "0" %>">
        <input type="hidden" name="observacoes" value="Sem observações">

        <button type="submit">Finalizar Pedido</button>
    </form>
</div>


</body>
</html>