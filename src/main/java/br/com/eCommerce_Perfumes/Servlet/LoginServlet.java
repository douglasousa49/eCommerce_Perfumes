package Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        // Validação dos dados de login
        if (isAdmin(email, senha)) {
            // Se for o administrador, redireciona para a página de gerenciamento de produtos
            resp.sendRedirect(req.getContextPath() + "/CadastrarProdutos.jsp");
        } else {
            // Se não for o administrador, redireciona para a página de produtos
            resp.sendRedirect(req.getContextPath() + "/produtos.jsp");
        }
    }

    // Função para verificar se o usuário é administrador
    private boolean isAdmin(String email, String senha) {
        String adminEmail = "admin@cosmeticos.com";
        String adminSenha = "adm123";
        
        return email.equals(adminEmail) && senha.equals(adminSenha);
    }
}