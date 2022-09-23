<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-index-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:32 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Sample title - Ecommerce admin dashboard template</title>

<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">

<link href="css/bootstrapf9e3.css?v=1.1" rel="stylesheet"
	type="text/css" />

<!-- custom style -->
<link href="css/uif9e3.css?v=1.1" rel="stylesheet" type="text/css" />
<link href="css/responsivef9e3.css?v=1.1" rel="stylesheet" />

<!-- iconfont -->
<link rel="stylesheet" href="fonts/material-icon/css/round.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
    	$("#admin-dashboard").addClass("active");
	});
</script>

</head>
<body>

	<b class="screen-overlay"></b>


	<%@ include file="admin-aside-bar.jsp"%>

	<main class="main-wrap">
		<header class="main-header navbar">
			<div class="col-search">
				<form class="searchform">
					<div class="input-group">
						<input list="search_terms" type="text" class="form-control"
							placeholder="Search term">
						<button class="btn btn-light bg" type="button">
							<i class="material-icons md-search"></i>
						</button>
					</div>
					<datalist id="search_terms">
						<option value="Products">
						<option value="New orders">
						<option value="Apple iphone">
						<option value="Ahmed Hassan">
					</datalist>
				</form>
			</div>
			<div class="col-nav">
				<button class="btn btn-icon btn-mobile me-auto"
					data-trigger="#offcanvas_aside">
					<i class="md-28 material-icons md-menu"></i>
				</button>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link btn-icon"
						onclick="darkmode(this)" title="Dark mode" href="#"> <i
							class="material-icons md-nights_stay"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link btn-icon" href="#">
							<i class="material-icons md-notifications_active"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> English
					</a></li>
					<li class="dropdown nav-item"><a class="dropdown-toggle"
						data-bs-toggle="dropdown" href="#"> <img
							class="img-xs rounded-circle" src="images/people/avatar1.jpg"
							alt="User"></a>
						<div class="dropdown-menu dropdown-menu-end">
							<a class="dropdown-item" href="#">My profile</a> <a
								class="dropdown-item" href="#">Settings</a> <a
								class="dropdown-item text-danger" href="#">Exit</a>
						</div></li>
				</ul>
			</div>
		</header>

		<section class="content-main">
			<div class="content-header">
				<h2 class="content-title">Dashboard</h2>
				<div>
					<a href="#" class="btn btn-primary">Create report</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="card card-body mb-4">
						<article class="icontext">
							<span class="icon icon-sm rounded-circle bg-primary-light"><i
								class="text-primary material-icons md-monetization_on"></i></span>
							<div class="text">
								<h6 class="mb-1">Total Sales</h6>
								<span>$19,626,058.20</span>
							</div>
						</article>

					</div>
					<!-- card  end// -->
				</div>
				<!-- col end// -->
				<div class="col-lg-4">
					<div class="card card-body mb-4">
						<article class="icontext">
							<span class="icon icon-sm rounded-circle bg-success-light"><i
								class="text-success material-icons md-local_shipping"></i></span>
							<div class="text">
								<h6 class="mb-1">Total Orders</h6>
								<span>87790</span>
							</div>
						</article>
					</div>
					<!-- card end// -->
				</div>
				<!-- col end// -->
				<div class="col-lg-4">
					<div class="card card-body mb-4">
						<article class="icontext">
							<span class="icon icon-sm rounded-circle bg-warning-light"><i
								class="text-warning material-icons md-shopping_basket"></i></span>
							<div class="text">
								<h6 class="mb-1">Total Products</h6>
								<span>5678</span>
							</div>
						</article>
					</div>
					<!--  end// -->
				</div>
				<!-- col end// -->
			</div>
			<!-- row end// -->


			<div class="row">
				<div class="col-xl-8 col-lg-12">
					<div class="card mb-4">
						<article class="card-body">
							<h5 class="card-title">Sale statistics</h5>
							<canvas height="120" id="myChart"></canvas>
						</article>
						<!-- card-body end// -->
					</div>
					<!-- card end// -->
				</div>
				<!-- col end// -->
				<div class="col-xl-4 col-lg-12">
					<div class="card mb-4">
						<article class="card-body">

							<h5 class="card-title">Marketing</h5>


							<span class="text-muted">Facebook page</span>
							<div class="progress mb-3">
								<div class="progress-bar progress-bar-striped"
									role="progressbar" style="width: 15%">15%</div>
							</div>

							<span class="text-muted">Instagram page</span>
							<div class="progress mb-3">
								<div class="progress-bar progress-bar-striped bg-success"
									role="progressbar" style="width: 65%">65%</div>
							</div>

							<span class="text-muted">Google search</span>
							<div class="progress mb-3">
								<div class="progress-bar progress-bar-striped bg-danger"
									role="progressbar" style="width: 51%">51%</div>
							</div>


							<span class="text-muted">Other links</span>
							<div class="progress mb-3">
								<div class="progress-bar progress-bar-striped bg-secondary"
									role="progressbar" style="width: 80%">80%</div>
							</div>
							<br> <a href="#" class="btn btn-light">Open analytics <i
								class="material-icons md-open_in_new"></i>
							</a>
						</article>
						<!-- card-body end// -->
					</div>
					<!-- card end// -->
				</div>
				<!-- col end// -->
			</div>
			<!-- row end// -->


			<div class="card mb-4">
				<div class="card-body">
					<h5 class="card-title">Latest orders</h5>
					<div class="table-responsive">
						<table class="table table-hover">
							<tr>
								<td>2323</td>
								<td><b>Devon Lane</b></td>
								<td>devon@example.com</td>
								<td>$778.35</td>
								<td><span class="badge rounded-pill alert-success">Delivered</span></td>
								<td>07.05.2020</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
							<tr>
								<td>2323</td>
								<td><b>Darrell Steward</b></td>
								<td>stew123@mysite.com</td>
								<td>$980.90</td>
								<td><span class="badge rounded-pill alert-warning">Pending</span></td>
								<td>12.02.2020</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
							<tr>
								<td>9053</td>
								<td><b>Mike Jonatan</b></td>
								<td>mike@somename.com</td>
								<td>$778.35</td>
								<td><span class="badge rounded-pill alert-warning">Pending</span></td>
								<td>07.05.2020</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
							<tr>
								<td>1234</td>
								<td><b>Ahmed Hassan</b></td>
								<td>devon@example.com</td>
								<td>$75.30</td>
								<td><span class="badge rounded-pill alert-danger">Cancelled</span></td>
								<td>02.01.2020</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
							<tr>
								<td>7532</td>
								<td><b>Abdul Mohammad</b></td>
								<td>abdu@example.com</td>
								<td>$190.15</td>
								<td><span class="badge rounded-pill alert-success">Delivered</span></td>
								<td>17.02.2020</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
							<tr>
								<td>2323</td>
								<td><b>Devon Lane</b></td>
								<td>devon@example.com</td>
								<td>$778.35</td>
								<td><span class="badge rounded-pill alert-success">Delivered</span></td>
								<td>07.05.2020</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
							<tr>
								<td>4521</td>
								<td><b>Alex Pushkin</b></td>
								<td>myphkin@company.com</td>
								<td>$708.35</td>
								<td><span class="badge rounded-pill alert-success">Delivered</span></td>
								<td>01.05.2019</td>
								<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
									<div class="dropdown">
										<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
											<i class="material-icons md-more_horiz"></i>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">View detail</a> <a
												class="dropdown-item" href="#">Edit info</a> <a
												class="dropdown-item text-danger" href="#">Delete</a>
										</div>
									</div> <!-- dropdown //end --></td>
							</tr>
						</table>
					</div>
					<!-- table-responsive end// -->
				</div>
				<!-- card-body end// -->
			</div>
			<!-- card end// -->

		</section>
		<!-- content-main end// -->
	</main>

	<script type="text/javascript">
	if(localStorage.getItem("darkmode")){
		var body_el = document.body;
		body_el.className += 'dark';
	}
</script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

	<!-- ChartJS files-->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<!-- Custom JS -->
	<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>

	<!-- ChartJS customize-->
	<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'line',

	    // The data for our dataset
	    data: {
	        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	        datasets: [
	        {
	            label: 'Sales',
	            backgroundColor: 'rgb(44, 120, 220)',
	            borderColor: 'rgb(44, 120, 220)',
	            data: [18, 17, 4, 3, 2, 20, 25, 31, 25, 22, 20, 9]
	        },
	        {
	            label: 'Visitors',
	            backgroundColor: 'rgb(180, 200, 230)',
	            borderColor: 'rgb(180, 200, 230)',
	            data: [40, 20, 17, 9, 23, 35, 39, 30, 34, 25, 27, 17]
	        } 

	        ]
	    },

	    // Configuration options go here
	    options: {}
	});
</script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-index-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:40 GMT -->
</html>