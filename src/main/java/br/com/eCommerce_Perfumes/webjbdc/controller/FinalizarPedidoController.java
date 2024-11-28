package br.com.eCommerce_Perfumes.webjbdc.controller;

import br.com.eCommerce_Perfumes.webjbdc.dao.FinalizarPedidoDAO;
import br.com.eCommerce_Perfumes.webjbdc.model.Pedido;
import br.com.eCommerce_Perfumes.webjbdc.model.ProdutoItem;
import br.com.eCommerce_Perfumes.webjbdc.utils.ConnectionFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/finalizarPedido")
public class FinalizarPedidoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera o carrinho da sessão
        HttpSession session = request.getSession();
        List<ProdutoItem> produtosCarrinho = (List<ProdutoItem>) session.getAttribute("produtosCarrinho");

        // Se o carrinho estiver vazio, inicializa
        if (produtosCarrinho == null) {
            produtosCarrinho = new ArrayList<>();
            session.setAttribute("produtosCarrinho", produtosCarrinho);
        }

        // Adiciona o carrinho na requisição para exibição
        request.setAttribute("produtosCarrinho", produtosCarrinho);
        request.getRequestDispatcher("/views/FinalizarPedido.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (var connection = ConnectionFactory.getConnection()) {
            HttpSession session = request.getSession();
            List<ProdutoItem> produtosCarrinho = (List<ProdutoItem>) session.getAttribute("produtosCarrinho");

            if (produtosCarrinho == null || produtosCarrinho.isEmpty()) {
                response.sendRedirect("carrinhoVazio.jsp");
                return;
            }

            FinalizarPedidoDAO pedidoDAO = new FinalizarPedidoDAO(connection);

            // Monta o objeto Pedido
            Pedido pedido = new Pedido();
            pedido.setUsuarioId(Integer.parseInt(request.getParameter("usuarioId")));
            pedido.setDataVenda(LocalDateTime.now());
            pedido.setTotalVenda(calcularTotal(produtosCarrinho));
            pedido.setObservacoes(request.getParameter("observacoes"));

            // Salva a venda
            int vendaId = pedidoDAO.salvarVenda(pedido);

            // Salva os itens da venda
            for (ProdutoItem item : produtosCarrinho) {
                pedidoDAO.salvarItensVenda(vendaId, item);
            }

            // Limpa o carrinho da sessão
            session.removeAttribute("produtosCarrinho");

            // Redireciona para página de sucesso
            response.sendRedirect("sucesso.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }

    private BigDecimal calcularTotal(List<ProdutoItem> produtosCarrinho) {
        BigDecimal total = BigDecimal.ZERO;
        for (ProdutoItem item : produtosCarrinho) {
            total = total.add(item.getSubtotal());
        }
        return total;
    }
}