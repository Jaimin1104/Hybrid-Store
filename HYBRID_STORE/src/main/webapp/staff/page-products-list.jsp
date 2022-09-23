<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:42 GMT -->
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
                <h2 class="content-title">Products list </h2>
                <div>
                    <a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
                </div>
            </div>

            <div class="card mb-4">
                <header class="card-header">
                    <div class="row align-items-center">
                        <div class="col col-check flex-grow-0">
                            <div class="form-check ms-2">
                                <input class="form-check-input" type="checkbox" value="">
                            </div>
                        </div>
                        <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                            <select class="form-select">
                                <option>All category</option>
                                <option>Electronics</option>
                                <option>Clothes</option>
                                <option>Automobile</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-6">
                            <input type="date" class="form-control">
                        </div>
                        <div class="col-md-2 col-6">
                            <select class="form-select">
                                <option>Status</option>
                                <option>Active</option>
                                <option>Disabled</option>
                                <option>Show all</option>
                            </select>
                        </div>
                    </div>
                </header> <!-- card-header end// -->
                
                <div class="card-body">

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/1.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">T-shirt for men medium size</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$34.50</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>04.12.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    
                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$990.99</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>02.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/3.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Lace mini dress with faux leather</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                <span class="badge rounded-pill alert-warning">Archived</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>13.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/4.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Fanmis Men's Travel Bag</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$18.00</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>02.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/3.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Jeans Shorts for Men</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                <span class="badge rounded-pill alert-danger">Disabled</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>13.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/5.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Wallet made of leather brown color</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$18.00</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                 <span class="badge rounded-pill alert-warning">Archived</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>02.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/6.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Modern Armchair for home interiors</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                 <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>13.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/4.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Lace mini dress with faux leather</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$18.00</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                 <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>31.01.2021</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/3.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Lace mini dress with faux leather</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                 <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>13.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->

                    <article class="itemlist">
                        <div class="row align-items-center">
                            <div class="col col-check flex-grow-0">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                <a class="itemside" href="#">
                                    <div class="left">
                                        <img src="images/items/4.jpg" class="img-sm img-thumbnail" alt="Item">
                                    </div>
                                    <div class="info">
                                        <h6 class="mb-0">Lace mini dress with faux leather</h6>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$180.99</span> </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-status">
                                <span class="badge rounded-pill alert-success">Active</span>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-4 col-date">
                                <span>02.11.2020</span>
                            </div>
                            <div class="col-lg-1 col-sm-2 col-4 col-action">
                                <div class="dropdown float-end">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">View detail</a>
                                        <a class="dropdown-item" href="#">Edit info</a>
                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                    </div>
                                </div> <!-- dropdown // -->
                            </div>
                        </div> <!-- row .// -->
                    </article>  <!-- itemlist  .// -->


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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:43 GMT -->
</html>