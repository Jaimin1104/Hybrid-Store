package hybridstore.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hybridstore.model.BrandsModel;
import hybridstore.util.DBConnector;

public class BrandsDao {
	private Connection connection = null;
	String query = null;
	PreparedStatement pstmt;

	public boolean deleteBrand(int brandid) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "delete from brands where brandid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, brandid);
			if (pstmt.executeUpdate() > 0) {
				status = true;
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
		return status;
	}

	public Boolean addBrand(BrandsModel newBrand) {
		this.connection = new DBConnector().getConnection();
		boolean status = false;
		query = "insert into brands (brandname,website,email,logo) values(?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, newBrand.getBrandname());
			pstmt.setString(2, newBrand.getWebsite());
			pstmt.setString(3, newBrand.getEmail());
			pstmt.setString(4, newBrand.getLogo());
			if (pstmt.executeUpdate() > 0) {
				status = true;
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
		return status;
	}

	public int getTotalProducts(int brandid) {
		this.connection = new DBConnector().getConnection();
		int numberOfProducts = 0;
		String query = "select count(*) as numberOfProducts from products where brandid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, brandid);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				numberOfProducts = rs.getInt("numberOfProducts");
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
		return numberOfProducts;
	}

}
