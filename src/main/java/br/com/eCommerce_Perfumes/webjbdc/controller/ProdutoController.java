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
import jakarta.servlet.http.Part;
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
                    inserir(request, response);
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
	        switch (action) {
	            case "/produtos/novo":
	                inserir(request, response);
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

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        ArrayList<Produto> listaProdutos = produtoDAO.listar();
        request.setAttribute("listaProdutos", listaProdutos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/ProdutoListar.jsp");
        dispatcher.forward(request, response);
    }

    private void editarForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        // Recebimento do id que será editado
        int id = Integer.parseInt(request.getParameter("codigoProduto"));
        
        // Setar a variável Produto
        Produto produto = produtoDAO.buscarPorId(id);
        
        // Passar o produto para o request como atributos
        request.setAttribute("codigoProduto", produto.getCodigoProduto());
        request.setAttribute("nomeProduto", produto.getNomeProduto());
        request.setAttribute("descricao", produto.getDescricao());
        request.setAttribute("preco", produto.getPreco());
        request.setAttribute("estoque", produto.getEstoque());
        
        // Redirecionar para o JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/ProdutoEditar.jsp");
        dispatcher.forward(request, response);
    }
    private void inserir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	
    	int codigoProduto = Integer.parseInt(request.getParameter("codigoProduto"));
        String nomeProduto = request.getParameter("nomeProduto");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int estoque = Integer.parseInt(request.getParameter("estoque"));

        Produto novoProduto = new Produto();
        
        novoProduto.setCodigoProduto(codigoProduto);
        novoProduto.setNomeProduto(nomeProduto);
        novoProduto.setDescricao(descricao);
        novoProduto.setPreco(preco);
        novoProduto.setEstoque(estoque);

        produtoDAO.inserir(novoProduto);
        response.sendRedirect(request.getContextPath() + "/views/produtos/ProdutoSucesso.jsp");
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        // Obter os dados do formulário
        int codigoProduto = Integer.parseInt(request.getParameter("codigoProduto")); // Corrigido para o nome correto
        String nomeProduto = request.getParameter("nomeProduto");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int estoque = Integer.parseInt(request.getParameter("estoque"));

        // Criar um objeto Produto com os novos valores
        Produto produtoAtualizar = new Produto();
        produtoAtualizar.setCodigoProduto(codigoProduto);
        produtoAtualizar.setNomeProduto(nomeProduto);
        produtoAtualizar.setDescricao(descricao);
        produtoAtualizar.setPreco(preco);
        produtoAtualizar.setEstoque(estoque);

        // Atualizar o produto no banco de dados
        boolean sucesso = produtoDAO.atualizar(produtoAtualizar);

        // Verificar se a atualização foi bem-sucedida e redirecionar
        if (sucesso) {
            response.sendRedirect(request.getContextPath() + "/produtos/listar");
        } else {
            // Se falhou, redirecionar para uma página de erro ou exibir mensagem
            response.sendRedirect(request.getContextPath() + "/produtos/erro.jsp");
        }
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int codigoProduto = Integer.parseInt(request.getParameter("codigoProduto"));
        produtoDAO.excluir(codigoProduto);
        response.sendRedirect("listar");
    }
}