<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/checkout.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
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
					<li class="breadcrumb-item active" aria-current="page">Checkout</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<div class="section">
			<div class="checkout shopping">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<div class="block billing-details">
								<h4 class="widget-title">Billing Details</h4>
								<form class="checkout-form">
									<div class="form-group">
										<label for="full_name">Full Name</label> <input type="text"
											class="form-control" id="full_name" placeholder="">
									</div>
									<div class="form-group">
										<label for="user_address">Address</label> <input type="text"
											class="form-control" id="user_address" placeholder="">
									</div>
									<div class="checkout-country-code clearfix">
										<div class="form-group">
											<label for="user_post_code">Zip Code</label> <input
												type="text" class="form-control" id="user_post_code"
												name="zipcode" value="">
										</div>
										<div class="form-group">
											<label for="user_city">City</label> <input type="text"
												class="form-control" id="user_city" name="city" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="user_country">Country</label> <input type="text"
											class="form-control" id="user_country" placeholder="">
									</div>
								</form>
							</div>
							<div class="block">
								<h4 class="widget-title">Payment Method</h4>
								<p>Credit Cart Details (Secure payment)</p>
								<div class="checkout-product-details">
									<div class="payment">
										<div class="card-details">
											<form class="checkout-form">
												<div class="form-group">
													<label for="card-number">Card Number <span
														class="required">*</span></label> <input id="card-number"
														class="form-control" type="tel"
														placeholder="•••• •••• •••• ••••">
												</div>
												<div class="form-group half-width padding-right">
													<label for="card-expiry">Expiry (MM/YY) <span
														class="required">*</span></label> <input id="card-expiry"
														class="form-control" type="tel" placeholder="MM / YY">
												</div>
												<div class="form-group half-width padding-left">
													<label for="card-cvc">Card Code <span
														class="required">*</span></label> <input id="card-cvc"
														class="form-control" type="tel" maxlength="4"
														placeholder="CVC">
												</div>
												<a href="confirmation.jsp" class="btn btn-primary mt-3">Place
													Order</a>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="product-checkout-details">
								<div class="block">
									<h4 class="widget-title">Order Summary</h4>
									<div class="media product-card">
										<a class="pull-left" href="product-single.jsp"> <img
											class="media-object" src="images/cart/product-1.jpg"
											alt="Image" />
										</a>
										<div class="media-body">
											<h4 class="media-heading">
												<a class="text-color" href="product-single.jsp">Ambassador
													Heritage 1921</a>
											</h4>
											<p class="price">1 x $249</p>
											<span class="remove">Remove</span>
										</div>
									</div>
									<div class="discount-code">
										<p>
											Have a discount ? <a data-toggle="modal"
												data-target="#coupon-modal" href="#">enter it here</a>
										</p>
									</div>
									<ul class="summary-prices">
										<li><span>Subtotal:</span> <span class="price">$190</span>
										</li>
										<li><span>Shipping:</span> <span>Free</span></li>
									</ul>
									<div class="summary-total">
										<span>Total</span> <span>$250</span>
									</div>
									<div class="verified-icon">
										<img src="images/verified.png">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<form class="text-center">
							<div class="form-group">
								<input class="form-control text-center" type="text"
									placeholder="Enter Coupon Code">
							</div>
							<button type="submit" class="btn btn-primary">Apply
								Coupon</button>
						</form>
					</div>
				</div>
			</div>
		</div>

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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBI14J_PNWVd-m0gnUBkjmhoQyNyd7nllA"></script>
	<script src="plugins/google-map/gmap.js"></script>
	<!-- Main Script -->
	<script src="js/script.js"></script>
</body>

<!-- Mirrored from demo.themefisher.com/elite-shop/checkout.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
</html>