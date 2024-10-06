package br.com.eCommerce_Perfumes.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        if (isAdmin(email, senha)) {
            resp.sendRedirect(req.getContextPath() + "/views/CadastrarProdutos.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/produtos.jsp");
        }
    }

    private boolean isAdmin(String email, String senha) {
        String adminEmail = "admin@cosmeticos.com";
        String adminSenha = "adm123";
        
        return email.equals(adminEmail) && senha.equals(adminSenha);
    }
}