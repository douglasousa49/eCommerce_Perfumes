package br.com.eCommerce_Perfumes.webjbdc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import br.com.eCommerce_Perfumes.webjbdc.dao.ProdutoDAO;
import br.com.eCommerce_Perfumes.webjbdc.model.Produto;

@WebServlet(name = "produtos", urlPatterns = { "/produtos", "/produtos/novo", "/produtos/editar", "/produtos/update",
        "/produtos/excluir", "/produtos/listar" })
public class ProdutoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProdutoDAO produtoDAO;

    public ProdutoController() {
        super();
        produtoDAO = new ProdutoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {
            switch (action) {
                case "/produtos/novo":
                    novoForm(request, response);
                    break;
                case "/produtos/listar":
                    listar(request, response);
                    break;
                case "/produtos/excluir":
                    excluir(request, response);
                    break;
                case "/produtos/editar":
                    editarForm(request, response);
                    break;
                case "/produtos/update":
                    update(request, response);
                    break;
                default:
                    listar(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            if ("/produtos/novo".equals(action)) {
                inserir(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        ArrayList<Produto> listaProdutos = produtoDAO.listar();
        request.setAttribute("listaProdutos", listaProdutos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/produto-listar.jsp");
        dispatcher.forward(request, response);
    }

    private void novoForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/produto-cadastro.jsp");
        dispatcher.forward(request, response);
    }

    private void editarForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("codigoProduto"));
        Produto produto = produtoDAO.buscarPorId(id);
        request.setAttribute("produto", produto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/produto-cadastro.jsp");
        dispatcher.forward(request, response);
    }

    private void inserir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int estoque = Integer.parseInt(request.getParameter("estoque"));

        Produto novoProduto = new Produto();
        
        novoProduto.setNome(nome);
        novoProduto.setDescricao(descricao);
        novoProduto.setPreco(preco);
        novoProduto.setEstoque(estoque);

        produtoDAO.inserir(novoProduto);
        response.sendRedirect("listar");
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int codigoProduto = Integer.parseInt(request.getParameter("codigoProduto"));
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int estoque = Integer.parseInt(request.getParameter("estoque"));

        Produto produtoAtualizar = new Produto();
        produtoAtualizar.setCodigoProduto(codigoProduto);
        produtoAtualizar.setNome(nome);
        produtoAtualizar.setDescricao(descricao);
        produtoAtualizar.setPreco(preco);
        produtoAtualizar.setEstoque(estoque);

        produtoDAO.atualizar(produtoAtualizar);
        response.sendRedirect("listar");
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int codigoProduto = Integer.parseInt(request.getParameter("codigoProduto"));
        produtoDAO.excluir(codigoProduto);
        response.sendRedirect("listar");
    }
}