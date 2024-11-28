package br.com.eCommerce_Perfumes.webjbdc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionFactory {

    // Método sobrecarregado sem parâmetros - Conecta como admin por padrão
    public static Connection getConnection() {
        return getConnection("admin");
    }

    // Método com parâmetro para definir o tipo de usuário (admin ou cliente)
    public static Connection getConnection(String userType) {
        try {
            // Registro do driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Caminho do banco de dados
            String url = "jdbc:mysql://localhost:3306/bdvendas";

            // Credenciais diferentes com base no tipo de usuário
            String user = "";
            String password = "";

            if ("admin".equals(userType)) {
                user = "admin@cosmeticos.com";
                password = "adm123";
                
            } else if ("usuario".equals(userType)) {
                user = "usuario";
                password = "usuario123";
                
            } else {
                throw new RuntimeException("Tipo de usuário inválido");
            }

            // Retorna a conexão com as credenciais apropriadas
            return DriverManager.getConnection(url, user, password);

        } catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Erro ao abrir conexão", ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Erro ao registrar driver do JDBC", ex);
        }
    }
}