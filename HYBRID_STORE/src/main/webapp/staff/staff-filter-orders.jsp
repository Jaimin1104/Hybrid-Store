<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String caller = request.getParameter("caller");
	StaffModel staff = (StaffModel)session.getAttribute("staff");
	if(caller.equalsIgnoreCase("orders"))
	{
		String query = "select * from orders";
		if((request.getParameter("search")).length()>0)
		{
			query = query +  " where staffid=" + staff.getStaffid() + " and orderid like '%" + request.getParameter("search") + "%'";
		}
		else
		{
			query = query +  " where staffid=" + staff.getStaffid() + " and orderid like '%'";
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
			int maximumRecordsPerPage = Integer.parseInt(request.getParameter("maximumRecordsPerPage"));
			if (orderslist.isEmpty())
			{
				out.println("<tr>");
					out.println("<td colspan='7' class='text-center'>No Orders Found</td>");
				out.println("</tr>");
			}
			else
			{
				for (int i=(pagenumber-1)*maximumRecordsPerPage;i<(pagenumber*maximumRecordsPerPage);i++) 
				{
					if(i==orderslist.size())
					{
						break;
					}
					OrdersModel order = orderslist.get(i);
					//StaffModel staff = new StaffModel().getOrderStaff(order.getOrderid());
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
							out.println("<td class='text-end'>");
								out.println("<a class='btn btn-light' href='staff-order-details.jsp?orderid=" + order.getOrderid() + "'>Detail</a>");
							out.println("</td>");
						out.println("</tr>");
				}
			}
		}
	}
%>
</body>
</html>