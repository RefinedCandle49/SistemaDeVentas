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
            PreparedStatement ps = con.prepareStatement("SELECT id, nombre, apellido, dni FROM empleado WHERE idEstado = 1");
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
}
