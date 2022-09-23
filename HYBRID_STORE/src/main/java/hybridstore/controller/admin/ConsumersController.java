package hybridstore.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import hybridstore.dao.admin.ConsumersDao;
import hybridstore.dao.consumer.CartDao;
import hybridstore.model.ConsumersModel;
import hybridstore.util.DateTimeFormat;
import hybridstore.util.FileUpload;
import hybridstore.util.MailSender;

@WebServlet("/ConsumersController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ConsumersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn");
		ConsumersDao consumer = new ConsumersDao();
		if (btn.equalsIgnoreCase("add consumer")) {
			ConsumersModel newConsumer = new ConsumersModel();
			newConsumer.setFirstname(request.getParameter("firstname"));
			newConsumer.setLastname(request.getParameter("lastname"));
			newConsumer.setUsername(request.getParameter("username"));
			newConsumer.setPassword(request.getParameter("password"));
			newConsumer.setEmail(request.getParameter("email"));
			newConsumer.setPhoneno(request.getParameter("phoneno"));
			newConsumer.setAddress(request.getParameter("address"));
			
			// getting Date in Format
			String date = "";
			try
			{
				date = new DateTimeFormat().getDateInFormat(request.getParameter("dob"), "yyyy-MM-dd" ,"dd-MM-yyyy");
			}
			catch (ParseException e)
			{
				e.printStackTrace();
			}
			newConsumer.setDob(date);
			
			if (request.getAttribute("profilepicture") != null) {
				// Image Uploading in database
				Part filePart = request.getPart("profilepicture");

				String photo = "";

				String path = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\customer";
				String fileName = newConsumer.getUsername() + ".png";

				photo = new FileUpload().getFileLocation(path, filePart, fileName);

				newConsumer.setProfilepicture(photo.substring(photo.indexOf("images"), photo.length()));
			}
			
			if (consumer.isValidConsumer(newConsumer)) {
				boolean isSuccess = consumer.addConsumer(newConsumer);
				if (isSuccess) {
					String subject = "Welcome Email";
					String msg = "Hello " + newConsumer.getFirstname() + " " + newConsumer.getLastname() + ","
							+ "\n\nGreetings from Hybrid store!" + "\nHappy to have you as a hybrid family."
							+ "\n\n\nRegards," + "\nHybrid store";

					new MailSender().sendEmail(newConsumer.getEmail(), subject, msg);
					new CartDao().addNewCartOfConsumer();
					out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Consumer is Added');");
					out.println("window.location.href='admin/admin-addconsumer.jsp';");
					out.println("</script>");
				}
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Username already exist');");
				out.println("window.location.href='admin/admin-addconsumer.jsp';");
				out.println("</script>");
			}
		} 
		else if (btn.equalsIgnoreCase("delete Consumers")) 
		{
			String consumerIds[] = request.getParameterValues("consumerids");
			int count = 0;
			ConsumersDao deleteConsumers = new ConsumersDao();
			for (int i = 0; i < consumerIds.length; i++) {
				boolean isDeleted = deleteConsumers.deleteConsumer(Integer.parseInt(consumerIds[i]));
				if (isDeleted) {
					count++;
				}
			}
			out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("var count = " + count + " ;");
			out.println("alert(count + ' Consumers are Deleted');");
			out.println("window.location.href='admin/admin-consumers.jsp';");
			out.println("</script>");
		}
	}
}
