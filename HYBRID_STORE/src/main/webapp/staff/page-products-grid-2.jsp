<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-grid-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
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
	<h2 class="content-title">Products grid</h2>
	<div>
		<a href="#" class="btn btn-light">Export</a>
		<a href="#" class="btn btn-light">Import</a>
		<a href="#" class="btn btn-primary">Create new</a>
	</div>
</div>


<header class="card card-body mb-4">
	<div class="row gx-3">
		<div class="col-lg-4 col-md-6 me-auto">
			<input type="text" placeholder="Search..." class="form-control">
		</div>
		<div class="col-lg-2 col-6 col-md-3">
			<select class="form-select">
				<option>All category</option>
				<option>Electronics</option>
				<option>Clothings</option>
				<option>Something else</option>
			</select>
		</div>
		<div class="col-lg-2 col-6 col-md-3">
			<select class="form-select">
				<option>Latest added</option>
				<option>Cheap first</option>
				<option>Most viewed</option>
			</select>
		</div>
	</div>
</header> <!-- card-header end// -->

<div class="row">
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/1.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Just another product name</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/2.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Brown Winter Jacket for Men</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/3.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Jeans short new model</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/4.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Travel Bag XL</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/5.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Just another product name</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/6.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Just another product name</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/7.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Just another product name</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
</div> <!-- col.// -->
<div class="col-xl-3 col-lg-4 col-md-6">
	<div class="card card-product-grid">
		<a href="#" class="img-wrap"> <img src="images/items/8.jpg" alt="Product"> </a>
		<div class="info-wrap">
			<div class="dropdown float-end">
				<a href="#" data-bs-toggle="dropdown" class="btn btn-icon btn-light"> 
					<i class="material-icons md-edit"></i> 
				</a> 
				<div class="dropdown-menu dropdown-menu-end">
				    <a class="dropdown-item" href="#">Edit info</a>
				    <a class="dropdown-item text-danger" href="#">Delete</a>
				</div>
			</div>
			<a href="#" class="title">Apple Airpods CB-133</a>
			<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
		</div>
	</div> <!-- card-product  end// -->
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-grid-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
</html>