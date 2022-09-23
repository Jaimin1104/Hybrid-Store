<%@page import="hybridstore.model.AdminModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.StockModel"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="hybridstore.model.BrandsModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="hybridstore.model.CategoriesModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-categories.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function() {
				$("#admin-products").addClass("active");
			});
			/* window.onload = function(){
				var url = window.location.search.substring(1);
				var queryString = url.split("&");
				var id = document.getElementById("firstBranchid");
				if(queryString.length == 1)
				{
					var branchid = id.innerHTML;
					window.location.href = "admin-stock.jsp?" + queryString[0] + "&branchid=" + branchid;
				}
			} */
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
            
<%
	ProductsModel product = new ProductsModel();
	CategoriesModel productcategory = new CategoriesModel();
	SubCategoriesModel productsubcategory = new SubCategoriesModel();
	BrandsModel productbrand = new BrandsModel();
	BranchesModel productbranch = new BranchesModel();
	ArrayList<StockModel> allStockOfProduct = new StockModel().getAllStock(Integer.parseInt(request.getParameter("productid")));
	int stock = new StockModel().getProductStock(Integer.parseInt(request.getParameter("branchid")),Integer.parseInt(request.getParameter("productid")));
	product = product.getProduct(Integer.parseInt(request.getParameter("productid")));
	productcategory = productcategory.getCategory(product.getCategoryid());
	productsubcategory = productsubcategory.getSubCategory(product.getSubcategoryid());
	productbrand = productbrand.getBrand(product.getBrandid());
%>
			<div style="display:none">
<%
	if(!allStockOfProduct.isEmpty())
	{
%>
				<span id="firstBranchid"><%= allStockOfProduct.get(0).getBranchid() %></span>
<%
	}
	for(StockModel stockmodel : allStockOfProduct)
	{
%>
				<span class="StockInBranchName"><%= new BranchesModel().getBranch(stockmodel.getBranchid()).getBranchname() %></span>
				<span class="StockInBranchStock"><%= stockmodel.getStock() %></span>			
<%
	}
%>
			</div>
			<section class="content-main">
				<div class="content-header">
					<h2 class="content-title">Stock</h2>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-4">
								<form action="../StockController" method="post">
									<div class="mb-4">
										<label for="product_name" class="form-label">Name</label>
										<input type="text" readonly="readonly" value="<%=product.getProductname()%>" class="form-control" />
									</div>
									<div class="mb-4">
										<label for="product_brand" class="form-label">Brand</label>
										<input type="text" readonly="readonly" value="<%=productbrand.getBrandname()%>" class="form-control" />
									</div>
									<div class="mb-4">
										<label for="product_subcategory" class="form-label">Subcategory</label>
										<input type="text" readonly="readonly" value="<%=productsubcategory.getSubcategoryname()%>" class="form-control" />
									</div>
									<div class="mb-4">
										<label for="product_category" class="form-label">Category</label>
										<input type="text" readonly="readonly" value="<%=productcategory.getCategoryname()%>" class="form-control" />
									</div>
									<div class="mb-4">
										<label for="product_price" class="form-label">Price</label>
										<input type="text" readonly="readonly" value="<%=product.getPrice()%>" class="form-control" />
									</div>
									<div class="mb-4">
										<label class="form-label">Branch</label>
										<input value="<%= new BranchesModel().getBranch(Integer.parseInt(request.getParameter("branchid"))).getBranchname() %>" onchange="manageStock(this)" autocomplete="off" class="form-control" placeholder="Search Here..." list="branch" name="branchname" id="branches" required="required">
										<datalist id="branch">
<%
	ArrayList<BranchesModel> branchlist = new BranchesModel().getAllBranches();
	for (BranchesModel branch : branchlist)
	{
%>
											<option value="<%=branch.getBranchname()%>">
<%
	}
%>
										</datalist>
									</div>
<%
	if (stock == -1)
	{
%>
									<div class="mb-4">
										<input type="hidden" name="productid" value="<%=product.getProductid()%>" />
										<label class="form-label">Stock</label>
										<input type="text" name="stock" placeholder="Add Stock" class="form-control" />
									</div>
									<div class="d-grid">
										<button class="btn btn-primary" name="btn" value="add stock">Add</button>
									</div>
<%
	}
	else
	{
%>
									<div class="mb-4">
										<input type="hidden" name="productid" value="<%=product.getProductid()%>" />
										<label class="form-label">Stock</label>
										<input type="text" id="branchStock" value="<%= stock %>" name="stock" placeholder="Update Stock" class="form-control" required="required"/>
									</div>
									<div class="d-grid">
										<button class="btn btn-primary" id="mngStock" name="btn" value="update stock">Update Stock</button>
									</div>
<%
	}
%>
								</form>
							</div>
							<div class="col-md-8" style="height: 700px; overflow-y: scroll;">
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
											<th>Category</th>
											<th>Subcategory</th>
											<th>Brand</th>
											<th>Branch</th>
											<th>Price</th>
											<th>Stock</th>
											<th class="text-end">Action</th>
										</tr>
									</thead>
									<tbody>
<%
	ArrayList<StockModel> stocklist = new StockModel().getAllStock();
	if (stocklist.isEmpty())
	{
%>
										<tr>
											<td class="text-center">No Product Stock Found</td>
										</tr>
<%
	}
	else
	{
		for (StockModel productstock : stocklist)
		{
			product = product.getProduct(productstock.getProductid());
			productcategory = productcategory.getCategory(product.getCategoryid());
			productsubcategory = productsubcategory.getSubCategory(product.getSubcategoryid());
			productbrand = productbrand.getBrand(product.getBrandid());
			productbranch = productbranch.getBranch(productstock.getBranchid());
%>
										<tr>
											<!-- <td>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" />
												</div>
											</td> -->
											<td><%=productstock.getStockid()%></td>
											<td><b><%=product.getProductname()%></b></td>
											<td><%=productcategory.getCategoryname()%></td>
											<td><%=productsubcategory.getSubcategoryname()%></td>
											<td><%=productbrand.getBrandname()%></td>
											<td><%=productbranch.getBranchname()%></td>
											<td>$<%=product.getPrice()%></td>
											<td><%=productstock.getStock()%></td>
											<td class="text-end">
												<a class="btn btn-light" href="admin-stock.jsp?productid=<%=product.getProductid()%>&branchid=<%=productstock.getBranchid()%>">Detail</a>
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
			
			function manageStock(branch) {
				var allStockBranches = document.getElementsByClassName("StockInBranchName");
				var allStock = document.getElementsByClassName("StockInBranchStock"); 
				var stock = document.getElementById("branchStock");
				var btn = document.getElementById("mngStock");
				for(var i = 0; i < allStockBranches.length ; i++)
				{
					if(branch.value == allStockBranches[i].innerHTML)
					{
						stock.value = parseInt(allStock[i].innerHTML);
						btn.value = "update stock";
						btn.innerHTML = "Update Stock";
					}
					else
					{
						stock.value = 0;
						btn.value = "add stock";
						btn.innerHTML = "Add Stock";
					}
				}
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