package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.eCommerce_Perfumes.webjbdc.utils.ConnectionFactory;

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
            resp.sendRedirect(req.getContextPath() + "/Index.jsp"); // Redireciona para a página principal
            
        } else if (isClient(email, senha)) {
            HttpSession session = req.getSession();
            session.setAttribute("userRole", "CLIENT");
            resp.sendRedirect(req.getContextPath() + "/Index.jsp"); // Redireciona para a página principal
            
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/Login.jsp?error=true");
        }
    }

    private boolean isAdmin(String email, String senha) {
        String adminEmail = "admin@cosmeticos.com";
        String adminSenha = "adm123";
        return email.equals(adminEmail) && senha.equals(adminSenha);
    } 

    private boolean isClient(String email, String senha) {
        boolean isValidClient = false;

        try (Connection connection = ConnectionFactory.getConnection()) {
            String sql = "SELECT COUNT(*) FROM tb_clientes WHERE email = ? AND senha = ?";
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, senha);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        isValidClient = rs.getInt(1) > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isValidClient;
    }
}