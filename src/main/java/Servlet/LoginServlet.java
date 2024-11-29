package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.eCommerce_Perfumes.webjbdc.utils.ConnectionFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        if (isAdmin(email, senha)) {
            // Configura a sessão para o ADMIN
            HttpSession session = req.getSession();
            session.setAttribute("userRole", "ADMIN");
            session.setAttribute("userName", "ADMIN"); // Nome fixo para o administrador
            resp.sendRedirect(req.getContextPath() + "/Index.jsp");
            
        } else {
            // Valida o cliente e obtém o nome
            String userName = getClientName(email, senha);
            if (userName != null) {
                HttpSession session = req.getSession();
                session.setAttribute("userRole", "CLIENT");
                session.setAttribute("userName", userName); // Nome obtido do banco de dados
                resp.sendRedirect(req.getContextPath() + "/Index.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/views/Login.jsp?error=true");
            }
        }
    }

    private boolean isAdmin(String email, String senha) {
        String adminEmail = "admin@cosmeticos.com";
        String adminSenha = "adm123";
        return email.equals(adminEmail) && senha.equals(adminSenha);
    }

    private String getClientName(String email, String senha) {
        String userName = null;

        try (Connection connection = ConnectionFactory.getConnection()) {
            String sql = "SELECT nome FROM tb_clientes WHERE email = ? AND senha = ?";
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, senha);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        userName = rs.getString("nome");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userName; // Retorna null se o cliente não for encontrado
    }
}