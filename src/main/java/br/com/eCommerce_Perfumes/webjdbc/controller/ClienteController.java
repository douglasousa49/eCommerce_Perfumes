package br.com.eCommerce_Perfumes.webjdbc.controller;

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
import br.com.eCommerce_Perfumes.model.Cliente;

@WebServlet(name = "clientes", urlPatterns = { "/clientes", "/clientes/novo", "/clientes/listar" })
public class ClienteController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ClienteDAO clienteDAO;

	public ClienteController() {
		super();
		clienteDAO = new ClienteDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/clientes/novo":
				novo(request, response);
				break;
			case "/clientes/listar":
				listar(request, response);
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
		
		ArrayList<Cliente> listaClientes = clienteDAO.listar();
		
		request.setAttribute("listaClientes", listaClientes);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/cliente-listar.jsp");
		
		dispatcher.forward(request, response);
	}

	private void novo(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/cliente-cadastro.jsp");
		dispatcher.forward(request, response);
	}
}