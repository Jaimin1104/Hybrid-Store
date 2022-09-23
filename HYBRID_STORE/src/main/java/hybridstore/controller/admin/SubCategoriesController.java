package hybridstore.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.admin.ProductsDao;
import hybridstore.dao.admin.SubCategoriesDao;
import hybridstore.model.SubCategoriesModel;

@WebServlet("/SubCategoriesController")
public class SubCategoriesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	private PrintWriter out;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		SubCategoriesDao subcategory = new SubCategoriesDao();

		if (btn.equalsIgnoreCase("add Subcategory")) {
			SubCategoriesModel newSubCategory = new SubCategoriesModel();
			newSubCategory.setSubcategoryname(request.getParameter("subcategoryname"));
			newSubCategory.setCategoryid(new ProductsDao().getCategoryId(request.getParameter("categoryname")));
			newSubCategory.setDescription(request.getParameter("description"));
			boolean isSuccess = subcategory.addSubCategory(newSubCategory);

			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-subcategories.jsp';");
			//	out.println("alert('Subcategory is added');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
			//	out.println("alert('Subcategory is not added');");
				out.println("window.location.href='admin/admin-subcategories.jsp';");
				out.println("</script>");
			}
		}
		
		if (btn.equalsIgnoreCase("delete subcategory")) {
			int subcategoryid = Integer.parseInt(request.getParameter("subcategoryid"));
			boolean isSuccess = subcategory.deleteSubCategory(subcategoryid);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-subcategories.jsp';");
				out.println("alert('Subcategory is deleted');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Subcategory is not deleted');");
				out.println("window.location.href='admin/admin-subcategories.jsp';");
				out.println("</script>");
			}
		}
	}

}
