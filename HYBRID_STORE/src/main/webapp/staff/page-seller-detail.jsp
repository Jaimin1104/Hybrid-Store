<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-seller-detail.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
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
    <a href="javascript:history.back()" class="btn btn-light"><i class="material-icons md-arrow_back"></i> Go back </a>
</div>

<div class="card mb-4">
<div class="card-header bg-warning" style="height:150px">
  
</div> 
<div class="card-body">
    <div class="row">
      <div class="col-xl col-lg flex-grow-0" style="flex-basis:230px"> 
        <div class="img-thumbnail shadow w-100 bg-white position-relative text-center" style="height:190px; width:200px; margin-top:-120px">
          <img src="images/brands/brand.jpg" class="center-xy img-fluid" alt="Logo Brand">
        </div>
      </div> <!--  col.// -->
      <div class="col-xl col-lg">
        <h3>Adidas sports shop</h3>
        <p>3891 Ranchview Dr. Richardson, California 62639</p>
      </div> <!--  col.// -->
      <div class="col-xl-4 text-md-end">
          <select class="form-select w-auto d-inline-block">
            <option>Actions</option>
            <option>Disable shop</option>
            <option>Analyze</option>
            <option>Something</option>
          </select>
          <a href="#" class="btn btn-outline-primary"> View live <i class="material-icons md-launch"></i> </a>
      </div> <!--  col.// -->
    </div> <!-- card-body.// -->
    <hr class="my-4">
    <div class="row g-4">
      <div class="col-md-12 col-lg-4 col-xl-2">
        <article class="box">
          <p class="mb-0 text-muted">Total sales:</p>
          <h5 class="text-success">238</h5>
          <p class="mb-0 text-muted">Revenue:</p>
          <h5 class="text-success mb-0">$2380</h5>
        </article>
      </div> <!--  col.// -->
      <div class="col-sm-6 col-lg-4 col-xl-3">
        <h6>Contacts</h6>
        <p>
          Manager: Jerome Bell <br>
          info@example.com <br>
          (229) 555-0109, (808) 555-0111
        </p>
      </div> <!--  col.// -->
      <div class="col-sm-6 col-lg-4 col-xl-3">
        <h6>Address</h6>
        <p>
          Country: California <br>
          Address: Ranchview Dr. Richardson <br>
          Postal code: 62639
        </p>
      </div> <!--  col.// -->
      <div class="col-sm-6 col-xl-4 text-xl-end">
        <map class="mapbox position-relative d-inline-block">
          <img src="images/misc/map.jpg" class="rounded" height="120" alt="map">
          <span class="map-pin" style="top:50px; left: 100px"></span>
          <button class="btn btn-sm btn-light position-absolute bottom-0 end-0 m-2"> Large </button>
        </map>
      </div> <!--  col.// -->
    </div> <!--  row.// -->
</div> <!--  card-body.// -->
</div> <!--  card.// -->


<div class="card mb-4">
<div class="card-body">
  <h5 class="card-title">Products by seller</h5>
  <div class="row">
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/1.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Just another product name</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/2.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Brown Winter Jacket for Men</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/3.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Jeans short new model</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/4.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Travel Bag XL</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/5.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Just another product name</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/6.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Just another product name</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/7.jpg" alt="Product"> </a>
        <div class="info-wrap">
          <a href="#" class="title">Just another product name</a>
          <div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
        </div>
      </div> <!-- card-product  end// -->
    </div> <!-- col.// -->
    <div class="col-xl-3 col-lg-4 col-md-6">
      <div class="card card-product-grid">
        <a href="#" class="img-wrap"> <img src="images/items/8.jpg" alt="Product"> </a>
        <div class="info-wrap">
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

</div> <!--  card-body.// -->
</div> <!--  card.// -->


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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-seller-detail.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
</html>