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
					novoForm(request, response);
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
			if ("/clientes/novo".equals(action)) {
				inserir(request, response);
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		ArrayList<Cliente> listaClientes = clienteDAO.listar();
		request.setAttribute("listaClientes", listaClientes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/cliente-listar.jsp");
		dispatcher.forward(request, response);
	}

	private void novoForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/cliente-cadastro.jsp");
		dispatcher.forward(request, response);
	}

	private void editarForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		Cliente clienteAlterar = clienteDAO.buscarPorId(id);
		request.setAttribute("cliente", clienteAlterar);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/cliente-cadastro.jsp");
		dispatcher.forward(request, response);
	}

	private void inserir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
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

		Cliente novoCliente = new Cliente();
		
		novoCliente.setNome(nome);
		novoCliente.setRg(rg);
		novoCliente.setCpf(cpf);
		novoCliente.setEmail(email);
		novoCliente.setTelefone(telefone);
		novoCliente.setCelular(celular);
		novoCliente.setCep(cep);
		novoCliente.setEndereco(endereco);
		novoCliente.setNumero(numero);
		novoCliente.setComplemento(complemento);
		novoCliente.setBairro(bairro);
		novoCliente.setCidade(cidade);
		novoCliente.setUf(uf);

		clienteDAO.inserir(novoCliente);
		response.sendRedirect("listar");
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