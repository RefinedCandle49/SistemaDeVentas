package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.empleado;

import static conexion.Conexion.getConnection;
public class EmpleadoDAO {
    public static List<empleado> listar(){
        List<empleado> list = new ArrayList<empleado>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT id, nombre, apellido, dni FROM empleado WHERE idEstado = 1 ORDER BY apellido ASC");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                empleado emp = new empleado();
                emp.setId(rs.getInt("id"));
                emp.setNombre(rs.getString("nombre"));
                emp.setApellido(rs.getString("apellido"));
                emp.setDni(rs.getString("dni"));
                list.add(emp);
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }

    public static int registrar(empleado emp){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO empleado (nombre, apellido, dni) VALUES (?, ?, ?)");
            ps.setString(1, emp.getNombre());
            ps.setString(2, emp.getApellido());
            ps.setString(3, emp.getDni());

            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

    public static empleado buscarPorId(int id){
        empleado emp = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT nombre, apellido, dni FROM empleado WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                emp = new empleado();
                emp.setNombre(rs.getString("nombre"));
                emp.setApellido(rs.getString("apellido"));
                emp.setDni(rs.getString("dni"));
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return emp;
    }

    public static int actualizar(empleado emp){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE empleado SET nombre = ?, apellido = ?, dni = ? WHERE id = ?");
            ps.setString(1, emp.getNombre());
            ps.setString(2, emp.getApellido());
            ps.setString(3, emp.getDni());
            ps.setInt(4, emp.getId());
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }


}
