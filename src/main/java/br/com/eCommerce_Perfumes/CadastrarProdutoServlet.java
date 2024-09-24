import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CadastrarProdutoServlet")
public class CadastrarProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtendo os parâmetros do formulário
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        // Aqui seria onde você adicionaria o código para salvar o produto em um banco de dados
        
        // Enviar resposta para uma página de sucesso
        request.setAttribute("nomeProduto", nome);
        request.getRequestDispatcher("sucesso.jsp").forward(request, response);
    }
}