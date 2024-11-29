package br.com.eCommerce_Perfumes.webjbdc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import br.com.eCommerce_Perfumes.webjbdc.dao.ClienteDAO;
import br.com.eCommerce_Perfumes.webjbdc.model.Cliente;

@WebServlet(name = "clientes", urlPatterns = { "/clientes", "/clientes/novo", "/clientes/editar", "/clientes/update",
		"/clientes/excluir", "/clientes/listar" })

public class ClienteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ClienteDAO clienteDAO;

	public ClienteController() {
		super();
		clienteDAO = new ClienteDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		try {
			switch (action) {
				case "/clientes/novo":
					inserir(request, response);
					break;
				case "/clientes/listar":
					listar(request, response);
					break;
				case "/clientes/excluir":
					excluir(request, response);
					break;
				case "/clientes/editar":
					editarForm(request, response);
					break;
				case "/clientes/update":
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
	            case "/clientes/novo":
	                inserir(request, response);
	                break;
	            case "/clientes/listar":
	                listar(request, response);
	                break;
	            case "/clientes/excluir":
	                excluir(request, response);
	                break;
	            case "/clientes/editar":
	                editarForm(request, response);
	                break;
	            case "/clientes/update":
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
	
	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    ArrayList<Cliente> listaClientes = clienteDAO.listar(); // Obtenha a lista
	    
	    request.setAttribute("listaClientes", listaClientes);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/ClienteListar.jsp");
	    dispatcher.forward(request, response);

	}

	private void editarForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		Cliente clienteAlterar = clienteDAO.buscarPorId(id);
		request.setAttribute("cliente", clienteAlterar);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/ClienteEditar.jsp");
		dispatcher.forward(request, response);
	}

	private void inserir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	    Cliente novoCliente = new Cliente();
	    
	    // Coleta de todos os campos do formulário
	    novoCliente.setNome(request.getParameter("nome"));
	    novoCliente.setEmail(request.getParameter("email"));
	    novoCliente.setSenha(request.getParameter("senha"));
	    novoCliente.setRg(request.getParameter("rg"));
	    novoCliente.setCpf(request.getParameter("cpf"));
	    novoCliente.setTelefone(request.getParameter("telefone"));
	    novoCliente.setCelular(request.getParameter("celular"));
	    novoCliente.setCep(request.getParameter("cep"));
	    novoCliente.setEndereco(request.getParameter("endereco"));

	    // Converte o valor de 'numero' para inteiro antes de passar para o setNumero
	    String numeroStr = request.getParameter("numero");
	    if (numeroStr != null && !numeroStr.isEmpty()) {
	        try {
	            int numero = Integer.parseInt(numeroStr);  // Converte a String para int
	            novoCliente.setNumero(numero);
	        } catch (NumberFormatException e) {
	            // Trata a exceção caso o valor não possa ser convertido para inteiro
	            e.printStackTrace();  // Pode registrar ou exibir uma mensagem de erro, se necessário
	        }
	    }

	    novoCliente.setComplemento(request.getParameter("complemento"));
	    novoCliente.setBairro(request.getParameter("bairro"));
	    novoCliente.setCidade(request.getParameter("cidade"));
	    novoCliente.setUf(request.getParameter("uf"));

	    // Inserir o cliente no banco de dados
	    clienteDAO.inserir(novoCliente);
	    
	    // Redireciona para a página de sucesso
	    response.sendRedirect(request.getContextPath() + "/views/clientes/ClienteSucesso.jsp");
	}


	private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String rg = request.getParameter("rg");
		String cpf = request.getParameter("cpf");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");
		String celular = request.getParameter("celular");
		String cep = request.getParameter("cep");
		String endereco = request.getParameter("endereco");
		int numero = Integer.parseInt(request.getParameter("numero"));
		String complemento = request.getParameter("complemento");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String uf = request.getParameter("uf");

		Cliente clienteAtualizar = new Cliente();
		
		clienteAtualizar.setId(id);
		clienteAtualizar.setNome(nome);
		clienteAtualizar.setRg(rg);
		clienteAtualizar.setCpf(cpf);
		clienteAtualizar.setEmail(email);
		clienteAtualizar.setTelefone(telefone);
		clienteAtualizar.setCelular(celular);
		clienteAtualizar.setCep(cep);
		clienteAtualizar.setEndereco(endereco);
		clienteAtualizar.setNumero(numero);
		clienteAtualizar.setComplemento(complemento);
		clienteAtualizar.setBairro(bairro);
		clienteAtualizar.setCidade(cidade);
		clienteAtualizar.setUf(uf);

		clienteDAO.atualizar(clienteAtualizar);
		response.sendRedirect("listar");
	}

	private void excluir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		clienteDAO.excluir(id);
		response.sendRedirect("listar");
	}
}