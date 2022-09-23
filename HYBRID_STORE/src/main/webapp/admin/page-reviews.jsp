<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-reviews.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->
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
    	$("#admin-reviews").addClass("active");
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
				<h2 class="content-title">Reviews</h2>
			</div>
			<div class="card mb-4">
				<header class="card-header">
					<div class="row gx-3">
						<div class="col-lg-4 col-md-6 me-auto">
							<input type="text" placeholder="Search..." class="form-control" />
						</div>
						<div class="col-lg-2 col-md-3 col-6">
							<select class="form-select">
								<option>Status</option>
								<option>Active</option>
								<option>Disabled</option>
								<option>Show all</option>
							</select>
						</div>
						<div class="col-lg-2 col-md-3 col-6">
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
									<th>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</th>
									<th>#ID</th>
									<th>Product</th>
									<th>Name</th>
									<th>Rating</th>
									<th>Date</th>
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
									<td>23</td>
									<td><b>A-Line Mini Dress in Blue</b></td>
									<td>Devon Lane</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 60%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>10.03.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>24</td>
									<td><b>Fashion Woman Bag</b></td>
									<td>Guy Hawkins</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 80%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>04.12.2019</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>25</td>
									<td><b>Air Jordan 1 Top 3 Sneaker (DS)</b></td>
									<td>Savannah Nguyen</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 90%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>25.05.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>26</td>
									<td><b>Samsung Galaxy S20 (SM-G980F/DS) Dual SIM</b></td>
									<td>Kristin Watson</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 90%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>01.06.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>27</td>
									<td><b>Macbook Pro 16 inch (2020 ) For Sale</b></td>
									<td>Jane Cooper</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 100%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>28</td>
									<td><b>Gaming Chair, local pickup only</b></td>
									<td>Courtney Henry</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 100%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>29</td>
									<td><b>Coach Tabby 26 for sale</b></td>
									<td>Ralph Edwards</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 90%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
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
									<td>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>30</td>
									<td><b>Oneplus 7 Pro GM1910 256GB</b></td>
									<td>Courtney Henry</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 70%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>20.02.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>31</td>
									<td><b>DJI Mavic Pro 2</b></td>
									<td>Theresa Webb</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 20%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>10.03.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>32</td>
									<td><b>Heimer Miller Sofa (Mint Condition)</b></td>
									<td>Darrell Steward</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 80%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>10.04.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>33</td>
									<td><b>Dell XPS 13 9380, 13.3" 4K UHD (3840X2160) </b></td>
									<td>Leslie Alexander</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 50%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>25.05.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>34</td>
									<td><b>Fashion Woman Bag</b></td>
									<td>Esther Howard</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 100%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>07.04.2020</td>
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
											<input class="form-check-input" type="checkbox" value="" />
										</div>
									</td>
									<td>35</td>
									<td><b>iPad Pro 2017 Model</b></td>
									<td>Savannah Nguyen</td>
									<td>
										<ul class="rating-stars">
											<li style="width: 100%;" class="stars-active"><img
												src="images/icons/stars-active.svg" height="16" alt="stars" />
											</li>
											<li><img src="images/icons/starts-disable.svg"
												height="16" alt="stars" /></li>
										</ul>
									</td>
									<td>10.10.2019</td>
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
					<!-- table-responsive//end -->
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
        body_el.className += "dark";
   }
</script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>


	<!-- Custom JS -->
	<script src="js/scriptc619.js?v=1.0"></script>
</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-reviews.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:49 GMT -->
</html>
