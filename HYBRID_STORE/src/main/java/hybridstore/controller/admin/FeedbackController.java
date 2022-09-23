package hybridstore.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.admin.FeedbacksDao;
import hybridstore.model.ConsumersModel;
import hybridstore.model.FeedbacksModel;
import hybridstore.util.MailSender;

@WebServlet("/FeedbackController")
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("Reply Feedback"))
		{
			int feedbackid = Integer.parseInt(request.getParameter("feedbackid"));
			FeedbacksModel feedback = new FeedbacksModel().getFeedbackDetails(feedbackid);
			feedback.setReply(request.getParameter("replyOfFeedback"));
			
			boolean isSuccess = new FeedbacksDao().addReplyOfFeedback(feedback);
			if(isSuccess)
			{
				ConsumersModel consumerOfFeedback = new ConsumersModel().getConsumer(feedback.getConsumerid());
				String subject = "Reply of Feedback";
				String msg = feedback.getReply();
				new MailSender().sendEmail(consumerOfFeedback.getEmail(), subject, msg);
			}
			response.sendRedirect("admin/admin-reviews.jsp");;
		}
	}

}
