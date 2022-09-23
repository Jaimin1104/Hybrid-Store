<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
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

<section class="content-main" style="max-width:920px">

    <div class="content-header">
        <h2 class="content-title">Add product</h2>
    </div>

    <div class="card mb-4">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <h6>1. General info</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4">
                        <label class="form-label">Product title</label>
                        <input type="text" placeholder="Type here" class="form-control">
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Description</label>
                        <textarea placeholder="Type here" class="form-control" rows="4"></textarea>
                    </div>
                    <div class="mb-4" style="max-width:250px;">
                        <label class="form-label">Brand name</label>
                        <select class="form-select">
                            <option> Adidas </option>
                            <option> Nike </option>
                            <option> Puma </option>
                        </select>
                    </div>
                </div>  <!-- col.// -->
            </div>  <!-- row.// -->
            
            <hr class="mb-4 mt-0">

            <div class="row"> 
                <div class="col-md-4">
                    <h6>2. Pricing</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4" style="max-width:250px;">
                         <label class="form-label">Cost in USD</label>
                        <input type="text" placeholder="00.0" class="form-control">
                    </div>
                </div> <!-- col.// -->
            </div> <!-- row.// -->

            <hr class="mb-4 mt-0">

            <div class="row"> 
                <div class="col-md-4">
                    <h6>3. Category</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4">
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" checked="" name="mycategory" type="radio">
                            <span class="form-check-label">  Clothes </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Electronics </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Sports </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Automobiles </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Home interior </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Smartphones </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Books </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Kids item </span>
                        </label>
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input" name="mycategory" type="radio">
                            <span class="form-check-label">  Others </span>
                        </label>
                    </div>
                </div> <!-- col.// -->
            </div> <!-- row.// -->
            
            <hr class="mb-4 mt-0">

            <div class="row"> 
                <div class="col-md-4">
                    <h6>4. Media</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4">
                        <label class="form-label">Images</label>
                        <input class="form-control" type="file">
                    </div>
                </div> <!-- col.// -->
            </div> <!-- .row end// -->
            <hr class="mb-4 mt-0">

            <div class="d-flex justify-content-end gap-2">
                <button type="button" class="btn btn-light">Save as draft</button>
                <button type="button" class="btn btn-primary">Save and activate </button>
            </div>
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

<!-- Custom JS -->
<script src="js/scriptc619.js?v=1.0"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
</html>