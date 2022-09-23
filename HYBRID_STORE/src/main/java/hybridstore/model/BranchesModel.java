package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class BranchesModel {
	private int branchid;
	private String branchname, address, status;
	private int pincode;

	public String getAddress() {
		return address;
	}

	public int getBranchid() {
		return branchid;
	}

	public String getBranchname() {
		return branchname;
	}

	public int getPincode() {
		return pincode;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status.substring(0, 1).toUpperCase() + status.substring(1);
	}

	public ArrayList<BranchesModel> getAllBranches()
	{
		ArrayList<BranchesModel> allBranches = new ArrayList<BranchesModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from branches";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet branches = pstmt.executeQuery();
			if(branches.next())
			{
				branches.previous();
				while(branches.next())
				{
					BranchesModel branch = new BranchesModel();
					branch.branchid = branches.getInt("branchid");
					branch.branchname = branches.getString("branchname");
					branch.address = branches.getString("address");
					branch.pincode = branches.getInt("pincode");
					branch.status = branches.getString("status");
					allBranches.add(branch);
				}
			}
			else
			{
				allBranches = null;
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return allBranches;
	}
	
	public BranchesModel getBranch(int branchid)
	{
		Connection connection = new DBConnector().getConnection();
		String query = "select * from branches where branchid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, branchid);
			ResultSet branchesResult = pstmt.executeQuery();
			if (branchesResult.next())
			{
				this.branchid = branchesResult.getInt("branchid");
				this.branchname = branchesResult.getString("branchname");
				this.address = branchesResult.getString("address");
				this.pincode = branchesResult.getInt("pincode");
				this.status = branchesResult.getString("status");
			}
			else
			{
				System.out.println("branch not found");
			}
			connection.close();
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
}
