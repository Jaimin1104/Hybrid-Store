package hybridstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.ConsumersModel;
import hybridstore.util.DBConnector;

public class SignInDao {
	private Connection connection;
	private String query;

	public boolean doSignIn(ConsumersModel consumer) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "insert into consumers (firstname, lastname, username, password, email, phoneno, address, profilepicture, dob) values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, consumer.getFirstname());
			pstmt.setString(2, consumer.getLastname());
			pstmt.setString(3, consumer.getUsername());
			pstmt.setString(4, consumer.getPassword());
			pstmt.setString(5, consumer.getEmail());
			pstmt.setString(6, consumer.getPhoneno());
			pstmt.setString(7, consumer.getAddress());
			pstmt.setString(8, consumer.getProfilepicture());
			pstmt.setString(9, consumer.getDob());

			if (pstmt.executeUpdate() > 0) {
				status = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
	}

	public boolean isValidConsumer(ConsumersModel consumer) {
		this.connection = new DBConnector().getConnection();
		boolean isValid = true;

		query = "select * from consumers where username=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, consumer.getUsername());

			ResultSet result = pstmt.executeQuery();
			if (result.next()) {
				isValid = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		return isValid;
	}
}
