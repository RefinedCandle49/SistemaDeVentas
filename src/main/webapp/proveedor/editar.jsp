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
    <title>Editar proveedor</title>
    <%
        String id = request.getParameter("id");
        int idProveedor = Integer.parseInt(id);
        proveedor prov = ProveedorDAO.buscarPorId(idProveedor);
    %>
</head>
<body>
<main>
    <form action="editar.jsp" method="post">
        <label>
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
        
        <input type="submit" value="Registrar">
    </form>
    <a href="listar.jsp">Regresar</a>
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
