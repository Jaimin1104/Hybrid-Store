package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import hybridstore.model.CategoriesModel;
import hybridstore.util.DBConnector;

public class CategoriesDao 
{
	private Connection connection = null;
	private PreparedStatement pstmt;
	private String query;
	private boolean isSuccess = false;
	
	public boolean addCategory(CategoriesModel newCategory) {
		this.connection = new DBConnector().getConnection();
		query = "insert into categories (categoryname,description) values(?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, newCategory.getCategoryname());
			pstmt.setString(2, newCategory.getDescription());
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
	public boolean deleteCategory(int id) {
		this.connection = new DBConnector().getConnection();
		query = "delete from categories where categoryid=?";
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
