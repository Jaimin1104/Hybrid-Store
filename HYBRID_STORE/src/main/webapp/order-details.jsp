<%@page import="hybridstore.util.DateTimeFormat"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.dao.consumer.CartItemsDao"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/order.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
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
<%
	OrdersModel order = new OrdersModel().getOrderInformation(Integer.parseInt(request.getParameter("orderid")));
%>
		<section class="user-dashboard section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="list-inline dashboard-menu text-center">
							<li class="list-inline-item"><a href="dashboard.jsp">Dashboard</a></li>
							<li class="list-inline-item"><a class="active"
								href="order.jsp">Orders</a></li>
							<li class="list-inline-item"><a href="wishlist.jsp">WishList</a></li>
							<li class="list-inline-item"><a href="profile-details.jsp">Profile
									Details</a></li>
						</ul>
						<div class="dashboard-wrapper user-dashboard">
							<div>
								<div class="row">
									<div class="col-6">
										<span>
											Order Id : <%= order.getOrderid() %>
										</span>
									</div>
									<div class="col-6">
										<p class="text-right">
											Date : <%= new DateTimeFormat().getDateTimeInFormat(order.getDatetime(), "MMM dd, yyyy hh:mm") %>
										</p>
									</div>
									
								</div>
<%
	PaymentsModel payment = new PaymentsModel().getOrderPaymentMode(order.getOrderid());
%>
								<div class="row">
									<div class="col-6">
										<span>
<%
	if(payment.getMode() != null)
	{
%>
												Payment Mode : <%= payment.getMode() %>
<%	
	}
	else
	{
%>
												Payment Mode : Offline
<%
	}
%>
											
										</span>
									</div>
									
									<div class="col-6">
										<p class="text-right">
<%
	if(payment.getMode() != null)
	{
%>
												Payment Status : Done
<%	
	}
	else
	{
%>
												Payment Status : Pending
<%
	}
%>
											
										</p>
									</div>
								</div>
								
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th></th>
											<th>Name</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>total</th>
										</tr>
									</thead>
									<tbody>
<%
	ArrayList<CartItemsModel> cartitems = new CartItemsModel().getAllCartItemsByCart(order.getCartid());
	if(cartitems.isEmpty())
	{
%>
										<tr>
											<td colspan="6" class="text-center">You hadn't ordered anything</td>
										</tr>
<%
	}
	else
	{
		for(CartItemsModel cartitem : cartitems)
		{
			ProductsModel product = new ProductsModel().getProduct(cartitem.getProductid());
%>
										<tr>
										<td>
											<div class="product-info" style="width: 100px; height: 100px;">
																<img class="img-fluid img-sm img-thumbnail" style="width: 100%; height: 100%;" src="<%= product.getImg1() %>" alt="product-img"> 
											</div></td>
											<td><a href="#"><%= product.getProductname() %></a></td>
											<td><%= product.getPrice() %></td>
											<td><%= cartitem.getQuantity() %></td>
											<td><%= cartitem.getTotal() %></td>
<%
		}
	}
%> 								
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-12">
									<p class="text-right h4 font-weight-bold">
										Grand Total : &#8377;<%= order.getTotal() %>
									</p>
								</div>
							</div>
<%
	if(!order.getStatus().equalsIgnoreCase("cancelled"))
	{
%>
								<div>
									<a class="btn btn-outline-primary" href="track.jsp?orderid=<%= order.getOrderid() %>">Track Order</a>
								</div>
<%	
	}
%>
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

<!-- Mirrored from demo.themefisher.com/elite-shop/order.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
</html>