package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modelo.proveedor;

import static conexion.Conexion.getConnection;
public class ProveedorDAO {
    public static List<proveedor> listar(){
        List<proveedor> list = new ArrayList<proveedor>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT id, razonSocial, representante, direccion, telefono FROM proveedor WHERE idEstado = 1");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                proveedor prov = new proveedor();
                prov.setId(rs.getInt("id"));
                prov.setRazonSocial(rs.getString("razonSocial"));
                prov.setRepresentante(rs.getString("representante"));
                prov.setDireccion(rs.getString("direccion"));
                prov.setTelefono(rs.getString("telefono"));
                list.add(prov);
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }

    public static int registrar(proveedor prov){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO proveedor (razonSocial, representante, direccion, telefono) VALUES (?, ?, ?, ?)");
            ps.setString(1, prov.getRazonSocial());
            ps.setString(2, prov.getRepresentante());
            ps.setString(3, prov.getDireccion());
            ps.setString(4, prov.getTelefono());

            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }
}
