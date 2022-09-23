<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-error-404.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->
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

          <div class="row" style="margin-top:60px">
              <div class="col-sm-12">
                  <div class="w-50 mx-auto text-center">
                      <img src="images/not-found.png" width="350" alt="Page Not Found">
              <h3 class="mt-4">Oops! Page not found</h3>
              <p>It's looking like you may have taken a wrong turn. Don't worry... it happens to the best of us. Here's a little tip that might help you get back on track.</p>
              <a href="page-index-1.jsp" class="btn btn-primary mt-4">Back to main</a>
                  </div>
              </div>
          </div>


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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-error-404.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->
</html>