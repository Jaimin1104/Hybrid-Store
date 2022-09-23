<%@page import="hybridstore.model.ConsumersModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:58 GMT -->
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
					<li class="breadcrumb-item active" aria-current="page">Contact
						Us</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<!-- google map -->
		<!-- <section class="map">
			Google Map
			<div id="map_canvas" data-latitude="51.507351"
				data-longitude="-0.127758"></div>
		</section> -->
		<!-- /google map -->

		<!-- contact -->
		<section class="section">
			<div class="container">
				<div class="row justify-content-between">
					<!-- form -->
					<div class="col-lg-7 mb-5 mb-lg-0 text-center text-md-left">
						<h2 class="section-title">Contact Us</h2>
						<form action="FeedbacksController.do" method="post" class="row">
							<div class="col-md-6">
								<input type="text" id="firstName" name="firstName"
									class="form-control mb-4 rounded-0" placeholder="First Name" value="<%= consumer.getFirstname() %>"
									required readonly="readonly">
							</div>
							<div class="col-md-6">
								<input type="text" id="lastName" name="lastName"  value="<%= consumer.getLastname() %>"
									class="form-control mb-4 rounded-0" placeholder="Last Name"
									required readonly="readonly">
							</div>
							<div class="col-md-12">
								<input type="text" id="subject" name="subject"
									class="form-control mb-4 rounded-0" placeholder="Subject"
									required>
							</div>
							<div class="col-md-12">
								<textarea name="message" id="message"
									class="form-control rounded-0 mb-4" placeholder="Message" required></textarea>
							</div>
							<div class="col-md-12">
								<input type="hidden" name="consumerid" value="<%= consumer.getConsumerid() %>">
								<button type="submit" value="send feedback" name="btn" class="btn btn-primary">Submit
									now</button>
							</div>
						</form>
					</div>
					<!-- contact item -->
					<div class="col-lg-4">
						<div class="d-flex mb-60">
							<i class="ti-location-pin contact-icon"></i>
							<div>
								<h4>Our Location</h4>
								<!-- <p class="text-gray">23 Michael Extension, Lake
									Christopher, UD03 5WX</p> -->
								<p>Shop No. 23 Nikol, Nikol Naroda Road, Ahmedabad, Gujarat 382350</p>
							</div>
						</div>
						<div class="d-flex mb-60">
							<i class="ti-mobile contact-icon"></i>
							<div>
								<h4>Call Us Now</h4>
								<p class="text-gray mb-0">(+91) 6351021898</p>
								<p class="text-gray mb-0">(+91) 9737482707</p>
								<p class="text-gray mb-0">(+91) 9328506860</p>
							</div>
						</div>
						<div class="d-flex mb-60">
							<i class="ti-email contact-icon"></i>
							<div>
								<h4>Write Us Now</h4>
								<p class="text-gray mb-0">hybridstore8@gmail.com</p>
								<!-- <p class="text-gray mb-0">info@example.com</p> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /contact -->

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

<!-- Mirrored from demo.themefisher.com/elite-shop/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:58 GMT -->
</html>