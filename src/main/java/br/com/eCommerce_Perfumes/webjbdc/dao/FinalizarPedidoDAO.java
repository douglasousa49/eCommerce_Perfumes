package br.com.eCommerce_Perfumes.webjbdc.dao;

import br.com.eCommerce_Perfumes.webjbdc.model.Pedido;
import br.com.eCommerce_Perfumes.webjbdc.model.ProdutoItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FinalizarPedidoDAO {

    private Connection connection;

    public FinalizarPedidoDAO(Connection connection) {
        this.connection = connection;
    }

    public int salvarVenda(Pedido pedido) throws SQLException {
        String sqlVenda = "INSERT INTO tb_vendas (cliente_id, data_venda, total_venda, observacoes) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sqlVenda, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, pedido.getUsuarioId());
            stmt.setTimestamp(2, java.sql.Timestamp.valueOf(pedido.getDataVenda()));
            stmt.setBigDecimal(3, pedido.getTotalVenda());
            stmt.setString(4, pedido.getObservacoes());

            stmt.executeUpdate();

            // Recupera o ID gerado
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // ID da venda
                }
            }
        }
        return -1;
    }

    public void salvarItensVenda(int vendaId, ProdutoItem item) throws SQLException {
        String sqlItens = "INSERT INTO tb_itensvendas (venda_id, produto_id, qtd, subtotal) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sqlItens)) {
            stmt.setInt(1, vendaId);
            stmt.setInt(2, item.getProdutoId());
            stmt.setInt(3, item.getQuantidade());
            stmt.setBigDecimal(4, item.getSubtotal());

            stmt.executeUpdate();
        }
    }
}