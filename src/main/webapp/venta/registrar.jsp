<%@ page import="modelo.empleado,conexion.*, dao.EmpleadoDAO, dao.VentaDAO, java.util.*" %>
<%@ page import="modelo.venta" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 6/08/2023
  Time: 09:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="venta" class="modelo.venta"/>
<jsp:setProperty property="*" name="venta"/>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="../estilos/general.css">
<%--    <link rel="stylesheet" href="../estilos/register.css">--%>
    <link rel="stylesheet" href="../estilos/detalleVentaForm.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Registrar venta</title>
</head>
<body>
<%
    List<empleado> miLista = EmpleadoDAO.listar();
    request.setAttribute("list", miLista);
%>

<%--<%!
    public String obtenerFechaActual() {
        java.util.Date fecha = new java.util.Date();
        java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        return formato.format(fecha);
    }
%>--%>
<main>
    <form class="saleForm" action="registrar.jsp" method="post" target="myframe">
        <div class="container">
            <div class="detalleVentaForm">
                <label>
                    Cliente:
                    <input type="text" name="cliente" required>
                </label>
                
                <label>
                    Empleado:
                    <select name="idEmpleado" required>
                        <option value="" disabled selected class="invisible">Seleccionar opción</option>
                        <c:forEach var="emp" items="${list}">
                            <option value="${emp.getId()}">${emp.getApellido()}, ${emp.getNombre()}</option>
                        </c:forEach>
                    </select>
                </label>
                <input class="saleRegisterButton" type="submit" value="Añadir productos">
            </div>
            

            <iframe class="table" name="myframe"></iframe>

        </div>
        
        <%-- <input type="datetime-local" value="<%=obtenerFechaActual()%>" disabled>--%>
    </form>
    <a class="saleRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = VentaDAO.registrar(venta);
        if (i > 0){
            int mayorId = VentaDAO.ultimoID();
            
            response.sendRedirect("../detalleVenta/listar-registrar.jsp?idVenta=" + VentaDAO.ultimoID());
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
