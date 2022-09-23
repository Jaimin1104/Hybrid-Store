<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Sample title - Ecommerce admin dashboard template</title>

<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">

<link href="css/bootstrapf9e3.css?v=1.1" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" href="fonts/material-icon/css/round.css" />

<!-- custom style -->
<link href="css/uif9e3.css?v=1.1" rel="stylesheet" type="text/css" />
<link href="css/responsivef9e3.css?v=1.1" rel="stylesheet" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
    	$("#admin-orders").addClass("active");
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
				<h2 class="content-title">Orders one</h2>
				<div>
					<a href="#" class="btn btn-primary"><i
						class="material-icons md-plus"></i> Create new</a>
				</div>
			</div>

			<div class="card mb-4">
				<header class="card-header">
					<div class="row gx-3">
						<div class="col-lg-4 col-md-6 me-auto">
							<input type="text" placeholder="Search..." class="form-control">
						</div>
						<div class="col-lg-2 col-6 col-md-3">
							<select class="form-select">
								<option>Status</option>
								<option>Active</option>
								<option>Disabled</option>
								<option>Show all</option>
							</select>
						</div>
						<div class="col-lg-2 col-6 col-md-3">
							<select class="form-select">
								<option>Show 20</option>
								<option>Show 30</option>
								<option>Show 40</option>
							</select>
						</div>
					</div>
				</header>
				<!-- card-header end// -->
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#ID</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Total</th>
									<th scope="col">Status</th>
									<th scope="col">Date</th>
									<th scope="col" class="text-end">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>0901</td>
									<td><b>Marvin McKinney</b></td>
									<td>marvin@example.com</td>
									<td>$9.00</td>
									<td><span class="badge rounded-pill alert-warning">Pending</span></td>
									<td>03.12.2020</td>
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
									<td><b>Leslie Alexander</b></td>
									<td>leslie@example.com</td>
									<td>$46.61</td>
									<td><span class="badge rounded-pill alert-warning">Pending</span></td>
									<td>21.02.2020</td>
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
									<td>1233</td>
									<td><b>Esther Howard</b></td>
									<td>esther@example.com</td>
									<td>$12.00</td>
									<td><span class="badge rounded-pill alert-danger">Canceled</span></td>
									<td>03.07.2020</td>
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
									<td>1233</td>
									<td><b>Esther Howard</b></td>
									<td>esther@example.com</td>
									<td>$12.00</td>
									<td><span class="badge rounded-pill alert-danger">Canceled</span></td>
									<td>03.07.2020</td>
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
									<td><b>Jenny Wilson</b></td>
									<td>jenny@example.com</td>
									<td>$589.99</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>22.05.2020</td>
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
									<td>2112</td>
									<td><b>Marvin McKinney</b></td>
									<td>marvin@example.com</td>
									<td>$16.58</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>23.04.2020</td>
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
									<td>7897</td>
									<td><b>Albert Flores</b></td>
									<td>albert@example.com</td>
									<td>$10.00</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>13.03.2020</td>
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
									<td><b>Wade Warren</b></td>
									<td>wade@example.com</td>
									<td>$105.55</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>23.09.2019</td>
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
									<td>2324</td>
									<td><b>Jane Cooper</b></td>
									<td>jane@example.com</td>
									<td>$710.68</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>28.04.2020</td>
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
									<td>2325</td>
									<td><b>Savannah Nguyen</b></td>
									<td>savannah@example.com</td>
									<td>$710.68</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>23.03.2020</td>
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
									<td>2326</td>
									<td><b>Guy Hawkins</b></td>
									<td>guy@example.com</td>
									<td>$767.50</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>28.04.2020</td>
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
									<td>2327</td>
									<td><b>Darrell Steward</b></td>
									<td>darrel@example.com</td>
									<td>$406.27</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>14.07.2020</td>
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
									<td>2328</td>
									<td><b>Jane Cooper</b></td>
									<td>jane@example.com</td>
									<td>$601.13</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>18.03.2020</td>
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
									<td>2329</td>
									<td><b>Darlene Robertson</b></td>
									<td>deriene@example.com</td>
									<td>$948.55</td>
									<td><span class="badge rounded-pill alert-success">Received</span></td>
									<td>03.07.2020</td>
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
							</tbody>
						</table>
					</div>
					<!-- table-responsive //end -->
				</div>
				<!-- card-body end// -->
			</div>
			<!-- card end// -->


		</section>
		<!-- content-main end// -->
	</main>

	<script>
    if(localStorage.getItem("darkmode")){
        var body_el = document.body;
        body_el.className += 'dark';
    }
</script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

	<!-- Custom JS -->
	<script src="js/scriptc619.js?v=1.0"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
</html>