package dao;


import modelo.detalleVenta;
import modelo.producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import static conexion.Conexion.getConnection;

public class DetalleVentaDAO {

    public static int registrar(detalleVenta detVenta){
        int estado = 0;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO detalleventa (idVenta, idProducto, cantidad, descuento) VALUES (?, ?, ?, ?)");
            ps.setInt(1, detVenta.getIdVenta());
            ps.setInt(2, detVenta.getIdProducto());
            ps.setInt(3, detVenta.getCantidad());
            ps.setInt(4, detVenta.getDescuento());
            estado = ps.executeUpdate();




        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static int actualizarMonto(int idVenta){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE venta JOIN (SELECT idVenta, SUM(round((cantidad) * (producto.precioUnitario - detalleventa.descuento), 2)) precioProductos FROM detalleventa INNER JOIN producto on producto.id = detalleventa.idProducto GROUP BY idVenta) as subquery ON venta.id = subquery.idVenta SET venta.monto = subquery.precioProductos WHERE venta.id = ?");
            ps.setInt(1, idVenta);
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static int actualizarStock(int unidadesStock, int idProducto, int cantidad){
        int stockActualizado = (unidadesStock - cantidad);
        int estado = 0;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE producto SET unidadesStock = ? WHERE id = ?");
            ps.setInt(1, stockActualizado);
            ps.setInt(2, idProducto);
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static List<detalleVenta> listar(int id) {
        List<detalleVenta> list = new ArrayList<detalleVenta>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT producto.id, producto.nombreProducto, producto.precioUnitario, cantidad, descuento FROM detalleventa INNER JOIN venta ON detalleventa.idVenta = venta.id INNER JOIN producto ON detalleventa.idProducto = producto.id WHERE venta.id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                detalleVenta detVenta = new detalleVenta();
                detVenta.setIdProducto(rs.getInt("producto.id"));
                detVenta.setNombreProducto(rs.getString("producto.nombreProducto"));
                detVenta.setPrecioUnitario(rs.getFloat("producto.precioUnitario"));
                detVenta.setCantidad(rs.getInt("cantidad"));
                detVenta.setDescuento(Integer.parseInt(rs.getString("descuento")));

                DecimalFormat df = new DecimalFormat("#.##");
                detVenta.setTotal(Double.parseDouble(df.format(detVenta.getPrecioUnitario() * detVenta.getCantidad())));

                list.add(detVenta);
            }


        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }

    public static producto buscarStock(int idProducto) {
        producto prod = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT unidadesStock FROM producto WHERE id = ?");
            ps.setInt(1, idProducto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                prod = new producto();
                prod.setUnidadesStock(rs.getInt("unidadesStock"));
            }
        } catch (Exception e){
            System.out.println(e);
        }
        return prod;
    }

    public static List<producto> listarProductosConStock(){
        List<producto> list = new ArrayList<producto>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT producto.id, nombreProducto, proveedor.razonSocial, categoria.nombreCategoria, precioUnitario, unidadesStock FROM producto INNER JOIN proveedor on proveedor.id = producto.idProveedor INNER JOIN categoria on producto.idCategoria = categoria.id WHERE producto.idEstado = 1 AND producto.unidadesStock > 0 ORDER BY nombreProducto ASC");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                producto prod = new producto();
                prod.setId(rs.getInt("producto.id"));
                prod.setNombreProducto(rs.getString("nombreProducto"));
                prod.setRazonSocial(rs.getString("proveedor.razonSocial"));
                prod.setNombreCategoria(rs.getString("categoria.nombreCategoria"));
                prod.setPrecioUnitario(rs.getFloat("precioUnitario"));
                prod.setUnidadesStock(rs.getInt("unidadesStock"));
                list.add(prod);
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }


}
