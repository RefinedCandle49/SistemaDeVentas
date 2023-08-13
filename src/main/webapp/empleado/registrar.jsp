<%@ page import="modelo.empleado,conexion.*, dao.EmpleadoDAO, java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 6/08/2023
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="empleado" class="modelo.empleado"/>
<jsp:setProperty property="*" name="empleado"/>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Registrar empleado</title>
</head>
<body>
<main>
    <form action="registrar.jsp" method="post">
        <label>
            Nombre:
            <input type="text" name="nombre" placeholder="">
        </label>
        
        <label>
            Apellido:
            <input type="text" name="apellido" placeholder="">
        </label>
        
        <label>
            DNI:
            <input type="text" name="dni" placeholder="">
        </label>
        
        <input type="submit" value="Registrar">
    </form>
    <a href="listar.jsp">Regresar</a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = EmpleadoDAO.registrar(empleado);
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
