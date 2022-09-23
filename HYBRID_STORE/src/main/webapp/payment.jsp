<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/payment.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
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
					<li class="breadcrumb-item active" aria-current="page">Shipping
						Information</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<!-- shipping method -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="inner-wrapper border-box">
							<!-- navbar -->
							<div class="justify-content-between nav mb-5">
								<a href="shipping.jsp"
									class="text-center d-inline-block nav-item"> <i
									class="ti-truck d-block mb-2"></i> <span class="d-block h4">Shipping
										Method</span>
								</a> <a href="payment.jsp"
									class="text-center d-inline-block nav-item active"> <i
									class="ti-wallet d-block mb-2"></i> <span class="d-block h4">Payment
										Method</span>
								</a> <a href="review.jsp"
									class="text-center d-inline-block nav-item"> <i
									class="ti-eye d-block mb-2"></i> <span class="d-block h4">Review</span>
								</a>
							</div>
							<!-- /navbar -->

							<!-- shipping-information -->
							<h3 class="mb-5 border-bottom pb-2">Shipping Information</h3>
							<div class="row mb-5">
								<div class="col-md-6">
									<h4 class="mb-3">Shipping Address</h4>
									<ul class="list-unstyled">
										<li>Somrat</li>
										<li>Mohammadpur, Dhaka 120, Bangladesh</li>
										<li>248-321-5879</li>
										<li>example.site@email.com</li>
									</ul>
								</div>
								<div class="col-md-6">
									<h4 class="mb-3">Shipping Method</h4>
									<ul class="list-unstyled">
										<li>Standard Ground (USPS) - $9.50</li>
										<li>Delivered in 8-10 business days.</li>
									</ul>
								</div>
							</div>
							<!-- billing information -->
							<h3 class="mb-5 border-bottom pb-2">Billing Information</h3>

							<div class="mb-4">
								<input id="checkbox1" type="radio" name="checkbox" value="1"
									checked="checked"> <label for="checkbox1" class="h4">Pay
									with Paypal</label>
							</div>
							<div class="mb-4">
								<input id="checkbox2" type="radio" name="checkbox" value="2">
								<label for="checkbox2" class="h4">Credit Card</label> <small
									class="mb-2 d-block ml-3">We accept following credit
									card</small>
								<div class="form-group ml-3 row">
									<div class="col-12">
										<ul class="list-inline mb-3">
											<li class="list-inline-item"><img
												src="images/payment-card/card-1.jpg" alt="card"></li>
											<li class="list-inline-item"><img
												src="images/payment-card/card-2.jpg" alt="card"></li>
											<li class="list-inline-item"><img
												src="images/payment-card/card-3.jpg" alt="card"></li>
											<li class="list-inline-item"><img
												src="images/payment-card/card-4.jpg" alt="card"></li>
										</ul>
									</div>
									<div class="col-sm-6">
										<label for="cardName">Name on Card</label> <input type="text"
											name="cardName" id="cardName" class="form-control">
									</div>
									<div class="col-sm-6">
										<label for="cardNumber">Card Number</label> <input type="text"
											name="cardNumber" id="cardNumber" class="form-control">
									</div>
									<div class="col-sm-6">
										<div class="row">
											<div class="col-12">
												<label for="exDate">Expiration Date</label>
											</div>
											<div class="col-md-6">
												<select class="form-control" name="exDate">
													<option value="">Year</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
													<option value="2020">2020</option>
												</select>
											</div>
											<div class="col-md-6">
												<select class="form-control" name="exDate">
													<option value="">Month</option>
													<option value="jan">Jan</option>
													<option value="feb">Feb</option>
													<option value="mar">Mar</option>
													<option value="apr">Apr</option>
													<option value="may">May</option>
													<option value="jun">Jun</option>
													<option value="jul">Jul</option>
													<option value="aug">Aug</option>
													<option value="sep">Sep</option>
													<option value="oct">Oct</option>
													<option value="nov">Nov</option>
													<option value="dec">Dec</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<label for="cvc">CVC/CVV</label> <input type="text" name="cvc"
											id="cvc" class="form-control" placeholder="1234">
									</div>
								</div>
							</div>
							<!-- /shipping-information -->
							<!-- buttons -->
							<div class="p-4 bg-gray d-flex justify-content-between">
								<a href="payment.jsp" class="btn btn-dark">Back</a> <a
									href="review.jsp" class="btn btn-primary">Continue</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="border-box p-4">
							<h4>Order Summery</h4>
							<p>Excepteur sint occaecat cupidat non proi dent
								sunt.officia.</p>
							<ul class="list-unstyled">
								<li class="d-flex justify-content-between"><span>Subtotal</span>
									<span>$237.00</span></li>
								<li class="d-flex justify-content-between"><span>Shipping
										& Handling</span> <span>$15.00</span></li>
								<li class="d-flex justify-content-between"><span>Estimated
										Tax</span> <span>$0.00</span></li>
							</ul>
							<hr>
							<div class="d-flex justify-content-between">
								<span>Total</span> <strong>USD $253.00</strong>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /shipping method -->

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

<!-- Mirrored from demo.themefisher.com/elite-shop/payment.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
</html>