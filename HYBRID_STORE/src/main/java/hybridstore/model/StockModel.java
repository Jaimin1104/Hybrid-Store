package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class StockModel {

	private int stockid;
	private int branchid;
	private int productid;
	private int stock;

	public int getProductid() {
		return productid;
	}

	public int getStock() {
		return stock;
	}

	public int getStockid() {
		return stockid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setStockid(int stockid) {
		this.stockid = stockid;
	}
	
	public int getBranchid() {
		return branchid;
	}

	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}

	public int getProductStock(int branchid,int productid) {
		int stockofproduct = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select * from stock where branchid=? and productid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, branchid);
			pstmt.setInt(2, productid);
			ResultSet stockResult = pstmt.executeQuery();
			if (stockResult.next()) {
				stockofproduct = stockResult.getInt("stock");
			} else {
				stockofproduct = -1;
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
		return stockofproduct;
	}
	
	public StockModel getStockByStockid(int stockid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from stock where stockid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, stockid);
			ResultSet stockResult = pstmt.executeQuery();
			if (stockResult.next()) {
				this.stockid = stockResult.getInt("stockid");
				this.branchid = stockResult.getInt("branchid");
				this.productid = stockResult.getInt("productid");
				this.stock = stockResult.getInt("stock");		
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
	
	public ArrayList<StockModel> getAllStock() {
		ArrayList<StockModel> allStock = new ArrayList<StockModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from stock";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet stockResult = pstmt.executeQuery();
			while (stockResult.next()) {
				StockModel stockmodel = new StockModel();
				stockmodel.stockid = stockResult.getInt("stockid");
				stockmodel.branchid = stockResult.getInt("branchid");
				stockmodel.productid = stockResult.getInt("productid");
				stockmodel.stock = stockResult.getInt("stock");
				allStock.add(stockmodel);		
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
		return allStock;
	}

	public ArrayList<StockModel> getAllStock(int productid) {
		ArrayList<StockModel> allStock = new ArrayList<StockModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from stock where productid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, productid);
			ResultSet stockResult = pstmt.executeQuery();
			while (stockResult.next()) {
				StockModel stockmodel = new StockModel();
				stockmodel.stockid = stockResult.getInt("stockid");
				stockmodel.branchid = stockResult.getInt("branchid");
				stockmodel.productid = stockResult.getInt("productid");
				stockmodel.stock = stockResult.getInt("stock");
				allStock.add(stockmodel);		
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
		return allStock;
	}
}
