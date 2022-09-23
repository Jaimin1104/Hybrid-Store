<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Sample title - Ecommerce admin dashboard template</title>

<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />

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
							placeholder="Search term" />
						<button class="btn btn-light bg" type="button">
							<i class="material-icons md-search"></i>
						</button>
					</div>
					<datalist id="search_terms">
						<option value="Products"></option>
						<option value="New orders"></option>
						<option value="Apple iphone"></option>
						<option value="Ahmed Hassan"></option>
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
				<h2 class="content-title">Categories</h2>
			</div>

			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-4">
							<form>
								<div class="mb-4">
									<label for="product_name" class="form-label">Name</label> <input
										type="text" placeholder="Type here" class="form-control"
										id="product_name" />
								</div>
								<div class="mb-4">
									<label for="product_slug" class="form-label">Slug</label> <input
										type="text" placeholder="Type here" class="form-control"
										id="product_slug" />
								</div>
								<div class="mb-4">
									<label class="form-label">Parent</label> <select
										class="form-select">
										<option>Clothes</option>
										<option>T-Shirts</option>
									</select>
								</div>
								<div class="mb-4">
									<label class="form-label">Description</label>
									<textarea placeholder="Type here" class="form-control" rows="4"></textarea>
								</div>
								<div class="d-grid">
									<button class="btn btn-primary">Create category</button>
								</div>
							</form>
						</div>
						<div class="col-md-8">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</th>
										<th>ID</th>
										<th>Name</th>
										<th>Description</th>
										<th>Slug</th>
										<th>Order</th>
										<th class="text-end">Action</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>21</td>
										<td><b>Men clothes</b></td>
										<td>Men clothes</td>
										<td>/men</td>
										<td>1</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>2</td>
										<td><b>Women fashion</b></td>
										<td>Fashions for Women</td>
										<td>/women</td>
										<td>2</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>3</td>
										<td><b>Kids clothes</b></td>
										<td>Clothes for kids</td>
										<td>/kids</td>
										<td>3</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td><i
											class="material-icons md-subdirectory_arrow_right text-muted"></i></td>
										<td>4</td>
										<td><b>Hot Gifts</b></td>
										<td>Hot Gifts</td>
										<td>/gifts</td>
										<td>4</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td><i
											class="material-icons md-subdirectory_arrow_right text-muted"></i></td>
										<td>5</td>
										<td><b>Electronics</b></td>
										<td>Electronics</td>
										<td>/electr</td>
										<td>5</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>6</td>
										<td><b>Accessories</b></td>
										<td>Accessories</td>
										<td>/accessories</td>
										<td>6</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>7</td>
										<td><b>Jewellery</b></td>
										<td>Jewellery</td>
										<td>/jewel</td>
										<td>7</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>8</td>
										<td><b>Interiors</b></td>
										<td>Interiors</td>
										<td>/interior</td>
										<td>8</td>
										<td class="text-end">
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a> <a
														class="dropdown-item" href="#">Edit info</a> <a
														class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
								</tbody>
							</table>

						</div>
						<!-- .col// -->
					</div>
					<!-- .row // -->
				</div>
				<!-- card body .// -->
			</div>
			<!-- card .// -->
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
</html>
