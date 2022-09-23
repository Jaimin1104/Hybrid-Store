<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
        <%@ include file="admin-head.jsp" %>
	</head>

	<body>
		<b class="screen-overlay"></b>
		<aside class="navbar-aside" id="offcanvas_aside" style="">
			<div class="aside-top">
				<a href="admin-dashboard.jsp" class="brand-wrap">
				<img src="images/logo.svg" height="46" class="logo" alt="Ecommerce dashboard template">
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
					<li class="menu-item" id="admin-dashboard">
						<a class="menu-link" href="admin-dashboard.jsp">
							<i class="icon material-icons md-home"></i>
							<span class="text">Dashboard</span>
						</a>
					</li>
					<li class="menu-item has-submenu" id="admin-products">
						<a class="menu-link" href="#">
							<i class="icon material-icons md-shopping_bag"></i>
							<span class="text">Products</span>
						</a>
						<div class="submenu">
							<a href="admin-products.jsp">View Products</a>
							<a href="admin-categories.jsp">Categories</a>
							<a href="admin-subcategories.jsp">Sub Categories</a>
						</div>
					</li>
					<li class="menu-item" id="admin-orders">
						<a class="menu-link" href="admin-orders.jsp">
							<i class="icon material-icons md-shopping_cart"></i>
							<span class="text">Orders</span>
						</a>
					</li>
					<li class="menu-item" id="admin-staff">
						<a class="menu-link" href="admin-staff.jsp">
						<i class="icon material-icons md-person"></i>
							<span class="text">Staff Members</span>
						</a>
					</li>
					<li class="menu-item" id="admin-branches">
						<a class="menu-link" href="admin-branches.jsp">
							<i class="icon material-icons md-store"></i>
							<!-- <i class="icon material-icons md-add_box"></i> -->
							<span class="text">Branches</span>
						</a>
					</li>
					<li class="menu-item" id="admin-transactions">
						<a class="menu-link" href="admin-transactions.jsp">
							<i class="icon material-icons md-monetization_on"></i>
							<span class="text">Transactions</span>
						</a>
					</li>
					<li class="menu-item" id="admin-consumers">
						<a class="menu-link" href="admin-consumers.jsp">
							<i class="icon material-icons md-person"></i>
							<span class="text">Consumers</span>
						</a>
					</li>
					<li class="menu-item" id="admin-reviews">
						<a class="menu-link" href="admin-reviews.jsp">
							<i class="icon material-icons md-comment"></i>
							<span class="text">Reviews</span>
						</a>
					</li>
					<li class="menu-item" id="admin-brands">
						<a class="menu-link" href="admin-brands.jsp">
							<i class="icon material-icons md-stars"></i>
							<span class="text">Brands</span>
						</a>
					</li>
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

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="js/navigation-jquery.js"></script>

	</body>

</html>