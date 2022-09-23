package hybridstore.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.admin.StockDao;
import hybridstore.model.StockModel;

@WebServlet("/StockController")
public class StockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if (btn.equalsIgnoreCase("update stock")) {
			StockModel newStock = new StockModel();
			newStock.setBranchid(new StockDao().getBranchId(request.getParameter("branchname")));
			newStock.setProductid(Integer.parseInt(request.getParameter("productid")));
			newStock.setStock(Integer.parseInt(request.getParameter("stock")));
			boolean isSuccess = new StockDao().updateStock(newStock);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('stock is added');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('stock is not added');");
				out.println("</script>");
			}
		}
		if (btn.equalsIgnoreCase("add stock")) {
			StockModel newStock = new StockModel();
			newStock.setBranchid(new StockDao().getBranchId(request.getParameter("branchname")));
			newStock.setProductid(Integer.parseInt(request.getParameter("productid")));
			newStock.setStock(Integer.parseInt(request.getParameter("stock")));
			boolean isSuccess = new StockDao().addStock(newStock);
			if (isSuccess) {	
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('stock is added');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('stock is not added');");
				out.println("</script>");
			}
		}
	}

}
