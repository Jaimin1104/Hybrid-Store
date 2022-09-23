<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-settings-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->
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
    <h2 class="content-title">Profile setting </h2>
  </div>

  <div class="card">
    <div class="card-body">
      <div class="row gx-5">
        <aside class="col-lg-3 border-end">

          <nav class="nav nav-pills flex-lg-column mb-4">
            <a class="nav-link active" aria-current="page" href="#">General</a>
            <a class="nav-link" href="#">Moderators</a>
            <a class="nav-link" href="#">Admin account</a>
            <a class="nav-link" href="#">SEO settings</a>
            <a class="nav-link" href="#">Mail settings</a>
            <a class="nav-link" href="#">Newsletter</a>
          </nav>

        </aside>
        <div class="col-lg-9">
          
          <section class="content-body p-xl-4">
            <form>
              <div class="row">
                <div class="col-lg-8">
                  <div class="row gx-3">
                    <div class="col-6  mb-3">
                      <label class="form-label">First name</label>
                      <input class="form-control" type="text"  placeholder="Type here">
                    </div> <!-- col .// -->
                    <div class="col-6  mb-3">
                      <label class="form-label">Last name</label>
                      <input class="form-control" type="text"  placeholder="Type here">
                    </div> <!-- col .// -->
                    <div class="col-lg-6  mb-3">
                      <label class="form-label">Email</label>
                      <input class="form-control" type="email"  placeholder="example@mail.com">
                    </div> <!-- col .// -->
                    <div class="col-lg-6  mb-3">
                      <label class="form-label">Phone</label>
                      <input class="form-control" type="tel" placeholder="+1234567890">
                    </div> <!-- col .// -->
                    <div class="col-lg-12  mb-3">
                      <label class="form-label">Address</label>
                      <input class="form-control" type="text"  placeholder="Type here">
                    </div> <!-- col .// -->
                    <div class="col-lg-6  mb-3">
                      <label class="form-label">Birthday</label>
                      <input class="form-control" type="date">
                    </div> <!-- col .// -->
                  </div> <!-- row.// -->
                </div> <!-- col.// -->
                <aside class="col-lg-4">
                  <figure class="text-lg-center">
                    <img class="img-lg mb-3 img-avatar" src="images/people/avatar1.jpg" alt="User Photo">
                    <figcaption>
                      <a class="btn btn-outline-primary" href="#">
                        <i class="icons material-icons md-backup"></i> Upload
                      </a>
                    </figcaption>
                  </figure>
                </aside> <!-- col.// -->
              </div> <!-- row.// -->
              <br>
              <button class="btn btn-primary" type="submit">Save changes</button>
            </form>

            <hr class="my-5">

            <div class="row" style="max-width:920px">
              <div class="col-md">
                <article class="box mb-3 bg-light">
                  <a class="btn float-end btn-light btn-sm" href="#">Change</a>
                  <h6>Password</h6>
                  <small class="text-muted d-block" style="width:70%">You can reset or change your password by clicking here</small>
                </article>
              </div> <!-- col.// -->
              <div class="col-md">
                <article class="box mb-3 bg-light">
                  <a class="btn float-end btn-outline-danger btn-sm" href="#">Deactivate</a>
                  <h6>Remove account</h6>
                  <small class="text-muted d-block" style="width:70%">Once you delete your account, there is no going back.</small>
                </article>
              </div> <!-- col.// -->
            </div> <!-- row.// -->


          </section> <!-- content-body .// -->

        </div> <!-- col.// -->
      </div> <!-- row.// -->

    </div> <!-- card body end// -->
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-settings-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->
</html>