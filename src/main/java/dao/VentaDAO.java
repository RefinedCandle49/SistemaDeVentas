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
            PreparedStatement ps = con.prepareStatement("SELECT venta.id, cliente, empleado.nombre, empleado.apellido, fechaVenta, monto FROM venta INNER JOIN empleado on venta.idEmpleado = empleado.id ORDER BY fechaVenta DESC");
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

    public static int ultimoID(){
        int mayorId = 1;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT MAX(id) FROM venta");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                mayorId = rs.getInt("MAX(id)");
            }
            
        }catch (Exception e){
            System.out.println(e);
        }
        return mayorId;
    }

/*    public static venta buscarPorId(int id) {
        venta vent = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT venta.id, cliente, idEmpleado, empleado.nombre, fechaVenta, monto FROM venta INNER JOIN empleado on empleado.id = venta.idEmpleado WHERE venta.id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                vent = new venta();
                vent.setId(rs.getInt("venta.id"));
                vent.setCliente(rs.getString("cliente"));
                vent.setIdEmpleado(Integer.parseInt(rs.getString("idEmpleado")));
                vent.setNombreEmpleado("empleado.nombre");
                vent.setFechaVenta(rs.getString("fechaVenta"));
                vent.setMonto(Float.parseFloat(rs.getString("monto")));
            }
        } catch (Exception e){
            System.out.println(e);
        }
        return vent;
    }*/
    public static String obtenerFechaActual() {
        java.util.Date fecha = new java.util.Date();
        java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyyy-MM-dd' 'HH:mm:ss");
        return formato.format(fecha);
    }

    public static venta buscarPorId(int id) {
        venta vent = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT venta.id, cliente, idEmpleado, empleado.nombre, fechaVenta, monto FROM venta INNER JOIN empleado on empleado.id = venta.idEmpleado WHERE venta.id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                vent = new venta();
                vent.setId(rs.getInt("venta.id"));
                vent.setCliente(rs.getString("cliente"));
                vent.setIdEmpleado(Integer.parseInt(rs.getString("idEmpleado")));
                vent.setNombreEmpleado("empleado.nombre");
                vent.setFechaVenta(rs.getString("fechaVenta"));
                vent.setMonto(Float.parseFloat(rs.getString("monto")));
            }
        } catch (Exception e){
            System.out.println(e);
        }
        return vent;
    }

    public static int desactivarVenta(int id){
        int estado = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM venta WHERE id = ?");
            ps.setInt(1, id);
            estado = ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return estado;
    }

}
