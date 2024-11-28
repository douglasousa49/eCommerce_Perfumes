package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LogoutServlet chamado!"); // Log para verificar execução

        // Obtém a sessão atual
        HttpSession session = req.getSession(false); // Evita criar uma nova sessão
        if (session != null) {
            System.out.println("Sessão invalidada."); // Log adicional
            session.invalidate(); // Invalida a sessão
        }

        // Redireciona para a página de login
        resp.sendRedirect(req.getContextPath() + "/views/Login.jsp");
    }
}