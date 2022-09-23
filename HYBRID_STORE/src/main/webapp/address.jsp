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
							<li class="list-inline-item"><a class="active"
								href="address.jsp">Address</a></li>
							<li class="list-inline-item"><a href="profile-details.jsp">Profile
									Details</a></li>
						</ul>
						<div class="dashboard-wrapper user-dashboard">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Company</th>
											<th>Name</th>
											<th>Address</th>
											<th>Country</th>
											<th>Phone</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Nokia</td>
											<td>Adam Smith</td>
											<td>9/4 C Babor Road, Mohammad Pur, Dhaka</td>
											<td>Bangladesh</td>
											<td>+884 5452 6452</td>
											<td>
												<div class="btn-group" role="group">
													<button type="button"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-pencil" aria-hidden="true"></i>
													</button>
													<button type="button"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-close" aria-hidden="true"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>Samsung</td>
											<td>Adam Smith</td>
											<td>9/4 C Babor Road, Mohammad Pur, Dhaka</td>
											<td>Bangladesh</td>
											<td>+884 5452 6452</td>
											<td>
												<div class="btn-group" role="group">
													<button type="button"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-pencil" aria-hidden="true"></i>
													</button>
													<button type="button"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-close" aria-hidden="true"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>Motorola</td>
											<td>Adam Smith</td>
											<td>9/4 C Babor Road, Mohammad Pur, Dhaka</td>
											<td>Bangladesh</td>
											<td>+884 5452 6452</td>
											<td>
												<div class="btn-group" role="group">
													<button type="button"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-pencil" aria-hidden="true"></i>
													</button>
													<button type="button"
														class="btn btn-sm btn-outline-primary">
														<i class="ti-close" aria-hidden="true"></i>
													</button>
												</div>
											</td>
										</tr>
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