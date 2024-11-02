package br.com.eCommerce_Perfumes.webjbdc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.com.eCommerce_Perfumes.webjbdc.model.Cliente;
import br.com.eCommerce_Perfumes.webjbdc.utils.ConnectionFactory;

public class ClienteDAO {
	Connection conexao;

	public boolean inserir(Cliente cliente) {
	    boolean retorno = false;
	    try {
	        conexao = ConnectionFactory.getConnection();

	        String sql = "INSERT INTO cliente (id_cliente, nome, rg, cpf, email, telefone, celular, cep, endereco, numero, complemento, bairro, cidade, uf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
	    } finally {
	        if (conexao != null) {
	            try {
	                conexao.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return retorno;
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

	public boolean excluir(int id) {
		boolean retorno = false;
		try {

			conexao = ConnectionFactory.getConnection();
			String sql = "DELETE FROM cliente WHERE id_cliente = ?";

			PreparedStatement ps = conexao.prepareStatement(sql);
			ps.setInt(1, id);
			int linhasAfetadas = ps.executeUpdate();

			if (linhasAfetadas > 0) {
				retorno = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conexao != null) {
				try {
					conexao.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return retorno;
	}

	public boolean atualizar(Cliente clienteAtualizar) {
		boolean retorno = false;
		try {
			conexao = ConnectionFactory.getConnection();
			
			String sql = "UPDATE cliente SET nome=?, rg=?, cpf=?, email=?, telefone=?, celular=?, cep=?,"
					+ " endereco=?, numero=?, complemento=?, bairro=?, uf=? WHERE id_cliente = ?";

			PreparedStatement ps = conexao.prepareStatement(sql);
			
			ps.setInt(1, clienteAtualizar.getId());
			ps.setString(2, clienteAtualizar.getNome());
			ps.setString(3, clienteAtualizar.getRg());
			ps.setString(4, clienteAtualizar.getCpf());
			ps.setString(5, clienteAtualizar.getEmail());
			ps.setString(6, clienteAtualizar.getTelefone());
			ps.setString(7, clienteAtualizar.getCelular());
			ps.setString(8, clienteAtualizar.getCep());
			ps.setString(9, clienteAtualizar.getEndereco());
			ps.setInt(10, clienteAtualizar.getNumero());
			ps.setString(11, clienteAtualizar.getComplemento());
			ps.setString(12, clienteAtualizar.getBairro());
			ps.setString(13, clienteAtualizar.getUf());
			
			int linhasAfetadas = ps.executeUpdate();
			
			if (linhasAfetadas > 0) {
				retorno = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conexao != null) {
				try {
					conexao.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return retorno;
	}
	
	public Cliente buscarPorId(int id) {
	    Cliente cliente = null;
	    String sql = "SELECT * FROM tb_clientes WHERE id_cliente = ?";

	    try (Connection connection = ConnectionFactory.getConnection();
	         PreparedStatement ps = connection.prepareStatement(sql)) {
	        
	        ps.setInt(1, id);
	        
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                cliente = new Cliente();
	                cliente.setId(rs.getInt("id_cliente"));
	                cliente.setNome(rs.getString("nome"));
	                cliente.setRg(rs.getString("rg"));
	                cliente.setCpf(rs.getString("cpf"));
	                cliente.setEmail(rs.getString("email"));
	                cliente.setTelefone(rs.getString("telefone"));
	                cliente.setCelular(rs.getString("celular"));
	                cliente.setCep(rs.getString("cep"));
	                cliente.setEndereco(rs.getString("endereco"));
	                cliente.setNumero(rs.getInt("numero"));
	                cliente.setComplemento(rs.getString("complemento"));
	                cliente.setBairro(rs.getString("bairro"));
	                cliente.setCidade(rs.getString("cidade"));
	                cliente.setUf(rs.getString("uf"));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cliente;
	}	
}