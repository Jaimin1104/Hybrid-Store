package hybridstore.controller.consumer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hybridstore.dao.consumer.CartDao;
import hybridstore.dao.consumer.CartItemsDao;
import hybridstore.dao.consumer.OrdersDao;
import hybridstore.dao.consumer.PaymentsDao;
import hybridstore.dao.consumer.StocksDao;
import hybridstore.model.BranchesModel;
import hybridstore.model.CartItemsModel;
import hybridstore.model.ConsumersModel;
import hybridstore.model.OrdersModel;
import hybridstore.model.StaffModel;
import hybridstore.model.StockModel;
import hybridstore.util.GenerateInvoice;
import hybridstore.util.MailSender;

@WebServlet("/OrderController.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("updateStatus"))
		{
			Boolean isSuccess = false;
			OrdersModel order = new OrdersModel();
			order.setOrderid(Integer.parseInt(request.getParameter("orderid")));
			order = order.getOrderInformation(order.getOrderid());
			order.setStatus(request.getParameter("status"));
			isSuccess = new OrdersDao().updateOrder(order);
			if(isSuccess)
			{
				if(order.getStatus().equalsIgnoreCase("packed"))
				{
					StaffModel staffOfOrder = new StaffModel().getStaff(order.getStaffid());
					BranchesModel branch = new BranchesModel().getBranch(staffOfOrder.getBranchid());
					String subject = "Cart Packed";
					String msg = "Your cart has been packed and ready to receive \n"+
								 "Kindly receive it within 24 hours. \n\n" + 
								 "Your Order ID is " + order.getOrderid() + "\n\n" + 
								 "Staff Member: " + staffOfOrder.getFirstname() + " " + staffOfOrder.getLastname() + "\n" +
								 "Branch Name: " + branch.getBranchname() + "\n" +
								 "Branch Address: " + branch.getAddress() + 
								 "\n\nRegards," +
								 "\nHybrid store";
					ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
					new MailSender().sendEmail(consumer.getEmail(), subject, msg);
					response.sendRedirect("staff/staff-order-details.jsp?orderid="+order.getOrderid());
				}
				else if(order.getStatus().equalsIgnoreCase("cancelled"))
				{
					String subject = "Order Cancelled";
					String msg = "Your order has been cancelled successfully." + 
								 "\n\nRegards," +
								 "\nHybrid store";
					ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
					new MailSender().sendEmail(consumer.getEmail(), subject, msg);
					response.sendRedirect("dashboard.jsp");
				}
				else if(order.getStatus().equalsIgnoreCase("completed"))
				{
					isSuccess = new PaymentsDao().createPayment(order.getOrderid(), "Offline");
					if(isSuccess)
					{
						ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
						new GenerateInvoice(order.getOrderid());
						
						String subject = "Order Completed";
						String msg = "Your order has been Completed successfully." + 
									 "\n\nRegards," +
									 "\nHybrid store";
						new MailSender().sendEmailWithAttachment(consumer.getEmail(), subject, msg,order.getOrderid());
						
						response.sendRedirect("staff/staff-dashboard.jsp");
					}
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkbox = request.getParameter("checkbox");
		System.out.println(checkbox);
		int branchid = Integer.parseInt(request.getParameter("branchid"));
		int cartid = Integer.parseInt(request.getParameter("cartid"));
		int totalOfOrder = Integer.parseInt(request.getParameter("payprice"));
		int orderid =  new OrdersDao().createOrder(cartid, branchid,totalOfOrder);
		if(checkbox.equalsIgnoreCase("online"))
		{
			if(orderid!=0)
			{
				response.sendRedirect("paytmRedirect.jsp?payment="+totalOfOrder+"&orderid="+orderid);
			}
		}
		else
		{
			if(orderid!=0)
			{
				boolean isSuccess = false;
				ArrayList<CartItemsModel> allCartItemsOfOrder = new CartItemsModel().getAllCartItemsByCart(cartid);
				StocksDao stockDao = new StocksDao();
				HttpSession session = request.getSession();
				ConsumersModel consumer = (ConsumersModel)(session.getAttribute("consumer"));
				for(CartItemsModel cartItemOfOrder : allCartItemsOfOrder)
				{
					int stockid = stockDao.getStockIdByProductAndBranch(cartItemOfOrder.getProductid(), branchid);
					StockModel stockModel = new StockModel().getStockByStockid(stockid);
					int stock = stockModel.getStock() - cartItemOfOrder.getQuantity();
					
					if(stock<3)
					{
						isSuccess = new CartItemsDao().deleteProductInCart(cartItemOfOrder.getProductid());
						if(isSuccess)
						{
							isSuccess = new CartDao().updateCartOfConsumer(consumer.getConsumerid());
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
				isSuccess = new CartDao().disableCurrentCartOfConsumer(consumer.getConsumerid());
				if(isSuccess)
				{
					isSuccess = new CartDao().addNewCartOfConsumer(consumer.getConsumerid());
				}
				response.sendRedirect("confirmation.jsp?orderid="+orderid);;
			}
		}
	
	}

}
