<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-sellers-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
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
        <h2 class="content-title">Sellers list</h2>
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
                            <th>Seller</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Registered</th>
                            <th class="text-end"> Action </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar1.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Eleanor Pena</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>eleanor2020@example.com</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar2.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Mary Monasa</h6>
                                        <small class="text-muted">Seller ID: #129</small>
                                    </div>
                                </a>
                            </td>
                            <td>monalisa@example.com</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>11.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar3.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Jonatan Ive</h6>
                                        <small class="text-muted">Seller ID: #400</small>
                                    </div>
                                </a>
                            </td>
                            <td>mrjohn@example.com</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar4.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Eleanor Pena</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>eleanor2020@example.com</td>
                            <td><span class="badge rounded-pill alert-danger">Inactive</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar1.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Albert Pushkin</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>someone@mymail.com</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>20.11.2019</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar2.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Alexandra Pena</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>eleanor2020@example.com</td>
                            <td><span class="badge rounded-pill alert-danger">Inactive</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar3.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Eleanor Pena</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>eleanor2020@example.com</td>
                            <td><span class="badge rounded-pill alert-danger">Inactive</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar4.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Alex Pushkina</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>alex@gmail.org</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar1.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Eleanor Pena</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>eleanor2020@example.com</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                <a href="#" class="itemside">
                                    <div class="left">
                                        <img src="images/people/avatar2.jpg" class="img-sm img-avatar" alt="Userpic">
                                    </div>
                                    <div class="info pl-3">
                                        <h6 class="mb-0 title">Eleanor Pena</h6>
                                        <small class="text-muted">Seller ID: #439</small>
                                    </div>
                                </a>
                            </td>
                            <td>eleanor2020@example.com</td>
                            <td><span class="badge rounded-pill alert-success">Active</span></td>
                            <td>08.07.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">View</a>
                            </td>
                        </tr>
                    </tbody>
                </table> <!-- table-responsive.// -->
            </div>

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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-sellers-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->
</html>