<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.dao.admin.BrandsDao"%>
<%@page import="hybridstore.model.BrandsModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-brands.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:49 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
		    $(document).ready(function() {
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
	
			<section class="content-main">
	
				<div class="content-header">
					<h2 class="content-title">Brands</h2>
					<div>
						<a href="#" class="btn btn-outline-danger" style="display: none;" onclick="deleteBrand()" id="delete"> &times; Discard</a>
						<a href="admin-addbrand.jsp" class="btn btn-primary">
							<i class="material-icons md-plus"></i> Add new
						</a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<div class="row gx-3">
<% 
	ArrayList<BrandsModel> brandlist = new ArrayList<BrandsModel>();
	brandlist.addAll(new BrandsModel().getAllBrands());
	if(brandlist.isEmpty())
	{
%>
							<div class="col-xl-2 col-lg-3 col-md-4 col-6">
								<p class="text-center">No Records Found</p>
							</div>
<% 
	}
	else
	{ 
		for(BrandsModel brand : brandlist)
		{
			int totalProductsOfBrand = new BrandsDao().getTotalProducts(brand.getBrandid());
			if(totalProductsOfBrand<=0)
			{
				continue;
			}
%>
							<div class="col-xl-2 col-lg-3 col-md-4 col-6">
								<figure class="card border-1">
									<div class="form-check ms-2">
										<input class="form-check-input" type="checkbox" id="myCheck" onchange="removeBrand(<%= brand.getBrandid() %>)">
									</div>
									<!-- style="height: 140px;" class="bg-white" -->
									<div class="card-header bg-transparent text-center">
										<img height="70" src="<%=brand.getLogo()%>" style="max-width: 100%;" alt="<%=brand.getBrandname()%>">
									</div>
									<figcaption class="card-body text-center" style="height: 100px; text-align: center;">
										<h6 class="card-title m-0"><%=brand.getBrandname()%></h6>
										<a href="<%= brand.getWebsite() %>">
											<%= totalProductsOfBrand %> items
										</a>
									</figcaption>
								</figure>
							</div>
							<!-- col.// -->
<%
		}
	}
%>
						</div>
						<!-- row.// -->
					</div>
					<!-- card-body end// -->
				</div>
				<!-- card end// -->
	
				<div class="modal fade" id="confirmDelete" tabindex="-1" aria-labelledby="exampleModalPromoLabel2" aria-hidden="true" data-tor-parent="show">
					<div class="modal-dialog  modal-dialog-centered no-transform">
						<div class="modal-content" data-tor="show(p):{scale.from(75) fade.in} quad">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalPromoLabel2">Delete Brands</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>Are you sure?</p>
							</div>
							<div class="modal-footer">
								<form method="post" action="../BrandsController">
									<span id="BrandIds"></span>
									<button type="submit" name="btn" value="delete brands" class="btn mb-2 btn-danger">Delete</button>
									<button type="submit" data-bs-dismiss="modal" class="btn mb-2 btn-primary">Close</button>
								</form>
							</div>
						</div>
					</div>
				</div>
	
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
	        
	        const ids = [];
	
	        function removeBrand(id) {
	            var deleteBrand = document.getElementById("delete");
	            var index = ids.indexOf(id);
	            if (index === -1) {
	                ids.push(id);
	            }
	            else {
	                var del = ids.splice(index, 1);
	            }
	            if (ids.length > 0) {
	                deleteBrand.style.display = "inline-block";
	            }
	            else {
	                deleteBrand.style.display = "none";
	            }
	        }
	
	        function deleteBrand() {
	            $("#confirmDelete").modal('show');
	            for (var i = 0; i < ids.length; i++) {
	                var txt1 = "<input type=\"hidden\" id=\"brandid\" name=\"brandids\" value=\"" + ids[i] + "\"></input>";
	                $("#BrandIds").append(txt1);
	            }
	        }
	    </script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>
	
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-brands.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:52 GMT -->

</html>