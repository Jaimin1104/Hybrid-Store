<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-0-blank.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->
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
		<h2 class="content-title">Blank page </h2>
		<div>
			<a href="#" class="btn btn-primary">Create new</a>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-body">
			<h5 class="card-title">Card heading</h5>
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
			cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
			proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
		</div>
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

<!-- ChartJS files-->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- Custom JS -->
<script src="js/scriptc619.js?v=1.0"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-0-blank.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->
</html>