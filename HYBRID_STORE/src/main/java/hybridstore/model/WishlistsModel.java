package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class WishlistsModel {
	private int consumerid;
	private int productid;
	
	public int getConsumerid() {
		return consumerid;
	}
	
	public void setConsumerid(int consumerid) {
		this.consumerid = consumerid;
	}
	
	public int getProductid() {
		return productid;
	}
	
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	public ArrayList<WishlistsModel> getAllProductsLikedByConsumer(int consumerid)
	{
		ArrayList<WishlistsModel> allWishlistPeoductsOfConsumer = new ArrayList<WishlistsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from wishlists where consumerid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet wishlistResult = pstmt.executeQuery();
			while(wishlistResult.next())
			{
				WishlistsModel wishlist = new WishlistsModel();
				wishlist.consumerid = wishlistResult.getInt("consumerid");
				wishlist.productid = wishlistResult.getInt("productid");
				allWishlistPeoductsOfConsumer.add(wishlist);
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
		return allWishlistPeoductsOfConsumer;
	}
	
	public boolean isPresent(int consumerid,int productid)
	{
		boolean isSuccess = false;
		Connection connection = new DBConnector().getConnection();
		String query = "select * from wishlists where consumerid=? and productid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			pstmt.setInt(2, productid);
			ResultSet wishlistResult = pstmt.executeQuery();
			if(wishlistResult.next())
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
	
	public int getLikes(int productid)
	{
		int likes = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(productid) as likesOfProduct from wishlists where productid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, productid);
			ResultSet wishlistResult = pstmt.executeQuery();
			if(wishlistResult.next())
			{
				likes = wishlistResult.getInt("likesOfProduct");
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
		return likes;
	}
}
