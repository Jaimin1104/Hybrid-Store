package hybridstore.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.admin.ProductsDao;
import hybridstore.dao.admin.StockDao;
import hybridstore.model.BranchesModel;
import hybridstore.model.ProductsModel;
import hybridstore.model.StockModel;
import hybridstore.util.DateTimeFormat;
import hybridstore.util.FileUpload;

@WebServlet("/ProductsController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512)
public class ProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String btn = request.getParameter("btn");
		if (btn.equalsIgnoreCase("edit product")) {
			int productid = Integer.parseInt(request.getParameter("productid"));
			response.sendRedirect("admin/admin-editproduct.jsp?productid=" + productid);
		}
		/*
		 * if(btn.equalsIgnoreCase("add stock")) {
		 * 
		 * }
		 */
		if (btn.equalsIgnoreCase("product stock")) {
			int productid = Integer.parseInt(request.getParameter("productid"));
			int firstBranchid = 1;
			ArrayList<StockModel> allStockOfProduct = new StockModel().getAllStock(productid);
			if(!allStockOfProduct.isEmpty())
			{
				firstBranchid = allStockOfProduct.get(0).getBranchid();
			}
			response.sendRedirect("admin/admin-stock.jsp?productid=" + productid + "&branchid=" + firstBranchid);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String btn = request.getParameter("btn");
		ProductsDao product = new ProductsDao();

		if (btn.equalsIgnoreCase("delete product")) {
			int productid = Integer.parseInt(request.getParameter("productid"));
			boolean isSuccess = product.deleteProduct(productid);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('Product is deleted');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Product is not deleted');");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("</script>");
			}
		}
		if (btn.equalsIgnoreCase("add product")) {
			ProductsModel newProduct = new ProductsModel();

			newProduct.setBrandid(product.getBrandId(request.getParameter("brand")));
			newProduct.setCategoryid(product.getCategoryId(request.getParameter("category")));
			int categoryid = product.getCategoryId(request.getParameter("category"));
			newProduct.setSubcategoryid(product.getSubcategoryId(request.getParameter("subcategory"), categoryid));
			newProduct.setProductname(request.getParameter("productname"));
			newProduct.setPrice(Integer.parseInt(request.getParameter("price")));
			newProduct.setDescription(request.getParameter("description"));
			newProduct.setStatus("Active");
			newProduct.setDate(new DateTimeFormat().getCurrentDate());
			
			String savepath = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\products\\" + request.getParameter("category")
					+ "\\" + request.getParameter("subcategory") + "\\" + request.getParameter("brand") + "\\"
					+ request.getParameter("productname");
			String action = "Add";
			newProduct = new FileUpload().uploadProductImages(savepath, request, newProduct,action);
			boolean isSuccess = product.addProduct(newProduct);
			if (isSuccess) {
				
				StockModel newStock = new StockModel();
				newStock.setBranchid(new StockDao().getBranchId(request.getParameter("branchname")));
				newStock.setProductid(newProduct.getLastProductid());
				newStock.setStock(Integer.parseInt(request.getParameter("stock")));
				isSuccess = new StockDao().addStock(newStock);
				
				// Adding Stock in remaining Branches
				ArrayList<BranchesModel> allbranches = new BranchesModel().getAllBranches();
				for(BranchesModel branch : allbranches)
				{
					if(branch.getBranchname().equals(request.getParameter("branchname")))
					{
						continue;
					}
					else
					{
						newStock = new StockModel();
						newStock.setBranchid(branch.getBranchid());
						newStock.setProductid(newProduct.getLastProductid());
						newStock.setStock(Integer.parseInt(request.getParameter("stock")));
						isSuccess = new StockDao().addStock(newStock);
					}
				}
				
				// Query
				if (isSuccess) {
					out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("window.location.href='admin/admin-products.jsp';");
					out.println("alert('stock and product are added');");
					out.println("</script>");
				} else {
					out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("window.location.href='admin/admin-products.jsp';");
					out.println("alert('stock is not added');");
					out.println("</script>");
				}
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Product is not added');");
				out.println("window.location.href='admin/admin-addproduct.jsp';");
				out.println("</script>");
			}
		}

		if (btn.equalsIgnoreCase("save as draft product")) {
			ProductsModel newProduct = new ProductsModel();

			newProduct.setBrandid(product.getBrandId(request.getParameter("brand")));
			newProduct.setCategoryid(product.getCategoryId(request.getParameter("category")));
			int categoryid = product.getCategoryId(request.getParameter("category"));
			newProduct.setSubcategoryid(product.getSubcategoryId(request.getParameter("subcategory"), categoryid));
			newProduct.setProductname(request.getParameter("productname"));
			newProduct.setPrice(Integer.parseInt(request.getParameter("price")));
			newProduct.setDescription(request.getParameter("description"));
			newProduct.setStatus("Deactive");
			newProduct.setDate(new DateTimeFormat().getCurrentDate());
			
			String savepath = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\products\\" + request.getParameter("category")
					+ "\\" + request.getParameter("subcategory") + "\\" + request.getParameter("brand") + "\\"
					+ request.getParameter("productname");
			String action = "Add";
			newProduct = new FileUpload().uploadProductImages(savepath, request, newProduct,action);
			boolean isSuccess = product.addProduct(newProduct);
			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('Product is added');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Product is not added');");
				out.println("window.location.href='admin/admin-addproduct.jsp';");
				out.println("</script>");
			}
		}

		if (btn.equalsIgnoreCase("update product")) {
			ProductsModel updateProduct = new ProductsModel();
			updateProduct.setProductid(Integer.parseInt(request.getParameter("productid")));
			updateProduct.setBrandid(product.getBrandId(request.getParameter("brand")));
			updateProduct.setCategoryid(product.getCategoryId(request.getParameter("category")));
			int categoryid = product.getCategoryId(request.getParameter("category"));
			updateProduct.setSubcategoryid(product.getSubcategoryId(request.getParameter("subcategory"), categoryid));
			updateProduct.setProductname(request.getParameter("productname"));
			updateProduct.setPrice(Integer.parseInt(request.getParameter("price")));
			updateProduct.setDescription(request.getParameter("description"));

			String savepath = "E:\\HYBRID_STORE\\src\\main\\webapp\\images\\products\\" + request.getParameter("category")
					+ "\\" + request.getParameter("subcategory") + "\\" + request.getParameter("brand") + "\\"
					+ request.getParameter("productname");
			String action = "Update";
			updateProduct = new FileUpload().uploadProductImages(savepath, request, updateProduct,action);
			boolean isSuccess = product.updateProduct(updateProduct);

			if (isSuccess) {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='admin/admin-products.jsp';");
				out.println("alert('Product is updated');");
				out.println("</script>");
			} else {
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Product is not updated');");
				out.println("window.location.href='admin/admin-addproduct.jsp';");
				out.println("</script>");
			}
		}

	}
}
