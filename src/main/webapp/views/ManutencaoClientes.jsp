page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manutenção de Clientes</title>
    <style>
       
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #3498db;
            color: white;
        }
        .delete-btn {
            background-color: #e74c3c;
            color: white;
        }
        .add-btn {
            background-color: #2ecc71;
            color: white;
            display: block;
            margin-bottom: 15px;
        }
        .disabled-btn {
            background-color: #95a5a6;
            color: white;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <h1>Manutenção de Clientes</h1>

    
<c:if test="${userRole == 'ADMIN'}">
        <button class="add-btn" onclick="window.location.href='ClienteServlet?action=add'">Incluir Novo Cliente</button>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%-- Loop pelos clientes e exibição dos dados --%>
            <c:forEach items="${clientes}" var="cliente">
                <tr>
                    <td>${cliente.id}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.telefone}</td>
                    <td>
                        <%-- Botão de editar habilitado para Clientes e Administradores --%>
                        <button class="action-btn edit-btn"
                                onclick="window.location.href='ClienteServlet?action=edit&id=${cliente.id}'"
                                <c:if test="${userRole == 'CLIENT' && userId != cliente.id}"> disabled </c:if>>
                            Editar
                        </button>
                        
                        <%-- Botão de excluir somente para Administradores --%>
                        <c:if test="${userRole == 'ADMIN'}">
                            <button class="action-btn delete-btn"
                                    onclick="window.location.href='ClienteServlet?action=delete&id=${cliente.id}'">
                                Excluir
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

   
    <c:if test="${clientes.size() == 0}">
        <p>Nenhum cliente encontrado.</p>
    </c:if>
</body>
</html>