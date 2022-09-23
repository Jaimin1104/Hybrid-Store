package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.util.DBConnector;

public class CartModel {

	private int cartid;
	private int consumerid;
	private int noofproducts;
	private int subtotal;
	private String status;

	public int getCartid() {
		return cartid;
	}

	public int getConsumerid() {
		return consumerid;
	}

	public int getQuantity() {
		return noofproducts;
	}

	public String getStatus() {
		return status;
	}

	public int getSubtotal() {
		return subtotal;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public void setConsumerid(int consumerid) {
		this.consumerid = consumerid;
	}

	public void setQuantity(int quantity) {
		this.noofproducts = quantity;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}

	public int getActiveCartidByConsumerid(int consumerid)
	{
		int cartid = -1;
		Connection connection = new DBConnector().getConnection();
		String 	query = "select cartid from carts where consumerid=? and status='active'";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet cartResult = pstmt.executeQuery();
			if (cartResult.next()) {
				cartid = cartResult.getInt("cartid");
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
		return cartid;
	}
	
	public CartModel getActiveCartByCartid(int cartid)
	{
		Connection connection = new DBConnector().getConnection();
		String 	query = "select * from carts where cartid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, cartid);
			ResultSet cartResult = pstmt.executeQuery();
			if(cartResult.next()) {
				this.cartid = cartResult.getInt("cartid");
				this.consumerid = cartResult.getInt("consumerid");
				this.noofproducts = cartResult.getInt("noofproducts");
				this.status = cartResult.getString("status");
				this.subtotal = cartResult.getInt("subtotal");
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
}
