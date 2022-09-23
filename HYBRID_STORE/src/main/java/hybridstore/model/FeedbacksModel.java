package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class FeedbacksModel {

	private int feedbackid;
	private int consumerid;
	private String message;
	private String subject;
	private String reply;
	private String date;

	public int getConsumerid() {
		return consumerid;
	}

	public String getDate() {
		return date;
	}

	public int getFeedbackid() {
		return feedbackid;
	}

	public String getMessage() {
		return message;
	}

	public void setConsumerid(int consumerid) {
		this.consumerid = consumerid;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setFeedbackid(int feedbackid) {
		this.feedbackid = feedbackid;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public ArrayList<FeedbacksModel> getAllFeedbacks() {
		ArrayList<FeedbacksModel> allFeedbecks = new ArrayList<FeedbacksModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from feedbacks";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet feedbackResult = pstmt.executeQuery();
			while (feedbackResult.next()) {
				FeedbacksModel feedback = new FeedbacksModel();
				feedback.feedbackid = feedbackResult.getInt("feedbackid");
				feedback.consumerid = feedbackResult.getInt("consumerid");
				feedback.date = feedbackResult.getString("date");
				feedback.reply = feedbackResult.getString("reply");
				feedback.subject = feedbackResult.getString("subject");
				feedback.message = feedbackResult.getString("message");
				allFeedbecks.add(feedback);
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
		return allFeedbecks;
	}

	public FeedbacksModel getFeedbackDetails(int feedbackid)
	{
		Connection connection = new DBConnector().getConnection();
		String query = "select * from feedbacks where feedbackid = ?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, feedbackid);
			ResultSet feedbackResult = pstmt.executeQuery();
			if(feedbackResult.next()) {
				this.feedbackid = feedbackResult.getInt("feedbackid");
				this.consumerid = feedbackResult.getInt("consumerid");
				this.date = feedbackResult.getString("date");
				this.reply = feedbackResult.getString("reply");
				this.subject = feedbackResult.getString("subject");
				this.message = feedbackResult.getString("message");
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
