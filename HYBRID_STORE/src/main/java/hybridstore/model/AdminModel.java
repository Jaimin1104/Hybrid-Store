package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class AdminModel {

	private String username;
	private String firstname;
	private String lastname;
	private String password;
	private String email;
	private String profilepicture;

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}
	
	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProfilepicture() {
		return profilepicture;
	}

	public void setProfilepicture(String profilepicture) {
		this.profilepicture = profilepicture;
	}
	
	public ArrayList<AdminModel> getAllAdmin()
	{
		ArrayList<AdminModel> allAdmins = new ArrayList<AdminModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from admin";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet adminResult = pstmt.executeQuery();
			while(adminResult.next())
			{
				AdminModel admin = new AdminModel();
				admin.username = adminResult.getString("username");
				admin.firstname = adminResult.getString("firstname");
				admin.lastname = adminResult.getString("lastname");
				admin.password = adminResult.getString("password");
				admin.email = adminResult.getString("email");
				admin.profilepicture = adminResult.getString("profilepicture");
				allAdmins.add(admin);
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
		return allAdmins;
	}

}
