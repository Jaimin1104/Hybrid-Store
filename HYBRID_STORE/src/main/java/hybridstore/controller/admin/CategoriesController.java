package hybridstore.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.admin.CategoriesDao;
import hybridstore.model.CategoriesModel;

@WebServlet("/CategoriesController")
public class CategoriesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String btn = request.getParameter("btn");
		CategoriesDao category = new CategoriesDao();

		if (btn.equalsIgnoreCase("add Category")) {
			CategoriesModel newCategory = new CategoriesModel();
			newCategory.setCategoryname(request.getParameter("categoryname"));
			newCategory.setDescription(request.getParameter("description"));
			File file = new File(request.getSession().getServletContext().getContextPath());
			System.out.println(file.getName());
			boolean isSuccess = category.addCategory(newCategory);

			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-categories.jsp';");
			//	out.println("alert('Category is added');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
			//	out.println("alert('Category is not added');");
				out.println("window.location.href='admin/admin-categories.jsp';");
				out.println("</script>");
			}
		}
		if (btn.equalsIgnoreCase("delete category")) {
			int categoryid = Integer.parseInt(request.getParameter("categoryid"));
			boolean isSuccess = category.deleteCategory(categoryid);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-categories.jsp';");
			//	out.println("alert('Category is deleted');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
			//	out.println("alert('Category is not deleted');");
				out.println("window.location.href='admin/admin-categories.jsp';");
				out.println("</script>");
			}
		}

	}

}
