<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function() {
				$("#admin-branches").addClass("active");
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
					<h2 class="content-title">Branch Info</h2>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-4">
								<form action="../BranchesController" method="post">
<%
	int branchid = Integer.parseInt(request.getParameter("branchid"));
	BranchesModel branch = new BranchesModel().getBranch(branchid);
%>
									<div class="mb-4">
										<input type="text" name="branchid" hidden="true" value="<%=request.getParameter("branchid")%>" class="form-control" />
										<label for="branchname" class="form-label">Name</label>
										<input type="text" name="branchname" value="<%=branch.getBranchname()%>" class="form-control" />
									</div>
									<div class="mb-4">
										<label for="status" class="form-label">Status</label>
										<div>
											<select class="form-select" name="status">
												<option><%=branch.getStatus()%></option>
<%
	if (branch.getStatus().equalsIgnoreCase("active"))
	{
%>
												<option>Deactive</option>
<%
	}
	else
	{
%>
												<option>Active</option>
<%
	}
%>
											</select>
										</div>
									</div>
									<div class="mb-4">
										<label for="address" class="form-label">Address</label>
										<textarea class="form-control" name="address" rows="4"><%=branch.getAddress()%></textarea>
									</div>
									<div class="mb-4">
										<label for="pincode" class="form-label">Pincode</label>
										<input type="text" name="pincode" value="<%=branch.getPincode()%>" class="form-control" />
									</div>
									<div class="d-grid">
										<input type="submit" name="btn" class="btn btn-primary" value="Update">
									</div>
								</form>
							</div>
							<!-- .col// -->
						</div>
						<!-- .row // -->
					</div>
					<!-- card body .// -->
				</div>
				<!-- card .// -->
			</section>
			<!-- content-main end// -->
	
		</main>
	
		<script>
			if (localStorage.getItem("darkmode")) {
				var body_el = document.body;
				body_el.className += 'dark';
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

</html>