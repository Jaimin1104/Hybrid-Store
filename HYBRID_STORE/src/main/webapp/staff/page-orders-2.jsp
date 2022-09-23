<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
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
            <h2 class="content-title">Orders two</h2>
            <div>
                <a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
            </div>
        </div>

        <div class="row">
            <div class="col-md-9">
                <div class="card mb-4">
                    <header class="card-header">
                        <div class="row gx-3">
                            <div class="col-lg-4 col-md-6 me-auto">
                                <input type="text" placeholder="Search..." class="form-control">
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
                    </header> <!-- card-header end// -->
                    <div class="card-body">
                        <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Customer name</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th class="text-end"> Action </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>452</td>
                                    <td><b>Devon Lane</b></td>
                                    <td>$948.55</td>
                                    <td><span class="badge rounded-pill alert-success">Received</span></td>
                                    <td>07.05.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>789</td>
                                    <td><b>Guy Hawkins</b></td>
                                    <td>$0.00</td>
                                    <td><span class="badge rounded-pill alert-danger">Cancelled</span></td>
                                    <td>25.05.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>478</td>
                                    <td><b>Leslie Alexander</b></td>
                                    <td>$293.01</td>
                                    <td><span class="badge rounded-pill alert-warning">Pending</span></td>
                                    <td>18.05.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>589</td>
                                    <td><b>Albert Flores</b></td>
                                    <td>$105.55</td>
                                    <td><span class="badge rounded-pill alert-warning">Pending</span></td>
                                    <td>07.02.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td><b>Eleanor Pena</b></td>
                                    <td>$779.58</td>
                                    <td><span class="badge rounded-pill alert-success">Received</span></td>
                                    <td>18.03.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>456</td>
                                    <td><b>Dianne Russell</b></td>
                                    <td>$576.28</td>
                                    <td><span class="badge rounded-pill alert-success">Received</span></td>
                                    <td>23.04.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>768</td>
                                    <td><b>Savannah Nguyen</b></td>
                                    <td>$589.99</td>
                                    <td><span class="badge rounded-pill alert-success">Received</span></td>
                                    <td>18.05.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>977</td>
                                    <td><b>Kathryn Murphy</b></td>
                                    <td>$169.43</td>
                                    <td><span class="badge rounded-pill alert-success">Received</span></td>
                                    <td>23.03.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>687</td>
                                    <td><b>Jacob Jones</b></td>
                                    <td>$219.78</td>
                                    <td><span class="badge rounded-pill alert-success">Received</span></td>
                                    <td>07.05.2020</td>
                                    <td class="text-end">
                                        <a href="#" class="btn btn-light">Detail</a>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                    class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">View detail</a>
                                                <a class="dropdown-item" href="#">Edit info</a>
                                                <a class="dropdown-item text-danger" href="#">Delete</a>
                                            </div>
                                        </div> <!-- dropdown //end -->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div> <!-- table-responsive //end -->
                    </div> <!-- card-body end// -->
                </div> <!-- card end// -->
            </div>
            <div class="col-md-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="mb-3">Filter by</h5>
                        <form>
                            <div class="mb-4">
                                <label for="order_id" class="form-label">Order ID</label>
                                <input type="text" placeholder="Type here" class="form-control" id="order_id">
                            </div>
                            <div class="mb-4">
                                <label for="order_customer" class="form-label">Customer</label>
                                <input type="text" placeholder="Type here" class="form-control" id="order_customer">
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Order Status</label>
                                <select class="form-select">
                                    <option>Published</option>
                                    <option>Draft</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="order_total" class="form-label">Total</label>
                                <input type="text" placeholder="Type here" class="form-control" id="order_total">
                            </div>
                            <div class="mb-4">
                                <label for="order_created_date" class="form-label">Date Added</label>
                                <input type="text" placeholder="Type here" class="form-control" id="order_created_date">
                            </div>
                            <div class="mb-4">
                                <label for="order_modified_date" class="form-label">Date Modified</label>
                                <input type="text" placeholder="Type here" class="form-control" id="order_modified_date">
                            </div>
                            <div class="mb-4">
                                <label for="order_customer_1" class="form-label">Customer</label>
                                <input type="text" placeholder="Type here" class="form-control" id="order_customer_1">
                            </div>
                        </form>
                    </div>
                </div> <!-- card end// -->
            </div>
        </div>
        <!-- .row end// -->


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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
</html>