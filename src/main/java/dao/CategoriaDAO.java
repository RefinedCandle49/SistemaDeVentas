package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.categoria;

import static conexion.Conexion.getConnection;

public class CategoriaDAO {
    public static List<categoria> listar() {
        List<categoria> list = new ArrayList<categoria>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT id, nombreCategoria, descripcion FROM categoria WHERE idEstado = 1 ORDER BY nombreCategoria ASC");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                categoria cat = new categoria();
                cat.setId(rs.getInt("id"));
                cat.setNombreCategoria(rs.getString("nombreCategoria"));
                cat.setDescripcion(rs.getString("descripcion"));
                list.add(cat);
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }

    public static int registrar(categoria cat){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO categoria (nombreCategoria, descripcion) VALUES (?, ?)");
            ps.setString(1, cat.getNombreCategoria());
            ps.setString(2, cat.getDescripcion());

            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static categoria buscarPorId(int id){
        categoria cat = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT nombreCategoria, descripcion FROM categoria WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                cat = new categoria();
                cat.setNombreCategoria(rs.getString("nombreCategoria"));
                cat.setDescripcion(rs.getString("descripcion"));
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return cat;
    }

    public static int actualizar(categoria cat){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE categoria SET nombreCategoria = ?, descripcion = ? WHERE id = ?");
            ps.setString(1, cat.getNombreCategoria());
            ps.setString(2, cat.getDescripcion());
            ps.setInt(3, cat.getId());
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }
}
