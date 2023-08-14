<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 10/08/2023
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@page import="modelo.proveedor, conexion.*, dao.ProveedorDAO, java.util.*" %>
    <jsp:useBean id="provActualizar" class="modelo.proveedor"/>
    <jsp:setProperty property="*" name="provActualizar"/>
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/register.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Editar proveedor</title>
    <%
        String id = request.getParameter("id");
        int idProveedor = Integer.parseInt(id);
        proveedor prov = ProveedorDAO.buscarPorId(idProveedor);
    %>
</head>
<body>
<main>
    <a class="supplierRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
    <div class="registerContainer">
        <form class="supplierForm" action="editar.jsp" method="post">
            <h1>Editar proveedor</h1>
            <label class="invisible">
                ID:
                <input type="text" name="id" value="<%=idProveedor%>">
            </label>
            
            <label>
                Razón Social:
                <input type="text" name="razonSocial" value="<%=prov.getRazonSocial()%>">
            </label>
            
            <label>
                Representante:
                <input type="text" name="representante" value="<%=prov.getRepresentante()%>">
            </label>
            
            <label>
                Dirección:
                <input type="text" name="direccion" value="<%=prov.getDireccion()%>">
            </label>
            
            <label>
                Teléfono:
                <input type="text" name="telefono" value="<%=prov.getTelefono()%>">
            </label>
            
            <input class="supplierRegisterButton" type="submit" value="Registrar">
        </form>
    </div>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = ProveedorDAO.actualizar(provActualizar);
        if (i > 0){
            response.sendRedirect("listar.jsp");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
