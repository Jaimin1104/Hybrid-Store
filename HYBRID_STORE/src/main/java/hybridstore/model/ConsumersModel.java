package hybridstore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hybridstore.util.DBConnector;

public class ConsumersModel {

	private int consumerid;
	private String firstname;
	private String lastname;
	private String username;
	private String phoneno;
	private String email;
	private String password;
	private String address;
	private String profilepicture;
	private String dob;

	public String getAddress() {
		return address;
	}

	public int getConsumerid() {
		return consumerid;
	}

	public String getEmail() {
		return email;
	}

	public String getFirstname() {
		return firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public String getPassword() {
		return password;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public String getUsername() {
		return username;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setConsumerid(int consumerid) {
		this.consumerid = consumerid;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProfilepicture() {
		return profilepicture;
	}

	public void setProfilepicture(String profilepicture) {
		this.profilepicture = profilepicture;
	}
	
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public ArrayList<ConsumersModel> getAllConsumers() {
		ArrayList<ConsumersModel> allConsumers = new ArrayList<ConsumersModel>();
		Connection connection = new DBConnector().getConnection();
		String query = "select * from consumers";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			ResultSet consumerResult = pstmt.executeQuery();
			while (consumerResult.next()) {
				ConsumersModel consumermodel = new ConsumersModel();
				consumermodel.consumerid = consumerResult.getInt("consumerid");
				consumermodel.firstname = consumerResult.getString("firstname");
				consumermodel.lastname = consumerResult.getString("lastname");
				consumermodel.username = consumerResult.getString("username");
				consumermodel.password = consumerResult.getString("password");
				consumermodel.email = consumerResult.getString("email");
				consumermodel.phoneno = consumerResult.getString("phoneno");
				consumermodel.address = consumerResult.getString("address");
				consumermodel.profilepicture = consumerResult.getString("profilepicture");
				consumermodel.dob = consumerResult.getString("dob");
				allConsumers.add(consumermodel);
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
		return allConsumers;
	}

	public ConsumersModel getConsumer(int consumerid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from consumers where consumerid = ?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, consumerid);
			ResultSet consumerResult = pstmt.executeQuery();
			if (consumerResult.next()) {
				this.consumerid = consumerResult.getInt("consumerid");
				this.firstname = consumerResult.getString("firstname");
				this.lastname = consumerResult.getString("lastname");
				this.username = consumerResult.getString("username");
				this.password = consumerResult.getString("password");
				this.email = consumerResult.getString("email");
				this.phoneno = consumerResult.getString("phoneno");
				this.address = consumerResult.getString("address");
				this.profilepicture = consumerResult.getString("profilepicture");
				this.dob = consumerResult.getString("dob");
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
	
	public long getTotalConsumers()
	{
		long totalconsumers = 0;
		Connection connection = new DBConnector().getConnection();
		String query = "select count(consumerid) as totalconsumers from consumers";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			ResultSet paymentResult = pstmt.executeQuery();
			if(paymentResult.next())
			{
				totalconsumers = paymentResult.getLong("totalconsumers");
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
		return totalconsumers;
	}
	
	public ConsumersModel getOrderConsumer(int orderid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from consumers where consumerid = (select consumerid from carts where cartid = ( select cartid from orders where orderid = ?))";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orderid);
			ResultSet consumerResult = pstmt.executeQuery();
			if (consumerResult.next()) {
				this.consumerid = consumerResult.getInt("consumerid");
				this.firstname = consumerResult.getString("firstname");
				this.lastname = consumerResult.getString("lastname");
				this.username = consumerResult.getString("username");
				this.password = consumerResult.getString("password");
				this.email = consumerResult.getString("email");
				this.phoneno = consumerResult.getString("phoneno");
				this.address = consumerResult.getString("address");
				this.profilepicture = consumerResult.getString("profilepicture");
				this.dob = consumerResult.getString("dob");
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
	
	public ConsumersModel getPaymentConsumer(int paymentid) {
		Connection connection = new DBConnector().getConnection();
		String query = "select * from consumers where consumerid = (select consumerid from carts where cartid = ( select cartid from orders where orderid = (select orderid from payments where paymentid = ?)))";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, paymentid);
			ResultSet consumerResult = pstmt.executeQuery();
			if (consumerResult.next()) {
				this.consumerid = consumerResult.getInt("consumerid");
				this.firstname = consumerResult.getString("firstname");
				this.lastname = consumerResult.getString("lastname");
				this.username = consumerResult.getString("username");
				this.password = consumerResult.getString("password");
				this.email = consumerResult.getString("email");
				this.phoneno = consumerResult.getString("phoneno");
				this.address = consumerResult.getString("address");
				this.profilepicture = consumerResult.getString("profilepicture");
				this.dob = consumerResult.getString("dob");
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
