<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

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
			$(document).ready(function () {
				$("#admin-addproduct").addClass("active");
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

		<section class="content-main" style="max-width: 720px">

			<div class="content-header">
				<h2 class="content-title">Create product</h2>
				<div>
					<a href="#" class="btn btn-outline-danger"> &times; Discard</a>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-body">
					<form>
						<div class="mb-4">
							<label for="product_name" class="form-label">Product
								title</label> <input type="text" placeholder="Type here"
								class="form-control" id="product_name">
						</div>

						<div class="mb-4">
							<label class="form-label">Full description</label>
							<textarea placeholder="Type here" class="form-control" rows="4"></textarea>
						</div>

						<div class="mb-4">
							<label class="form-label">Images</label> <input
								class="form-control" type="file">
						</div>

						<div class="mb-4">
							<label for="product_name" class="form-label">Tags</label> <input
								type="text" class="form-control">
						</div>

						<div class="row gx-2">
							<div class="col-sm-6 mb-3">
								<label class="form-label">Category</label> <select
									class="form-select">
									<option>Automobiles</option>
									<option>Home items</option>
									<option>Electronics</option>
									<option>Smartphones</option>
									<option>Sport items</option>
									<option>Baby and Tous</option>
								</select>
							</div>
							<div class="col-sm-6 mb-3">
								<label class="form-label">Sub-category</label> <select
									class="form-select">
									<option>Nissan</option>
									<option>Honda</option>
									<option>Mercedes</option>
									<option>Chevrolet</option>
								</select>
							</div>
						</div>
						<!-- row.// -->


						<div class="mb-4">
							<label class="form-label">Price</label>
							<div class="row gx-2">
								<div class="col-4">
									<input placeholder="Type" type="text" class="form-control">
								</div>
								<div class="col-2">
									<select class="form-select">
										<option>USD</option>
										<option>EUR</option>
										<option>RUBL</option>
									</select>
								</div>
							</div>
							<!-- row.// -->
						</div>

						<label class="form-check mb-4"> <input
							class="form-check-input" type="checkbox" value=""> <span
							class="form-check-label"> Publish on website </span>
						</label>

						<button class="btn btn-primary">Submit item</button>

					</form>
				</div>
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

</html>