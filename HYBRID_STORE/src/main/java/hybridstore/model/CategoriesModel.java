package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class CategoriesModel {
	private int categoryid;
	private String categoryname, description;

	public int getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<CategoriesModel> getAllCategories() {
		ArrayList<CategoriesModel> allCategories = new ArrayList<CategoriesModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from categories";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet categoryResult = pstmt.executeQuery();
			while (categoryResult.next()) {
				CategoriesModel categorymodel = new CategoriesModel();
				categorymodel.categoryid = categoryResult.getInt("categoryid");
				categorymodel.categoryname = categoryResult.getString("categoryname");
				categorymodel.description = categoryResult.getString("description");
				allCategories.add(categorymodel);
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
		return allCategories;
	}

	public CategoriesModel getCategory(int categoryid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from categories where categoryid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, categoryid);
			ResultSet categoryResult = pstmt.executeQuery();
			if (categoryResult.next()) {

				this.categoryname = categoryResult.getString("categoryname");
				this.description = categoryResult.getString("description");
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
		return this;
	}
	
	public int getCategoryId(String categoryname) {
		Connection connection = new DBConnector().getConnection();
		String query = "select categoryid from categories where categoryname=?";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, categoryname);
			
			ResultSet result = pstmt.executeQuery();
			if (result.next()) {
				categoryid = result.getInt("categoryid");
				System.out.println(categoryid);
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
}
