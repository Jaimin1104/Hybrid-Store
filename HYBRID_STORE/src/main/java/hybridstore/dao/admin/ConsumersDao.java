package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.ConsumersModel;
import hybridstore.util.DBConnector;

public class ConsumersDao {
	private Connection connection = null;
	private String query;

	public boolean addConsumer(ConsumersModel consumer) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "insert into consumers (firstname, lastname, username, password, email, phoneno, address, profilepicture) values(?,?,?,?,?,?,?,?)";
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
	public boolean updateConsumer(ConsumersModel consumer) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "update consumers set firstname=?, lastname=?, dob=?, phoneno=?, address=?, profilepicture=? where consumerid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, consumer.getFirstname());
			pstmt.setString(2, consumer.getLastname());
			pstmt.setString(3, consumer.getDob());
			pstmt.setString(4, consumer.getPhoneno());
			pstmt.setString(5, consumer.getAddress());
			pstmt.setString(6, consumer.getProfilepicture());
			pstmt.setInt(7, consumer.getConsumerid());
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

	public boolean deleteConsumer(int consumerid) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "delete from consumers where consumerid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
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

	public ConsumersModel getConsumerInformation(int consumerid) {
		this.connection = new DBConnector().getConnection();
		ConsumersModel consumer = null;
		query = "select * from consumers where consumerid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet consumersResult = pstmt.executeQuery();
			if (consumersResult.next()) {
				consumer = new ConsumersModel();
				consumer.setAddress(consumersResult.getString("address"));
				consumer.setConsumerid(consumersResult.getInt("consumerid"));
				consumer.setEmail(consumersResult.getString("email"));
				consumer.setFirstname(consumersResult.getString("firstname"));
				consumer.setLastname(consumersResult.getString("lastname"));
				consumer.setPhoneno(consumersResult.getString("phoneno"));
				consumer.setProfilepicture(consumersResult.getString("profilepicture"));
				consumer.setUsername(consumersResult.getString("username"));
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
		return consumer;
	}
}
