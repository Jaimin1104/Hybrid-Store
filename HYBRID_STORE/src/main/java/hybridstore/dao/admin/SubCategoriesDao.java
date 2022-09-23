package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hybridstore.model.SubCategoriesModel;
import hybridstore.util.DBConnector;

public class SubCategoriesDao 
{
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public SubCategoriesDao() {
		this.connection = new DBConnector().getConnection();
	}
		
	
	public boolean addSubCategory(SubCategoriesModel newSubCategory) {
		this.connection = new DBConnector().getConnection();
		query = "insert into subcategories (categoryid,subcategoryname,description) values(?,?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, newSubCategory.getCategoryid());
			pstmt.setString(2, newSubCategory.getSubcategoryname());
			pstmt.setString(3, newSubCategory.getDescription());
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
	
	public boolean deleteSubCategory(int id) {
		this.connection = new DBConnector().getConnection();
		query = "delete from subcategories where subcategoryid=?";
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
}
