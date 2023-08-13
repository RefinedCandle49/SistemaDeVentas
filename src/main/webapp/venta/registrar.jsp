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
    <form action="registrar.jsp" method="post" target="myframe">
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
       <%-- <input type="datetime-local" value="<%=obtenerFechaActual()%>" disabled>--%>
        <iframe name="myframe"></iframe>
        <input type="submit" value="Registrar">
    </form>
    <a href="listar.jsp">Regresar</a>
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
