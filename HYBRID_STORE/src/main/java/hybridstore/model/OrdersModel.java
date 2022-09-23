package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import hybridstore.util.DBConnector;
import hybridstore.util.DateTimeFormat;

public class OrdersModel {

	private int orderid;
	private int cartid;
	private int staffid;
	private String datetime;
	private int total;
	private String status;

	public int getCartid() {
		return cartid;
	}

	public String getDatetime() {
		return datetime;
	}

	public int getOrderid() {
		return orderid;
	}

	public int getStaffid() {
		return staffid;
	}

	public String getStatus() {
		return status;
	}

	public int getTotal() {
		return total;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public void setStaffid(int staffid) {
		this.staffid = staffid;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public ArrayList<OrdersModel> getAllOrders() {
		ArrayList<OrdersModel> allOrders = new ArrayList<OrdersModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from orders";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet orderResult = pstmt.executeQuery();
			while (orderResult.next()) {
				OrdersModel ordersmodel = new OrdersModel();
				ordersmodel.cartid = orderResult.getInt("cartid");
				ordersmodel.orderid = orderResult.getInt("orderid");
				ordersmodel.datetime = orderResult.getString("datetime");
				ordersmodel.staffid = orderResult.getInt("staffid");
				ordersmodel.status = orderResult.getString("status");
				ordersmodel.total = orderResult.getInt("total");
				allOrders.add(ordersmodel);
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
		return allOrders;
	}
	
	public ArrayList<OrdersModel> getAllOrders(String query) {
		ArrayList<OrdersModel> allOrders = new ArrayList<OrdersModel>();
		Connection connection = new DBConnector().getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet orderResult = pstmt.executeQuery();
			while (orderResult.next()) {
				OrdersModel ordersmodel = new OrdersModel();
				ordersmodel.cartid = orderResult.getInt("cartid");
				ordersmodel.orderid = orderResult.getInt("orderid");
				ordersmodel.datetime = orderResult.getString("datetime");
				ordersmodel.staffid = orderResult.getInt("staffid");
				ordersmodel.status = orderResult.getString("status");
				ordersmodel.total = orderResult.getInt("total");
				allOrders.add(ordersmodel);
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
		return allOrders;
	}
	
	public ArrayList<OrdersModel> getOrdersByConsumer(int consumerid) {
		Connection connection = new DBConnector().getConnection();
		ArrayList<OrdersModel> allOrders = new ArrayList<OrdersModel>();
		String query = "select * from orders where cartid in (select cartid from carts where consumerid=?) ";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet orderResult = pstmt.executeQuery();
			while (orderResult.next()) {
				OrdersModel order = new OrdersModel();
				order.setOrderid(orderResult.getInt("orderid"));
				order.setCartid(orderResult.getInt("cartid"));
				order.setDatetime(orderResult.getString("datetime"));
				order.setStaffid(orderResult.getInt("staffid"));
				order.setStatus(orderResult.getString("status"));
				order.setTotal(orderResult.getInt("total"));
				allOrders.add(order);
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
		return allOrders;
	}
	
	public long getTotalOrders()
	{
		long totalorders = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(orderid) as totalorders from orders";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalorders = paymentResult.getLong("totalorders");
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
		return totalorders;
	}
	
	public long getTotalItems(int orderid)
	{
		long totalorders = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "SELECT SUM(quantity) as totalorders FROM cartitems WHERE cartid=(SELECT cartid FROM orders WHERE orderid=?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orderid);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalorders = paymentResult.getLong("totalorders");
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
		return totalorders;
	}
	public ArrayList<OrdersModel> getLatestOrders(int length) {
		ArrayList<OrdersModel> latestOrders = new ArrayList<OrdersModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from orders order by orderid desc limit ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,length);
			ResultSet orderResult = pstmt.executeQuery();
			while (orderResult.next()) {
				OrdersModel ordersmodel = new OrdersModel();
				ordersmodel.cartid = orderResult.getInt("cartid");
				ordersmodel.orderid = orderResult.getInt("orderid");
				ordersmodel.datetime = orderResult.getString("datetime");
				ordersmodel.staffid = orderResult.getInt("staffid");
				ordersmodel.status = orderResult.getString("status");
				ordersmodel.total = orderResult.getInt("total");
				latestOrders.add(ordersmodel);
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
		return latestOrders;
	}
	
	public ArrayList<OrdersModel> getLatestOrders(int length,int consumerid) {
		ArrayList<OrdersModel> latestOrders = new ArrayList<OrdersModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from orders where cartid in (select cartid from carts where consumerid=? and status='deactive') order by orderid desc limit ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			pstmt.setInt(2,length);
			
			ResultSet orderResult = pstmt.executeQuery();
			while (orderResult.next()) {
				OrdersModel ordersmodel = new OrdersModel();
				ordersmodel.cartid = orderResult.getInt("cartid");
				ordersmodel.orderid = orderResult.getInt("orderid");
				ordersmodel.datetime = orderResult.getString("datetime");
				ordersmodel.staffid = orderResult.getInt("staffid");
				ordersmodel.status = orderResult.getString("status");
				ordersmodel.total = orderResult.getInt("total");
				latestOrders.add(ordersmodel);
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
		return latestOrders;
	}
	public ArrayList<OrdersModel> getOrdersByStaff(int staffid) {
		Connection connection = new DBConnector().getConnection();
		ArrayList<OrdersModel> allOrders = new ArrayList<OrdersModel>();
		String query = "select * from orders where staffid = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, staffid);
			ResultSet orderResult = pstmt.executeQuery();
			while (orderResult.next()) {
				OrdersModel order = new OrdersModel();
				order.setOrderid(orderResult.getInt("orderid"));
				order.setCartid(orderResult.getInt("cartid"));
				order.setDatetime(orderResult.getString("datetime"));
				order.setStaffid(orderResult.getInt("staffid"));
				order.setStatus(orderResult.getString("status"));
				order.setTotal(orderResult.getInt("total"));
				allOrders.add(order);
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
		return allOrders;
	}
	
	public OrdersModel getOrderInformation(int orderid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from orders where orderid = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orderid);
			ResultSet orderResult = pstmt.executeQuery();
			if (orderResult.next()) {
				this.setOrderid(orderResult.getInt("orderid"));
				this.setCartid(orderResult.getInt("cartid"));
				this.setDatetime(orderResult.getString("datetime"));
				this.setStaffid(orderResult.getInt("staffid"));
				this.setStatus(orderResult.getString("status"));
				this.setTotal(orderResult.getInt("total"));	
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
	
	public long getTotalOrdersOfStaffByStatus(int staffid,String status)
	{
		long totalorders = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(orderid) as totalorders from orders where staffid=? and status=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, staffid);
			pstmt.setString(2, status);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalorders = paymentResult.getLong("totalorders");
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
		return totalorders;
	}
	
	public long getTotalSalesOfMonth(int month)
	{
		long getTotalSales = 0;
		Date date = null; 
		Date currentDate = new Date();
		ArrayList<OrdersModel> allOrders = new OrdersModel().getAllOrders();
		for(OrdersModel order : allOrders)
		{
			String dateInString = order.getDatetime();
			try 
			{
				date = new DateTimeFormat().getDateFromString(dateInString);
				if(month == date.getMonth() && currentDate.getYear()==date.getYear())
				{
					getTotalSales += order.getTotal();
				}
			}
			catch (ParseException e)
			{
				e.printStackTrace();
			}
		}
		return getTotalSales;
	}
	
	public long getTotalSalesOfCategory(int categoryid)
	{
		long getTotalSales = 0;
		ArrayList<OrdersModel> allOrders = new OrdersModel().getAllOrders();
		for(OrdersModel order : allOrders)
		{
			ArrayList<CartItemsModel> allCartItemsOfOrder = new CartItemsModel().getAllCartItemsByCart(order.getCartid());
			for(CartItemsModel cartItem : allCartItemsOfOrder)
			{
				ProductsModel productOfCartItem = new ProductsModel().getProduct(cartItem.getProductid());
				if(productOfCartItem.getCategoryid() == categoryid)
				{
					getTotalSales += cartItem.getQuantity();
				}
			}
		}
		return getTotalSales;
	}
}
