package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.BranchesModel;
import hybridstore.util.DBConnector;

public class BranchesDao {
	Connection connection = null;
	String query;
	
	public BranchesDao() {
		connection = new DBConnector().getConnection();
	}
	
	public int addBranch(BranchesModel newBranch) {
		int status = 0;
		query = "insert into branches (branchname, status, address, pincode) values (?,?,?,?);";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, newBranch.getBranchname());
			pstmt.setString(2, newBranch.getStatus());
			pstmt.setString(3, newBranch.getAddress());
			pstmt.setInt(4, newBranch.getPincode());

			status = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public int updateBranch(BranchesModel branch) {
		int status = 0;
		
		try {
			query = "update branches set branchname=?, status=?, address=?, pincode=? where branchid=?";
			
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, branch.getBranchname());
			pstmt.setString(2, branch.getStatus());
			pstmt.setString(3, branch.getAddress());
			pstmt.setInt(4, branch.getPincode());
			pstmt.setInt(5, branch.getBranchid());
			
			status = pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public boolean isBranchExist(BranchesModel newBranch) {
		boolean status = false;
		query = "select * from branches where branchname=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, newBranch.getBranchname());

			ResultSet existingBranch = pstmt.executeQuery();
			if (existingBranch.next()) {
				status = true;
			}
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public boolean removeBranch(int branchid) {
		boolean status = false;
		query = "delete from branches where branchid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, branchid);
			pstmt.execute();
			status = true;
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
}
