package hybridstore.controller.consumer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.consumer.FeedbacksDao;
import hybridstore.model.FeedbacksModel;
import hybridstore.util.DateTimeFormat;

@WebServlet("/FeedbacksController.do")
public class FeedbacksController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("send feedback"))
		{
			FeedbacksModel newFeedback = new FeedbacksModel();
			newFeedback.setConsumerid(Integer.parseInt(request.getParameter("consumerid")));
			newFeedback.setSubject(request.getParameter("subject"));
			newFeedback.setMessage(request.getParameter("message"));
			
			newFeedback.setDate(new DateTimeFormat().getCurrentDate());
			
			boolean isSuccess = new FeedbacksDao().addFeedback(newFeedback);
			if(isSuccess)
			{
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='contact.jsp';");
				out.println("alert('Message Sent');");
				out.println("</script>");
			}
			else
			{
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='contact.jsp';");
				out.println("alert('Message not Sent');");
				out.println("</script>");
			}
		}
	}

}
