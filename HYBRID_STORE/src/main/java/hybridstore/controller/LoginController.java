package hybridstore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hybridstore.dao.LoginDao;
import hybridstore.model.AdminModel;
import hybridstore.model.ConsumersModel;
import hybridstore.model.LoginModel;
import hybridstore.model.StaffModel;
import hybridstore.util.MailSender;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private int generatedCode;
	private String email;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("logout"))
		{
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
		else
		{
			generatedCode = generateCode();
			String subject = "Verfication code";
			String msg = "As per your request for resetting password" +
					"\nVerification code: " + generatedCode +
					"\n\nIf you have not requested for it kindly ignore." +
					"\n\nRegards," +
					"\nHybrid store";
			new MailSender().sendEmail(email, subject, msg);
			response.sendRedirect("verify-code.jsp");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn");

		if (btn.equalsIgnoreCase("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			LoginModel user = new LoginModel();
			user.setUsername(username);
			user.setPassword(password);

			LoginDao login = new LoginDao();

			if (login.isAdmin(user)) {
				AdminModel admin = (AdminModel) new LoginDao().doLogin(user);
				HttpSession session = request.getSession(true);
				session.setAttribute("admin", admin);
				response.sendRedirect("admin/admin-dashboard.jsp");
			} else if (login.isStaff(user)) {
				StaffModel staff = (StaffModel) new LoginDao().doLogin(user);
				HttpSession session = request.getSession(true);
				session.setAttribute("staff", staff);
				response.sendRedirect("staff/staff-dashboard.jsp");
			} else if (login.isConsumer(user)) {
				ConsumersModel consumer = (ConsumersModel) new LoginDao().doLogin(user);
				HttpSession session = request.getSession(true);
				session.setAttribute("consumer", consumer);
				session.setMaxInactiveInterval(60 * 10);
				response.sendRedirect("index.jsp");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='login.jsp';");
				out.println("alert('Invalid username or password');");
				out.println("</script>");
			}
		}else if (btn.equalsIgnoreCase("request password reset")) {
			email = request.getParameter("email");
			if (new LoginDao().isRegisteredEmail(email)) {
				String subject, msg;
				generatedCode = generateCode();

				subject = "Verfication code";
				msg = "As per your request for resetting password" +
						"\nVerification code: " + generatedCode +
						"\n\nIf you have not requested for it kindly ignore." +
						"\n\nRegards," +
						"\nHybrid store";
				new MailSender().sendEmail(email, subject, msg);
				response.sendRedirect("verify-code.jsp");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Please enter your registered email.');");
				out.println("window.location.href='forget-password.jsp';");
				out.println("</script>");
			}
		} else if (btn.equalsIgnoreCase("verify code")) {
			int enteredCode = Integer.parseInt(request.getParameter("verification code"));

			if (isValidCode(generatedCode, enteredCode)) {
				response.sendRedirect("reset-password.jsp");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid verification code.');");
				out.println("window.location.href='verify-code.jsp';");
				out.println("</script>");
			}
		} else if (btn.equalsIgnoreCase("reset password")) {
			String newPassword = request.getParameter("new password");
			String confirmPassword = request.getParameter("confirm password");

			if (newPassword.equals(confirmPassword)) {
				String subject, msg;
				new LoginDao().changePassword(newPassword, email);
				subject = "Reset password";
				msg = "Your password has been changed." +
						"\nNew password: " + newPassword +
						"\n\nRegards," +
						"\nHybrid store";
				new MailSender().sendEmail(email, subject, msg);
				response.sendRedirect("login.jsp");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password and confirm password should be same.');");
				out.println("window.location.href='reset-password.jsp';");
				out.println("</script>");
			}
		}
	}

	private int generateCode() {
		int generatedCode = ThreadLocalRandom.current().nextInt(100000, 999999);
		System.out.println("Generated code: " + generatedCode);
		return generatedCode;
	}

	private boolean isValidCode(int generatedCode, int enteredCode) {
		if (generatedCode == enteredCode) {
			System.out.println("true");
			return true;
		} else {
			System.out.println("false");
			return false;
		}
	}
}
