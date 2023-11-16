
package pack;

import java.sql.Connection;
import java.sql.DriverManager;


public class Dbconnection {
    
    public static Connection getConn()throws Exception{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hybrid_cloud","root","akash");
        return con;
    
    }
   
}
