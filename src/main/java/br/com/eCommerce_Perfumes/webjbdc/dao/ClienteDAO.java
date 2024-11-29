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

	        String sql = "INSERT INTO tb_clientes (nome, rg, cpf, email, senha, telefone, celular, cep, endereco, numero, complemento, bairro, cidade, uf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        PreparedStatement ps = conexao.prepareStatement(sql);

	        ps.setString(1, cliente.getNome());
	        ps.setString(2, cliente.getRg());
	        ps.setString(3, cliente.getCpf());
	        ps.setString(4, cliente.getEmail());
	        ps.setString(5, cliente.getSenha());
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


	public ArrayList<Cliente> listarManutencao() {
		
	    ArrayList<Cliente> clientes = new ArrayList<>();
	    
	    String sql = "SELECT id, nome, email, celular FROM tb_clientes";
	    
	    try (Connection connection = ConnectionFactory.getConnection();
	         PreparedStatement ps = connection.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Cliente client = new Cliente();
	            
	            client.setId(rs.getInt("id"));
	            client.setNome(rs.getString("nome"));
	            client.setEmail(rs.getString("email"));
	            client.setCelular(rs.getString("celular"));
	            
	            clientes.add(client);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return clientes;
	}
	
	public ArrayList<Cliente> listar() {
	    ArrayList<Cliente> clientes = new ArrayList<>();
	    String sql = "SELECT * FROM tb_clientes";

	    try (Connection connection = ConnectionFactory.getConnection();
	         PreparedStatement ps = connection.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	        	
	            Cliente client = new Cliente();
	            
	            client.setId(rs.getInt("id"));
	            client.setNome(rs.getString("nome"));
	            client.setRg(rs.getString("rg"));
	            client.setCpf(rs.getString("cpf"));
	            client.setEmail(rs.getString("email"));
	            client.setSenha(rs.getString("senha"));
	            client.setTelefone(rs.getString("telefone"));
	            client.setCelular(rs.getString("celular"));
	            client.setCep(rs.getString("cep"));
	            client.setEndereco(rs.getString("endereco"));
	            client.setNumero(rs.getInt("numero"));
	            client.setComplemento(rs.getString("complemento"));
	            client.setBairro(rs.getString("bairro"));
	            client.setCidade(rs.getString("cidade"));
	            client.setUf(rs.getString("uf"));
	            
	            clientes.add(client);
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
			String sql = "DELETE FROM tb_clientes WHERE id = ?";

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
			
			String sql = "UPDATE tb_clientes SET nome=?, rg=?, cpf=?, email=?, telefone=?, celular=?, cep=?, "
		             + "endereco=?, numero=?, complemento=?, bairro=?, uf=? WHERE id = ?";
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setString(1, clienteAtualizar.getNome());
		ps.setString(2, clienteAtualizar.getRg());
		ps.setString(3, clienteAtualizar.getCpf());
		ps.setString(4, clienteAtualizar.getEmail());
		ps.setString(5, clienteAtualizar.getTelefone());
		ps.setString(6, clienteAtualizar.getCelular());
		ps.setString(7, clienteAtualizar.getCep());
		ps.setString(8, clienteAtualizar.getEndereco());
		ps.setInt(9, clienteAtualizar.getNumero());
		ps.setString(10, clienteAtualizar.getComplemento());
		ps.setString(11, clienteAtualizar.getBairro());
		ps.setString(12, clienteAtualizar.getUf());
		ps.setInt(13, clienteAtualizar.getId());

			
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
	    String sql = "SELECT * FROM tb_clientes WHERE id = ?";

	    try (Connection connection = ConnectionFactory.getConnection();
	         PreparedStatement ps = connection.prepareStatement(sql)) {
	        
	        ps.setInt(1, id);
	        
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                cliente = new Cliente();
	                cliente.setId(rs.getInt("id"));
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