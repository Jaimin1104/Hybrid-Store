<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-brands.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:49 GMT -->
<head>
	<%@ include file="staff-head.jsp" %>
</head>
<body>

	<%@ include file="staff-aside-bar.jsp" %>

<main class="main-wrap">
	
<header class="main-header navbar">
	<div class="col-search">
		<form class="searchform">
			<div class="input-group">
			  <input list="search_terms" type="text" class="form-control" placeholder="Search term">
			  <button class="btn btn-light bg" type="button"> <i class="material-icons md-search"></i> </button>
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
     <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"> <i class="md-28 material-icons md-menu"></i> </button>
     <ul class="nav">
      <li class="nav-item">
          <a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> <i class="material-icons md-nights_stay"></i> </a>
      </li>
      <li class="nav-item">
        <a class="nav-link btn-icon" href="#"> <i class="material-icons md-notifications_active"></i> </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> English </a>
      </li>
      <li class="dropdown nav-item">
        <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#"> <img class="img-xs rounded-circle" src="images/people/avatar1.jpg" alt="User"></a>
        <div class="dropdown-menu dropdown-menu-end">
          <a class="dropdown-item" href="#">My profile</a>
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item text-danger" href="#">Exit</a>
        </div>
      </li>
    </ul> 
  </div>
</header>

<section class="content-main">

<div class="content-header">
	<h2 class="content-title">Orders</h2>
	<div>
		<a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
	</div>
</div>

<div class="card mb-4">
	<header class="card-header">
		<div class="row gx-3">
			<div class="col-lg-4 me-auto">
				<input type="text" placeholder="Search..." class="form-control">
			</div>
			<div class="col-lg-2 col-6">
				<select class="form-select">
					<option>Status 20</option>
					<option>Status 30</option>
					<option>Status 40</option>
					<option>Status all</option>
				</select>
			</div>
			<div class="col-lg-2 col-6">
				<input type="date" class="form-control" name="">
			</div>
		</div>
	</header> <!-- card-header end// -->
	<div class="card-body">
		<div class="row gx-3">
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/1.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Apple</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/2.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Motorola</h6>
						<a href="#"> 13 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/4.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Tencent</h6>
						<a href="#"> 87 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/5.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Acer</h6>
						<a href="#"> 10 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/6.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Shivaki</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/7.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Acer</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/8.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">LG electronics</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/9.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Samsung</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/10.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Xiaomi</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/1.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Nokia</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/2.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Company name</h6>
						<a href="#"> 13 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/3.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Company name</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/4.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Company name</h6>
						<a href="#"> 13 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/5.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Company name</h6>
						<a href="#"> 398 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
			<div class="col-xl-2 col-lg-3 col-md-4 col-6">
				<figure class="card border-1">
					<div class="card-header bg-white text-center">
						<img height="76" src="images/brands/6.png" class="img-fluid" alt="Logo">
					</div>
					<figcaption class="card-body text-center">
						<h6 class="card-title m-0">Company name</h6>
						<a href="#"> 13 items </a>
					</figcaption>
				</figure>
			</div> <!-- col.// -->
		</div> <!-- row.// -->

		
	</div> <!-- card-body end// -->
</div> <!-- card end// -->


</section> <!-- content-main end// -->
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-brands.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->
</html>