<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-sellers-cards.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:45 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function() {
				$("#admin-staff").addClass("active");
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
					<h2 class="content-title">Staff Members</h2>
					<div>
						<a href="admin-addstaff.jsp" class="btn btn-primary">
							<i class="material-icons md-plus"></i> Add new 
						</a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4">
<%
	ArrayList<StaffModel> staffMembers = new StaffModel().getAllStaff();
	for (StaffModel staffMember : staffMembers)
	{
%>
							<div class="col">
								<div class="card card-user">
									<div class="card-header">
<%
		if (staffMember.getProfilepicture() == null)
		{
%>
										<img class="img-md img-avatar" style="border: none" src="..\images\default.png" alt="User pic">
<%
		}
		else
		{
%>
										<img class="img-md img-avatar" style="border: none" src="..\<%=staffMember.getProfilepicture()%>" alt="User pic">
<%
		}
%>
									</div>
									<div class="card-body" style="min-height: 250px; max-height:250px;">
										<h5 class="card-title mt-5"><%=staffMember.getFirstname() + " " + staffMember.getLastname()%></h5>
										<div class="card-text text-muted" style="height: 85px;">
											<p class="m-0"> Staff ID: <%=staffMember.getStaffid()%></p>
											<p><%=staffMember.getEmail()%></p>											
										</div>
										<div class="row">
											<a class="col-md-6 btn btn-outline-secondary" style="margin:1%;width: 48%;font-size: smaller;" href="admin-staffprofile.jsp?staffid=<%=staffMember.getStaffid()%>">View profile</a> 
											<button class="btn col-md-6 btn-outline-danger" style="margin:1%;width: 48%;font-size: smaller;" onclick="deleteStaff(<%=staffMember.getStaffid()%>)"> &times; Discard</button>
										</div>
									</div>
								</div>
							</div>
							<!-- col.// -->
<%
	}
%>
						</div>
						<!-- row.// -->
					</div>
					<!-- card-body end// -->
				</div>
				<!-- card end// -->
			</section>
			<!-- content-main end// -->
			
			<div class="modal fade" id="confirmDeletes" tabindex="-1" aria-labelledby="exampleModalPromoLabel2" aria-hidden="true" data-tor-parent="show">
				<div class="modal-dialog  modal-dialog-centered no-transform">
					<div class="modal-content" data-tor="show(p):{scale.from(75) fade.in} quad">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalPromoLabel2">Delete Consumer</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Are you sure?</p>
						</div>
						<div class="modal-footer">
							<form method="post" action="../StaffController">
								<span id="StaffIds"></span>
								<button type="submit" name="btn" value="delete staff" class="btn mb-2 btn-danger">Delete</button>
								<button type="submit" data-bs-dismiss="modal" class="btn mb-2 btn-primary">Close</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
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
			
			function deleteStaff(id) {
	            $("#confirmDeletes").modal('show');
	            var txt1 = "<input type=\"hidden\" id=\"staffId\" name=\"staffid\" value=\"" + id + "\"></input>";
	            $("#StaffIds").append(txt1);
	        }
		</script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>
	
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-sellers-cards.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:46 GMT -->

</html>