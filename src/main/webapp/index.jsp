<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="estilos/general.css">
    <link rel="stylesheet" href="estilos/index.css">
    <title>JSP - Hello World</title>
</head>
<body>
<header class="sidebar">
    <nav>
        <ul>
            <li><a class="sidebarLink" href="categoria/listar.jsp" target="miIframe">Categoría</a></li>
            <li><a class="sidebarLink" href="empleado/listar.jsp" target="miIframe">Empleado</a></li>
            <li><a class="sidebarLink" href="proveedor/listar.jsp" target="miIframe">Proveedor</a></li>
            <li><a class="sidebarLink" href="producto/listar.jsp" target="miIframe">Producto</a></li>
            <li><a class="sidebarLink" href="venta/listar.jsp" target="miIframe">Venta</a></li>
        </ul>
    </nav>
</header>
<main class="principal">
    
    <iframe class="generalFrame" name="miIframe"  <%--src="categoria/listar.jsp"--%>></iframe>
    
</main>
</body>
</html>