package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class ProductsModel {
	private int productid;
	private int brandid;
	private int categoryid;
	private int subcategoryid;
	private String productname;
	private String description;
	private int price;
	private String status;
	private String date;
	private String img1;
	private String img2;
	private String img3;
	private String img4;

	public int getProductid() {
		return this.productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public int getBrandid() {
		return brandid;
	}

	public void setBrandid(int brandid) {
		this.brandid = brandid;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getSubcategoryid() {
		return subcategoryid;
	}

	public void setSubcategoryid(int subcategoryid) {
		this.subcategoryid = subcategoryid;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return this.price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public ArrayList<ProductsModel> getAllProducts() {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.status = productResult.getString("status");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}
	
	public ArrayList<ProductsModel> getAllProducts(String query) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.status = productResult.getString("status");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}

	public int getLastProductid() {
		int productid=-1;
		Connection connection = new DBConnector().getConnection();
		String query = "select productid from products order by productid desc limit 1;";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet productResult = pstmt.executeQuery();
			if (productResult.next()) {
				productid = productResult.getInt("productid");
				System.out.println(productid);
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
		return productid;
	}
	
	public ProductsModel getProduct(int productid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products where productid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, productid);
			ResultSet productResult = pstmt.executeQuery();
			if (productResult.next()) {
				this.productid = productResult.getInt("productid");
				this.brandid = productResult.getInt("brandid");
				this.categoryid = productResult.getInt("categoryid");
				this.subcategoryid = productResult.getInt("subcategoryid");
				this.productname = productResult.getString("productname");
				this.price = productResult.getInt("price");
				this.description = productResult.getString("description");
				this.date = productResult.getString("date");
				this.img1 = productResult.getString("img1");
				this.img2 = productResult.getString("img2");
				this.img3 = productResult.getString("img3");
				this.img4 = productResult.getString("img4");	
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

	public ArrayList<ProductsModel> getCategoryProducts(int categoryid) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products where categoryid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, categoryid);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}

	public ArrayList<ProductsModel> getSubcategoryProducts(int subcategoryid) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products where subcategoryid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, subcategoryid);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}

	public ArrayList<ProductsModel> getBrandProducts(int brandid) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products where brandid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, brandid);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}

	public ArrayList<ProductsModel> getBranchProducts(int branchid) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products where branchid=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, branchid);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);
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
		return allProducts;
	}

	public long getTotalProducts()
	{
		long totalproducts = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(productid) as totalproducts from products";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalproducts = paymentResult.getLong("totalproducts");
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
		return totalproducts;
	}
	
	public int getMaximumPrice()
	{
		int price = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select max(price) as price from products;";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				price = paymentResult.getInt("price");
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
		return price;
	}
	
	public int getMinimumPrice()
	{
		int price = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select min(price) as price from products;";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				price = paymentResult.getInt("price");
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
		return price;
	}
	
	public int getTotalProductsByCategoryid(int categoryid)
	{
		int totalproducts = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(productid) as totalproducts from products where categoryid=? and status='Active'";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,categoryid);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalproducts = paymentResult.getInt("totalproducts");
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
		return totalproducts;
	}
	
	public int getTotalProductsBySubCategoryid(int subcategoryid)
	{
		int totalproducts = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(productid) as totalproducts from products where subcategoryid=? and status='Active'";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,subcategoryid);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalproducts = paymentResult.getInt("totalproducts");
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
		return totalproducts;
	}
	
	public int getTotalProductsByBrandid(int brandid)
	{
		int totalproducts = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(productid) as totalproducts from products where brandid=? and status='Active'";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,brandid);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalproducts = paymentResult.getInt("totalproducts");
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
		return totalproducts;
	}
	
	public ArrayList<ProductsModel> getAllProductsOfCartItemsByConsumerid(int consumerid) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from products where productid in (select productid from cartitems where cartid=(select cartid from carts where consumerid=? and status='Active'));";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.status = productResult.getString("status");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}
	
	public ArrayList<ProductsModel> getAvailableProductsByBranch(int cartid,int branchid) {
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "SELECT * FROM products WHERE productid IN (SELECT productid FROM stock WHERE productid IN (SELECT productid FROM cartitems WHERE cartitemid IN (SELECT cartitemid FROM cartitems WHERE cartid = ?)) AND branchid=?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, cartid);
			pstmt.setInt(2, branchid);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel.productid = productResult.getInt("productid");
				productmodel.brandid = productResult.getInt("brandid");
				productmodel.categoryid = productResult.getInt("categoryid");
				productmodel.subcategoryid = productResult.getInt("subcategoryid");
				productmodel.productname = productResult.getString("productname");
				productmodel.price = productResult.getInt("price");
				productmodel.status = productResult.getString("status");
				productmodel.description = productResult.getString("description");
				productmodel.date = productResult.getString("date");
				productmodel.img1 = productResult.getString("img1");
				productmodel.img2 = productResult.getString("img2");
				productmodel.img3 = productResult.getString("img3");
				productmodel.img4 = productResult.getString("img4");
				allProducts.add(productmodel);	
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
		return allProducts;
	}
	
	public int getTotalProductsByfilter(int brandid,String categoryids,String subcategoryids)
	{
		int totalproducts = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(productid) as totalproducts from products where brandid=? and status='Active'";
		if(subcategoryids.length()>0)  
		{
			query = query + " and subcategoryid IN ("+subcategoryids+")"; 
		}
		else if(categoryids.length()>0)
		{
			query = query + " and categoryid IN ("+categoryids+")"; 
		}
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1,brandid);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalproducts = paymentResult.getInt("totalproducts");
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
		return totalproducts;
	}
	
	public ArrayList<ProductsModel> getTopCollection()
	{
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select productid,count(productid) as nooftimes from cartitems where cartid in (select cartid from carts where status = 'deactive') group by productid order by nooftimes desc limit 8";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel = productmodel.getProduct(productResult.getInt("productid"));
				allProducts.add(productmodel);	
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
		return allProducts;
	}
	
	public ArrayList<ProductsModel> getMostLikedProducts()
	{
		ArrayList<ProductsModel> allProducts = new ArrayList<ProductsModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select productid,count(productid) as nooftimes from wishlists group by productid order by nooftimes desc limit 6";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet productResult = pstmt.executeQuery();
			while (productResult.next()) {
				ProductsModel productmodel = new ProductsModel();
				productmodel = productmodel.getProduct(productResult.getInt("productid"));
				allProducts.add(productmodel);	
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
		return allProducts;
	}
	
	public ProductsModel getCheapestProduct(String subcategoryname) {
		String query = "SELECT * FROM products WHERE price=(SELECT MIN(price) FROM products WHERE subcategoryid=(SELECT subcategoryid FROM subcategories WHERE subcategoryname=?)) AND subcategoryid=(SELECT subcategoryid FROM subcategories WHERE subcategoryname=?)";
		Connection connection = new DBConnector().getConnection();
		ProductsModel cheapestProduct = new ProductsModel();
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, subcategoryname); 
			pstmt.setString(2, subcategoryname);
			
			ResultSet result = pstmt.executeQuery();
			if (result.next()) {
				System.out.println(result.getInt("productid"));
				cheapestProduct = getProduct(result.getInt("productid"));
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
		return cheapestProduct;
	}
}
