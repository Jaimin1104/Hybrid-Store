package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.CartModel;
import hybridstore.model.OrdersModel;
import hybridstore.model.StaffModel;
import hybridstore.util.DBConnector;
import hybridstore.util.DateTimeFormat;

public class OrdersDao {
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public int createOrder(int cartid,int branchid,int total)
	{
		connection = new DBConnector().getConnection();
		OrdersModel order = new OrdersModel();
		StaffModel staff = new StaffModel().assignStaffToOrder(branchid);
		CartModel cart = new CartModel().getActiveCartByCartid(cartid);
	    
	    order.setCartid(cart.getCartid());
		order.setStaffid(staff.getStaffid());
	    order.setDatetime(new DateTimeFormat().getCurrentDateTime());
		order.setTotal(total);
		order.setStatus("confirmed");
		
		query = "insert into orders (cartid,staffid,datetime,total,status) values(?,?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, order.getCartid());
			pstmt.setInt(2, order.getStaffid());
			pstmt.setString(3, order.getDatetime());
			pstmt.setInt(4, order.getTotal());
			pstmt.setString(5, order.getStatus());
			if(pstmt.executeUpdate()>0)
			{
					String query = "select orderid from orders order by orderid desc limit 1";
					Connection connection = new DBConnector().getConnection();
					PreparedStatement pstmt = connection.prepareStatement(query);
					ResultSet orderResult = pstmt.executeQuery();
					if(orderResult.next())
					{
						order.setOrderid(orderResult.getInt("orderid"));
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
		return order.getOrderid();
	}
	
	public boolean updateOrder(OrdersModel order)
	{
		connection = new DBConnector().getConnection();
		query = "update orders set status = ? where orderid = ?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, order.getStatus());
			pstmt.setInt(2, order.getOrderid());
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
	public boolean deleteOrder(int orderid)
	{
		connection = new DBConnector().getConnection();
		query = "delete from orders where orderid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orderid);
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
