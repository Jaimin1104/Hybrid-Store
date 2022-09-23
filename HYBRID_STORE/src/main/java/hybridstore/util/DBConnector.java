package hybridstore.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	Connection connection = null;
	private String username = "root";
	private String password = "";

	// To return connection
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hybridstore", username, password);
			System.out.println("Connection Established...");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}