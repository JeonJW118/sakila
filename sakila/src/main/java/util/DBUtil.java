package util;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;



public class DBUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila","root","java1234");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
		return conn;
	}
	}
}