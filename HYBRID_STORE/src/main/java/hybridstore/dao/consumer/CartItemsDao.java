package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.model.CartItemsModel;
import hybridstore.model.CartModel;
import hybridstore.model.ProductsModel;
import hybridstore.util.DBConnector;

public class CartItemsDao 
{
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query,query2;
	private boolean isSuccess = false;
	
	public boolean addProductInCart(int productid,int consumerid,int quantity) {
		int price = (new ProductsModel().getProduct(productid)).getPrice();
		this.connection = new DBConnector().getConnection();
		int cartid = new CartModel().getActiveCartidByConsumerid(consumerid);
		try {
				CartItemsModel cartitem = new CartItemsModel().getCartItemsByProduct(productid, cartid);
				if(cartitem == null)
				{
					query2 = "insert into cartitems (cartid,productid,quantity,total) values(?,?,?,?)";
					pstmt = connection.prepareStatement(query2);
					pstmt.setInt(1, cartid);
					pstmt.setInt(2, productid);
					pstmt.setInt(3, quantity);
					pstmt.setInt(4, price*quantity);
				}
				else
				{
					query2 = "update cartitems set quantity=?,total=? where productid=? and cartid=?";
					pstmt = connection.prepareStatement(query2);
					pstmt.setInt(1, (cartitem.getQuantity()+1));
					pstmt.setInt(2, price*(cartitem.getQuantity()+1));
					pstmt.setInt(3, productid);
					pstmt.setInt(4, cartid);
				}
				
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
	
	public boolean deleteProductInCart(int productid) {
		this.connection = new DBConnector().getConnection();
		query = "delete from cartitems where productid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, productid);
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
	
	public boolean updateCartItems(CartItemsModel cartitems) {
		int price = new ProductsModel().getProduct(cartitems.getProductid()).getPrice();
		this.connection = new DBConnector().getConnection();
		query = "update cartitems set quantity=?,total=? where productid=? and cartid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, cartitems.getQuantity());
			pstmt.setInt(2, price*(cartitems.getQuantity()));
			pstmt.setInt(3, cartitems.getProductid());
			pstmt.setInt(4, cartitems.getCartid());
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
