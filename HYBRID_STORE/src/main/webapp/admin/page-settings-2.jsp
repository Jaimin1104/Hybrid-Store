<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-settings-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->

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
        $("#admin-settings").addClass("active");
      });
    </script>

</head>

<body>

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
							<a class="dropdown-item" href="admin-profile.jsp">My profile</a>
							<a class="dropdown-item" href="#">Settings</a> <a
								class="dropdown-item text-danger" href="../login.jsp">Logout</a>
						</div></li>
				</ul>
			</div>
		</header>

		<section class="content-main">

			<div class="content-header">
				<h2 class="content-title">Site settings</h2>
			</div>

			<div class="card">
				<div class="card-body">
					<div class="row gx-5">
						<aside class="col-lg-3 border-end">

							<nav class="nav nav-pills flex-lg-column mb-4">
								<a class="nav-link active" aria-current="page" href="#">General</a>
								<a class="nav-link" href="#">Moderators</a> <a class="nav-link"
									href="#">Admin account</a> <a class="nav-link" href="#">SEO
									settings</a> <a class="nav-link" href="#">Mail settings</a> <a
									class="nav-link" href="#">Newsletter</a>
							</nav>

						</aside>
						<div class="col-lg-9">
							<section class="content-body p-xl-4">


								<form>

									<div class="row border-bottom mb-4 pb-4">
										<div class="col-md-5">
											<h5>Website name</h5>
											<p class="text-muted" style="max-width: 90%">Supported
												languages of all pages including each product lorem ipsum
												dolor sit amet, consectetur adipisicing</p>
										</div>
										<!-- col.// -->
										<div class="col-md-7">

											<div class="mb-3">
												<label class="form-label">Home page title</label> <input
													class="form-control" type="text" name=""
													placeholder="Type here">
											</div>

											<div class="mb-3">
												<label class="form-label">Description</label>
												<textarea type="text" class="form-control"></textarea>
											</div>

										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<div class="row border-bottom mb-4 pb-4">
										<div class="col-md-5">
											<h5>Access</h5>
											<p class="text-muted" style="max-width: 90%">Give access
												of all pages including each product lorem ipsum dolor sit
												amet, consectetur adipisicing</p>
										</div>
										<!-- col.// -->
										<div class="col-md-7">

											<label class="mb-2 form-check"> <input
												class="form-check-input" checked="" name="mycheck_a1"
												type="radio"> <span class="form-check-label">
													All registration is enabled </span>
											</label> <label class="mb-2 form-check"> <input
												class="form-check-input" name="mycheck_a1" type="radio">
												<span class="form-check-label"> Only buyers is
													enabled </span>
											</label> <label class="mb-2 form-check"> <input
												class="form-check-input" name="mycheck_a1" type="radio">
												<span class="form-check-label"> Only buyers is
													enabled </span>
											</label> <label class="mb-2 form-check"> <input
												class="form-check-input" name="mycheck_a1" type="radio">
												<span class="form-check-label"> Stop new shop
													registration </span>
											</label>

										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->



									<div class="row border-bottom mb-4 pb-4">
										<div class="col-md-5">
											<h5>Notification</h5>
											<p class="text-muted" style="max-width: 90%">Lorem ipsum
												dolor sit amet, consectetur adipisicing something about this</p>
										</div>
										<div class="col-md-7">

											<div class="form-check mb-3">
												<input class="form-check-input" type="checkbox" value=""
													id="mycheck_notify" checked> <label
													class="form-check-label" for="mycheck_notify"> Send
													notification on each user registration </label>
											</div>

											<div class="mb-3">
												<input class="form-control" placeholder="Text">
											</div>

										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->


									<div class="row border-bottom mb-4 pb-4">
										<div class="col-md-5">
											<h5>Currency</h5>
											<p class="text-muted" style="max-width: 90%">Lorem ipsum
												dolor sit amet, consectetur adipisicing something about this</p>
										</div>
										<!-- col.// -->
										<div class="col-md-7">

											<div class="mb-3" style="max-width: 200px">
												<label class="form-label">Main currency </label> <select
													class="form-select">
													<option>US Dollar</option>
													<option>EU Euro</option>
													<option>RU Ruble</option>
													<option>UZ Som</option>
												</select>
											</div>

											<div class="mb-3" style="max-width: 200px">
												<label class="form-label">Supported curencies</label> <select
													class="form-select">
													<option>US dollar</option>
													<option>RUBG russia</option>
													<option>INR india</option>
												</select>
											</div>

										</div>
										<!-- col.// -->
									</div>
									<!-- row.// -->

									<button class="btn btn-primary" type="submit">Save all
										changes</button>
									&nbsp;
									<button class="btn btn-outline-danger" type="reset">Reset</button>

								</form>

							</section>
							<!-- content-body .// -->
						</div>
						<!-- col.// -->
					</div>
					<!-- row.// -->

				</div>
				<!-- card-body .//end -->
			</div>
			<!-- card .//end -->


		</section>
		<!-- content-main end// -->
	</main>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

	<!-- Custom JS -->
	<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>


</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-settings-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->

</html>