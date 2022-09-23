package hybridstore.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import hybridstore.model.ProductsModel;

public class FileUpload {
	public String getFileLocation(Part part) throws IOException {
		String savepath = "E:\\HYBRID_STORE\\src\\main\\webapp\\images";
		File fileSaveDir = new File(savepath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		Part file1 = part;
		String filename = extractfilename(file1);
		file1.write(savepath + File.separator + filename);
		return savepath + "\\" + filename;
	}

	public String getFileLocation(String path, Part part) throws IOException {
		String savepath = path;
		File fileSaveDir = new File(savepath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		Part file1 = part;
		String filename = extractfilename(file1);
		file1.write(savepath + File.separator + filename);
		return savepath + "\\" + filename;
	}

	public String getFileLocation(String path, Part part, String fileName) throws IOException {
		String savepath = path;
		System.out.println(savepath);
		File fileSaveDir = new File(savepath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		Part file1 = part;
		String filename = fileName;
		file1.write(savepath + File.separator + filename);
		return savepath + "\\" + filename;
	}

	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}
	
	public ProductsModel uploadProductImages(String path,HttpServletRequest request,ProductsModel product,String action) throws ServletException, IOException
	{
		String databasePath = "";
		File fileSaveDir = new File(path);
		int count = 1;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		for (Part part : request.getParts()) {
			System.out.println(part.getContentType());
			if ((part.getName()).equalsIgnoreCase("file")) {
				databasePath = path.substring(path.indexOf("images"), path.length());
				System.out.println(part.getName());
			
				if ((part.getContentType()).equalsIgnoreCase("image/jpeg") || (part.getContentType()).equalsIgnoreCase("image/png")) {	
					if (count == 1) {
						product.setImg1(databasePath + File.separator + count + ".jpg");
						part.write(path + File.separator + count + ".jpg");
					} else if (count == 2) {
						product.setImg2(databasePath + File.separator + count + ".jpg");
						part.write(path + File.separator + count + ".jpg");
					} else if (count == 3) {
						product.setImg3(databasePath + File.separator + count + ".jpg");
						part.write(path + File.separator + count + ".jpg");
					} else if (count == 4) {
						product.setImg4(databasePath + File.separator + count + ".jpg");
						part.write(path + File.separator + count + ".jpg");
					}
				}
				else if(action.equalsIgnoreCase("Update"))
				{	
					if (count == 1) {
						product.setImg1(databasePath + File.separator + count + ".jpg");
					} else if (count == 2) {
						product.setImg2(databasePath + File.separator + count + ".jpg");
					} else if (count == 3) {
						product.setImg3(databasePath + File.separator + count + ".jpg");
					} else if (count == 4) {
						product.setImg4(databasePath + File.separator + count + ".jpg");
					}
				}
				count++;
			}
		}
		/* System.out.println(count); */
		return product;
	}
}
