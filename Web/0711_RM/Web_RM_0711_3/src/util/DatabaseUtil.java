package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			String dbURL="jdbc:mysql://localhost:3306/ASD";
			String dbID="root";
			String dbPassword="12345";
			Class.forName("com.mysql.jdbc.Driver");
			
			conn= DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
