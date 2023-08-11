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
            PreparedStatement ps = con.prepareStatement("SELECT producto.id, nombreProducto, proveedor.razonSocial, categoria.nombreCategoria, precioUnitario, unidadesStock FROM producto INNER JOIN proveedor on proveedor.id = producto.idProveedor INNER JOIN categoria on producto.idCategoria = categoria.id WHERE producto.idEstado = 1 ORDER BY nombreProducto ASC");
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

    public static int registrar(producto prod){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO producto (nombreProducto, idProveedor, idCategoria, precioUnitario, unidadesStock) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, prod.getNombreProducto());
            ps.setInt(2, prod.getIdProveedor());
            ps.setInt(3, prod.getIdCategoria());
            ps.setFloat(4, prod.getPrecioUnitario());
            ps.setInt(5, prod.getUnidadesStock());

            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static producto buscarPorId(int id){
        producto prod = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT nombreProducto, idProveedor, proveedor.razonSocial, idCategoria, categoria.nombreCategoria, precioUnitario, unidadesStock FROM producto INNER JOIN proveedor on proveedor.id = producto.idProveedor INNER JOIN categoria on producto.idCategoria = categoria.id WHERE producto.id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                prod = new producto();
                prod.setNombreProducto(rs.getString("nombreProducto"));
                prod.setIdProveedor(rs.getInt("idProveedor"));
                prod.setRazonSocial(rs.getString("proveedor.razonSocial"));
                prod.setNombreCategoria(rs.getString("categoria.nombreCategoria"));
                prod.setIdCategoria(rs.getInt("idCategoria"));
                prod.setPrecioUnitario(rs.getFloat("precioUnitario"));
                prod.setUnidadesStock(rs.getInt("unidadesStock"));
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return prod;
    }


    public static int actualizar(producto prod){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE producto SET nombreProducto = ?, idProveedor = ?, idCategoria = ?, precioUnitario = ?, unidadesStock = ? WHERE id = ?");
            ps.setString(1, prod.getNombreProducto());
            ps.setInt(2, prod.getIdProveedor());
            ps.setInt(3, prod.getIdCategoria());
            ps.setFloat(4, prod.getPrecioUnitario());
            ps.setInt(5, prod.getUnidadesStock());
            ps.setInt(6, prod.getId());
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static int desactivarProducto(int id){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE producto SET idEstado = 2 WHERE id = ?");
            ps.setInt(1, id);
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

}
