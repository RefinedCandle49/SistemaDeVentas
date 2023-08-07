<%@ page import="dao.ProveedorDAO" %><%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 6/08/2023
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="proveedor" class="modelo.proveedor"/>
<jsp:setProperty property="*" name="proveedor"/>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Registrar proveedor</title>
</head>
<body>
<main>
    <form action="registrar.jsp" method="post">
        <label>
            Razón Social:
            <input type="text" name="razonSocial">
        </label>
        
        <label>
            Representante:
            <input type="text" name="representante">
        </label>
        
        <label>
            Dirección:
            <input type="text" name="direccion">
        </label>
        
        <label>
            Teléfono:
            <input type="text" name="telefono">
        </label>
        
        <input type="submit" value="Registrar">
    </form>
    <a href="listar.jsp">Regresar</a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = ProveedorDAO.registrar(proveedor);
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
