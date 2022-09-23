package hybridstore.controller.staff;

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

import hybridstore.dao.admin.StaffDao;
import hybridstore.model.StaffModel;
import hybridstore.util.FileUpload;
import hybridstore.util.MailSender;

@WebServlet("/StaffProfileController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512)
public class StaffProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
    
    public StaffProfileController() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("update profile"))
		{
			StaffModel staff = new StaffModel();
			staff.setStaffid(Integer.parseInt(request.getParameter("staffid")));
			
			staff = staff.getStaff(staff.getStaffid());
			
			staff.setFirstname(request.getParameter("firstname"));
			staff.setLastname(request.getParameter("lastname"));
			staff.setEmail(request.getParameter("email"));
			staff.setPhoneno(request.getParameter("phone"));
			staff.setAddress(request.getParameter("address"));
			
			try 
			{
				staff.setDob(new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"))));
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
	
				String path = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\staffmembers";
				String fileName = staff.getUsername() + ".png";
				photo = new FileUpload().getFileLocation(path, filePart, fileName);
				staff.setProfilepicture(photo.substring(photo.indexOf("images"), photo.length()));
			}
			
			boolean isSuccess = new StaffDao().updateStaffMember(staff);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your profile is Updated');");
				out.println("window.location.href='staff/staff-profile.jsp';");
				out.println("</script>");
			}
		}
	}

}
