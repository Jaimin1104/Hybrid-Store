<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
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

		<section class="content-main" style="max-width: 1200px">

			<div class="content-header">
				<h2 class="content-title">Add product</h2>
				<div>
					<a href="#" class="btn btn-light">Save to draft</a> <a href="#"
						class="btn btn-primary">Publish now</a>
				</div>
			</div>

			<div class="row mb-4">
				<div class="col-xl-8 col-lg-8">
					<div class="card mb-4">
						<div class="card-body">
							<div class="mb-4">
								<label for="product_title" class="form-label">Product
									title</label> <input type="text" placeholder="Type here"
									class="form-control" id="product_title">
							</div>
							<div class="row gx-3">
								<div class="col-md-4  mb-3">
									<label for="product_sku" class="form-label">SKU</label> <input
										type="text" placeholder="Type here" class="form-control"
										id="product_sku">
								</div>
								<div class="col-md-4  mb-3">
									<label for="product_color" class="form-label">Color</label> <input
										type="text" placeholder="Type here" class="form-control"
										id="product_color">
								</div>
								<div class="col-md-4  mb-3">
									<label for="product_size" class="form-label">Size</label> <input
										type="text" placeholder="Type here" class="form-control"
										id="product_size">
								</div>
							</div>
							<div class="mb-4">
								<label for="product_brand" class="form-label">Brand</label> <input
									type="text" placeholder="Type here" class="form-control"
									id="product_brand">
							</div>
						</div>
					</div>
					<!-- card end// -->
					<div class="card mb-4">
						<div class="card-body">
							<div>
								<label class="form-label">Description</label>
								<textarea placeholder="Type here" class="form-control" rows="4"></textarea>
							</div>
						</div>
					</div>
					<!-- card end// -->
					<div class="card mb-4">
						<div class="card-body">
							<div>
								<label class="form-label">Images</label> <input
									class="form-control" type="file">
							</div>
						</div>
					</div>
					<!-- card end// -->
				</div>
				<!-- col end// -->
				<aside class="col-xl-4 col-lg-4">
					<div class="card mb-4">
						<div class="card-body">
							<div class="mb-4">
								<label class="form-label">Price</label> <input type="text"
									placeholder="Type here" class="form-control">
							</div>
							<div class="mb-4">
								<label class="form-label">Status</label> <select
									class="form-select">
									<option>Published</option>
									<option>Draft</option>
								</select>
							</div>

							<div class="mb-4">
								<label class="form-label">Tags</label> <input type="text"
									placeholder="Type here" class="form-control">
							</div>

							<a href="#" class="btn btn-sm btn-light mb-1">Woman <i
								class="material-icons md-close"></i></a> <a href="#"
								class="btn btn-sm btn-light mb-1">Summer <i
								class="material-icons md-close"></i></a> <a href="#"
								class="btn btn-sm btn-light mb-1">Clothes <i
								class="material-icons md-close"></i></a>
							<hr>
							<h5 class="mb-3">Categories</h5>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat"> <label class="form-check-label"
									for="product-cat"> Shirt </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat-1"> <label class="form-check-label"
									for="product-cat-1"> T-Shirt </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat-2"> <label class="form-check-label"
									for="product-cat-2"> Sneakers </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat-3"> <label class="form-check-label"
									for="product-cat-3"> Joggers </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat-4"> <label class="form-check-label"
									for="product-cat-4"> Vests </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat-5"> <label class="form-check-label"
									for="product-cat-5"> Knitwear </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="product-cat-8"> <label class="form-check-label"
									for="product-cat-8"> Shorts </label>
							</div>
						</div>
					</div>
					<!-- card end// -->
				</aside>
				<!-- col end// -->
			</div>
			<!-- row end// -->


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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
</html>