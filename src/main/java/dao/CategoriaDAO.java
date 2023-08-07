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
            PreparedStatement ps = con.prepareStatement("SELECT id, nombreCategoria, descripcion FROM categoria WHERE idEstado = 1");
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
}
