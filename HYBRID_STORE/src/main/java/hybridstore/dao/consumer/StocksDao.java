package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.util.DBConnector;

public class StocksDao {
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public boolean updateStocks(int stockid,int stock) {
		this.connection = new DBConnector().getConnection();
		query = "update stock set stock=? where stockid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, stock);
			pstmt.setInt(2, stockid);
			if(pstmt.executeUpdate() > 0)
			{
				isSuccess = true;
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
		return isSuccess;
	}
	
	public int getStockIdByProductAndBranch(int productid,int branchid) {
		int stockid = 0;
		this.connection = new DBConnector().getConnection();
		query = "select stockid from stock where productid=? and branchid = ?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, productid);
			pstmt.setInt(2, branchid);
			ResultSet stockResult = pstmt.executeQuery();
			if(stockResult.next())
			{
				stockid = stockResult.getInt("stockid");
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
		return stockid;
	}
}
