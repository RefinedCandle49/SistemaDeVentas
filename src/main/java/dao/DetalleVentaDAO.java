package dao;


import modelo.detalleVenta;
import modelo.producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            PreparedStatement ps = con.prepareStatement("SELECT producto.nombreProducto, cantidad, descuento FROM detalleventa INNER JOIN venta ON detalleventa.idVenta = venta.id INNER JOIN producto ON detalleventa.idProducto = producto.id WHERE venta.id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                detalleVenta detVenta = new detalleVenta();
                detVenta.setNombreProducto(rs.getString("producto.nombreProducto"));
                detVenta.setCantidad(Integer.parseInt(rs.getString("cantidad")));
                detVenta.setDescuento(Integer.parseInt(rs.getString("descuento")));

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


}
