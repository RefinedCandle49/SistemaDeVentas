package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    public static Connection getConnection(){
        Connection con = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtienda?useSSL=false", "root", "");
        } catch (Exception e){
            System.out.println(e);
        }
        return con;
    }
}
