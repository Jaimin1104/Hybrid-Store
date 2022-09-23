package hybridstore.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import hybridstore.dao.admin.BrandsDao;
import hybridstore.model.BrandsModel;
import hybridstore.util.FileUpload;

@WebServlet("/BrandsController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class BrandsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter writer = null;

	public BrandsController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String btn = request.getParameter("btn");
		if (btn.equalsIgnoreCase("add brand")) {
			BrandsModel newBrand = new BrandsModel();
			newBrand.setBrandname(request.getParameter("brandname"));
			newBrand.setEmail(request.getParameter("brandemail"));
			newBrand.setWebsite(request.getParameter("brandwebsite"));
				
			// Image Uploading in database
			Part filePart = request.getPart("brandlogo");

			String photo = "";

			String path = "E:\\HYBRID_STORE\\src\\main\\webapp\\admin\\images\\brands";
			String fileName = newBrand.getBrandname() + ".png";

			photo = new FileUpload().getFileLocation(path, filePart, fileName);

			newBrand.setLogo(photo.substring(photo.indexOf("images"), photo.length()));

			boolean isAdded = new BrandsDao().addBrand(newBrand);
			if (isAdded) {
				writer = response.getWriter();
				writer.println("<script type=\"text/javascript\">");
				writer.println("alert('Brand is Added');");
				writer.println("window.location.href='admin/admin-brands.jsp';");
				writer.println("</script>");
			} else {
				writer = response.getWriter();
				writer.println("<script type=\"text/javascript\">");
				writer.println("alert('Brand is not Added');");
				writer.println("window.location.href='admin/admin-addbrand.jsp';");
				writer.println("</script>");
			}
		}
		if (btn.equalsIgnoreCase("delete brands")) {
			String brandIds[] = request.getParameterValues("brandids");
			int count = 0;
			BrandsDao brand = new BrandsDao();
			for (int i = 0; i < brandIds.length; i++) {
				boolean isDeleted = brand.deleteBrand(Integer.parseInt(brandIds[i]));
				if (isDeleted) {
					count++;
				}
			}
			writer = response.getWriter();
			writer.println("<script type=\"text/javascript\">");
			writer.println("var count = " + count + " ;");
			writer.println("alert(count + ' Brands are Deleted');");
			writer.println("window.location.href='admin/admin-brands.jsp';");
			writer.println("</script>");
		}
	}

}
