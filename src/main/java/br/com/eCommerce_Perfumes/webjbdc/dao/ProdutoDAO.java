package br.com.eCommerce_Perfumes.webjbdc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import br.com.eCommerce_Perfumes.webjbdc.model.Produto;
import br.com.eCommerce_Perfumes.webjbdc.utils.ConnectionFactory;

public class ProdutoDAO {

    public boolean inserir(Produto produto) {
        boolean resultado = false;
        String sql = "INSERT INTO produto (codigo_produto, nome, descricao, preco, estoque) VALUES (?, ?, ?, ?, ?)";

        try (Connection conexao = ConnectionFactory.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
             
            ps.setInt(1, produto.getCodigoProduto());
            ps.setString(2, produto.getNome());
            ps.setString(3, produto.getDescricao());
            ps.setDouble(4, produto.getPreco());
            ps.setInt(5, produto.getEstoque());

            resultado = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultado;
    }

    public ArrayList<Produto> listar() {
        ArrayList<Produto> produtos = new ArrayList<>();
        String sql = "SELECT * FROM produto";

        try (Connection conexao = ConnectionFactory.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setCodigoProduto(rs.getInt("codigo_produto"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setEstoque(rs.getInt("estoque"));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }

    public boolean excluir(int codigoProduto) {
        boolean resultado = false;
        String sql = "DELETE FROM produto WHERE codigo_produto = ?";

        try (Connection conexao = ConnectionFactory.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
             
            ps.setInt(1, codigoProduto);
            resultado = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultado;
    }

    public boolean atualizar(Produto produto) {
        boolean resultado = false;
        String sql = "UPDATE produto SET nome=?, descricao=?, preco=?, estoque=? WHERE codigo_produto=?";

        try (Connection conexao = ConnectionFactory.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
             
            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getDescricao());
            ps.setDouble(3, produto.getPreco());
            ps.setInt(4, produto.getEstoque());
            ps.setInt(5, produto.getCodigoProduto());
            
            resultado = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultado;
    }

    public Produto buscarPorId(int codigoProduto) {
        Produto produto = null;
        String sql = "SELECT * FROM produto WHERE codigo_produto = ?";

        try (Connection conexao = ConnectionFactory.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
             
            ps.setInt(1, codigoProduto);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    produto = new Produto();
                    produto.setCodigoProduto(rs.getInt("codigo_produto"));
                    produto.setNome(rs.getString("nome"));
                    produto.setDescricao(rs.getString("descricao"));
                    produto.setPreco(rs.getDouble("preco"));
                    produto.setEstoque(rs.getInt("estoque"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produto;
    }
}