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

@WebServlet(name = "ManutencaoCliente", urlPatterns = { "/clientes/manutencao" })
public class ManutencaoClienteController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ClienteDAO clienteDAO;

    public ManutencaoClienteController() {
        super();
        clienteDAO = new ClienteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            listarManutencao(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void listarManutencao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ArrayList<Cliente> Clientes = clienteDAO.listarManutencao(); // Obtenha a lista
        request.setAttribute("listaClientes", Clientes); // Atribua ao request
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes/ManutencaoCliente.jsp"); // Caminho para a JSP
        dispatcher.forward(request, response); // Encaminhe para a página
    }
}