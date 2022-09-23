package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class CartItemsModel {
	private int cartitemid;
	private int cartid;
	private int productid;
	private int quantity;
	private int total;

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCartitemid() {
		return cartitemid;
	}

	public void setCartitemid(int cartitemid) {
		this.cartitemid = cartitemid;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	public CartItemsModel getCartItemsByProduct(int productid,int cartid) {
		Connection connection = new DBConnector().getConnection();
		CartItemsModel cartitem = null;	
		String query = "select * from cartitems where productid=? and cartid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, productid);
			pstmt.setInt(2, cartid);
			ResultSet cartitemsResult = pstmt.executeQuery();
			if (cartitemsResult.next()) {
				cartitem = new CartItemsModel();
				cartitem.cartitemid = cartitemsResult.getInt("cartitemid");
				cartitem.cartid = cartitemsResult.getInt("cartid");
				cartitem.productid = cartitemsResult.getInt("productid");
				cartitem.quantity = cartitemsResult.getInt("quantity");
				cartitem.total = cartitemsResult.getInt("total");
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
		return cartitem;
	}
	
	public ArrayList<CartItemsModel> getAllCartItemsByCart(int cartid)
	{
		ArrayList<CartItemsModel> allCartItems = new ArrayList<CartItemsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from cartitems where cartid = ?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, cartid);
			ResultSet cartitemsResult = pstmt.executeQuery();
			while(cartitemsResult.next()) {
				CartItemsModel cartitem = new CartItemsModel();
				cartitem.cartitemid = cartitemsResult.getInt("cartitemid");
				cartitem.cartid = cartitemsResult.getInt("cartid");
				cartitem.productid = cartitemsResult.getInt("productid");
				cartitem.quantity = cartitemsResult.getInt("quantity");
				cartitem.total = cartitemsResult.getInt("total");
				allCartItems.add(cartitem);
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
		return allCartItems;
	}
}
