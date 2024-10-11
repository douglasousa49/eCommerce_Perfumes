package br.com.eCommerce_Perfumes.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        if (isAdmin(email, senha)) {
            HttpSession session = req.getSession();
            session.setAttribute("userRole", "ADMIN");
            resp.sendRedirect(req.getContextPath() + "/views/Index.jsp"); // Redireciona para a página principal
            
        } else if (isClient(email, senha)) {
            HttpSession session = req.getSession();
            session.setAttribute("userRole", "CLIENT");
            resp.sendRedirect(req.getContextPath() + "/views/Index.jsp"); // Redireciona para a página principal
            
        } else {
            // Se o login falhar, você pode redirecionar para a página de login novamente
            resp.sendRedirect(req.getContextPath() + "/views/Login.jsp?error=true");
        }
    }

    private boolean isAdmin(String email, String senha) {
        String adminEmail = "admin@cosmeticos.com";
        String adminSenha = "adm123";
        return email.equals(adminEmail) && senha.equals(adminSenha);
    }

    private boolean isClient(String email, String senha) {
        // Aqui você pode adicionar a lógica de validação para um cliente.
        // Para simplificar, estamos apenas retornando true para qualquer cliente.
        return email.endsWith("cliente@cliente.com") && senha.equals("cliente123");
    }
}