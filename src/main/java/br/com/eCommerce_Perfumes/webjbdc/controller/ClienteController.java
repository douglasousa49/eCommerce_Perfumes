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
    
    try {
        Cliente clienteAlterar = clienteDAO.buscarPorId(id);
        
        // Atribuindo cada atributo separadamente para não sobrescrever
        request.setAttribute("cliente", clienteAlterar);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/ClienteEditar.jsp");
        dispatcher.forward(request, response);
        
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID do cliente inválido");
    }
}

	
	private Cliente extrairCliente(HttpServletRequest request) {
		
	    Cliente cliente = new Cliente();
	    
	    cliente.setNome(request.getParameter("nome"));
	    cliente.setEmail(request.getParameter("email"));
	    cliente.setSenha(request.getParameter("senha"));
	    cliente.setRg(request.getParameter("rg"));
	    cliente.setCpf(request.getParameter("cpf"));
	    cliente.setTelefone(request.getParameter("telefone"));
	    cliente.setCelular(request.getParameter("celular"));
	    cliente.setCep(request.getParameter("cep"));
	    cliente.setEndereco(request.getParameter("endereco"));
	    // Converte o número de string para int, se possível
	    String numeroStr = request.getParameter("numero");
	    if (numeroStr != null && !numeroStr.isEmpty()) {
	        try {
	            cliente.setNumero(Integer.parseInt(numeroStr));
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
	    cliente.setComplemento(request.getParameter("complemento"));
	    cliente.setBairro(request.getParameter("bairro"));
	    cliente.setCidade(request.getParameter("cidade"));
	    cliente.setUf(request.getParameter("uf"));

	    return cliente;
	}

	private void inserir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	    Cliente novoCliente = extrairCliente(request); // Utiliza o método para extrair dados
	    clienteDAO.inserir(novoCliente); // Insere no banco de dados
	    response.sendRedirect(request.getContextPath() + "/views/clientes/ClienteSucesso.jsp");
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	    try {
	        // Obter os dados do formulário
	        int id = Integer.parseInt(request.getParameter("id"));
	        String nome = request.getParameter("nome");
	        String telefone = request.getParameter("telefone");
	        String celular = request.getParameter("celular");
	        String cep = request.getParameter("cep");
	        String endereco = request.getParameter("endereco");

	        // Verificar se o campo "numero" é válido
	        String numeroStr = request.getParameter("numero");
	        int numero = 0; // Valor padrão caso "numero" seja inválido
	        if (numeroStr != null && !numeroStr.trim().isEmpty() && !numeroStr.equals("null")) {
	            try {
	                numero = Integer.parseInt(numeroStr); // Tenta converter
	            } catch (NumberFormatException e) {
	                // Tratar o caso em que a conversão falha
	                numero = 0; // ou outro valor padrão
	            }
	        }

	        String complemento = request.getParameter("complemento");
	        String bairro = request.getParameter("bairro");
	        String cidade = request.getParameter("cidade");
	        String uf = request.getParameter("uf");

	        // Criar um objeto Cliente com os novos valores
	        Cliente clienteAtualizar = new Cliente();
	        clienteAtualizar.setId(id);
	        clienteAtualizar.setNome(nome);
	        clienteAtualizar.setTelefone(telefone);
	        clienteAtualizar.setCelular(celular);
	        clienteAtualizar.setCep(cep);
	        clienteAtualizar.setEndereco(endereco);
	        clienteAtualizar.setNumero(numero);  // Define o número com o valor válido ou o padrão
	        clienteAtualizar.setComplemento(complemento);
	        clienteAtualizar.setBairro(bairro);
	        clienteAtualizar.setCidade(cidade);
	        clienteAtualizar.setUf(uf);

	        // Atualizar o cliente no banco de dados
	        boolean sucesso = clienteDAO.atualizar(clienteAtualizar);

	        // Verificar se a atualização foi bem-sucedida e redirecionar
	        if (sucesso) {
	            response.sendRedirect(request.getContextPath() + "/clientes/listar");
	        } else {
	            // Caso de erro na atualização
	            response.sendRedirect(request.getContextPath() + "/clientes/erro.jsp");
	        }
	    } catch (Exception e) {
	        // Tratar outros erros, como o de ID inválido ou outros problemas
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath() + "/clientes/erro.jsp");
	    }
	}

	private void excluir(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		clienteDAO.excluir(id);
		response.sendRedirect("listar");
	}
}