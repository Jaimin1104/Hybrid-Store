<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-detail.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

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
<link href="css/ui3556.css?v=1.1?v=1.0" rel="stylesheet" type="text/css" />
<link href="css/responsive3556.css?v=1.1?v=1.0" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
      $(document).ready(function () {
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
				<h2 class="content-title">Order detail</h2>
			</div>


			<div class="card">
				<header class="card-header">
					<div class="row align-items-center">
						<div class="col-lg-6 col-md-6">
							<span> <i class="material-icons md-calendar_today"></i> <b>Wed,
									Aug 13, 2020, 4:34PM</b>
							</span> <br> <small class="text-muted">Order ID: 3453012</small>
						</div>
						<div class="col-lg-6 col-md-6 ms-auto text-md-end">
							<select class="form-select d-inline-block"
								style="max-width: 200px">
								<option>Change status</option>
								<option>Awaiting payment</option>
								<option>Confirmed</option>
								<option>Shipped</option>
								<option>Delivered</option>
							</select> <a class="btn btn-light" href="#">Save</a> <a
								class="btn btn-secondary ms-2" href="#"><i
								class="icon material-icons md-print"></i></a>
						</div>
					</div>
				</header>
				<!-- card-header end// -->
				<div class="card-body">

					<div class="row mb-5 order-info-wrap">
						<div class="col-md-4">
							<article class="icontext align-items-start">
								<span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-person"></i>
								</span>
								<div class="text">
									<h6 class="mb-1">Customer</h6>
									<p class="mb-1">
										John Alexander <br> alex@example.com <br> +998 99
										22123456
									</p>
									<a href="#">View profile</a>
								</div>
							</article>
						</div>
						<!-- col// -->
						<div class="col-md-4">
							<article class="icontext align-items-start">
								<span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-local_shipping"></i>
								</span>
								<div class="text">
									<h6 class="mb-1">Order info</h6>
									<p class="mb-1">
										Shipping: Fargo express <br> Pay method: card <br>
										Status: new
									</p>
									<a href="#">Download info</a>
								</div>
							</article>
						</div>
						<!-- col// -->
						<div class="col-md-4">
							<article class="icontext align-items-start">
								<span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-place"></i>
								</span>
								<div class="text">
									<h6 class="mb-1">Deliver to</h6>
									<p class="mb-1">
										City: Tashkent, Uzbekistan <br>Block A, House 123, Floor
										2 <br> Po Box 10000
									</p>
									<a href="#">View profile</a>
								</div>
							</article>
						</div>
						<!-- col// -->
					</div>
					<!-- row // -->

					<div class="row">
						<div class="col-lg-8">
							<div class="table-responsive">
								<table class="table border table-hover table-lg">
									<thead>
										<tr>
											<th width="40%">Product</th>
											<th width="20%">Unit Price</th>
											<th width="20%">Quantity</th>
											<th width="20%" class="text-end">Total</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a class="itemside" href="#">
													<div class="left">
														<img src="images/items/1.jpg" width="40" height="40"
															class="img-xs" alt="Item">
													</div>
													<div class="info">T-shirt blue, XXL size</div>
											</a></td>
											<td>$44.25</td>
											<td>2</td>
											<td class="text-end">$99.50</td>
										</tr>
										<tr>
											<td><a class="itemside" href="#">
													<div class="left">
														<img src="images/items/2.jpg" width="40" height="40"
															class="img-xs" alt="Item">
													</div>
													<div class="info">Winter jacket for men</div>
											</a></td>
											<td>$7.50</td>
											<td>2</td>
											<td class="text-end">$15.00</td>
										</tr>
										<tr>
											<td><a class="itemside" href="#">
													<div class="left">
														<img src="images/items/3.jpg" width="40" height="40"
															class="img-xs" alt="Item">
													</div>
													<div class="info">Jeans wear for men</div>
											</a></td>
											<td>$43.50</td>
											<td>2</td>
											<td class="text-end">$102.04</td>
										</tr>
										<tr>
											<td><a class="itemside" href="#">
													<div class="left">
														<img src="images/items/4.jpg" width="40" height="40"
															class="img-xs" alt="Item">
													</div>
													<div class="info">Product name color and size</div>
											</a></td>
											<td>$99.00</td>
											<td>3</td>
											<td class="text-end">$297.00</td>
										</tr>
										<tr>
											<td colspan="4">
												<article class="float-end">
													<dl class="dlist">
														<dt>Subtotal:</dt>
														<dd>$973.35</dd>
													</dl>
													<dl class="dlist">
														<dt>Shipping cost:</dt>
														<dd>$10.00</dd>
													</dl>
													<dl class="dlist">
														<dt>Grand total:</dt>
														<dd>
															<b class="h5">$983.00</b>
														</dd>
													</dl>
													<dl class="dlist">
														<dt class="text-muted">Status:</dt>
														<dd>
															<span
																class="badge rounded-pill alert-success text-success">Payment
																done</span>
														</dd>
													</dl>
												</article>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- table-responsive// -->
						</div>
						<!-- col// -->
						<div class="col-lg-4">
							<div class="box shadow-sm bg-light">
								<h6>Payment info</h6>
								<p>
									<img src="images/card-brands/2.png" class="border" height="20">
									Master Card **** **** 4768 <br> Business name: Grand
									Market LLC <br> Phone: +1 (800) 555-154-52
								</p>
							</div>
							<div class="h-25 pt-4">
								<div class="mb-3">
									<label>Notes</label>
									<textarea class="form-control" name="notes" id="notes"
										placeholder="Type some note"></textarea>
								</div>
								<button class="btn btn-primary">Save note</button>
							</div>
						</div>
						<!-- col// -->

					</div>
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-detail.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:45 GMT -->

</html>