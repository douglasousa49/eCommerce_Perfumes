//Abrir  fechar carrinho
let cartIcon = document.querySelector("#cart-icon");
let cart = document.querySelector(".cart");
let closeCart = document.querySelector("#close-cart");
// Abrir carrinho
cartIcon.onclick = () => {
	cart.classList.add("active");
}
// Fechar carrinho
closeCart.onclick = () => {
	cart.classList.remove("active");
}
// Fazendo adição do carrinho
// Carrinho trabalhando em JS
if (document.readyState == "loading") {
	document.addEventListener("DOMContentLoaded", ready);
} else {
	ready();
}

// Função de marcação
function ready() {
	// Remover item do carrinho
	var removeCartButtons = document.getElementsByClassName("cart-remove");
	for (var i = 0; i < removeCartButtons.length; i++) {
		var button = removeCartButtons[i];
		button.addEventListener("click", removeCartItem);
	}
	//mudança de quantidade
	var quantityInputs = document.getElementsByClassName("cart-quantity");
	for (var i = 0; i < quantityInputs.length; i++) {
		var input = quantityInputs[i];
		input.addEventListener("change", quantityChanged);
	}
	// Adicionar para o carrinho
	var addCart = document.getElementsByClassName("add-cart");
	for (var i = 0; i < addCart.length; i++) {
		var button = addCart[i];
		button.addEventListener("click", addCartClicked);
	}
	loadCartItems();
}

// Remover item do carrinho
function removeCartItem(event) {
	var buttonClicked = event.target;
	buttonClicked.parentElement.remove();
	updatetotal();
	saveCartItems();
	updateCartIcon();
}
//mudança de quantidade
function quantityChanged(event) {
	var input = event.target;
	if (isNaN(input.value) || input.value <= 0) {
		input.value = 1;
	}
	updatetotal();
	saveCartItems();
	updateCartIcon();
}

// Função Adicionar ao carrinho
function addCartClicked(event) {
	var button = event.target;
	var shopProducts = button.parentElement;
	var title = shopProducts.getElementsByClassName("product-title")[0].innerText;
	var price = shopProducts.getElementsByClassName("price")[0].innerText;
	var productImg = shopProducts.getElementsByClassName("product-img")[0].src;
	addProductToCart(title, price, productImg);
	updatetotal();
	saveCartItems();
	updateCartIcon();
}

function addProductToCart(title, price, productImg) {
	var cartShopBox = document.createElement("div");
	cartShopBox.classList.add("cart-box");
	var cartItems = document.getElementsByClassName("cart-content")[0];
	var cartItemsNames = cartItems.getElementsByClassName("cart-product-title");
	for (var i = 0; i < cartItemsNames.length; i++) {
		if (cartItemsNames[i].innerText == title) {
			alert("Você já adicionou este item ao carrinho");
			return;
		}
	}
	var cartBoxContent = `
	<img src="${productImg}" alt=""
						class="cart-img">
					<div class="detail-box">
						<div class="cart-product-title">${title}</div>
						<div class="cart-price">${price}</div>
						<input type="number" name="" id="" value="1"
							class="cart-quantity">
					</div>
					<!-- Remover item -->
					<i class="bx bx-trash-alt cart-remove"></i>`;
	cartShopBox.innerHTML = cartBoxContent;
	cartItems.append(cartShopBox);
	cartShopBox.getElementsByClassName("cart-remove")[0]
		.addEventListener("click", removeCartItem);
	cartShopBox.getElementsByClassName("cart-quantity")[0]
		.addEventListener("change", quantityChanged);
	saveCartItems();
	updateCartIcon();
}

// Atualizar Total
function updatetotal() {
	var cartContent = document.getElementsByClassName("cart-content")[0];
	var cartBoxes = cartContent.getElementsByClassName("cart-box");
	var total = 0;
	for (var i = 0; i < cartBoxes.length; i++) {
		var cartBox = cartBoxes[i];
		var priceElement = cartBox.getElementsByClassName("cart-price")[0];
		var quantityElement = cartBox.getElementsByClassName("cart-quantity")[0];
		var price = parseFloat(priceElement.innerText.replace("R$", ""))
		var quantity = quantityElement.value;
		total += price * quantity;
	}
	//se o preço contiver alguns centavos
	total = Math.round(total * 100) / 100;
	document.getElementsByClassName("total-price")[0].innerText = "R$" + total;
	// Salvar o total para o armazenamento local
	localStorage.setItem("cartTotal", total);
}

//manter item no carrinho quando a página for atualizada
function saveCartItems() {
	var cartContent = document.getElementsByClassName("cart-content")[0];
	var cartBoxes = cartContent.getElementsByClassName("cart-box");
	var cartItems = [];
	
	for (var i=0; i< cartBoxes.length; i++) {
		cartBox = cartBoxes[i];
		var titleElement = cartBox.getElementsByClassName("cart-product-title")[0];
		var priceElement = cart.getElementsByClassName("cart-price")[0];
		var quantityElement = cartBox.getElementsByClassName("cart-quantity")[0];
		var productImg = cartBox.getElementsByClassName("cart-img")[0].src;
		
		var item = {
			title: titleElement.innerText,
			price: priceElement.innerText,
			quantity: quantityElement.value,
			productImg: productImg,
		};
		cartItems.push(item);
	}
	localStorage.setItem("cartItems", JSON.stringify(cartItems));
}

//Carregar no carrinho
function loadCartItems() {
	var cartItems = localStorage.getItem("cartItems");
	if (cartItems) {
		cartItems = JSON.parse(cartItems);
		
		for(var i= 0; i < cartItems.length; i++) {
			var item = cartItems[i];
			addProductToCart(item.title, item.price, item.productImg);
			
			var cartBoxes = document.getElementsByClassName("cart-box");
			var cartBox = cartBoxes[cartBoxes.length - 1];
			var quantityElement = cartBox.getElementsByClassName("cart-quantity")[0];
			quantityElement.value = item.quantity;
		}
	}
	var cartTotal = localStorage.getItem("cartTotal");
	if(cartTotal) {
		document.getElementsByClassName("total-price")[0].innerText = "$" + cartTotal;
	}
	updateCartIcon();
}

//Icone quantidade no carrinho
function updateCartIcon() {
	var cartBoxes = document.getElementsByClassName("cart-box");
	var quantity = 0;
	
	for(var i = 0; i < cartBoxes.length; i++) {
		var cartBox = cartBoxes[i];
		var quantityElement = cartBox.getElementsByClassName("cart-quantity")[0];
		quantity += parseInt(quantityElement.value);
	}
	var cartIcon = document.querySelector("#cart-icon");
	cartIcon.setAttribute("data-quantity", quantity);
}

// Função para enviar o carrinho para o servidor
function finalizarPedido() {
    let cartItems = JSON.parse(localStorage.getItem("cartItems"));
    
    if (!cartItems || cartItems.length === 0) {
        alert("Seu carrinho está vazio!");
        return;
    }

    // Preparando os dados para enviar
    let dadosPedido = {
        usuarioId: 1, // Isso deve ser dinâmico, dependendo do usuário logado
        items: cartItems
    };

    fetch('/finalizarPedido', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(dadosPedido)
    })
    .then(response => response.json())
    .then(data => {
        if (data.sucesso) {
            // Redirecionar para a página de sucesso
            window.location.href = '/success.jsp';
        } else {
            alert('Erro ao finalizar o pedido.');
        }
    })
    .catch(error => {
        console.error('Erro:', error);
        alert('Erro ao enviar os dados para o servidor.');
    });
}