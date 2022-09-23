<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-sellers-cards.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:45 GMT -->
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
				<h2 class="content-title">Sellers cards</h2>
				<div>
					<a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
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
								<option>Show 20</option>
								<option>Show 30</option>
								<option>Show 40</option>
								<option>Show all</option>
							</select>
						</div>
						<div class="col-lg-2 col-6 col-md-3">
							<select class="form-select">
								<option>Status: all</option>
								<option>Active only</option>
								<option>Disabled</option>
							</select>
						</div>
					</div>
				</header> <!-- card-header end// -->
				<div class="card-body">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4">
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar1.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Mary Sandra</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #409</p>
										<p>mary90@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar2.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Leslie Alexander</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #478</p>
										<p>leslie@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar3.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Leslie Alexander</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #478</p>
										<p>leslie@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar4.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Floyd Miles</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #171</p>
										<p>fedor12@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar1.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">John Alexander</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #987</p>
										<p>john@mymail.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar3.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Albert Flores</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #478</p>
										<p>leslie@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar4.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Leslie Alexander</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #478</p>
										<p>leslie@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
						<div class="col">
							<div class="card card-user">
								<div class="card-header">
									<img class="img-md img-avatar" src="images/people/avatar1.jpg" alt="User pic">
								</div>
								<div class="card-body">
									<h5 class="card-title mt-5">Marx Alberto</h5>
									<div class="card-text text-muted">
										<p class="m-0">Seller ID: #478</p>
										<p>leslie@example.com</p>
										<a class="btn btn-light" href="#">View profile</a>
									</div>
								</div>
							</div>
						</div> <!-- col.// -->
					</div> <!-- row.// -->
					
					<nav class="float-end mt-4" aria-label="Page navigation">
                      <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                    </nav>
				</div> <!-- card-body end// -->
			</div> <!-- card end// -->


		</section> <!-- content-main end// -->
	</main>


<script type="text/javascript">
	if(localStorage.getItem("darkmode")){
		var body_el = document.body;
		body_el.className += 'dark';
	}
</script>

<script src="js/jquery-3.5.0.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-sellers-cards.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:46 GMT -->
</html>