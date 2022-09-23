<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	
	</head>
	<body>
<%
	String caller = request.getParameter("caller");
	if(caller.equalsIgnoreCase("products"))
	{
		String query = "select * from products";
		if((request.getParameter("search")).length()>0)
		{
			query = query +  " where productname like '" + request.getParameter("search") + "%'";
		}
		else
		{
			query = query +  " where productname like '%'";
		}
		if(!request.getParameter("status").equalsIgnoreCase("all"))
		{
			query = query +  " and status = '" + request.getParameter("status") + "'";
		}
		if(request.getParameter("date").length()>0)
		{
			query = query +  " and date = '" + request.getParameter("date") + "'";
		}
		ArrayList<ProductsModel> productlist = new ProductsModel().getAllProducts(query);
		if(request.getParameter("action")!=null)
		{
			out.println(productlist.size());
		}
		else
		{
			int pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
			if (productlist.isEmpty())
			{
				out.println("<article class='itemlist'>");
					out.println("<div class='row align-items-center'>");	
						out.println("<p class='text-center'>No Products Found</p>");
					out.println("</div>");
				out.println("</article>");
			}
			else
			{ 
				for (int i=(pagenumber-1)*10;i<(pagenumber*10);i++) 
				{
					if(i==productlist.size())
					{
						break;
					}
					ProductsModel product = productlist.get(i);
					out.println("<article class='itemlist' style='padding: 10px 10px 15px 10px;'>");
						out.println("<div class='row align-items-center'>");
							out.println("<div class='col-lg-4 col-sm-4 col-8 flex-grow-1 col-name'>");
								out.println("<a class='itemside' href='#' onclick='viewProduct(" + product.getProductid() + ")'>");
									out.println("<div class='left'>");
										out.println("<img src='..\\" + product.getImg1() + "' class='img-sm img-thumbnail' alt='Item'>");
									out.println("</div>");
									out.println("<div class='info'>");
										out.println("<h6 class='mb-0'>" + product.getProductname() + "</h6>");
									out.println("</div>");
								out.println("</a>");
							out.println("</div>");
							out.println("<div class='col-lg-2 col-sm-2 col-4 col-price'>");
								out.println("<span>" + product.getPrice() + "</span>");
							out.println("</div>");
							out.println("<div class='col-lg-2 col-sm-2 col-4 col-status'>");
					if ((product.getStatus()).equalsIgnoreCase("active"))
					{
								out.println("<span class='badge rounded-pill alert-success'>" + product.getStatus() + "</span>");
					}
					else if ((product.getStatus()).equalsIgnoreCase("deactive"))
					{
								out.println("<span class='badge rounded-pill alert-danger'>" + product.getStatus() + "</span>");
					}
							out.println("</div>");
							out.println("<div class='col-lg-2 col-sm-2 col-4 col-date'>");
								out.println("<span>" + product.getDate() + "</span>");
							out.println("</div>");
							out.println("<div class='col-lg-1 col-sm-2 col-4 col-action'>");
								out.println("<div class='dropdown float-end'>");
									out.println("<a href='#' data-bs-toggle='dropdown' class='btn btn-light'>");
										out.println("<i class='material-icons md-more_horiz'></i>");
									out.println("</a>");
									out.println("<div class='dropdown-menu'>");
										out.println("<button onclick='viewProduct(" + product.getProductid() + ")' class='dropdown-item'>View detail</button>");
										out.println("<form action='../ProductsController' method='get'>");
											out.println("<input type='hidden' name='productid' value='" + product.getProductid() + "'>");
											out.println("<button type='submit' name='btn' value='edit product' class='dropdown-item'>Edit info</button>"); 
					if((product.getStatus()).equalsIgnoreCase("active"))
					{
											out.println("<button type='submit' name='btn' value='product stock' class='dropdown-item'>Change Stock</button>");
					}
					else
					{
											out.println("<button type='submit' name='btn' value='product stock' class='dropdown-item'>Add Stock</button>");
					}
										out.println("</form>");
										out.println("<button onclick='deleteProduct(" + product.getProductid() + ")' class='dropdown-item text-danger'>Delete</button>");
									out.println("</div>");
								out.println("</div>");
								out.println("<!-- dropdown // -->");
							out.println("</div>");
						out.println("</div>");
						out.println("<!-- row .// -->");
					out.println("</article>");
					out.println("<!-- itemlist  .// -->");
				}
			}
		}
	}
	else if(caller.equalsIgnoreCase("orders"))
	{
		String query = "select * from orders";
		if((request.getParameter("search")).length()>0)
		{
			query = query +  " where cartid in (select cartid from carts where consumerid in (select consumerid from consumers where username like '" + request.getParameter("search") + "%'))";
		}
		else
		{
			query = query +  " where cartid in (select cartid from carts where consumerid in (select consumerid from consumers where username like '%'))";
		}
		if(!request.getParameter("status").equalsIgnoreCase("all"))
		{
			query = query +  " and status = '" + request.getParameter("status") + "'";
		}
		if(request.getParameter("date").length()>0)
		{
			StringBuffer date = new StringBuffer(request.getParameter("date"));
			date.deleteCharAt(2);
			date.insert(2, '-');
			date.deleteCharAt(5);
			date.insert(5, '-');
			query = query +  " and datetime like '" + date.toString() + "%'";
		}
		System.out.println("Query is : " + query);
		ArrayList<OrdersModel> orderslist = new OrdersModel().getAllOrders(query);
		if(request.getParameter("action")!=null)
		{
			out.println(orderslist.size());
		}
		else
		{
			int pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
			if (orderslist.isEmpty())
			{
				out.println("<tr>");
					out.println("<td colspan='6' class='text-center'>No Orders Found</td>");
				out.println("</tr>");
			}
			else
			{
				for (int i=(pagenumber-1)*10;i<(pagenumber*10);i++) 
				{
					if(i==orderslist.size())
					{
						break;
					}
					OrdersModel order = orderslist.get(i);
					StaffModel staff = new StaffModel().getOrderStaff(order.getOrderid());
					ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
					
						out.println("<tr>");
							out.println("<td>" + order.getOrderid() + "</td>");
							out.println("<td><b>" + consumer.getFirstname() + " " + consumer.getLastname() + "</b></td>");
							out.println("<td>" + consumer.getEmail() + "</td>");
							out.println("<td>" + order.getTotal() + "</td>");
							out.println("<td>");
					if(order.getStatus().equalsIgnoreCase("confirmed"))
					{
								out.println("<span class='badge rounded-pill alert-primary'>" + order.getStatus() + "</span>");
					}
					else if(order.getStatus().equalsIgnoreCase("packed"))
					{
								out.println("<span class='badge rounded-pill alert-info'>" + order.getStatus() + "</span>");
					}
					else if(order.getStatus().equalsIgnoreCase("completed"))
					{
								out.println("<span class='badge rounded-pill alert-success'>" + order.getStatus() + "</span>");
					}
					else if(order.getStatus().equalsIgnoreCase("cancelled"))
					{
								out.println("<span class='badge rounded-pill alert-danger'>" + order.getStatus() + "</span>");
					}
							out.println("</td>");
							out.println("<td>" + order.getDatetime() + "</td>");
							out.println("<td class='text-center'><b>" + staff.getFirstname() + " " + staff.getLastname() + "</b></td>");
							out.println("<td class='text-end'>");
								out.println("<a class='btn btn-light' onclick='viewOrder(" + order.getOrderid() + ")'>Detail</a>");
							out.println("</td>");
						out.println("</tr>");
				}
			}
		}
	}
	else if(caller.equalsIgnoreCase("consumers"))
	{
		int pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
		ArrayList<ConsumersModel> consumerslist = new ConsumersModel().getAllConsumers();
		if(consumerslist.isEmpty())
		{
			out.println("<article class='itemlist' name='consumers'>");
				out.println("<div class='row align-items-center'>");	
					out.println("<p class='text-center'>No Consumers Found</p>");
				out.println("</div>");
			out.println("</article>");	
		}
		else
		{
			for (int i=(pagenumber-1)*10;i<(pagenumber*10);i++) 
			{
				if(i==consumerslist.size())
				{
					break;
				}
				ConsumersModel consumer = consumerslist.get(i);
					out.println("<article class='itemlist' name='consumers'>");
						out.println("<div class='row align-items-center'>");
							out.println("<div class='col col-check flex-grow-0'>");
								out.println("<div class='form-check'>");
									out.println("<input class='form-check-input' type='checkbox' class='oneCheck' onchange='removeConsumers(" + consumer.getConsumerid() + ")'>");
		                        out.println("</div>");
		                    out.println("</div>");
		                    out.println("<div class='col-lg-2 col-sm-2 col-2 flex-grow-1 col-name'>");
		                    	out.println("<a class='itemside' href='#'>");
		                    		out.println("<div class='left'>");
		        if(consumer.getProfilepicture()==null)
				{
		                    			out.println("<img src='..\\images\\default.png' class='img-sm img-thumbnail'>");
		        }
		        else
		        {
		                    			out.println("<img src='..\\" + consumer.getProfilepicture() + "' class='img-sm img-thumbnail'>");
				}
									out.println("</div>");
		                           	out.println("<div class='info'>");
		                           		out.println("<h6 class='mb-0'>" + consumer.getUsername() + "</h6>");
		                           	out.println("</div>");
		                        out.println("</a>");
		                    out.println("</div>");
		                    out.println("<div class='col-lg-2 col-sm-2 col-4 col-price'>");
		                        out.println("<span>" + consumer.getFirstname() + " " + consumer.getLastname() + "</span>");
		                    out.println("</div>");
		                    out.println("<div class='col-lg-2 col-sm-2 col-4 col-status'>");
		                        out.println("<span>" + consumer.getEmail() + "</span>");
		                    out.println("</div>");
		                    out.println("<div class='col-lg-2 col-sm-2 col-4 col-date'>");
		                        out.println("<span>" + consumer.getPhoneno() + "</span>");
		                    out.println("</div>");
		                    out.println("<div class='col-lg-1 col-sm-2 col-4 col-action'>");
		                    	out.println("<div class='dropdown float-end'>");
		                    		out.println("<a href='#' data-bs-toggle='dropdown' class='btn btn-light'>");
		                    			out.println("<i class='material-icons md-more_horiz'></i>");
		                           	out.println("</a>");
		                           	out.println("<div class='dropdown-menu'>");
		                           		out.println("<input type='hidden' name='consumerid' value='" + consumer.getConsumerid() + "'>");
		                               	out.println("<a class='dropdown-item' href='admin-consumerprofile.jsp?id=" + consumer.getConsumerid() + "'>View Details</a>");
		                                out.println("<button type='submit' onclick='deleteConsumer(" + consumer.getConsumerid() + ")' class='dropdown-item text-danger' data-bs-toggle='modal' data-bs-target='#confirmDelete'>Delete</button>");
		                            out.println("</div>");
		                        out.println("</div>");
		                        out.println("<!-- dropdown // -->");
		                    out.println("</div>");
		            	out.println("</div>");
		                out.println("<!-- row .// -->");
		            out.println("</article>");
		            out.println("<!-- itemlist  .// -->");
			}
		}
	}
	else if(caller.equalsIgnoreCase("transactions"))
	{
		String query = "select * from payments";
		if((request.getParameter("search")).length()>0)
		{
			query = query +  " where orderid in (select orderid from orders where cartid in (select cartid from carts where consumerid in (select consumerid from consumers where username like '" + request.getParameter("search") + "%')))";
		}
		else
		{
			query = query +  " where orderid in (select orderid from orders where cartid in (select cartid from carts where consumerid in (select consumerid from consumers where username like '%')))";
		}
		if(!request.getParameter("mode").equalsIgnoreCase("all"))
		{
			query = query +  " and mode = '" + request.getParameter("mode") + "'";
		}
		if(request.getParameter("date").length()>0)
		{
			StringBuffer date = new StringBuffer(request.getParameter("date"));
			date.deleteCharAt(2);
			date.insert(2, '-');
			date.deleteCharAt(5);
			date.insert(5, '-');
			query = query +  " and datetime like '" + date.toString() + "%'";
		}
		ArrayList<PaymentsModel> paymentslist = new PaymentsModel().getAllPayments(query);
		if(request.getParameter("action")!=null)
		{
			out.println(paymentslist.size());
		}
		else
		{
			int pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
			if (paymentslist.isEmpty())
			{
				out.println("<tr>");
					out.println("<td colspan='6' class='text-center'>No Payments Found</td>");
				out.println("</tr>");
			}
			else
			{
				for (int i=(pagenumber-1)*15;i<(pagenumber*15);i++) 
				{
					if(i==paymentslist.size())
					{
						break;
					}
					PaymentsModel payment = paymentslist.get(i);
					ConsumersModel consumer = new ConsumersModel().getPaymentConsumer(payment.getPaymentid());
					
						out.println("<tr>");
							out.println("<td><b>" + payment.getPaymentid() + "</b></td>");
							out.println("<td><b>" + payment.getOrderid() + "</b></td>");
							out.println("<td><b>" + consumer.getFirstname() + " " + consumer.getLastname() + "</b></td>");
							out.println("<td>" + payment.getAmount() + "</td>");
							
					if (payment.getMode().equalsIgnoreCase("Online"))
					{
							out.println("<td>");
								out.println("<span class='badge rounded-pill alert-dark'>" + payment.getMode() + "</span>");
							out.println("</td>");
					}
					if (payment.getMode().equalsIgnoreCase("Offline"))
					{
							out.println("<td>");
								out.println("<span class='badge rounded-pill alert-secondary'>" + payment.getMode() + "</span>");
							out.println("</td>");
					}
							out.println("<td>" + payment.getDatetime() + "</td>");
						out.println("</tr>");
				}
			}
		}
	}
%>
	</body>
</html>