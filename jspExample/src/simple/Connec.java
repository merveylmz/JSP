package simple;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by ss on 3.7.2017.
 */
public class Connec {

    public static String driver = "com.mysql.jdbc.Driver";
    public static String url = "jdbc:mysql://localhost:3306/users";
    public static String username = "root";
    public static String password = "135679";
    public static Connection conn = null;

    public static Connection getConnection() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
