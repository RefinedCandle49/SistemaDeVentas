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
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Editar empleado</title>
    <%
        String id = request.getParameter("id");
        int idEmpleado = Integer.parseInt(id);
        empleado emp = EmpleadoDAO.buscarPorId(idEmpleado);
    %>
</head>
<body>
<main>
    <form action="editar.jsp" method="post">
        <label class="invisible">
            Id:
            <input type="text" name="id" value="<%=idEmpleado%>">
        </label>
        
        <label>
            Nombre:
            <input type="text" name="nombre" value="<%=emp.getNombre()%>" placeholder="">
        </label>
        
        <label>
            Apellido:
            <input type="text" name="apellido" value="<%=emp.getApellido()%>" placeholder="">
        </label>
        
        <label>
            DNI:
            <input type="text" name="dni" value="<%=emp.getDni()%>" placeholder="">
        </label>
        
        <input type="submit" value="Guardar">
    </form>
    <a href="listar.jsp">Regresar</a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = EmpleadoDAO.actualizar(empActualizar);
        if (i > 0){
            response.sendRedirect("listar.jsp");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
