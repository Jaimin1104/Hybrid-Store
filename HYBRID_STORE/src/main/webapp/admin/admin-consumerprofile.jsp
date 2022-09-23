<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="hybridstore.dao.admin.ConsumersDao"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function() {
				$("#admin-consumers").addClass("active");
			});
		</script>
	</head>

	<body>
<%
	int consumerid = Integer.valueOf(request.getParameter("id"));
	ConsumersModel consumer = new ConsumersDao().getConsumerInformation(consumerid);
%>
		<%@ include file="admin-aside-bar.jsp"%>
	
		<main class="main-wrap">
	
			<header class="main-header navbar">
                <div class="col-search">
                    <form class="searchform">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search here..." id="searchInAdmin">
                            <button class="btn btn-light bg" type="button" id="searchBtn" onclick="searchAdmin()"> 
                                <i class="material-icons md-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-nav">
                    <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside">
                        <i class="md-28 material-icons md-menu"></i>
                    </button>
                    <ul class="nav">
                        <li class="nav-item" style="margin-right: 7px;">
                            <a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> 
                                <i class="material-icons md-nights_stay"></i>
                            </a>
                        </li>
                        <li class="nav-item" style="margin-right: 7px;">
                            <a class="nav-link" href="admin-profile.jsp">
<%
	AdminModel admin = (AdminModel) (session.getAttribute("admin"));
	if(admin.getProfilepicture()==null || admin.getProfilepicture().equalsIgnoreCase("(null)"))
	{
%>
                            	<img class="img-xs rounded-circle" src="../images/default.png" alt="User">
<%
	}
	else
	{
%>
								<img class="img-xs rounded-circle" src="../<%= admin.getProfilepicture() %>" alt="User">
<%
	}
%>
                            </a>
                        </li>
                        <li class="w-25">
							<a href="../LoginController?action=logout" class="btn btn-outline-primary">Logout</a>
						</li>
                    </ul>
                </div>
            </header>
	
			<div class="card-body">
				<div style="display: flex; height: 100%, width:100%">
					<div style="height: 100%; width: 30%; margin: 5px; display: block; border-radius: 5%;">
						<!-- <div style="margin: 50px; height: 100%; width: 100%;"> -->
						<%-- src="<%= consumer.getProfilepicture() %>" --%>
						<!-- <img src="images/people/avatar2.jpg" height="100%"
							width="100%" style="padding: 18%; border-radius: 50%;"> -->	
<%
	if(consumer.getProfilepicture()==null)
	{
%>
						<img src="../images/default.png" height="100%" width="100%" style="padding: 18%; border-radius: 50%;">
<%
	}
	else
	{
%>
						<img src="../<%= consumer.getProfilepicture() %>" height="100%" width="100%" style="padding: 18%; border-radius: 50%;">
<%
	}
%>
						<!-- </div> -->
					</div>
					<div style="height: 100%; width: 70%; margin: 5px; border-radius: 5%;">
						<div style="height: 100%; width: 90%; border-radius: 5%;">
							<!-- <div style="color: white; padding-top: 5px;" align="center"> -->
							<div class="row mt-3">
								<div class="col-md-6">
									<label class="labels">User Name</label>
									<input type="text" class="form-control" value="<%= consumer.getUsername() %>" disabled="disabled">
								</div>
								<div class="col-md-6">
									<label class="labels">Name</label>
									<input type="text" class="form-control" value="<%= consumer.getFirstname() + " " + consumer.getLastname() %>" disabled="disabled">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-6">
									<label class="labels">Mobile Number</label>
									<input type="text" class="form-control" value="<%= consumer.getPhoneno() %>" disabled="disabled">
								</div>
								<div class="col-md-6">
									<label class="labels">Email</label>
									<input type="text" class="form-control" value="<%= consumer.getEmail() %>" disabled="disabled">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">Address</label>
									<textarea class="form-control" rows="3" disabled="disabled"><%= consumer.getAddress() %></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin-top: 30px; padding: 15px; width: 95%; height: auto;">
					<div>
						<div style="color: black;">
							<h4 style="align-content: center; text-align: center">Orders</h4>
						</div>
						<div class="table-responsive" style="overflow: auto; overflow-x: hidden; max-height: 200px;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Order ID</th>
										<th>Staff</th>
										<th>Status</th>
										<th>Date</th>
										<th class="text-end">Total</th>
									</tr>
								</thead>
								<tbody>
<%
	ArrayList<OrdersModel> orders = new OrdersModel().getOrdersByConsumer(consumer.getConsumerid());
	if (orders.isEmpty())
	{
%>
									<tr>
										<td colspan="6" class="text-center">No Orders Found</td>
									</tr>
<%
	}
	else
	{
		for(OrdersModel order:orders)
		{	
			StaffModel staff = new StaffModel().getOrderStaff(order.getOrderid());
%>
									<tr>
										<td><b><%=order.getOrderid() %></b></td>
										<td><%=staff.getFirstname() + " " + staff.getLastname() %></td>
										<!-- <td>
											<div class="icontext">
												<img width="36" class="icon border" src="images/card-brands/1.png">
												<span class="text text-muted">Amex</span>
											</div> -->
										<td>
<%
		if(order.getStatus().equalsIgnoreCase("confirmed"))
		{
%>
											<span class="badge rounded-pill alert-primary"><%= order.getStatus() %></span>
<%
		}
		else if(order.getStatus().equalsIgnoreCase("packed"))
		{
%>
											<span class="badge rounded-pill alert-info"><%= order.getStatus() %></span>
<%
		}
		else if(order.getStatus().equalsIgnoreCase("completed"))
		{
%>
											<span class="badge rounded-pill alert-success"><%= order.getStatus() %></span>
<%
		}
		else if(order.getStatus().equalsIgnoreCase("cancelled"))
		{
%>
											<span class="badge rounded-pill alert-danger"><%= order.getStatus() %></span>
<%
		}
%>
										</td>
										<td><%=order.getDatetime() %></td>
										<td class="text-end">
											<!-- <a href="#" class="btn btn-sm btn-light">Details</a> -->
											<%= order.getTotal() %>
										</td>
									</tr>
<%
		}
	}
%>
								</tbody>
							</table>
						</div>
					</div>
					<div>
						<div style="color: black;">
							<h4 style="align-content: center; text-align: center">Payments</h4>
						</div>
						<div class="table-responsive" style="overflow: auto; overflow-x: hidden; max-height: 200px;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Transaction ID</th>
										<th>Order ID</th>
										<th>Paid</th>
										<th>Mode</th>
										<th>Staff name</th>
										<th class="text-end">Datetime</th>
									</tr>
								</thead>
								<tbody>
<%
	ArrayList<PaymentsModel> payments = new PaymentsModel().getPaymentInformation(consumer.getConsumerid());
	if(payments.isEmpty())
	{
%>
										<tr>
											<td colspan="6" class="text-center">No Payments Found</td>
										</tr>
<%
	}
	else
	{
		for(PaymentsModel payment:payments)
		{
%>
									<tr>
										<td><b><%=payment.getPaymentid() %></b></td>
										<td><b><%=payment.getOrderid() %></b></td>
										<td><%=payment.getAmount() %></td>
										<!-- <td>
											<div class="icontext">
												<img width="36" class="icon border" src="images/card-brands/1.png">
												<span class="text text-muted">Amex</span>
											</div>
										</td> -->
<%
			if (payment.getMode().equalsIgnoreCase("Online"))
			{
%>
										<td>
											<span class="badge rounded-pill alert-dark"><%=payment.getMode()%></span>
										</td>
										<td><b>-</b></td>
<%
			}
			if (payment.getMode().equalsIgnoreCase("Offline"))
			{
%>
										<td>
											<span class="badge rounded-pill alert-secondary"><%=payment.getMode()%></span>
										</td>
										<td>Mihir Patel</td>
<%
			}
%>
										<td class="text-end"><%=payment.getDatetime() %></td>
									</tr>
<%
		}
	}
%>
								</tbody>
							</table>
						</div>
						<!-- </div> -->
					</div>
				</div>
			</div>
		</main>
	
		<script type="text/javascript">
			if (localStorage.getItem("darkmode")) {
				var body_el = document.body;
				body_el.className += "dark";
			}
			
			var searchInAdmin = document.getElementById("searchInAdmin");
			// Execute a function when the user releases a key on the keyboard
			searchInAdmin.addEventListener("keypress", function(event) {
			  // Number 13 is the "Enter" key on the keyboard
			  if (event.keyCode === 13) {
			    // Cancel the default action, if needed
			    event.preventDefault();
			    // Trigger the button element with a click
			    document.getElementById("searchBtn").click();
			  }
			});
		</script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>
		
	</body>

</html>