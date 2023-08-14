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
    <link rel="stylesheet" href="../estilos/register.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Editar empleado</title>
    <%
        String id = request.getParameter("id");
        int idEmpleado = Integer.parseInt(id);
        empleado emp = EmpleadoDAO.buscarPorId(idEmpleado);
    %>
</head>
<body>
<main>
    <a class="employeeRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
    <div class="registerContainer">
        <form class="employeeForm" action="editar.jsp" method="post">
            <h1>Editar empleado</h1>
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
            
            <input class="employeeRegisterButton" type="submit" value="Guardar">
        </form>
    </div>
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
