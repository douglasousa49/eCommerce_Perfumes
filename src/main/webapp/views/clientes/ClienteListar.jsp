<%@ page import="java.util.ArrayList" %>
<%@ page import="br.com.eCommerce_Perfumes.webjbdc.model.Cliente" %>

<html>
<head>
    <title>Lista de Clientes</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Lista de Clientes</h1>
    <form action="<%=request.getContextPath()%>/clientes/listar" method="post" onsubmit="return validarSenha()">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>RG</th>
                    <th>CPF</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Celular</th>
                    <th>CEP</th>
                    <th>Endereço</th>
                    <th>Número</th>
                    <th>Complemento</th>
                    <th>Bairro</th>
                    <th>Cidade</th>
                    <th>UF</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Recuperando a lista de clientes
                    @SuppressWarnings("unchecked")
                    ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) request.getAttribute("listaClientes");

                    // Iterando sobre a lista de clientes
                    if (listaClientes != null && !listaClientes.isEmpty()) {
                        for (Cliente cliente : listaClientes) {
                %>
                    <tr>
                        <td><%= cliente.getId() %></td>
                        <td><%= cliente.getNome() %></td>
                        <td><%= cliente.getRg() %></td>
                        <td><%= cliente.getCpf() %></td>
                        <td><%= cliente.getEmail() %></td>
                        <td><%= cliente.getTelefone() %></td>
                        <td><%= cliente.getCelular() %></td>
                        <td><%= cliente.getCep() %></td>
                        <td><%= cliente.getEndereco() %></td>
                        <td><%= cliente.getNumero() %></td>
                        <td><%= cliente.getComplemento() %></td>
                        <td><%= cliente.getBairro() %></td>
                        <td><%= cliente.getCidade() %></td>
                        <td><%= cliente.getUf() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="14">Nenhum cliente encontrado.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </form>
    
    <button type="button" onclick="window.location.href='../Index.jsp'">Página Inicial</button>
</body>
</html>