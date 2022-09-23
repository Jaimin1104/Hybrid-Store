package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.StockModel;
import hybridstore.util.DBConnector;

public class StockDao {
	private Connection connection = null;
	private ResultSet result;
	private PreparedStatement pstmt;
	private String query,statusquery;
	private boolean isSuccess = false;

	public boolean addStock(StockModel newStock) {
		this.connection = new DBConnector().getConnection();
		query = "insert into stock(branchid,productid,stock) values(?,?,?)";
		statusquery = "update products set status=? where productid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, newStock.getBranchid());
			pstmt.setInt(2, newStock.getProductid());
			pstmt.setInt(3, newStock.getStock());
			if (pstmt.executeUpdate() > 0) {
				pstmt = connection.prepareStatement(statusquery);
				pstmt.setString(1, "Active");
				pstmt.setInt(2, newStock.getProductid());
				if (pstmt.executeUpdate() > 0)
				{
					isSuccess = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
	
	public int getBranchId(String branchname) {
		this.connection = new DBConnector().getConnection();
		int branchid = -1;
		query = "select * from branches where branchname=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, branchname);
			result = pstmt.executeQuery();
			if(result.next())
			{
				branchid = result.getInt("branchid");
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
		return branchid;
	}
	

	public boolean updateStock(StockModel updateStock) {
		this.connection = new DBConnector().getConnection();
		query = "update stock set stock=? where productid=? and branchid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, updateStock.getStock());
			pstmt.setInt(2, updateStock.getProductid());
			pstmt.setInt(3, updateStock.getBranchid());
			if (pstmt.executeUpdate() > 0) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
}
