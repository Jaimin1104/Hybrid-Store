<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-4.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

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

		<section class="content-main">

			<div class="content-header">
				<h2 class="content-title">Create product</h2>
				<div>
					<a href="#" class="btn btn-outline-danger"> &times; Discard</a>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<div class="row gx-5">
						<aside class="col-lg-3 border-end">

							<nav class="nav nav-pills flex-column mb-4">
								<a class="nav-link active" aria-current="page" href="#">General</a>
								<a class="nav-link" href="#">Catgeory info</a> <a
									class="nav-link" href="#">Pricing</a> <a class="nav-link"
									href="#">Images</a> <a class="nav-link" href="#">SEO
									keywords</a> <a class="nav-link" href="#">Related items</a>
							</nav>

						</aside>
						<div class="col-lg-9">
							<section class="content-body p-xl-4">
								<form>

									<div class="row mb-4">
										<label class="col-lg-3 col-form-label">Product name*</label>
										<div class="col-lg-9">
											<input type="text" class="form-control"
												placeholder="Type here">
										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<div class="row mb-4">
										<label class="col-lg-3 col-form-label">Description*</label>
										<div class="col-lg-9">
											<textarea class="form-control" placeholder="Type here"
												rows="4"></textarea>
										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<div class="row mb-4">
										<label class="col-lg-3 col-form-label">Brand</label>
										<div class="col-lg-4">
											<small class="text-muted">Multiselect: Cmd+click</small> <select
												multiple size="4" class="form-control">
												<option>Adidas</option>
												<option>Puma</option>
												<option>Apple</option>
												<option>Toyota</option>
												<option>Toshiba</option>
												<option>Artel</option>
											</select>
										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<div class="row mb-4">
										<label class="col-lg-3 col-form-label">Tax ID</label>
										<div class="col-lg-4">
											<input type="number" class="form-control"
												placeholder="012345678">
										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<div class="row mb-4">
										<label class="col-lg-3 col-form-label">Related tags</label>
										<div class="col-lg-4">
											<input type="text" class="form-control" placeholder="Type">
										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<div class="row mb-4">
										<label class="col-lg-3 col-form-label">Status</label>
										<div class="col-lg-9">
											<label class="form-check my-2"> <input
												type="checkbox" class="form-check-input" checked="">
												<span class="form-check-label">Enable this product </span>
											</label>
										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<br>
									<button class="btn btn-primary" type="submit">
										Continue to next</button>
								</form>


							</section>
							<!-- content-body .// -->

						</div>
						<!-- col.// -->
					</div>
					<!-- row.// -->

				</div>
				<!-- card body end// -->
			</div>
			<!-- card end// -->

		</section>
		<!-- content-main end// -->
	</main>

	<script type="text/javascript">
        if (localStorage.getItem("darkmode")) {
          var body_el = document.body;
          body_el.className += 'dark';
        }
      </script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

	<!-- Custom JS -->
	<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-4.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

</html>