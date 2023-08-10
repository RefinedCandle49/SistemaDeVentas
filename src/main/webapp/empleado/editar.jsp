<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 9/08/2023
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@page import="conexion.*, java.util.*" %>
    <%@ page import="dao.EmpleadoDAO" %>
    <%@ page import="modelo.empleado" %>
    <jsp:useBean id="empActualizar" class="modelo.empleado"/>
    <jsp:setProperty property="*" name="empActualizar"/>
    <title>Editar empleado</title>
    <%
        String id = request.getParameter("id");
        int idEmpleado = Integer.parseInt(id);
        empleado emp = EmpleadoDAO.buscarPorId(idEmpleado);
    %>
</head>
<body>
<main>
    <form action="registrar.jsp" method="post">
        <label>
            Id:
            <input type="text" name="id" value="">
        </label>
        
        <label>
            Nombre:
            <input type="text" name="nombre" placeholder="" value="<%=emp.getNombre()%>">
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
</body>
</html>
