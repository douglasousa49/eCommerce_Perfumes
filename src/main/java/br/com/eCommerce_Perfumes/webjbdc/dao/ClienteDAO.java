package br.com.eCommerce_Perfumes.webjbdc.dao;

import br.com.eCommerce_Perfumes.model.Cliente;
import br.com.eCommerce_Perfumes.webjdbc.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO {
	Connection conexao;

	@SuppressWarnings("finally")
	public boolean inserir(Cliente cliente) {
		boolean retorno = false;
		try {
			conexao = ConnectionFactory.getConnection();

			String sql = "INSERT INTO cliente (cpf,nome) values(?,?)";

			PreparedStatement ps = conexao.prepareStatement(sql);

			ps.setInt(1, cliente.getId());
			ps.setString(2, cliente.getNome());
			ps.setString(3, cliente.getRg());
			ps.setString(4, cliente.getCpf());
			ps.setString(5, cliente.getEmail());
			ps.setString(6, cliente.getTelefone());
			ps.setString(7, cliente.getCelular());
			ps.setString(8, cliente.getCep());
			ps.setString(9, cliente.getEndereco());
			ps.setInt(10, cliente.getNumero());
			ps.setString(11, cliente.getComplemento());
			ps.setString(12, cliente.getBairro());
			ps.setString(13, cliente.getCidade());
			ps.setString(14, cliente.getUf());

			int linhasAfetadas = ps.executeUpdate();

			if (linhasAfetadas > 0) {
				retorno = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // código omitido}
			return retorno;
		}
}

	public ArrayList<Cliente> listar() {
		
		ArrayList<Cliente> clientes = new ArrayList<>();
		
		String sql = "SELECT * FROM tb_clientes";
		
		try (Connection connection = ConnectionFactory.getConnection();
				
			PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				 	int id = rs.getInt("id_cliente");
		            String nome = rs.getString("nome");
		            String rg = rs.getString("rg");
		            String cpf = rs.getString("cpf");
		            String email = rs.getString("email");
		            String telefone = rs.getString("telefone");
		            String celular = rs.getString("celular");
		            String cep = rs.getString("cep");
		            String endereco = rs.getString("endereco");
		            int numero = rs.getInt("numero");
		            String complemento = rs.getString("complemento");
		            String bairro = rs.getString("bairro");
		            String cidade = rs.getString("cidade");
		            String uf = rs.getString("uf");

		            Cliente itemLista = new Cliente();
		            
		            itemLista.setId(id);
		            itemLista.setNome(nome);
		            itemLista.setRg(rg);
		            itemLista.setCpf(cpf);
		            itemLista.setEmail(email);
		            itemLista.setTelefone(telefone);
		            itemLista.setCelular(celular);
		            itemLista.setCep(cep);
		            itemLista.setEndereco(endereco);
		            itemLista.setNumero(numero);
		            itemLista.setComplemento(complemento);
		            itemLista.setBairro(bairro);
		            itemLista.setCidade(cidade);
		            itemLista.setUf(uf);

		            clientes.add(itemLista);
			}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return clientes;
	}
}