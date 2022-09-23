package hybridstore.controller.consumer;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import hybridstore.dao.admin.ConsumersDao;
import hybridstore.dao.admin.StaffDao;
import hybridstore.model.ConsumersModel;
import hybridstore.model.StaffModel;
import hybridstore.util.DateTimeFormat;
import hybridstore.util.FileUpload;
import hybridstore.util.MailSender;

@WebServlet("/ConsumerProfileController.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512)
public class ConsumerProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
    
    public ConsumerProfileController() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("update profile"))
		{
			ConsumersModel consumer = new ConsumersModel();
			consumer.setConsumerid(Integer.parseInt(request.getParameter("consumerid")));
			consumer = consumer.getConsumer(consumer.getConsumerid());
			consumer.setFirstname(request.getParameter("firstname"));
			consumer.setLastname(request.getParameter("lastname"));
			consumer.setAddress(request.getParameter("address"));
			consumer.setPhoneno(request.getParameter("phone"));
			try 
			{
				consumer.setDob(new DateTimeFormat().getDateInFormat(request.getParameter("dob"), "yyyy-MM-dd", "dd-MM-yyyy"));
			}
			catch (ParseException e)
			{
				e.printStackTrace();
			}
			
			// Image Uploading in database
			Part filePart = request.getPart("profilepicture");
			System.out.println("Content type : " + filePart.getContentType());
			if((filePart.getContentType()).equalsIgnoreCase("image/jpeg") || (filePart.getContentType()).equalsIgnoreCase("image/png"))
			{
				String photo = "";
	
				String path = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\consumers";
				String fileName = consumer.getUsername() + ".png";
				photo = new FileUpload().getFileLocation(path, filePart, fileName);
				consumer.setProfilepicture(photo.substring(photo.indexOf("images"), photo.length()));
			}
			
			boolean isSuccess = new ConsumersDao().updateConsumer(consumer);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your profile is Updated');");
				out.println("window.location.href='profile-details.jsp';");
				out.println("</script>");
			}
		}
	}

}
