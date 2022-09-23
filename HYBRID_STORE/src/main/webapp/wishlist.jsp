<%@page import="hybridstore.model.WishlistsModel"%>
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
							<li class="list-inline-item"><a class="active" href="wishlist.jsp">WishList</a></li>
							<li class="list-inline-item"><a href="profile-details.jsp">Profile Details</a></li>
						</ul>
						<div class="dashboard-wrapper user-dashboard">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th></th>
											<th>Company</th>
											<th>Name</th>
											<th>Price</th>
											
										</tr>
									</thead>
									<tbody>
<%
	ArrayList<WishlistsModel> wishlistitems = new WishlistsModel().getAllProductsLikedByConsumer(consumer.getConsumerid());
	if(wishlistitems.isEmpty())
	{
%>
										<tr>
										<td colspan="4" class="text-center">Your Wishlist is empty</td>
										</tr>
<%
	}
	else
	{
		for(WishlistsModel wishitem : wishlistitems)
		{
			ProductsModel product = new ProductsModel().getProduct(wishitem.getProductid());
%>
										<tr>
											<td>
												<form action="WishlistsController.do" method="post"> 
												<input type="hidden" name ="productid" value="<%= product.getProductid()%>">
												<input type="hidden" name ="caller" value="wishlist">
												<input type="hidden" name ="consumerid" value="<%= consumer.getConsumerid()%>">
												<button style="border: 0px; background-color: white;" class="product-remove" name="btn" value="delete item">&times;</button>
												</form>
											</td>
											<td><%= (new BrandsModel().getBrand(product.getBrandid())).getBrandname() %></td>
											<td><a href="product-single.jsp?productid=<%= product.getProductid() %>"><%= product.getProductname() %></a></td>
											<td><%= product.getPrice() %></td>
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