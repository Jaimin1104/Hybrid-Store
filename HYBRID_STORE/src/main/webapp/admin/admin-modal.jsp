<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.model.FeedbacksModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="hybridstore.model.BrandsModel"%>
<%@page import="hybridstore.model.StockModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="hybridstore.model.CategoriesModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="admin-head.jsp" %>
		<style>
		#order-heading {
			background-color: #edf4f7;
			position: relative;
			max-width: 800px;
			padding-top: 30px;
			padding-bottom: 20px;
		}
		
		#order-heading .text-uppercase {
			font-size: 0.9rem;
			color: #777;
			font-weight: 600
		}
		
		#order-heading .h4 {
			font-weight: 600
		}
		
		#order-heading .h4+div p {
			font-size: 0.8rem;
			color: #777
		}
		
		.wrapper {
			padding: 0px 10px 10px;
			max-width: 800px;
			border-bottom-left-radius: 25px;
			border-bottom-right-radius: 25px
		}
		</style>
	</head>
	
	<body>
	
<%
	if (request.getParameter("orderid") != null)
	{
		OrdersModel order = new OrdersModel().getOrderInformation(Integer.parseInt(request.getParameter("orderid")));
		CartModel cartOfOrder = new CartModel().getActiveCartByCartid(order.getCartid());
		ArrayList<CartItemsModel> allCartItemsOfOrder = new CartItemsModel().getAllCartItemsByCart(cartOfOrder.getCartid());
		PaymentsModel paymentOfOrder = new PaymentsModel().getOrderPaymentMode(order.getOrderid());
		ConsumersModel consumerOfOrder = new ConsumersModel().getOrderConsumer(order.getOrderid());
		StaffModel staffOfOrder = new StaffModel().getOrderStaff(order.getOrderid());
		
		out.println("<div class='d-flex flex-column justify-content-center align-items-center' id='order-heading'>");
			out.println("<div class='h4'>" + order.getDatetime() + "</div>");
				out.println("<div class='pt-1'>Order #" + order.getOrderid() + " is currently ");
				if(order.getStatus().equalsIgnoreCase("confirmed"))
				{
					out.println("<b class='text-dark badge rounded-pill alert-primary'>" + order.getStatus() + "</b>");
				}
				else if(order.getStatus().equalsIgnoreCase("packed"))
				{
					out.println("<b class='text-dark badge rounded-pill alert-info'>" + order.getStatus() + "</b>");
				}
				else if(order.getStatus().equalsIgnoreCase("completed"))
				{
					out.println("<b class='text-dark badge rounded-pill alert-success'>" + order.getStatus() + "</b>");
				}
				else if(order.getStatus().equalsIgnoreCase("cancelled"))
				{
					out.println("<b class='text-dark badge rounded-pill alert-danger'>" + order.getStatus() + "</b>");
				}
				out.println("</div>");
		out.println("</div>");
		
		out.println("<div class='products p-2'>");
			out.println("<table class='table'>");
				out.println("<thead>");
					out.println("<tr>");
						out.println("<td scope='col'>Product List</td>");
						out.println("<td scope='col'>Quantity</td>");
						out.println("<td scope='col'>Price</td>");
						out.println("<td scope='col' class='text-center'>Total</td>");
					out.println("</tr>");
				out.println("</thead>");
				out.println("<tbody>");
					for(CartItemsModel cartitemOfOrder : allCartItemsOfOrder)
					{
						ProductsModel productOfCartItem = new ProductsModel().getProduct(cartitemOfOrder.getProductid());
						out.println("<tr class='content'>");
							out.println("<td>" + productOfCartItem.getProductname() + "</td>");
							out.println("<td>" + cartitemOfOrder.getQuantity() + "</td>");
							out.println("<td>" + productOfCartItem.getPrice() + "</td>");
							out.println("<td class='text-center'>" + cartitemOfOrder.getTotal() + "</td>");
						out.println("</tr>");
					}	
				out.println("</tbody>");
			out.println("</table>");
		out.println("</div>");
		
		out.println("<div class='wrapper bg-white'>");
			out.println("<div class='pt-2 border-bottom mb-3'></div>");
			out.println("<div class='d-flex justify-content-start align-items-center pl-3'>");
				out.println("<div class='text-muted'>Payment Method :</div>");
				out.println("<div class='ml-auto' style='margin-left: auto !important;'>");
					out.println("<label style='margin-bottom: 0; padding: 0; font-weight: 900'>" + paymentOfOrder.getMode() + "</label>");
				out.println("</div>");
			out.println("</div>");
			out.println("<div class='pt-2 border-bottom mb-3'></div>");
			out.println("<div class='d-flex justify-content-start align-items-center pl-3'>");
				out.println("<div class='text-muted'>Total :</div>");
				out.println("<div class='ml-auto' style='margin-left: auto !important;'>");
					out.println("<label style='margin-bottom: 0; padding: 0; font-weight: 900'><span style='font-size: 18px;'>&#x20B9;</span>" + cartOfOrder.getSubtotal() + "</label>");
				out.println("</div>");
			out.println("</div>");
			out.println("<div class='pt-2 border-bottom mb-3'></div>");
			out.println("<div class='row border rounded p-1 my-3'>");
				out.println("<div class='col-md-6 py-3'>");
					out.println("<div class='d-flex flex-column align-items start'>");
						out.println("<b>Consumer Details</b>");
						out.println("<p class='text-justify pt-2'>" + consumerOfOrder.getFirstname() + " " + consumerOfOrder.getLastname() + "</p>");
						out.println("<p class='text-justify'>" + consumerOfOrder.getEmail() + "</p>");
						out.println("<p class='text-justify'>" + consumerOfOrder.getPhoneno() + "</p>");
					out.println("</div>");
				out.println("</div>");
				out.println("<div class='col-md-6 py-3'>");
					out.println("<div class='d-flex flex-column align-items start'>");
						out.println("<b>Staff Details</b>");
						out.println("<p class='text-justify pt-2'>" + staffOfOrder.getFirstname() + " " + staffOfOrder.getLastname() + "</p>");
						out.println("<p class='text-justify'>" + staffOfOrder.getEmail() + "</p>");
						out.println("<p class='text-justify'>" + staffOfOrder.getPhoneno() + "</p>");
					out.println("</div>");
				out.println("</div>");
			out.println("</div>");
		out.println("</div>"); 
	}
	if (request.getParameter("productid") != null)
	{
		ProductsModel product = new ProductsModel();
		product = product.getProduct(Integer.parseInt(request.getParameter("productid")));
		out.println("<div class='modal-header'>");
			out.println("<h3 class='modal-title' style='color: black; font-size: large;'> " + product.getProductname() + "</h3>");
			out.println("<button type='button' class='btn-close' data-bs-dismiss='modal'></button>");
		out.println("</div>");
		out.println("<div class='modal-body' style='display: flex;'>");
		
			out.println("<div id='custCarousel' class='carousel slide' data-ride='carousel' align='center' style='width: 400px;'>");
				out.println("<div class='carousel-inner' style='height: 100%;'>");
					out.println("<div class='carousel-item active' style='height: 100%;'>");
						out.println("<img src='..\\" + product.getImg1() + "' alt='Product Image' style='width: 100%;height: 100%;'>");
					out.println("</div>");
					out.println("<div class='carousel-item' style='height: 100%;'>");
						out.println("<img src='..\\" + product.getImg2() + "' alt='Product Image' style='width: 100%;height: 100%;'>");
					out.println("</div>");
					out.println("<div class='carousel-item' style='height: 100%;'>");
						out.println("<img src='..\\" + product.getImg3() + "' alt='Product Image' style='width: 100%;height: 100%;'>");
					out.println("</div>");
					out.println("<div class='carousel-item' style='height: 100%;'>");
						out.println("<img src='..\\" + product.getImg4() + "' alt='Product Image' style='width: 100%;height: 100%;'>");
					out.println("</div>");
				out.println("</div>");				
				out.println("<a class='carousel-control-prev' href='#custCarousel' data-slide='prev'> <span class='carousel-control-prev-icon' style='background-color: rgba(0,0,0,0.3);'></span> </a>");
				out.println("<a class='carousel-control-next' href='#custCarousel' data-slide='next'> <span class='carousel-control-next-icon' style='background-color: rgba(0,0,0,0.3);'></span> </a>");
			out.println("</div>");
			
			out.println("<div style='width: 400px'>");
				out.println("<div class='modal-title' style='color: black; margin-left: 7px;'>");
					/* out.println("<h2>"+product.getProductname()+"</h2>"); */
					out.println("<h4 class='text-primary h3' style='margin-top: 30px; color: red;'>Price : $" + product.getPrice() + "</h4>");
					out.println("<h3 style='margin-top: 50px'>Product Details</h3>");
					out.println("<ul class='features-list' style='font-size: 20px;'>");
						out.println("<li><b>Category Name : </b>" + (new CategoriesModel().getCategory(product.getCategoryid())).getCategoryname() + "</li>");
						out.println("<li><b>Subcategory Name : </b>" + (new SubCategoriesModel().getSubCategory(product.getSubcategoryid())).getSubcategoryname() + "</li>");
						out.println("<li><b>Brand Name : </b>" + (new BrandsModel().getBrand(product.getBrandid())).getBrandname() + "</li>");
						ArrayList<StockModel> allStockOfProduct = new StockModel().getAllStock(product.getProductid());
						if (!allStockOfProduct.isEmpty())
						{
							out.println("<li><b>Stock : </b>" + 23 + "</li>");
						}
						/* out.println("<li><b>Branch Name : </b>" + (new BranchesModel().getBranch(product.getBranchid())).getBranchname() + "</li>"); */
					out.println("</ul>");
					out.println("<h3 style='margin-top: 50px'>Description : </h3>");
					out.println("<p>" + product.getDescription() + "</p>");
				out.println("</div>");
			out.println("</div>");
			
	 	out.println("</div>");
	}
	if(request.getParameter("feedbackid") != null)
	{
		FeedbacksModel feedback = new FeedbacksModel().getFeedbackDetails(Integer.parseInt(request.getParameter("feedbackid")));
		ConsumersModel consumerOfFeedback = new ConsumersModel().getConsumer(feedback.getConsumerid());
		
			out.println("<form method='post' action='../FeedbackController'>");
				out.println("<div class='modal-header'>");
				  out.println("<h5 class='modal-title' id='exampleModalLabel'>Reply Feedback</h5>");
				  out.println("<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>");
				out.println("</div>");
				out.println("<div class='modal-body'>");
				  	out.println("<div class='row'>");
				  		out.println("<div class='col-md-2'>");
				  		if(consumerOfFeedback.getProfilepicture()==null)
				  		{
				  			out.println("<img src='../images/default.png' style='height:100%;width:100%;border-radius: 50%;'>");
				  		}
				  		else
				  		{
				  			out.println("<img src='..//" + consumerOfFeedback.getProfilepicture() + "' style='height:100%;width:100%;border-radius: 50%;'>");	
				  		}
						out.println("</div>");
						out.println("<div class='col-md-7'>");
							out.println("<p class='h3' style='margin-top: 4%;'>" + consumerOfFeedback.getFirstname() + " " + consumerOfFeedback.getLastname() + "</p>");
						out.println("</div>");
						out.println("<div class='col-md-3 text-right'>");
							out.println("<p style='margin-top: 18%;'>" + feedback.getDate() + "</p>");
						out.println("</div>");
					out.println("</div>");
					out.println("<div class='form-group text-center' style='margin-top: 10px;'>");
				  		out.println("<label class='col-form-label' style='font-size: 20px'>" + feedback.getSubject() + "</label>");
					out.println("</div>");
					out.println("<div class='form-group' style='margin-top: 15px;'>");
				  		out.println("<label class='col-form-label justify-content-center'>" + feedback.getMessage() + "</label>");
					out.println("</div>");
					out.println("<div class='form-group' style='margin-top: 20px;'>");
						out.println("<label for='message-text' class='col-form-label'>Reply</label>");
						if(feedback.getReply()!=null)
						{
							out.println("<textarea class='form-control' name='replyOfFeedback' id='message-text' style='min-height: 100px;border-width: 1px;border-color: black;' readonly='readonly'>" + feedback.getReply() + "</textarea>");
						}
						else
						{
							out.println("<textarea class='form-control' name='replyOfFeedback' id='message-text' placeholder='Type messsage here...' style='min-height: 100px;border-width: 1px;border-color: black;'></textarea>");
						}
					out.println("</div>");
				out.println("</div>");
				out.println("<div class='modal-footer'>");
					out.println("<input type='hidden' id='feedbackid' value='" + feedback.getFeedbackid() + "' name='feedbackid'>");
					out.println("<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>");
					out.println("<button type='submit' class='btn btn-primary' name='btn' value='Reply Feedback'>Reply Feedback</button>");
				out.println("</div>");
			out.println("</form>");
	}
%>

	</body>
	
</html>
