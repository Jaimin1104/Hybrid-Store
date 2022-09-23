<%@page import="hybridstore.model.StaffModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
        <%@ include file="staff-head.jsp" %>
	</head>

	<body>
		<%
			StaffModel staff = (StaffModel)(session.getAttribute("staff"));
		%>
		<b class="screen-overlay"></b>
		<aside class="navbar-aside" id="offcanvas_aside" style="">
			<div class="aside-top">
				<!-- <a href="#" class="brand-wrap">
					<img src="images/logo.svg" class="logo" alt="Ecommerce dashboard template" style="height: 30%;width: 80%;">
				</a> -->
				<a class="brand-wrap text-decoration-none text-dark" href="index.jsp">
					<span class="align-middle" style="font-family: play;font-weight: bolder;font-size: 20px;">HYBRID STORE</span>
					<!-- <img class="img-fluid" src="images/hybrid store.png" alt="logo" style="width: 100%;height: 100%;"> -->
				</a>
				<div>
					<button class="btn btn-icon btn-aside-minimize">
						<i class="text-muted material-icons md-menu_open"></i>
					</button>
				</div>
			</div>
			<!-- aside-top.// -->
	
			<nav>
				<ul class="menu-aside">
				    <li class="menu-item" id="staff-dashboard"> 
				    	<a class="menu-link" href="staff-dashboard.jsp"> <i class="icon material-icons md-home"></i> 
				        	<span class="text">Dashboard</span> 
				      	</a> 
				    </li>
				    <!-- <li class="menu-item has-submenu"> 
					    <a class="menu-link" href="page-products-list.jsp"> <i class="icon material-icons md-shopping_bag"></i>  
					    	<span class="text">Products</span> 
					    </a> 
					    <div class="submenu">
							<a href="page-products-list.jsp">Product list view</a>
							<a href="page-products-table.jsp">Product table view</a>
							<a href="page-products-grid.jsp">Product grid</a>
							<a href="page-products-grid-2.jsp">Product grid 2</a>
							<a href="page-categories.jsp">Categories</a>
					    </div>
				    </li>
				    <li class="menu-item has-submenu"> 
					    <a class="menu-link" href="page-orders-1.jsp"> <i class="icon material-icons md-shopping_cart"></i> 
				      		<span class="text">Orders</span> 
					    </a>
					    <div class="submenu">
							<a href="page-orders-1.jsp">Order list 1</a>
							<a href="page-orders-2.jsp">Order list 2</a>
							<a href="page-orders-detail.jsp">Order detail</a>
					    </div> 
				    </li>
				    <li class="menu-item has-submenu"> 
					    <a class="menu-link" href="page-sellers-cards.jsp"> <i class="icon material-icons md-store"></i> 
					    	<span class="text">Sellers</span> 
					    </a> 
					    <div class="submenu">
							<a href="page-sellers-cards.jsp">Sellers cards</a>
							<a href="page-sellers-list.jsp">Sellers list</a>
							<a href="page-seller-detail.jsp">Seller profile</a>
					    </div> 
				    </li>
				    <li class="menu-item has-submenu"> 
					    <a class="menu-link" href="page-form-product-1.jsp"> <i class="icon material-icons md-add_box"></i>  
					    	<span class="text">Add product</span> 
					    </a> 
					    <div class="submenu">
							<a href="page-form-product-1.jsp">Add product 1</a>
							<a href="page-form-product-2.jsp">Add product 2</a>
							<a href="page-form-product-3.jsp">Add product 3</a>
							<a href="page-form-product-4.jsp">Add product 4</a>  
					    </div>
				    </li>
				    <li class="menu-item has-submenu">
					    <a class="menu-link" href="page-transactions-A.jsp"> <i class="icon material-icons md-monetization_on"></i> 
					    	<span class="text">Transactions</span> 
					    </a> 
					    <div class="submenu">
							<a href="page-transactions-A.jsp">Transaction 1</a>
							<a href="page-transactions-B.jsp">Transaction 2</a>
					    </div>
				    </li>
				    <li class="menu-item has-submenu"> 
					    <a class="menu-link" href="#"> <i class="icon material-icons md-person"></i>  
					    	<span class="text">Account</span> 
					    </a> 
					    <div class="submenu">
						    <a href="page-account-login.jsp">User login</a>
						    <a href="page-account-register.jsp">User registration</a>
						    <a href="page-error-404.jsp">Error 404</a>
					    </div>
				    </li> -->
				    <li class="menu-item has-submenu" id="staff-orders"> 
					    <a class="menu-link" href="#">
					    	<i class="icon material-icons md-shopping_cart"></i> 
				      		<span class="text">Orders</span> 
					    </a>
					    <div class="submenu">
							<a href="staff-confirmed-orders.jsp">Confirmed</a>
							<a href="staff-packed-orders.jsp">Packed</a>
							<a href="staff-completed-orders.jsp">Completed</a>
					    </div> 
				    </li>
				    <!-- <li class="menu-item" id="staff-reviews"> 
					    <a class="menu-link" href="staff-reviews.jsp"> <i class="icon material-icons md-comment"></i> 
					    	<span class="text">Reviews</span> 
					    </a> 
				    </li> -->
				    <li class="menu-item" id="staff-profile"> 
					    <a class="menu-link" href="staff-profile.jsp"> <i class="icon material-icons md-person"></i> 
					    	<span class="text">My Profile</span> 
					    </a> 
				    </li>
				    <!-- <li class="menu-item"> 
					    <a class="menu-link" href="page-brands.jsp"> <i class="icon material-icons md-stars"></i> 
					    	<span class="text">Brands</span>
					    </a> 
				    </li> -->
				    <!-- <li class="menu-item"> 
						<a class="menu-link" disabled href="#"> <i class="icon material-icons md-pie_chart"></i> 
							<span class="text">Statistics</span> 
						</a> 
				    </li> -->
				</ul>
				<!-- <hr>
				<ul class="menu-aside">
					<li class="menu-item has-submenu" id="admin-settings">
						<a class="menu-link" href="#">
							<i class="icon material-icons md-settings"></i>
							<span class="text">Settings</span>
						</a>
						<div class="submenu">
							<a href="page-settings-1.jsp">Setting sample 1</a>
							<a href="page-settings-2.jsp">Setting sample 2</a>
						</div>
					</li>
					<li class="menu-item" id="admin-starterpage">
						<a class="menu-link" href="page-0-blank.jsp">
							<i class="icon material-icons md-local_offer"></i>
							<span class="text">Starter page</span>
						</a>
					</li>
				</ul> -->
				<br>
				<br>
			</nav>
		</aside>

		<script>
			$(document).ready(function(){
				
				$("#staff-dashboard").click(function(){
			        $('.menu-item.active').removeClass("active");
			        $("#staff-dashboard").addClass("active");
			    });
					
			    $("#staff-orders").click(function(){
			        $('.menu-item.active').removeClass("active");
			        $("#staff-orders").addClass("active");
			    });
			    
				$("#staff-profile").click(function(){
			        $('.menu-item.active').removeClass("active");
			        $("#staff-profile").addClass("active");
			    });
	
			});
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	</body>

</html>