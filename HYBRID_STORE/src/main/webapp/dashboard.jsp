<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/dashboard.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:58 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>
	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>
	<!-- main wrapper -->
	<div class="main-wrapper">

		<!-- breadcrumb -->
		<nav class="bg-gray py-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">My
						Accounts</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<section class="user-dashboard section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="list-inline dashboard-menu text-center">
							<li class="list-inline-item"><a class="active"
								href="dashboard.jsp">Dashboard</a></li>
							<li class="list-inline-item"><a href="order.jsp">Orders</a></li>
							<li class="list-inline-item"><a href="wishlist.jsp">WishList</a></li>
							<li class="list-inline-item"><a href="profile-details.jsp">Profile
									Details</a></li>
						</ul>
						<div class="dashboard-wrapper user-dashboard">
							<div class="media">
								<div class="pull-left mr-3">
<%
	if(consumer.getProfilepicture()==null)
	{
%>
									<img class="media-object user-img" style="height: 120px;width: 120px;" src="images/default.png"
										alt="Image">
<%
	}
	else
	{
%>
									<img class="media-object user-img" style="height: 120px;width: 120px;" src="<%= consumer.getProfilepicture() %>"
										alt="Image">
<% 
	}
%>
								</div>
								<div class="media-body align-self-center">
									<h2 class="media-heading">Welcome <%= consumer.getFirstname() %> <%= consumer.getLastname() %></h2>
									<p class="mb-0">Lorem ipsum dolor sit amet, consectetur
										adipisicing elit. Unde, iure, est. Sit mollitia est maxime!
										Eos cupiditate tempore, tempora omnis. Lorem ipsum dolor sit
										amet, consectetur adipisicing elit. Enim, nihil.</p>
								</div>
							</div>
							<div class="total-order mt-4">
								<h4>Total Orders</h4>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Order ID</th>
												<th>Date</th>
												<th>Items</th>
												<th>Total Price</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody>
<%
	ArrayList<OrdersModel> orders = new OrdersModel().getOrdersByConsumer(consumer.getConsumerid());
	if(orders.isEmpty())
	{
%>
											<tr>
												<td colspan="4" class="text-center">You hadn't done any orders</td>
											</tr>
<%
	}
	else
	{
		for(OrdersModel order : orders)
		{
			if(order.getStatus().equalsIgnoreCase("confirmed"))
			{
				if((new PaymentsModel().getOrderPaymentMode(order.getOrderid())).getMode()==null)
				{
				
%>
											<tr>
												<td><a href="#">#<%= order.getOrderid() %></a></td>
												<td><%= order.getDatetime() %></td>
												<td><%= order.getTotalItems(order.getOrderid()) %></td>
												<td><%= order.getTotal() %></td>
												<td class="text-center">
													<a href="OrderController.do?btn=updateStatus&status=cancelled&orderid=<%=order.getOrderid() %>" class="btn btn-outline-danger badge rounded-pill alert-danger" style="padding : 10px;">Cancel Order</a>
												</td>
											</tr>
<%
				}
			}
		}
	}
%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>



		<%@ include file="footer.jsp"%>

	</div>
	<!-- /main wrapper -->

	<!-- jQuery -->
	<script src="plugins/jQuery/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/venobox/venobox.min.js"></script>
	<script src="plugins/aos/aos.js"></script>
	<script src="plugins/syotimer/jquery.syotimer.js"></script>
	<script src="plugins/instafeed/instafeed.min.js"></script>
	<script src="plugins/zoom-master/jquery.zoom.min.js"></script>
	<script
		src="plugins/bootstrap-touchspin-master/jquery.bootstrap-touchspin.min.js"></script>
	<script src="plugins/nice-select/jquery.nice-select.min.js"></script>
	<script src="plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
	<!-- google map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&amp;libraries=places"></script>
	<script src="plugins/google-map/gmap.js"></script>
	<!-- Main Script -->
	<script src="js/script.js"></script>
</body>

<!-- Mirrored from demo.themefisher.com/elite-shop/dashboard.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:58 GMT -->
</html>