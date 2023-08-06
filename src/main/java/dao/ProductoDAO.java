package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modelo.categoria;
import modelo.producto;

import static conexion.Conexion.getConnection;
public class ProductoDAO {
    public static List<producto> listar(){
        List<producto> list = new ArrayList<producto>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT producto.id, nombreProducto, proveedor.razonSocial, categoria.nombreCategoria, precioUnitario, unidadesStock FROM producto INNER JOIN proveedor on proveedor.id = producto.idProveedor INNER JOIN categoria on producto.idCategoria = categoria.id WHERE producto.idEstado = 1");
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
/*    public static List<producto> listar(){
        List<producto> list = new ArrayList<producto>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT id, nombreProducto, idProveedor, idCategoria, precioUnitario, unidadesStock FROM producto WHERE idEstado = 1;");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                producto prod = new producto();
                prod.setId(rs.getInt("id"));
                prod.setNombreProducto(rs.getString("nombreProducto"));
                prod.setIdProveedor(rs.getInt("idProveedor"));
                prod.setIdCategoria(rs.getInt("idCategoria"));
                prod.setPrecioUnitario(rs.getFloat("precioUnitario"));
                prod.setUnidadesStock(rs.getInt("unidadesStock"));
                list.add(prod);
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }*/
}
