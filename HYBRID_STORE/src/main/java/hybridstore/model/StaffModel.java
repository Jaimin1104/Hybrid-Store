package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import hybridstore.util.DBConnector;

public class StaffModel {
	private int staffid;
	private int branchid;
	private String firstname;
	private String lastname;
	private String username;
	private String password;
	private String email;
	private String dob;
	private String phoneno;
	private String address;
	private String profilepicture;
	

	public int getBranchid() {
		return branchid;
	}

	public String getDob() {
		return dob;
	}

	public String getEmail() {
		return email;
	}

	public String getFirstname() {
		return firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public String getPassword() {
		return password;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public int getStaffid() {
		return staffid;
	}

	public String getUsername() {
		return username;
	}

	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public void setStaffid(int staffid) {
		this.staffid = staffid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProfilepicture() {
		return this.profilepicture;
	}

	public void setProfilepicture(String profilepicture) {
		this.profilepicture = profilepicture;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public ArrayList<StaffModel> getAllStaff()
	{
		ArrayList<StaffModel> allStaff = new ArrayList<StaffModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from staff";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet staffResult = pstmt.executeQuery();
			while(staffResult.next())
			{
				StaffModel staffMember = new StaffModel();
				staffMember.staffid = staffResult.getInt("staffid");
				staffMember.branchid = staffResult.getInt("branchid");
				staffMember.firstname = staffResult.getString("firstname");
				staffMember.lastname = staffResult.getString("lastname");
				staffMember.username = staffResult.getString("username");
				staffMember.password = staffResult.getString("password");
				staffMember.email = staffResult.getString("email");
				staffMember.dob = staffResult.getString("dob");
				staffMember.phoneno = staffResult.getString("phoneno");
				staffMember.address = staffResult.getString("address");
				staffMember.profilepicture = staffResult.getString("profilepicture");
				allStaff.add(staffMember);
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
		return allStaff;
	}
	
	public StaffModel getStaff(int staffid)
	{
		Connection connection = new DBConnector().getConnection();
		String query = "select * from staff where staffid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,staffid);
			ResultSet staffResult = pstmt.executeQuery();
			if(staffResult.next())
			{
				this.staffid = staffResult.getInt("staffid");
				this.branchid = staffResult.getInt("branchid");
				this.firstname = staffResult.getString("firstname");
				this.lastname = staffResult.getString("lastname");
				this.username = staffResult.getString("username");
				this.password = staffResult.getString("password");
				this.email = staffResult.getString("email");
				this.dob = staffResult.getString("dob");
				this.phoneno = staffResult.getString("phoneno");
				this.address = staffResult.getString("address");
				this.profilepicture = staffResult.getString("profilepicture");
				System.out.println("this.address : " + this.address);
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
		return this;
	}
	
	public ArrayList<StaffModel> getBranchStaff(int branchid)
	{
		ArrayList<StaffModel> allStaff = new ArrayList<StaffModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from staff where branchid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,branchid);
			ResultSet staffResult = pstmt.executeQuery();
			
			while(staffResult.next())
			{
				StaffModel staffMember = new StaffModel();
				staffMember.staffid = staffResult.getInt("staffid");
				staffMember.branchid = staffResult.getInt("branchid");
				staffMember.firstname = staffResult.getString("firstname");
				staffMember.lastname = staffResult.getString("lastname");
				staffMember.username = staffResult.getString("username");
				staffMember.password = staffResult.getString("password");
				staffMember.email = staffResult.getString("email");
				staffMember.dob = staffResult.getString("dob");
				staffMember.phoneno = staffResult.getString("phoneno");
				staffMember.address = staffResult.getString("address");
				staffMember.profilepicture = staffResult.getString("profilepicture");
				allStaff.add(staffMember);
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
		return allStaff;
	}
	
	public StaffModel getOrderStaff(int orderid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from staff where staffid = (select staffid from orders where orderid = ?)";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orderid);
			ResultSet staffResult = pstmt.executeQuery();
			if (staffResult.next()) {
				this.staffid = staffResult.getInt("staffid");
				this.branchid = staffResult.getInt("branchid");
				this.firstname = staffResult.getString("firstname");
				this.lastname = staffResult.getString("lastname");
				this.username = staffResult.getString("username");
				this.password = staffResult.getString("password");
				this.email = staffResult.getString("email");
				this.dob = staffResult.getString("dob");
				this.phoneno = staffResult.getString("phoneno");
				this.address = staffResult.getString("address");
				this.profilepicture = staffResult.getString("profilepicture");
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
		return this;
	}
	
	public StaffModel assignStaffToOrder(int branchid) {
		ArrayList<StaffModel> allStaffOfBranch = new StaffModel().getBranchStaff(branchid);
		Collections.shuffle(allStaffOfBranch);
		return allStaffOfBranch.get(0);
	}
}
