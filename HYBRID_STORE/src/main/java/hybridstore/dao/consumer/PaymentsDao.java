package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.model.OrdersModel;
import hybridstore.util.DBConnector;
import hybridstore.util.DateTimeFormat;

public class PaymentsDao {
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public boolean createPayment(int orderid,String PaymentMode)
	{
		connection = new DBConnector().getConnection();
		OrdersModel order = new OrdersModel().getOrderInformation(orderid);
		
		query = "insert into payments (orderid,mode,amount,datetime) values(?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, order.getOrderid());
			pstmt.setString(2, PaymentMode);
			pstmt.setInt(3, order.getTotal());
			pstmt.setString(4, new DateTimeFormat().getCurrentDateTime());
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
