<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-transactions-B.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->
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
        <h2 class="content-title">Transactions </h2>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-9">
                        <header class="border-bottom mb-4 pb-4">
                            <div class="row">
                                <div class="col-lg-5 col-6 me-auto">
                                    <input type="text" placeholder="Search..." class="form-control">
                                </div>
                                <div class="col-lg-2 col-6">
                                    <select class="form-select">
                                        <option>Method</option>
                                        <option>Master card</option>
                                        <option>Visa card</option>
                                        <option>Paypal</option>
                                    </select>
                                </div>
                            </div>
                        </header> <!-- card-header end// -->
                        <div class="table-responsive">
                        <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Paid</th>
                                <th>Method</th>
                                <th>Date</th>
                                <th class="text-end"> Action </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><b>#456667</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/1.png" alt="Payment">
                                        <span class="text text-muted">Amex</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#134768</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/2.png" alt="Payment">
                                        <span class="text text-muted">Master card</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#134768</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/3.png" alt="Payment">
                                        <span class="text text-muted">Paypal</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#134768</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/4.png" alt="Payment">
                                        <span class="text text-muted">Visa</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#887780</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/4.png" alt="Payment">
                                        <span class="text text-muted">Visa</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#344556</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/4.png" alt="Payment">
                                        <span class="text text-muted">Visa</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#134768</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/2.png" alt="Payment">
                                        <span class="text text-muted">Master card</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#134768</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/2.png" alt="Payment">
                                        <span class="text text-muted">Master card</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#998784</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/3.png" alt="Payment">
                                        <span class="text text-muted">Paypal</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#556667</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/3.png" alt="Payment">
                                        <span class="text text-muted">Paypal</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#098989</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/3.png" alt="Payment">
                                        <span class="text text-muted">Paypal</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                            <tr>
                                <td><b>#134768</b></td>
                                <td>$294.00</td>
                                <td>
                                    <div class="icontext">
                                        <img width="36" class="icon border" src="images/card-brands/4.png" alt="Payment">
                                        <span class="text text-muted">Visa</span>
                                    </div>
                                </td>
                                <td>16.12.2020, 14:21</td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light">Details</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                        </div> <!-- table-responsive.// -->

                    <nav class="float-end mt-4" aria-label="Page navigation">
                      <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                    </nav>

                </div> <!-- col end// -->
                <aside class="col-lg-3">
                    <div class="box bg-light" style="min-height:80%">
                        <h6>Transaction Details</h6>
                        <hr>
                        <h6 class="mb-0">Suplier:</h6> <p>TemplateMount</p>
                        <h6 class="mb-0">Date:</h6> <p>December 19th, 2020</p>
                        <h6 class="mb-0">Billing address</h6> <p>1901 Thornridge Cir. Shiloh, Hawaii 81063</p>
                        <h6 class="mb-0">VAT ID:</h6> <p>54741654160</p>
                        <h6 class="mb-0">Email:</h6> <p>support@example.com</p>
                        <h6 class="mb-0">Item purchased:</h6>
                        <p> 
                            <a href="#"> Adidas Air Jordan <i class="icons material-icons md-launch"></i>  </a> 
                            <br>  
                            <a href="#"> Great product <i class="icons material-icons md-launch"></i>  </a> 
                        </p>
                       
                        <p>Payment:  PayPal</p>
                        <p class="h4">$457.14</p> 
                        <hr>
                        <a class="btn btn-light" href="#"> Download receipe </a>
                     
                    </div>
                </aside> <!-- col // -->
            </div> <!-- row // -->
        </div> <!-- card-body // -->
    </div> <!-- card // -->



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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-transactions-B.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->
</html>