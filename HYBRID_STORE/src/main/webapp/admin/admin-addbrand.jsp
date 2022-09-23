<%@page import="hybridstore.model.AdminModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

	<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

	<head>
        <%@ include file="admin-head.jsp" %>
		<script>
            $(document).ready(function () {
                $("#admin-brands").addClass("active");
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

			<section class="content-main" style="max-width: 1200px">
	
				<div class="content-header">
					<h2 class="content-title">New Brand</h2>
					<div>
						<a href="admin-addbrand.jsp" class="btn btn-outline-danger"> &times; Discard </a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<form method="post" action="../BrandsController" enctype="multipart/form-data">
							<div class="mb-4 form-group">
								<label for="brandname" class="form-label">Brand Name</label> 
								<input type="text" class="form-control" name="brandname" placeholder="Brand Name" required="required">
							</div>
							<div class="mb-4 form-group">
								<label for="website" class="form-label">Website</label>
								<input type="url" class="form-control" name="brandwebsite" placeholder="Website">
							</div>
							<div class="mb-4 form-group">
								<label for="email" class="form-label">Email</label>
								<input type="email" class="form-control" name="brandemail" placeholder="Email">
							</div>
							<div class="mb-4 form-group">
								<label for="logo" class="form-label">Logo</label>
								<input type="file" class="form-control" name="brandlogo" id="brandlogo" placeholder="Logo" required="required">
							</div>
							<div class="text-left">
								<input type="submit" name="btn" value="Add Brand" class="btn btn-primary">
							</div>
						</form>
					</div>
				</div>
				<!-- card end// -->
			</section>
			<!-- content-main end// -->
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

</html>