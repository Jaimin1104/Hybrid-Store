package hybridstore.dao.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.model.FeedbacksModel;
import hybridstore.util.DBConnector;

public class FeedbacksDao {
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public boolean addFeedback(FeedbacksModel newFeedback) {
		this.connection = new DBConnector().getConnection();
		query = "insert into feedbacks (consumerid,subject,message,date) values(?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, newFeedback.getConsumerid());
			pstmt.setString(2, newFeedback.getSubject());
			pstmt.setString(3, newFeedback.getMessage());
			pstmt.setString(4, newFeedback.getDate());
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
