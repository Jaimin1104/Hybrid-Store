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

import hybridstore.dao.admin.StaffDao;
import hybridstore.dao.admin.StockDao;
import hybridstore.model.StaffModel;
import hybridstore.util.DateTimeFormat;
import hybridstore.util.FileUpload;
import hybridstore.util.MailSender;

@WebServlet("/StaffController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024
		* 512)
public class StaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn");

		if (btn.equalsIgnoreCase("Add Staff Member")) {
			StaffModel newStaff = new StaffModel();
			newStaff.setFirstname(request.getParameter("firstname"));
			newStaff.setLastname(request.getParameter("lastname"));
			newStaff.setUsername(request.getParameter("username"));
			newStaff.setPassword(request.getParameter("password"));
			newStaff.setEmail(request.getParameter("email"));
			newStaff.setPhoneno(request.getParameter("phoneno"));
			newStaff.setBranchid(new StockDao().getBranchId(request.getParameter("brachname")));
			newStaff.setAddress(request.getParameter("address"));
			
			String date = "";
			try {
				date = new DateTimeFormat().getDateInFormat(request.getParameter("dob"), "yyyy-MM-dd", "dd-MM-yyyy");
			} catch (ParseException e) {
				e.printStackTrace();
			}
			newStaff.setDob(date);

			if (request.getAttribute("profilepicture") != null) {
				Part filePart = request.getPart("profilepicture");

				String photo = "";

				String path = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\staffmembers";
				String fileName = newStaff.getUsername() + ".png";
				photo = new FileUpload().getFileLocation(path, filePart, fileName);
				newStaff.setProfilepicture(photo.substring(photo.indexOf("images"), photo.length()));
			}

			boolean isSuccess = new StaffDao().addStaffMember(newStaff);
			if (isSuccess) {
				String subject = "Welcome Email";
				String msg = "Hello " + newStaff.getFirstname() + " " + newStaff.getLastname() + ","
						+ "\n\nGreetings from Hybrid store!" + "\nHappy to have you as a hybrid family."
						+ "\n\n\nRegards," + "\nHybrid store";

				new MailSender().sendEmail(newStaff.getEmail(), subject, msg);

				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Staff Member is Added');");
				out.println("window.location.href='admin/admin-addstaff.jsp';");
				out.println("</script>");
			}
		}
		if (btn.equalsIgnoreCase("delete staff")) {
			int staffId = Integer.parseInt(request.getParameter("staffid"));
			boolean isDeleted = new StaffDao().deleteStaff(staffId);
			if (isDeleted) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Staff Member is Deleted');");
				out.println("window.location.href='admin/admin-staff.jsp';");
				out.println("</script>");
			}
		}
	}
}
