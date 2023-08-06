package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modelo.venta;

import static conexion.Conexion.getConnection;
public class VentaDAO {
    public static List<venta> listar() {
        List<venta> list = new ArrayList<venta>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT venta.id, cliente,empleado.nombre, empleado.apellido, fechaVenta, monto FROM venta INNER JOIN empleado on venta.idEmpleado = empleado.id");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                venta vent = new venta();
                vent.setId(rs.getInt("venta.id"));
                vent.setCliente(rs.getString("cliente"));
                vent.setNombreEmpleado(rs.getString("empleado.nombre"));
                vent.setApellidoEmpleado(rs.getString("empleado.apellido"));
                vent.setFechaVenta(rs.getString("fechaVenta"));
                vent.setMonto(rs.getFloat("monto"));

                list.add(vent);
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }

    /*public static List<venta> listar() {
        List<venta> list = new ArrayList<venta>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT venta.id, cliente, empleado.nombre, fechaVenta, monto FROM venta INNER JOIN empleado on venta.idEmpleado = empleado.id");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                venta vent = new venta();
                vent.setId(rs.getInt("venta.id"));
                vent.setCliente(rs.getString("cliente"));
                vent.setNombreEmpleado(rs.getString("empleado.nombre"));
                vent.setFechaVenta(rs.getString("fechaVenta"));
                vent.setMonto(rs.getFloat("monto"));

                list.add(vent);
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }*/
}
