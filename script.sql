CREATE DATABASE dbtienda;
create table dbtienda.estado
(
    id     int auto_increment
        primary key,
    estado varchar(8) not null
);

create table dbtienda.categoria
(
    id              int auto_increment
        primary key,
    nombreCategoria varchar(100)  not null,
    descripcion     varchar(200)  null,
    idEstado        int default 1 not null,
    constraint fk_categoria_estado
        foreign key (idEstado) references dbtienda.estado (id)
);

create table dbtienda.empleado
(
    id       int auto_increment
        primary key,
    nombre   varchar(50)   not null,
    apellido varchar(50)   not null,
    dni      varchar(8)    not null
        check (`dni` > 0),
    idEstado int default 1 not null,
    constraint fk_empleado_estado
        foreign key (idEstado) references dbtienda.estado (id)
);

create table dbtienda.proveedor
(
    id            int auto_increment
        primary key,
    razonSocial   varchar(100)  not null,
    representante varchar(100)  not null,
    direccion     varchar(200)  not null,
    telefono      varchar(9)    null
        check (`telefono` > 0),
    idEstado      int default 1 not null,
    constraint fk_proveedor_estado
        foreign key (idEstado) references dbtienda.estado (id)
);

create table dbtienda.producto
(
    id             int auto_increment
        primary key,
    nombreProducto varchar(100)  not null,
    idProveedor    int           not null,
    idCategoria    int           not null,
    precioUnitario float         not null
        check (`precioUnitario` > 0),
    unidadesStock  int           not null
        check (`unidadesStock` >= 0),
    idEstado       int default 1 not null,
    constraint fk_producto_categoria
        foreign key (idCategoria) references dbtienda.categoria (id),
    constraint fk_producto_estado
        foreign key (idEstado) references dbtienda.estado (id),
    constraint fk_producto_proveedor
        foreign key (idProveedor) references dbtienda.proveedor (id)
);

create table dbtienda.venta
(
    id         int auto_increment
        primary key,
    cliente    varchar(100)    not null,
    idEmpleado int             not null,
    fechaVenta datetime        null,
    monto      float default 0 null,
    constraint fk_venta_empleado
        foreign key (idEmpleado) references dbtienda.empleado (id)
);

create table dbtienda.detalleventa
(
    id         int auto_increment
        primary key,
    idVenta    int           not null,
    idProducto int           not null,
    cantidad   int           not null
        check (`cantidad` > 0),
    descuento  int default 0 not null
        check (`descuento` >= 0),
    constraint fk_detalleVenta_producto
        foreign key (idProducto) references dbtienda.producto (id),
    constraint fk_detalleVenta_venta
        foreign key (idVenta) references dbtienda.venta (id)
            on delete cascade
);

create
    definer = root@localhost procedure dbtienda.addDetalleVenta(IN addIdVenta int, IN addIdProducto int,
                                                                IN addCantidad int, IN addDescuento int)
BEGIN

    INSERT INTO detalleventa (idVenta, idProducto, cantidad, descuento)
    SELECT addIdVenta, addIdProducto, addCantidad, addDescuento
    FROM producto
    WHERE producto.id = addIdProducto
      AND producto.idEstado = 1;

    UPDATE venta
        JOIN (SELECT idVenta,
                     SUM(round((cantidad) * (producto.precioUnitario - detalleventa.descuento), 2)) precioProductos
              FROM detalleventa
                       INNER JOIN producto on producto.id = detalleventa.idProducto
              GROUP BY idVenta) as subquery ON venta.id = subquery.idVenta
    SET venta.monto = subquery.precioProductos
    WHERE venta.id = addIdVenta;

    UPDATE producto
        JOIN (SELECT idProducto, SUM(cantidad) as totalCantidad
              FROM detalleventa
              WHERE idVenta = addIdVenta
              GROUP BY idProducto) as subquery ON producto.id = subquery.idProducto
    SET producto.unidadesStock = producto.unidadesStock - subquery.totalCantidad;

end;


