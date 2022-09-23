<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-table.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:43 GMT -->

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
            $(document).ready(function () {
                $("#admin-products").addClass("active");
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
				<h2 class="content-title">Products table</h2>
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
								<option>All category</option>
								<option>Electronics</option>
								<option>Clothes</option>
								<option>Automobile</option>
							</select>
						</div>
						<div class="col-lg-2 col-6 col-md-3">
							<select class="form-select">
								<option>Status</option>
								<option>Active</option>
								<option>Disabled</option>
								<option>Show all</option>
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
									<th>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</th>
									<th>#ID</th>
									<th>Product</th>
									<th>Category</th>
									<th>Status</th>
									<th>Date</th>
									<th class="text-end">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>12</td>
									<td><b>Lace mini dress with faux leather</b></td>
									<td>Dresses</td>
									<td><span class="badge rounded-pill alert-success">Active</span></td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>32</td>
									<td><b>Maxi-chequered shirt with buttons on t...</b></td>
									<td>Shirts</td>
									<td><span class="badge rounded-pill alert-warning">Archived</span></td>
									<td>04.12.2020</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>23</td>
									<td><b>Top with embellished puff sleeves</b></td>
									<td>T-Shirts</td>
									<td><span class="badge rounded-pill alert-warning">Archived</span></td>
									<td>07.11.2020</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>12</td>
									<td><b>Cropped velour hoody</b></td>
									<td>Sweatshirts</td>
									<td><span class="badge rounded-pill alert-danger">Not
											available</span></td>
									<td>09.11.2020</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>32</td>
									<td><b>Pullover with ribbed detailing</b></td>
									<td>Sweaters</td>
									<td><span class="badge rounded-pill alert-success">Active</span></td>
									<td>18.10.2020</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>89</td>
									<td><b>Lace mini dress with faux leather</b></td>
									<td>Blazers And Vests</td>
									<td><span class="badge rounded-pill alert-success">Active</span></td>
									<td>31.10.2020</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>64</td>
									<td><b>Lace mini dress with faux leather</b></td>
									<td>Trousers</td>
									<td><span class="badge rounded-pill alert-success">Active</span></td>
									<td>02.09.2020</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>23</td>
									<td><b>Lace mini dress with faux leather</b></td>
									<td>Skirts</td>
									<td><span class="badge rounded-pill alert-success">Active</span></td>
									<td>23.09.2020</td>
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
					<!-- table-responsive end // -->

					<nav class="float-end mt-3" aria-label="Page navigation">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>

				</div>
				<!-- card-body end// -->
			</div>
			<!-- card end// -->


		</section>
		<!-- content-main end// -->
	</main>

	<script>
                if (localStorage.getItem("darkmode")) {
                    var body_el = document.body;
                    body_el.className += 'dark';
                }
            </script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

	<!-- Custom JS -->
	<script src="js/scriptc619.js?v=1.0"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-table.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

</html>