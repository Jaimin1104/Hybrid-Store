package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class PaymentsModel {
	private int paymentid;
	private int orderid;
	private String mode;
	private int amount;
	private String datetime;

	public int getAmount() {
		return amount;
	}

	public String getDatetime() {
		return datetime;
	}

	public String getMode() {
		return mode;
	}

	public int getOrderid() {
		return orderid;
	}

	public int getPaymentid() {
		return paymentid;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}

	public ArrayList<PaymentsModel> getAllPayments() {
		ArrayList<PaymentsModel> allPayments = new ArrayList<PaymentsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from payments";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			while (paymentResult.next()) {
				PaymentsModel payment = new PaymentsModel();
				payment.paymentid = paymentResult.getInt("paymentid");
				payment.orderid = paymentResult.getInt("orderid");
				payment.datetime = paymentResult.getString("datetime");
				payment.amount = paymentResult.getInt("amount");
				payment.mode = paymentResult.getString("mode");
				allPayments.add(payment);
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
		return allPayments;
	}
	
	public ArrayList<PaymentsModel> getAllPayments(String query) {
		ArrayList<PaymentsModel> allPayments = new ArrayList<PaymentsModel>();
		Connection connection = new DBConnector().getConnection();
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			while (paymentResult.next()) {
				PaymentsModel payment = new PaymentsModel();
				payment.paymentid = paymentResult.getInt("paymentid");
				payment.orderid = paymentResult.getInt("orderid");
				payment.datetime = paymentResult.getString("datetime");
				payment.amount = paymentResult.getInt("amount");
				payment.mode = paymentResult.getString("mode");
				allPayments.add(payment);
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
		return allPayments;
	}
	
	public ArrayList<PaymentsModel> getPaymentInformation(int consumerid) {
		Connection connection = new DBConnector().getConnection();
		ArrayList<PaymentsModel> allPayments = new ArrayList<PaymentsModel>();
		String query = "select * from payments where orderid in (select orderid from orders where cartid in (select cartid from carts where consumerid = ?))";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet paymentResult = pstmt.executeQuery();
			while (paymentResult.next()) {
				PaymentsModel payment = new PaymentsModel();
				payment.setOrderid(paymentResult.getInt("orderid"));
				payment.setPaymentid(paymentResult.getInt("paymentid"));
				payment.setDatetime(paymentResult.getString("datetime"));
				payment.setMode(paymentResult.getString("mode"));
				payment.setAmount(paymentResult.getInt("amount"));
				allPayments.add(payment);
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
		return allPayments;
	}
	
	public long getTotalPayments()
	{
		long totalpayments = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(*) as totalpayments from payments";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalpayments = paymentResult.getLong("totalpayments");
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
		return totalpayments;
	}
	
	public long getTotalSales()
	{
		long totalsales = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select sum(amount) as totalsales from payments";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalsales = paymentResult.getLong("totalsales");
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
		return totalsales;
	}
	
	public PaymentsModel getOrderPaymentMode(int orderid)
	{
		Connection connection = new DBConnector().getConnection();
		String query = "select * from payments where orderid = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orderid);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next()) {
				this.setOrderid(paymentResult.getInt("orderid"));
				this.setPaymentid(paymentResult.getInt("paymentid"));
				this.setDatetime(paymentResult.getString("datetime"));
				this.setMode(paymentResult.getString("mode"));
				this.setAmount(paymentResult.getInt("amount"));
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
