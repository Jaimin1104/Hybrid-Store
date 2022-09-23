<%-- <%@page import="javafx.scene.control.Alert"%> --%>
<%@page import="hybridstore.util.GenerateInvoice"%>
<%@page import="hybridstore.util.MailSender"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.dao.consumer.CartItemsDao"%>
<%@page import="hybridstore.model.StockModel"%>
<%@page import="hybridstore.dao.consumer.StocksDao"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="hybridstore.util.DBConnector"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.dao.consumer.CartDao"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@page import="hybridstore.dao.consumer.PaymentsDao"%>
<%@page import="hybridstore.dao.consumer.OrdersDao"%>
<%@page import="com.sun.mail.iap.Response"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="hybridstore.util.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
System.out.println(paramNames);
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	System.out.println(isValideChecksum);
	System.out.println(parameters.containsKey("RESPCODE"));
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		System.out.println(parameters.get("RESPCODE"));
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
			PaymentsDao payment = new PaymentsDao();
			System.out.println((int)(Double.parseDouble(parameters.get("TXNAMOUNT"))));
			boolean isSuccess = payment.createPayment(Integer.parseInt(parameters.get("ORDERID")), "Online");
			if(isSuccess)
			{
				// Remove Stock of Purchased Products
				OrdersModel order = new OrdersModel().getOrderInformation(Integer.parseInt(parameters.get("ORDERID")));
				StaffModel staff = new StaffModel().getStaff(order.getStaffid());
				int cartid = order.getCartid();
				CartModel cart = new CartModel().getActiveCartByCartid(cartid);
				System.out.println(order.getStaffid());
				System.out.println(cartid);
				int branchid = staff.getBranchid();
				ArrayList<CartItemsModel> allCartItemsOfOrder = new CartItemsModel().getAllCartItemsByCart(cartid);
				StocksDao stockDao = new StocksDao();
				for(CartItemsModel cartItemOfOrder : allCartItemsOfOrder)
				{
					int stockid = stockDao.getStockIdByProductAndBranch(cartItemOfOrder.getProductid(), branchid);
					StockModel stockModel = new StockModel().getStockByStockid(stockid);
					int stock = stockModel.getStock() - cartItemOfOrder.getQuantity();
					if(stock<0)
					{
						isSuccess = new CartItemsDao().deleteProductInCart(cartItemOfOrder.getProductid());
						if(isSuccess)
						{
							isSuccess = new CartDao().updateCartOfConsumer(cart.getConsumerid());
							if(isSuccess)
							{
								continue;
							}
						}
					}
					else
					{
						isSuccess = stockDao.updateStocks(stockid,stock);
						if(isSuccess)
						{
							continue;
						}
					}
				}
				isSuccess = new CartDao().disableCurrentCartOfConsumer(cart.getConsumerid());
				if(isSuccess)
				{
					isSuccess = new CartDao().addNewCartOfConsumer(cart.getConsumerid());
					ArrayList<CartItemsModel> cartitems = new CartItemsModel().getAllCartItemsByCart(order.getCartid());
					ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
					new GenerateInvoice(order.getOrderid());
					
					String subject = "Order Confirmed";
					String msg = "Your order has been confirmed and invoice" + 
								 "\n\nRegards," +
								 "\nHybrid store";
					new MailSender().sendEmailWithAttachment(consumer.getEmail(), subject, msg,order.getOrderid());
				}
				ConsumersModel consumer = new ConsumersModel().getConsumer(cart.getConsumerid());
				session.setAttribute("consumer",consumer);
				response.sendRedirect("confirmation.jsp?orderid="+parameters.get("ORDERID"));
			}
		}else{
			outputHTML="<b>Payment Failed.</b>";
			OrdersModel order = new OrdersModel().getOrderInformation(Integer.parseInt(parameters.get("ORDERID")));
			StaffModel staff = new StaffModel().getStaff(order.getStaffid());
			boolean isSuccess = new OrdersDao().deleteOrder(Integer.parseInt(parameters.get("ORDERID")));
			response.sendRedirect("review.jsp?cartid="+order.getCartid()+"&branchid="+staff.getBranchid());
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
		OrdersModel order = new OrdersModel().getOrderInformation(Integer.parseInt(parameters.get("ORDERID")));
		StaffModel staff = new StaffModel().getStaff(order.getStaffid());
		boolean isSuccess = new OrdersDao().deleteOrder(Integer.parseInt(parameters.get("ORDERID")));
		response.sendRedirect("review.jsp?cartid="+order.getCartid()+"&branchid="+staff.getBranchid());
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>

<%
//
%>
</body>
</html>