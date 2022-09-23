<%@page import="hybridstore.util.DateTimeFormat"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/track.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>
	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>
<%
	int orderid = Integer.parseInt(request.getParameter("orderid"));
	OrdersModel order = new OrdersModel().getOrderInformation(orderid);
%>
	<input type="hidden" name="status" id="orderStatus" value="<%= order.getStatus() %>">
	<!-- main wrapper -->
	<div class="main-wrapper">

		<!-- breadcrumb -->
		<nav class="bg-gray py-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Order
						Track</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<!-- track -->
		<section class="section">
			<div class="container">
				<div class="row bg-dark">
					<div class="col-lg-12 text-center">
						<div class="p-4">
							<h5 class="text-white">TRACKING ORDER</h5>
						</div>
					</div>
				</div>
				<div class="row bg-gray px-3 py-5">
					<div class="col-md-4 text-center">
						<!-- <p>
							<strong>Shipped Via: </strong>Standard Delevery
						</p> -->
						<p>
							<strong>Ordered Datetime : </strong> <%= new DateTimeFormat().getDateTimeInFormat(order.getDatetime(), "MMM dd, yyyy hh:mm") %>
						</p>
					</div>
					<div class="col-md-4 text-center">
						<p>
							<strong>Status : </strong><%= order.getStatus() %>
						</p>
					</div>
					<div class="col-md-4 text-center">
						<p>
							<strong>Expected Date : </strong> <%= order.getDatetime().substring(0, 10) %>
						</p>
					</div>
					<div class="d-flex justify-content-between w-50 mt-5 flex-column flex-sm-row" style="margin: 0 25%;">
						<div
							class="border mx-1 mb-2 p-2 p-md-4 text-center" id="confirmedOrder">
							<i class="ti-bag icon-md mb-3 d-inline-block"></i>
							<h5>Confirmed Order</h5>
						</div>
						<!-- <div
							class="border mx-1 mb-2 border-primary p-2 p-md-4 text-center">
							<i class="ti-settings icon-md mb-3 d-inline-block"></i>
							<h5>Processing Order</h5>
						</div>
						<div class="border mx-1 mb-2 p-2 p-md-4 text-center">
							<i class="ti-crown icon-md mb-3 d-inline-block"></i>
							<h5>Quality Check</h5>
						</div> -->
						<div class="border mx-1 mb-2 p-2 p-md-4 text-center" id="packedOrder">
							<i class="ti-package icon-md mb-3 d-inline-block"></i>
							<h5>Order Packed</h5>
						</div>
						<div class="border mx-1 mb-2 p-2 p-md-4 text-center" id="completedOrder">
							<i class="ti-home icon-md mb-3 d-inline-block"></i>
							<h5>Order Completed</h5>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /track -->

		<%@ include file="footer.jsp"%>

	</div>
	<!-- /main wrapper -->

	<!-- jQuery -->
	<script src="plugins/jQuery/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			var status = document.getElementById("orderStatus").value;
			console.log(status);
			if(status.includes("confirmed"))
			{
				$("#confirmedOrder").addClass("border-primary");
			}
			else if(status.includes("packed"))
			{
				$("#confirmedOrder").addClass("border-primary");
				$("#packedOrder").addClass("border-primary");
			}
			else if(status.includes("completed"))
			{
				$("#confirmedOrder").addClass("border-primary");
				$("#packedOrder").addClass("border-primary");
				$("#completedOrder").addClass("border-primary");
			}
		});
	</script>
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

<!-- Mirrored from demo.themefisher.com/elite-shop/track.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
</html>