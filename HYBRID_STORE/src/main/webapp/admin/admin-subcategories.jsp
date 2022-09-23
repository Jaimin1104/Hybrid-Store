<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.CategoriesModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

<head>
<%@ include file="admin-head.jsp"%>
<script>
			$(document).ready(function() {
				$("#admin-products").addClass("active");
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
				<h2 class="content-title">Sub Categories</h2>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-4">
							<form action="../SubCategoriesController" method="post">
								<div class="mb-4">
									<label for="subcategory_name" class="form-label">Name</label>
									<input
										type="text" placeholder="Type here" class="form-control"
										name="subcategoryname" required="required"/>
								</div>
								<div class="mb-4">
									<label class="form-label">Categories</label>
									<select class="form-select" name="categoryname" required="required">
										<%
										ArrayList<CategoriesModel> categorylist = new CategoriesModel().getAllCategories();
										for (CategoriesModel category : categorylist) {
										%>
										<option><%=category.getCategoryname()%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="mb-4">
									<label class="form-label">Description</label>
									<textarea placeholder="Type here" class="form-control" name="description" rows="4" required="required"></textarea>
								</div>
								<div class="d-grid">
									<button class="btn btn-primary" name="btn"
										value="add subcategory">Create</button>
								</div>
							</form>
						</div>
						<div class="col-md-8" style="height: 400px; overflow-y: scroll;">
							<table class="table table-hover">
								<thead>
									<tr>
										<!-- <th>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" />
												</div>
											</th> -->
										<th>ID</th>
										<th>Name</th>
										<th>Description</th>
										<th>Category Name</th>
										<!-- <th>Order</th> -->
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									ArrayList<SubCategoriesModel> subcategorylist = new SubCategoriesModel().getAllSubCategories();
									if (subcategorylist.isEmpty()) {
									%>
									<tr>
										<td class="text-center" colspan="6">No Subcategory Found</td>
									</tr>
									<%
									} else {
									for (SubCategoriesModel subcategory : subcategorylist) {
										CategoriesModel category = new CategoriesModel().getCategory(subcategory.getCategoryid());
									%>
									<tr>
										<!-- <td>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" />
												</div>
											</td> -->
										<td><%=subcategory.getSubcategoryid()%></td>
										<td><b><%=subcategory.getSubcategoryname()%></b></td>
										<td><%=subcategory.getDescription()%></td>
										<td><%=category.getCategoryname()%></td>
										<!-- <td>1</td> -->
										<td class="text-center">
											<div class="dropdown">
												<button name="btn" value="delete subcategory"
													onclick="deleteSubCategory(<%=subcategory.getSubcategoryid()%>)"
													class="btn btn-outline-danger">Delete</button>
											</div> <!-- dropdown //end -->
										</td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
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

		<div class="modal fade" id="confirmDelete" tabindex="-1"
			aria-labelledby="exampleModalPromoLabel2" aria-hidden="true"
			data-tor-parent="show">
			<div class="modal-dialog  modal-dialog-centered no-transform">
				<div class="modal-content"
					data-tor="show(p):{scale.from(75) fade.in} quad">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalPromoLabel2">Delete
							Product</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Are you sure?</p>
					</div>
					<div class="modal-footer">
						<form method="post" action="../SubCategoriesController">
							<input type="hidden" id="subcategoryid" name="subcategoryid"></input>
							<button type="submit" name="btn" value="delete subcategory"
								class="btn mb-2 btn-danger">Delete</button>
							<button type="submit" data-bs-dismiss="modal"
								class="btn mb-2 btn-primary">Close</button>
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
			
			function deleteSubCategory(subcategoryid)
			{
				$('#confirmDelete #subcategoryid').val(subcategoryid);
				$("#confirmDelete").modal('show');
			}
		</script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- Custom JS -->
	<script src="js/search.js"></script>
	<script src="js/scriptc619.js?v=1.0"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

</html>