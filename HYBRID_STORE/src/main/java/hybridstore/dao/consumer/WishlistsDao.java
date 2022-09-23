package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.util.DBConnector;

public class WishlistsDao {
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public boolean addProductInWishlist(int consumerid,int productid)
	{
		connection = new DBConnector().getConnection();
		query = "insert into wishlists (consumerid,productid) values (?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			pstmt.setInt(2, productid);
			if(pstmt.executeUpdate()>0)
			{
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
	
	public boolean removeProductFromWishlist(int consumerid,int productid)
	{
		connection = new DBConnector().getConnection();
		query = "delete from wishlists where consumerid=? and productid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			pstmt.setInt(2, productid);
			if(pstmt.executeUpdate()>0)
			{
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
