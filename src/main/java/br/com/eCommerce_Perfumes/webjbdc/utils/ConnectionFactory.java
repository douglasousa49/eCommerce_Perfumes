package br.com.eCommerce_Perfumes.webjbdc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionFactory {
	
	public static Connection getConnection() {
		
		try {
			//Opcional: Registro o driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//caminho do banco de dados
			String url = "jdbc:mysql://localhost/bdvendas";
			
			//Retorno o objeto de conexão
			return DriverManager.getConnection(url, "root", "adminadmin");
			
			} catch (SQLException ex) {
				
			//Registro o erro no log do tomcat
			Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
			
			throw new RuntimeException("Erro ao abrir conexão", ex);
			
			} catch (ClassNotFoundException ex) {
				
			Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
			
			throw new RuntimeException("Erro ao registrar driver do JDBC", ex);
		}
	}
}