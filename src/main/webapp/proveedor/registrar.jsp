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
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/register.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Registrar proveedor</title>
</head>
<body>
<main>
    <a class="supplierRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
    <div class="registerContainer">
        <form class="supplierForm" action="registrar.jsp" method="post">
            <h1>Registrar proveedor</h1>
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
            
            <input class="supplierRegisterButton" type="submit" value="Registrar">
        </form>
    </div>
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
