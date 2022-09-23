package hybridstore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import hybridstore.dao.SignInDao;
import hybridstore.dao.consumer.CartDao;
import hybridstore.model.ConsumersModel;
import hybridstore.util.DateTimeFormat;
import hybridstore.util.FileUpload;
import hybridstore.util.MailSender;

@WebServlet("/SignInController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConsumersModel newConsumer = new ConsumersModel();
	private SignInDao consumer = new SignInDao();
	private static int generatedOtp;
	private PrintWriter out;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		generatedOtp = generateOtp();
		String subject = "OTP Verification";
		String msg = "Your OTP is " + generatedOtp;
		new MailSender().sendEmail(newConsumer.getEmail(), subject, msg);
		response.sendRedirect("verify-otp.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn");

		if (btn.equalsIgnoreCase("sign in")) {
			newConsumer.setFirstname(request.getParameter("firstname"));
			newConsumer.setLastname(request.getParameter("lastname"));
			newConsumer.setUsername(request.getParameter("username"));
			newConsumer.setPassword(request.getParameter("password"));
			newConsumer.setPhoneno(request.getParameter("phoneno"));
			newConsumer.setEmail(request.getParameter("email"));
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
			
			// Image Uploading in database
			Part filePart = request.getPart("profilepicture");
			System.out.println("Content type : " + filePart.getContentType());
			if((filePart.getContentType()).equalsIgnoreCase("image/jpeg") || (filePart.getContentType()).equalsIgnoreCase("image/png"))
			{
				String photo = "";
	
				String path = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\consumers";
				String fileName = newConsumer.getUsername() + ".png";
	
				photo = new FileUpload().getFileLocation(path, filePart, fileName);
				newConsumer.setProfilepicture(photo.substring(photo.indexOf("images"), photo.length()));
			}
			else
			{
				newConsumer.setProfilepicture(null);
			}
			
			if (consumer.isValidConsumer(newConsumer)) {
				generatedOtp = generateOtp();
				String subject = "OTP Verification";
				String msg = "Your OTP is " + generatedOtp;
				new MailSender().sendEmail(newConsumer.getEmail(), subject, msg);
				response.sendRedirect("verify-otp.jsp");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Username already exist');");
				out.println("window.location.href='signin.jsp';");
				out.println("</script>");
			}
		} else if (btn.equalsIgnoreCase("verify otp")) {
			int enteredOtp = Integer.parseInt(request.getParameter("enteredOtp"));

			if (isValidOtp(generatedOtp, enteredOtp)) {
				boolean isSuccess = consumer.doSignIn(newConsumer);

				if (isSuccess) {
					String subject = "Welcome Email";
					String msg = "Hello " + newConsumer.getFirstname() + " " + newConsumer.getLastname() + ","
							+ "\n\nGreetings from Hybrid store!"
							+ "\nHappy to have you as a hybrid family."
							+ "\n\n\nRegards,"
							+ "\nHybrid store";

					new MailSender().sendEmail(newConsumer.getEmail(), subject, msg);
					new CartDao().addNewCartOfConsumer();
					response.sendRedirect("login.jsp");
				} else {
					out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Try to Sign In again.');");
					out.println("window.location.href='signin.jsp';");
					out.println("</script>");
				}
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid OTP');");
				out.println("window.location.href='verify-otp.jsp';");
				out.println("</script>");
			}
		}
	}

	private int generateOtp() {
		int generatedOtp = ThreadLocalRandom.current().nextInt(100000, 999999);
		System.out.println("Generated OTP: " + generatedOtp);
		return generatedOtp;
	}

	private boolean isValidOtp(int generatedOtp, int enteredOtp) {
		if (generatedOtp == enteredOtp) {
			generatedOtp = 0;
			return true;
		} else {
			return false;
		}
	}
}
