<%@page import="hybridstore.model.BrandsModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/address.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
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
							<li class="list-inline-item"><a href="dashboard.jsp">Dashboard</a></li>
							<li class="list-inline-item"><a href="order.jsp">Orders</a></li>
							<li class="list-inline-item"><a class="active" href="profile-cart.jsp">Cart</a></li>
							<li class="list-inline-item"><a href="profile-details.jsp">Profile Details</a></li>
						</ul>
						<div class="dashboard-wrapper user-dashboard">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Company</th>
											<th>Name</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>Sub Total</th>
										</tr>
									</thead>
									<tbody>
<%
	int cartid = new CartModel().getActiveCartidByConsumerid(consumer.getConsumerid());
	ArrayList<CartItemsModel> cartitems = new CartItemsModel().getAllCartItemsByCart(cartid);
	if(cartitems.isEmpty())
	{
%>
										<tr>
										<td colspan="5" class="text-center"> Your Cart is Empty</td>
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
											<td><%= (new BrandsModel().getBrand(product.getBrandid())).getBrandname() %></td>
											<td><%= product.getProductname() %></td>
											<td><%= product.getPrice() %></td>
											<td><%= cartitem.getQuantity() %></td>
											<td><%= cartitem.getTotal() %></td>
											
											<td>
											<form action="CartsController.do" method="post">
												<div class="btn-group" role="group">
												
													<a type="button" href="cart.jsp"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-pencil" aria-hidden="true"></i>
													</a>
															<input type="hidden" name ="caller" value="profile-cart">
															<input type="hidden" name ="productid" value="<%= product.getProductid()%>">
															<input type="hidden" name ="consumerid" value="<%= consumer.getConsumerid()%>">
													<button type="submit" name="btn" value="delete item" class="btn btn-sm btn-outline-primary">
														<i class="ti-close" aria-hidden="true"></i>
													</button>													
													
												</div>
												</form>
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

<!-- Mirrored from demo.themefisher.com/elite-shop/address.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
</html>