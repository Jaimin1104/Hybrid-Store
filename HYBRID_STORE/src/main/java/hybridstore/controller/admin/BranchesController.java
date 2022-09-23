package hybridstore.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.admin.BranchesDao;
import hybridstore.model.BranchesModel;

@WebServlet("/BranchesController")
public class BranchesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
		
		if (action.equalsIgnoreCase("remove")) {
			
			boolean isRemoved = new BranchesDao().removeBranch(Integer.parseInt(request.getParameter("branchid")));
			
			if (isRemoved) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Branch is removed.');");
				out.println("window.location.href='admin/admin-branches.jsp';");
				out.println("</script>"); 
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Unable to remove branch.');");
				out.println("window.location.href='admin/admin-branches.jsp';");
				out.println("</script>");
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn");
		PrintWriter out = response.getWriter();
		
		if (btn.equalsIgnoreCase("add branch")) {
			BranchesModel newBranch = new BranchesModel();
			newBranch.setBranchname(request.getParameter("branchname"));
			newBranch.setStatus(request.getParameter("status"));
			newBranch.setAddress(request.getParameter("address"));
			newBranch.setPincode(Integer.parseInt(request.getParameter("pincode")));
			
			if (new BranchesDao().isBranchExist(newBranch)) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Branch already exist.');");
				out.println("window.location.href='admin/admin-branches.jsp';");
				out.println("</script>");
			}
			else
			{
				int isAdded = new BranchesDao().addBranch(newBranch);
				if (isAdded > 0) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Branch is added.');");
					out.println("window.location.href='admin/admin-branches.jsp';");
					out.println("</script>");
				}
				else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Unable to add branch.');");
					out.println("window.location.href='admin/admin-addbranches.jsp';");
					out.println("</script>");
				}
			}
		}
		else if (btn.equalsIgnoreCase("update")) {
			BranchesModel updatedBranch = new BranchesModel();
			updatedBranch.setBranchname(request.getParameter("branchname"));
			updatedBranch.setStatus(request.getParameter("status"));
			updatedBranch.setAddress(request.getParameter("address"));
			updatedBranch.setPincode(Integer.parseInt(request.getParameter("pincode")));
			updatedBranch.setBranchid(Integer.parseInt(request.getParameter("branchid")));
			
			int isUpdated = new BranchesDao().updateBranch(updatedBranch);
			
			if (isUpdated > 0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Branch is updated.');");
				out.println("window.location.href='admin/admin-branches.jsp';");
				out.println("</script>");
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Unable to update branch.');");
				out.println("window.location.href='admin/admin-branches.jsp';");
				out.println("</script>");
			}
		}
	}
}
