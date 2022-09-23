package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class BrandsModel {
	private int brandid;
	private String brandname;
	private String email;
	private String website;
	private String logo;

	public int getBrandid() {
		return this.brandid;
	}

	public void setBrandid(int brandid) {
		this.brandid = brandid;
	}

	public String getBrandname() {
		return this.brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public ArrayList<BrandsModel> getAllBrands() {
		ArrayList<BrandsModel> allbrands = new ArrayList<BrandsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from brands";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet brandResult = pstmt.executeQuery();
			while (brandResult.next()) {
				BrandsModel brandmodel = new BrandsModel();
				brandmodel.brandid = brandResult.getInt("brandid");
				brandmodel.email = brandResult.getString("email");
				brandmodel.logo = brandResult.getString("logo");
				brandmodel.brandname = brandResult.getString("brandname");
				brandmodel.website = brandResult.getString("website");
				allbrands.add(brandmodel);
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
		return allbrands;
	}

	public BrandsModel getBrand(int brandid)
	{
		Connection connection = new DBConnector().getConnection();
		String query = "select * from brands where brandid=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,brandid);
			ResultSet brandResult = pstmt.executeQuery();
			if (brandResult.next()) {
				this.brandid = brandResult.getInt("brandid");
				this.email = brandResult.getString("email");
				this.logo = brandResult.getString("logo");
				this.brandname = brandResult.getString("brandname");
				this.website = brandResult.getString("website");
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
}
