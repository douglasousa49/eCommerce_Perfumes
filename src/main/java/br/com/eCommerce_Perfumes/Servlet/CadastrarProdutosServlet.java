package br.com.eCommerce_Perfumes.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CadastrarProdutos")
public class CadastrarProdutosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtendo os parâmetros do formulário
        String codigoProduto = request.getParameter("codigoProduto");
        String nome = request.getParameter("nomeProduto");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        // Aqui seria onde você adicionaria o código para salvar o produto em um banco de dados
        
        // Enviar resposta para uma página de sucesso
        request.setAttribute("codigoProduto", codigoProduto);
        request.setAttribute("nomeProduto", nome);
        request.setAttribute("descricao", descricao);
        request.setAttribute("preco", preco);
        request.setAttribute("quantidade", quantidade);

        request.getRequestDispatcher("views/Sucesso.jsp").forward(request, response);
    }
}