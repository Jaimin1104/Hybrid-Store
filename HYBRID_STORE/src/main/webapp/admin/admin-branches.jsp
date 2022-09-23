<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.dao.admin.BranchesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:42 GMT -->

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
	
			<form action="../BranchesController" method="post">
				<section class="content-main">
					<div class="content-header">
						<h2 class="content-title">Branches</h2>
						<div>
							<a href="admin-addbranch.jsp" class="btn btn-primary">
								<i class="material-icons md-plus"></i> Add new 
							</a>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-body">
<%
	ArrayList<BranchesModel> branches = new BranchesModel().getAllBranches();
	for (BranchesModel branch : branches) 
	{
%>
							<!-- itemlist  .// -->
							<article class="itemlist">
								<div class="row align-items-center">
									<div class="col-lg-2 col-sm-2 col-4 col-name">
										<a class="itemside" href="#">
											<div class="left">
												<h6 class="mb-0"><%=branch.getBranchid()%></h6>
											</div>
											<div class="info">
												<h6 class="mb-0"><%=branch.getBranchname()%></h6>
											</div>
										</a>
									</div>
									<div class="col-lg-2 col-sm-2 col-4 col-status">
<%
		if (branch.getStatus().equalsIgnoreCase("active")) {
%>
										<span class="badge rounded-pill alert-success" id="branchid"><%=branch.getStatus()%></span>
<%
		}
		else
		{
%>
										<span class="badge rounded-pill alert-danger" id="branchid"><%=branch.getStatus()%></span>
<%
		}
%>
									</div>
									<div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-address">
										<span><%=branch.getAddress()%></span>
									</div>
									<div class="col-lg-2 col-sm-2 col-4 col-pincode">
										<span><%=branch.getPincode()%></span>
									</div>
									<div class="col-lg-1 col-sm-2 col-4 col-action">
										<div class="dropdown float-end">
											<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
												<i class="material-icons md-more_horiz"></i>
											</a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="admin-editbranchinfo.jsp?action=editinfo&branchid=<%=branch.getBranchid()%>">Edit info</a>
												<a class="dropdown-item text-danger" type="submit" href="../BranchesController?action=remove&branchid=<%=branch.getBranchid()%>">Remove </a>
											</div>
										</div>
										<!-- dropdown // -->
									</div>
								</div>
								<!-- row .// -->
							</article>
							<!-- itemlist  .// -->
<%
	}
%>
						</div>
						<!-- card-body end// -->
					</div>
					<!-- card end// -->
				</section>
			</form>
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

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:43 GMT -->

</html>