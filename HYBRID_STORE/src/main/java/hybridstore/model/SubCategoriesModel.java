package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class SubCategoriesModel {
	private int subcategoryid, categoryid;
	private String subcategoryname, description;

	public String getSubcategoryname() {
		return subcategoryname;
	}

	public void setSubcategoryname(String subcategoryname) {
		this.subcategoryname = subcategoryname;
	}

	public int getSubcategoryid() {
		return this.subcategoryid;
	}

	public void setSubcategoryid(int subcategoryid) {
		this.subcategoryid = subcategoryid;
	}

	public int getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<SubCategoriesModel> getAllSubCategories() {
		ArrayList<SubCategoriesModel> allSubCategories = new ArrayList<SubCategoriesModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from SubCategories";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet subcategoryResult = pstmt.executeQuery();
			while (subcategoryResult.next()) {
				SubCategoriesModel subcategorymodel = new SubCategoriesModel();
				subcategorymodel.categoryid = subcategoryResult.getInt("categoryid");
				subcategorymodel.subcategoryid = subcategoryResult.getInt("subcategoryid");
				subcategorymodel.subcategoryname = subcategoryResult.getString("subcategoryname");
				subcategorymodel.description = subcategoryResult.getString("description");
				allSubCategories.add(subcategorymodel);
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
		return allSubCategories;
	}

	public SubCategoriesModel getSubCategory(int subcategoryid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from subcategories where subcategoryid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, subcategoryid);
			ResultSet subcategoryResult = pstmt.executeQuery();
			if (subcategoryResult.next()) {

				this.subcategoryname = subcategoryResult.getString("subcategoryname");
				this.description = subcategoryResult.getString("description");
				this.categoryid = subcategoryResult.getInt("categoryid");
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
	
	public ArrayList<SubCategoriesModel> getAllSubCategoriesByCategory(int categoryid) {
		ArrayList<SubCategoriesModel> allSubCategories = new ArrayList<SubCategoriesModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from SubCategories where categoryid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, categoryid);
			ResultSet subcategoryResult = pstmt.executeQuery();
			while (subcategoryResult.next()) {
				SubCategoriesModel subcategorymodel = new SubCategoriesModel();
				subcategorymodel.categoryid = subcategoryResult.getInt("categoryid");
				subcategorymodel.subcategoryid = subcategoryResult.getInt("subcategoryid");
				subcategorymodel.subcategoryname = subcategoryResult.getString("subcategoryname");
				subcategorymodel.description = subcategoryResult.getString("description");
				allSubCategories.add(subcategorymodel);
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
		return allSubCategories;
	}
	
	public int getSubCategoryId(String subCategoryName) throws SQLException {
		String query = "select subcategoryid from subcategories where subcategoryname=?";
		Connection connection = new DBConnector().getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		
		pstmt.setString(1, subCategoryName);
		ResultSet result = pstmt.executeQuery();
		if (result.next()) {
			subcategoryid = result.getInt("subcategoryid");
		}
		return subcategoryid;
	}
}
