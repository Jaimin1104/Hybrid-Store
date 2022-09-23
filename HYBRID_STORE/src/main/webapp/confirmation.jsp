<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/confirmation.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>
	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>

	<!-- main wrapper -->
	<div class="main-wrapper">

		<!-- Page Wrapper -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 mx-auto">
						<div class="block text-center">
							<h3 class="text-center mb-3">Thank you! For your payment</h3>
							<p class="text-color">
								Your order has been placed and will be processed as soon as
								possible. Make sure you make note of your order number, which is
								<span class="text-primary"><%= Integer.parseInt(request.getParameter("orderid")) %></span> You will be
								receiving an email shortly with confirmation of your order. You
								can now:
							</p>
							<a href="shop.jsp" class="btn btn-primary mt-3 mx-2">Go To
								Shopping</a> <a href="track.jsp?orderid=<%= Integer.parseInt(request.getParameter("orderid"))%>" class="btn btn-dark mt-3 mx-2">Track
								order</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.page-warpper -->

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

<!-- Mirrored from demo.themefisher.com/elite-shop/confirmation.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
</html>