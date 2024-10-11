package br.com.eCommerce_Perfumes.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ManutencaoProdutoServlet")
public class ManutencaoProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;

        if (userRole != null && userRole.equals("ADMIN")) {
            // Se for ADMIN, redireciona para a página de manutenção de produtos
            request.getRequestDispatcher("/views/ManutencaoProdutos.jsp").forward(request, response);
        } else {
            // Se não for ADMIN, redireciona para uma página de erro ou login
            response.sendRedirect(request.getContextPath() + "/views/login.jsp?error=accessDenied");
        }
    }
}