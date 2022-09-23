package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.model.FeedbacksModel;
import hybridstore.util.DBConnector;

public class FeedbacksDao {
	private Connection connection = null;
	String query = null;
	PreparedStatement pstmt;
	boolean isSuccess;
	
	public boolean addReplyOfFeedback(FeedbacksModel feedback)
	{
		connection = new DBConnector().getConnection();
		query = "update feedbacks set reply = ? where feedbackid = ?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, feedback.getReply());
			pstmt.setInt(2, feedback.getFeedbackid());
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
