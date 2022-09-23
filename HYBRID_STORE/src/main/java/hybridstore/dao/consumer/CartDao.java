package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.model.CartItemsModel;
import hybridstore.model.CartModel;
import hybridstore.util.DBConnector;

public class CartDao {
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query,query2;
	private boolean isSuccess = false;
	
	public boolean addNewCartOfConsumer()
	{
		connection = new DBConnector().getConnection();
		query = "select consumerid from consumers order by consumerid desc limit 1";
		query2 = "insert into carts(consumerid,noofproducts,subtotal,status) values(?,0,0,'active')";
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			if(result.next())
			{
				pstmt = connection.prepareStatement(query2);
				pstmt.setInt(1, result.getInt("consumerid"));
				if(pstmt.executeUpdate() > 0)
				{
					isSuccess = true;
				}
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
	
	public boolean addNewCartOfConsumer(int consumerid)
	{
		connection = new DBConnector().getConnection();
		query = "insert into carts(consumerid,noofproducts,subtotal,status) values(?,0,0,'active')";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
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
	
	public boolean disableCurrentCartOfConsumer(int consumerid)
	{
		connection = new DBConnector().getConnection();
		query = "update carts set status = 'deactive' where consumerid = ? and status = 'active'";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
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
	
	public boolean updateCartOfConsumer(int consumerid)
	{
		int cartid = new CartModel().getActiveCartidByConsumerid(consumerid);
		/* CartModel cart = new CartModel().getActiveCartByCartid(cartid); */
		int noofproducts=0,subtotal=0;
		ArrayList<CartItemsModel> allCartItemsOfCart = new CartItemsModel().getAllCartItemsByCart(cartid);
		for(CartItemsModel cartitem : allCartItemsOfCart) {
			noofproducts = noofproducts + 1;
			subtotal = subtotal + cartitem.getTotal();
		}
		connection = new DBConnector().getConnection();
		query = "update carts set noofproducts=?, subtotal=? where cartid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, noofproducts);
			pstmt.setInt(2, subtotal);
			pstmt.setInt(3, cartid);
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
}
