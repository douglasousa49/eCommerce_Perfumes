<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="br.com.eCommerce_Perfumes.webjbdc.model.Produto" %>

<html>
<head>
    <title>Lista de Produtos</title>
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
    <h1>Lista de Produtos</h1>
    <form action="<%=request.getContextPath()%>/produtos/listar" method="post">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Recuperando a lista de produtos
                    @SuppressWarnings("unchecked")
                    ArrayList<Produto> listaProdutos = (ArrayList<Produto>) request.getAttribute("listaProdutos");

                    // Iterando sobre a lista de produtos
                    if (listaProdutos != null && !listaProdutos.isEmpty()) {
                        for (Produto produto : listaProdutos) {
                %>
                    <tr>
                        <td><%= produto.getCodigoProduto() %></td>
                        <td><%= produto.getNomeProduto() %></td>
                        <td><%= produto.getDescricao() %></td>
                        <td><%= produto.getEstoque() %></td>
                        <td>R$ <%= produto.getPreco() %></td>
                        <td>
                            <!-- Bot�es de A��o: Editar e Excluir -->
                            <a href="<%=request.getContextPath()%>/produtos/editar?codigoProduto=<%= produto.getCodigoProduto() %>" class="botao1">Editar</a>
                            <form action="<%=request.getContextPath()%>/produtos/excluir" method="post" style="display:inline;">
                                <input type="hidden" name="codigoProduto" value="<%= produto.getCodigoProduto() %>">
                                <button class="action-btn delete-btn">Excluir</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="5">Nenhum cliente encontrado.</td>
                    </tr>
                    
                <%
                    }
                %>
            </tbody>
        </table>
    </form>
    <a href="#" class="sc-btn" onclick="window.location.href='<%=request.getContextPath() %>/Index.jsp'">Voltar Para o Menu</a>
</body>
</html>