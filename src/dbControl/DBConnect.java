package dbControl;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 * Created by throughkim on 2016. 9. 28..
 */
public class DBConnect {
    public DBConnect() {}

    public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/insta?autoReconnect=true&useSSL=false";
        String id = "root";
        String pw = "5461652";

        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,id,pw);
        }catch(Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
