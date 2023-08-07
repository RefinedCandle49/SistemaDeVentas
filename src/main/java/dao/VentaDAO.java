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
            PreparedStatement ps = con.prepareStatement("SELECT venta.id, cliente,empleado.nombre, empleado.apellido, fechaVenta, monto FROM venta INNER JOIN empleado on venta.idEmpleado = empleado.id ORDER BY fechaVenta DESC");
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

    public static int registrar(venta vent){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO venta (cliente, idEmpleado, fechaVenta) VALUES (?, ?, ?)");
            ps.setString(1, vent.getCliente());
            ps.setInt(2, vent.getIdEmpleado());
            ps.setString(3, obtenerFechaActual());

            estado = ps.executeUpdate();
        }catch (Exception e) {
            System.out.println(e);
        }
        return estado;
    }
    public static String obtenerFechaActual() {
        java.util.Date fecha = new java.util.Date();
        java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyyy-MM-dd' 'HH:mm:ss");
        return formato.format(fecha);
    }

}
