package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.model.StaffModel;
import hybridstore.util.DBConnector;

public class StaffDao {
	private Connection connection = null;
	private String query;
	
	public boolean addStaffMember(StaffModel newStaff) {
		connection = new DBConnector().getConnection();
		boolean status = false;
		query = "insert into staff (branchid, firstname, lastname, username, password, email, phoneno, dob, address, profilepicture) values (?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, newStaff.getBranchid());
			pstmt.setString(2, newStaff.getFirstname());
			pstmt.setString(3, newStaff.getLastname());
			pstmt.setString(4, newStaff.getUsername());
			pstmt.setString(5, newStaff.getPassword());
			pstmt.setString(6, newStaff.getEmail());
			pstmt.setString(7, newStaff.getPhoneno());
			pstmt.setString(8, newStaff.getDob());
			pstmt.setString(9, newStaff.getAddress());
			pstmt.setString(10, newStaff.getProfilepicture());
			
			if(pstmt.executeUpdate() > 0)
			{
				status = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	
	public boolean updateStaffMember(StaffModel updateStaff) {
		connection = new DBConnector().getConnection();
		boolean status = false;
		query = "update staff set firstname=?,lastname=?,email=?,phoneno=?,dob=?,address=?,profilepicture=? where staffid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, updateStaff.getFirstname());
			pstmt.setString(2, updateStaff.getLastname());
			pstmt.setString(3, updateStaff.getEmail());
			pstmt.setString(4, updateStaff.getPhoneno());
			pstmt.setString(5, updateStaff.getDob());
			pstmt.setString(6, updateStaff.getAddress());
			pstmt.setString(7, updateStaff.getProfilepicture());
			pstmt.setInt(8, updateStaff.getStaffid());
			
			if(pstmt.executeUpdate() > 0)
			{
				status = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	
	public boolean deleteStaff(int staffid) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "delete from staff where staffid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, staffid);
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
}
