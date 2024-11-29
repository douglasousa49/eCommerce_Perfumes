<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Luxus Cosmetic</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <h1>Editar Produto</h1>
    <form action="<%=request.getContextPath()%>/produtos/update" method="post">
        <table>
            <!-- Campo oculto para o código do produto -->
            <tr>
                <td><input type="hidden" name="codigoProduto" value="<%= request.getAttribute("codigoProduto") %>"></td>
            </tr>
            <tr>
                <td><input type="text" name="nomeProduto" class="caixa1" value="<%= request.getAttribute("nomeProduto") %>"></td>
            </tr>
            <tr>
                <td><input type="text" name="descricao" class="caixa1" value="<%= request.getAttribute("descricao") %>"></td>
            </tr>
            <tr>
                <td><input type="text" name="preco" class="caixa1" value="<%= request.getAttribute("preco") %>"></td>
            </tr>
            <tr>
                <td><input type="text" name="estoque" class="caixa1" value="<%= request.getAttribute("estoque") %>"></td>
            </tr>
        </table>
        <input type="submit" value="Salvar" class="botao1">
    </form>
</body>
</html>