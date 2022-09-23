package hybridstore.dao.admin;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.ProductsModel;
import hybridstore.util.DBConnector;

public class ProductsDao {
	private Connection connection = null;
	private ResultSet result;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public boolean addProduct(ProductsModel newProduct) {
		this.connection = new DBConnector().getConnection();
		query = "insert into products (brandid, categoryid, subcategoryid, productname, price,status,description,img1,img2,img3,img4,date) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, newProduct.getBrandid());
			pstmt.setInt(2, newProduct.getCategoryid());
			pstmt.setInt(3, newProduct.getSubcategoryid());
			pstmt.setString(4, newProduct.getProductname());
			pstmt.setInt(5, newProduct.getPrice());
			pstmt.setString(6, newProduct.getStatus());
			pstmt.setString(7, newProduct.getDescription());
			pstmt.setString(8, newProduct.getImg1());
			pstmt.setString(9, newProduct.getImg2());
			pstmt.setString(10, newProduct.getImg3());
			pstmt.setString(11, newProduct.getImg4());
			pstmt.setString(12, newProduct.getDate());
			if(pstmt.executeUpdate() > 0)
			{
				isSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
	public boolean deleteProduct(int id) {
		this.connection = new DBConnector().getConnection();
		query = "delete from products where productid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, id);
			if(pstmt.executeUpdate() > 0)
			{
				isSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
	public boolean updateProduct(ProductsModel Product) {
		this.connection = new DBConnector().getConnection();
		query = "update products set brandid=?,categoryid=?,subcategoryid=?,productname=?,price=?,description=?,img1=?,img2=?,img3=?,img4=? where productid=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, Product.getBrandid());
			pstmt.setInt(2, Product.getCategoryid());
			pstmt.setInt(3, Product.getSubcategoryid());
			pstmt.setString(4, Product.getProductname());
			pstmt.setInt(5, Product.getPrice());
			pstmt.setString(6, Product.getDescription());
			pstmt.setString(7, Product.getImg1());
			pstmt.setString(8, Product.getImg2());
			pstmt.setString(9, Product.getImg3());
			pstmt.setString(10, Product.getImg4());
			pstmt.setInt(11, Product.getProductid());
			if(pstmt.executeUpdate() > 0)
			{
				isSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
	
	public int getBrandId(String brandname) {
		this.connection = new DBConnector().getConnection();
		int brandid = -1;
		query = "select * from brands where brandname=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, brandname);
			result = pstmt.executeQuery();
			if(result.next())
			{
				brandid = result.getInt("brandid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return brandid;
	}
	
	public int getCategoryId(String categoryname) {
		this.connection = new DBConnector().getConnection();
		int categoryid = -1;
		query = "select * from categories where categoryname=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, categoryname);
			result = pstmt.executeQuery();
			if(result.next())
			{
				categoryid = result.getInt("categoryid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return categoryid;
	}
	
	public int getSubcategoryId(String subcategoryname,int categoryid) {
		this.connection = new DBConnector().getConnection();
		int subcategoryid = -1;
		query = "select * from subcategories where categoryid=? and subcategoryname=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, categoryid);
			pstmt.setString(2, subcategoryname);
			
			ResultSet ressa = pstmt.executeQuery();
			if(ressa.next())
			{
				subcategoryid = ressa.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return subcategoryid;
	}
}
