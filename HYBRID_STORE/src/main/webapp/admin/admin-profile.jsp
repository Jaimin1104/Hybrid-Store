<%@page import="hybridstore.model.AdminModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-settings-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
		      $(document).ready(function () {
		        $("#admin-dashboard").addClass("active");
		      });
		</script>
	</head>

	<body>
	
		<%@ include file="admin-aside-bar.jsp"%>
	
		<main class="main-wrap">
	
			<header class="main-header navbar">
                <div class="col-search">
                    <form class="searchform">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search here..." id="searchInAdmin">
                            <button class="btn btn-light bg" type="button" id="searchBtn" onclick="searchAdmin()"> 
                                <i class="material-icons md-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-nav">
                    <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside">
                        <i class="md-28 material-icons md-menu"></i>
                    </button>
                    <ul class="nav">
                        <li class="nav-item" style="margin-right: 7px;">
                            <a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> 
                                <i class="material-icons md-nights_stay"></i>
                            </a>
                        </li>
                        <li class="nav-item" style="margin-right: 7px;">
                            <a class="nav-link" href="admin-profile.jsp">
<%
	AdminModel admin = (AdminModel) (session.getAttribute("admin"));
	if(admin.getProfilepicture()==null || admin.getProfilepicture().equalsIgnoreCase("(null)"))
	{
%>
                            	<img class="img-xs rounded-circle" src="../images/default.png" alt="User">
<%
	}
	else
	{
%>
								<img class="img-xs rounded-circle" src="../<%= admin.getProfilepicture() %>" alt="User">
<%
	}
%>
                            </a>
                        </li>
                        <li class="w-25">
							<a href="../LoginController?action=logout" class="btn btn-outline-primary">Logout</a>
						</li>
                    </ul>
                </div>
            </header>
	
			<section class="content-main">

  <div class="content-header">
    <h2 class="content-title">My Profile</h2>
  </div>

  <div class="card">
    <div class="card-body">
      <div class="row gx-5">
        <!-- <aside class="col-lg-3 border-end">

          <nav class="nav nav-pills flex-lg-column mb-4">
            <a class="nav-link active" aria-current="page" href="#">General</a>
            <a class="nav-link" href="#">Moderators</a>
            <a class="nav-link" href="#">Admin account</a>
            <a class="nav-link" href="#">SEO settings</a>
            <a class="nav-link" href="#">Mail settings</a>
            <a class="nav-link" href="#">Newsletter</a>
          </nav>

        </aside> -->
        <div class="col-lg-9">
          
<section class="content-body p-xl-4">
		<div class="row">
			<div class="col-lg-10">
				<div class="row gx-3">
					<div class="col-6  mb-3">
						<label class="form-label">First name</label>
						<input class="form-control" type="text" value="<%= admin.getFirstname() %>" name="firstname" placeholder="Enter First Name ... " readonly="readonly">
					</div>
					<div class="col-6  mb-3">
						<label class="form-label">Last name</label>
						<input class="form-control" type="text" value="<%= admin.getLastname() %>" name="lastname" placeholder="Enter Last Name ... " readonly="readonly">
					</div>
					<div class="col-lg-12  mb-3">
						<label class="form-label">Username</label>
						<input class="form-control" type="text" value="<%= admin.getUsername() %>" name="username" placeholder="Enter Username ... " readonly="readonly">
					</div>
					<div class="col-lg-12  mb-3">
						<label class="form-label">Email</label>
						<input class="form-control" type="email" value="<%= admin.getEmail() %>" name="email" placeholder="Enter Email ... " readonly="readonly">
					</div>
					<%-- <div class="col-lg-6  mb-3">
						<label class="form-label">Phone</label>
						<input class="form-control" type="tel" value="<%= staffProfile.getPhoneno() %>" name="phone" placeholder="Enter Mobile Number ... " readonly="readonly">
					</div>
					<div class="col-lg-12  mb-3">
						<label class="form-label">Address</label>
						<textarea class="form-control" type="text" name="address" placeholder="Enter Address" readonly="readonly"><%= staffProfile.getAddress() %></textarea>
					</div>
					<div class="col-lg-6  mb-3">
						<label class="form-label">Birthday</label>
						<input class="form-control" type="text" value="<%= staffProfile.getDob() %>" name="dob" readonly="readonly" id="DOB">
					</div> --%>
				</div>
			 </div>
			<aside class="col-lg-2">
				<figure class="text-lg-center">
					<input class="form-control" type="file" id="inputProfilePicture" name="profilepicture" style="display: none;">
<%
	if(admin.getProfilepicture()!=null)
	{
%>                  
					<img class="img-lg mb-3 img-avatar" id="profilepicture" src="../<%= admin.getProfilepicture() %>" alt="User Photo">
<%
	}
	else
	{
%>
					<img class="img-lg mb-3 img-avatar" id="profilepicture" src="../images/default.png" alt="User Photo">
<%
	}
%>
					<figcaption>
						<!-- <a class="btn btn-outline-primary" href="#" style="display: none;">
							<i class="icons material-icons md-backup"></i> Upload
						</a> -->
					</figcaption>
				</figure>
			</aside>
		</div> <!-- row.// -->
		<br>

            <!-- <hr class="my-5">

            <div class="row" style="max-width:920px">
              <div class="col-md">
                <article class="box mb-3 bg-light">
                  <a class="btn float-end btn-light btn-sm" href="#">Change</a>
                  <h6>Password</h6>
                  <small class="text-muted d-block" style="width:70%">You can reset or change your password by clicking here</small>
                </article>
              </div> col.//
              <div class="col-md">
                <article class="box mb-3 bg-light">
                  <a class="btn float-end btn-outline-danger btn-sm" href="#">Deactivate</a>
                  <h6>Remove account</h6>
                  <small class="text-muted d-block" style="width:70%">Once you delete your account, there is no going back.</small>
                </article>
              </div> col.//
            </div> row.// -->


</section>

        </div> <!-- col.// -->
      </div> <!-- row.// -->

    </div> <!-- card body end// -->
  </div> <!-- card end// -->


</section> <!-- content-main end// -->
		</main>
		
		<script type="text/javascript">
			if (localStorage.getItem("darkmode")) {
				var body_el = document.body;
				body_el.className += "dark";
			}
			
			var searchInAdmin = document.getElementById("searchInAdmin");
			// Execute a function when the user releases a key on the keyboard
			searchInAdmin.addEventListener("keypress", function(event) {
			  // Number 13 is the "Enter" key on the keyboard
			  if (event.keyCode === 13) {
			    // Cancel the default action, if needed
			    event.preventDefault();
			    // Trigger the button element with a click
			    document.getElementById("searchBtn").click();
			  }
			});
		</script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>
	
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-settings-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->

</html>