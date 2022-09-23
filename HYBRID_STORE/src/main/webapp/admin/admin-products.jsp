<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="hybridstore.model.StockModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:42 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
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
					<h2 class="content-title">Products</h2>
					<div>
						<a href="admin-addproduct.jsp" class="btn btn-primary"><i
							class="material-icons md-plus"></i> Add new</a>
					</div>
				</div>
				<div class="card mb-4">
					<header class="card-header">
						<div class="row align-items-center">
							<!-- <div class="col col-check flex-grow-0">
	                            <div class="form-check ms-2">
	                                <input class="form-check-input" type="checkbox" value="">
	                            </div>
	                        </div> -->
							<div class="col-lg-4 col-md-6 me-auto">
								<input type="text" id="Search" onkeyup="searchProduct()" placeholder="Search by Product name..." class="form-control">
							</div>
						<!-- 
							<div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
								<select class="form-select">
									<option>All subcategory</option>
<%
	ArrayList<SubCategoriesModel> allSubcategories = new SubCategoriesModel().getAllSubCategories();
	for(SubCategoriesModel subcategory : allSubcategories)
	{
%>
									<option><%= subcategory.getSubcategoryname() %></option>
<%
	}
%>
								</select>
							</div>
						 -->
							<div class="col-md-3 col-6">
								<input type="date" class="form-control" id="Date" onchange="dateProduct()">
							</div>
							<div class="col-md-2 col-6">
								<select class="form-select" id="Status" onchange="statusProduct()">
									<option value="All">All</option>
									<option value="Active">Active</option>
									<option value="Deactive">Deactive</option>
								</select>
							</div>
						</div>
					</header>
					<!-- card-header end// -->
	
					<div class="card-body">
						<article class="itemlist" style="border-bottom: 5px solid rgba(108, 117, 125, 0.25); padding: 10px 10px 15px 10px;">
							<div class="row align-items-center">
								<!-- <div class="col col-check flex-grow-0">
	                                        <div class="form-check">
	                                            <input class="form-check-input" type="checkbox">
	                                        </div>
	                                    </div> -->
								<div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
									<span><b>Product Name</b></span>
								</div>
								<div class="col-lg-2 col-sm-2 col-4 col-price">
									<span><b>Price</b></span>
								</div>
								<div class="col-lg-2 col-sm-2 col-4 col-status">
									<span><b>Status</b></span>
								</div>
								<div class="col-lg-2 col-sm-2 col-4 col-date">
									<span><b>Date</b></span>
								</div>
								<div class="col-lg-1 col-sm-2 col-4 col-action">
									<span><b>Action</b></span>
								</div>
							</div>
							<!-- row .// -->
						</article>
						
						<span id="displayPageProducts"></span>
						
						<nav class="float-end mt-4" aria-label="Page navigation">
							<ul class="pagination">
							</ul>
						</nav>
					</div>
					<!-- card-body end// -->
				</div>
				<!-- card end// -->
			</section>
			<!-- content-main end// -->
			
			<!-- Large modal -->
			<div id="largeModal" class="modal fade" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- <div class="modal-header">
							<h5 class="modal-title" style="color: black; font-size: large;">Product</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div> -->
						<span id="modal"></span>
					</div>
				</div>
			</div>
			
			<!-- Delete modal -->
			<div class="modal fade" id="confirmDelete" tabindex="-1" aria-labelledby="exampleModalPromoLabel2" aria-hidden="true" data-tor-parent="show">
				<div class="modal-dialog  modal-dialog-centered no-transform">
					<div class="modal-content" data-tor="show(p):{scale.from(75) fade.in} quad">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalPromoLabel2">Delete Product</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Are you sure?</p>
						</div>
						<div class="modal-footer">
							<form method="post" action="../ProductsController">
								<input type="hidden" id="productid" name="productid"></input>
								<button type="submit" name="btn" value="delete product" class="btn mb-2 btn-danger">Delete</button>
								<button type="submit" data-bs-dismiss="modal" class="btn mb-2 btn-primary">Close</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
		</main>
	
	
		<script>
			var numberOfRecords;
			var maximumRecordsPerPage;
			var numberOfPagesRequired;
			var currentPage = 1;
			var caller = 'products';
			var search = "";
			var date = "";
			var status = document.getElementById("Status").value;
			
			window.onload = function() {
				fetchrecords(caller,currentPage);
			}
		
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
		
			function deleteProduct(productid)
			{
				$('#confirmDelete #productid').val(productid);
				$("#confirmDelete").modal('show');
			}
			
			var request = new XMLHttpRequest();
			function viewProduct(productid)
			{
				var url="admin-modal.jsp?productid="+productid;  
			  	try
			  	{  
					request.onreadystatechange=function()
					{  
						if(request.readyState==4)
						{  
							var val=request.responseText;  
							document.getElementById('modal').innerHTML=val;  
						}  
					}  
					request.open("GET",url,true);  
					request.send();  
					$("#largeModal").modal('show');
				}
			  	catch(e)
			  	{
			  		alert("Unable to connect to server");
			  	}  
			}
			
			function searchProduct() {
				currentPage = 1;
				search = document.getElementById("Search").value;
				fetchrecords(caller,currentPage);
			}
			
			function statusProduct() {
				currentPage = 1;
				status = document.getElementById("Status").value;
				fetchrecords(caller,currentPage);
			}
			
			function dateProduct() {
				currentPage = 1;
				date = "";
				day = document.getElementById("Date").value;
				var d = day.split("-");
				for(let i=d.length-1;i>=0;i--)
				{
					date = date + d[i];
					if(i!=0)
					{
						date = date + "/";
					}
				}
				console.log(date);
				fetchrecords(caller,currentPage);
			}
			
			function fetchrecords(caller, pagenumber) {
				data_counter();
			    console.log("Caller : " + caller);
			    console.log("Pagenumber : " + pagenumber);
			    console.log("date : " + date);
			    console.log("status : " + status);
			    console.log("search : " + search);
			  	$.ajax({
					url : "admin-pagination.jsp",
					method : "GET",
					data : {
						caller : caller,
						pagenumber : pagenumber,
						date : date,
						status : status,
						search : search
					},
					success : function(data) {
						$('#displayPageProducts').html(data);
					}
				});
			}
			
			function data_counter() {
				$.ajax({
					url : "admin-pagination.jsp",
					method : "GET",
					data : {
						action : "counter",
						caller : caller,
						date : date,
						status : status,
						search : search
					},
					success : function(data) {
						var totalProducts = parseInt((data.split('<body>'))[1].split('<script>'));
						numberOfRecords = totalProducts;
						console.log("numberOfRecords : " + numberOfRecords);
						maximumRecordsPerPage = 10;
						numberOfPagesRequired = Math.ceil(numberOfRecords/maximumRecordsPerPage);
						var pagination = document.getElementsByClassName("pagination");
						var previousElement = "<li id='previous' class='page-item'><a class='page-link' onclick='displayPreviousPage()' href='#'>previous</a></li>";
						var nextElement = "<li id='next' class='page-item'><a class='page-link' onclick='displayNextPage()' href='#'>next</a></li>";
						pagination[0].innerHTML = previousElement;
						for(let i=1;i<=numberOfPagesRequired;i++)
						{
							var pageElement = "<li class='page-item'><a class='page-link' onclick='displayRecords(this)' href='#'>"+i+"</a></li>";
							pagination[0].innerHTML += pageElement;
						}
						pagination[0].innerHTML += nextElement;
						var allPages = document.getElementsByClassName("page-item");
						for(let i=0;i<allPages.length;i++)
						{
							var pages = parseInt(allPages[i].innerText);
							if(pages == currentPage)
							{
								allPages[i].className = "page-item active";
							}
						}
						checkPreviousNextPage();
					}
				});
			}
			<%@ include file="js/pagination.js" %>
		</script>

		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>
		
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:43 GMT -->

</html>