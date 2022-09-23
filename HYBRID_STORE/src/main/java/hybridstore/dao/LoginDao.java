package hybridstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.AdminModel;
import hybridstore.model.ConsumersModel;
import hybridstore.model.LoginModel;
import hybridstore.model.StaffModel;
import hybridstore.util.DBConnector;

public class LoginDao {
	private Connection connection = null;
	private ResultSet result = null;
	private String query;
	private boolean isFound;

	public Object doLogin(LoginModel user) {
		this.connection = new DBConnector().getConnection();
		Object object = null;

		if (isAdmin(user)) {
			AdminModel admin = new AdminModel();
			
			query = "select * from admin where username=?";
			try {
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setString(1, user.getUsername());

				result = pstmt.executeQuery();
				if (result.next()) {
					admin.setUsername(result.getString("username"));
					admin.setPassword(result.getString("password"));
					admin.setEmail(result.getString("email"));
					admin.setFirstname(result.getString("firstname"));
					admin.setLastname(result.getString("lastname"));
					admin.setProfilepicture(result.getString("profilepicture"));;
				}
				object = admin;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
//					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			object = admin;
		} else if (isStaff(user)) {
			StaffModel staff = new StaffModel();

			query = "select * from staff where username=?";
			try {
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setString(1, user.getUsername());

				result = pstmt.executeQuery();
				if (result.next()) {
					staff = new StaffModel().getStaff(result.getInt("staffid"));
				}
				object = staff;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
//					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else if (isConsumer(user)) {
			ConsumersModel consumer = new ConsumersModel();

			query = "select * from consumers where username=?";
			try {
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setString(1, user.getUsername());

				result = pstmt.executeQuery();
				if (result.next()) {
					consumer = new ConsumersModel().getConsumer(result.getInt("consumerid"));
				}
				object = consumer;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
//					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else {
			object = null;
		}
		return object;
	}

	public boolean isAdmin(LoginModel user) {
		this.connection = new DBConnector().getConnection();
		query = "select * from admin where username=? and password=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());

			result = pstmt.executeQuery();
			if (result.next()) {
				isFound = true;
			} else {
				isFound = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
	//			connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isFound;
	}

	public boolean isStaff(LoginModel user) {
		this.connection = new DBConnector().getConnection();
		query = "select * from staff where username=? and password=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());

			result = pstmt.executeQuery();
			if (result.next()) {
				isFound = true;
			} else {
				isFound = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
	//			connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isFound;
	}

	public boolean isConsumer(LoginModel user) {
		this.connection = new DBConnector().getConnection();
		query = "select * from consumers where username=? and password=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());

			result = pstmt.executeQuery();
			if (result.next()) {
				isFound = true;
			} else {
				isFound = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
	//			connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isFound;
	}

	public boolean isRegisteredEmail(String email) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		try {
			query = "select * from admin where email=?";
			PreparedStatement adminPstmt = connection.prepareStatement(query);
			adminPstmt.setString(1, email);
			ResultSet adminResult = adminPstmt.executeQuery();

			query = "select * from staff where email=?";
			PreparedStatement staffPstmt = connection.prepareStatement(query);
			staffPstmt.setString(1, email);
			ResultSet staffResult = staffPstmt.executeQuery();

			query = "select * from consumers where email=?";
			PreparedStatement consumersPstmt = connection.prepareStatement(query);
			consumersPstmt.setString(1, email);
			ResultSet consumerResult = consumersPstmt.executeQuery();

			if (adminResult.next() || staffResult.next() || consumerResult.next()) {
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

	public boolean changePassword(String newPassword, String email) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "update consumers set password=? where email=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, email);

			status = pstmt.execute();
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
}
