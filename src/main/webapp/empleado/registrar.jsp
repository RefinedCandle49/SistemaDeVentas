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
    <link rel="stylesheet" href="../estilos/register.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Registrar empleado</title>
</head>
<body>
<main>
    <a class="employeeRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
    <div class="registerContainer">
        <form class="employeeForm" action="registrar.jsp" method="post">
            <h1>Registrar empleado</h1>
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
            
            <input class="employeeRegisterButton" type="submit" value="Registrar">
        </form>
    </div>
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
