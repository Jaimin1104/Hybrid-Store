<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="hybridstore.model.CategoriesModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="head.jsp" %>
</head>
<body>
	<!-- header -->
	<header>
		<!-- top advertise -->
		<!-- <div class="alert alert-secondary alert-dismissible fade show rounded-0 pb-0 mb-0" role="alert">
    <div class="d-flex justify-content-between">
      <p>SAVE UP TO $50</p>
      <h4>SALE!</h4>
      <div class="shop-now">
        <a href="shop.jsp" class="btn btn-sm btn-primary">Shop Now</a>
      </div>
    </div>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div> -->

		<!-- top header -->
		<div class="top-header">
			<div class="row">
				<div class="col-lg-6 text-center text-lg-left">
					<!-- <p class="text-white mb-lg-0 mb-1">Free shipping • Free 30 days
						return • Express delivery</p> -->
				</div>
				<div class="col-lg-6 text-center text-lg-right">
					<ul class="list-inline">
						<!-- <li class="list-inline-item"><img src="images/flag.jpg" alt="flag"></li> -->
<% 
				ConsumersModel consumer = (ConsumersModel)(session.getAttribute("consumer"));
				if(consumer!=null)
				{
%>
						<li class="list-inline-item"><a href="dashboard.jsp">My Account</a></li>
						<li class="list-inline-item">
							<a href="LoginController?action=logout">Logout</a>	
						</li>
						
<%
				}
				else
				{
%>
						<li class="list-inline-item"><a href="signin.jsp">Sign in</a></li>
						<li class="list-inline-item"><a href="login.jsp">Login</a></li>
<%
				}
%>
					</ul>
				</div>
			</div>
		</div>
		<!-- /top-header -->
	</header>

	<!-- navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white w-100"
		id="navbar">
		<!-- <a class="navbar-brand order-2 order-lg-1" href="index.jsp"><img class="img-fluid" src="images/logo.png" alt="logo"></a> -->
		<a class="navbar-brand order-2 order-lg-1" href="index.jsp">
			<span class="font-weight-bold  align-middle" style="font-family: play;">HYBRID STORE</span>
			<!-- <img class="img-fluid" src="images/hybrid store.png" alt="logo" style="width: 100%;height: 100%;"> -->
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse order-1 order-lg-2"
			id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="shop.jsp">Shop</a>
				</li>
				<!-- <li class="nav-item dropdown view">
					<a class="nav-link dropdown-toggle" href="shop.jsp" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> shop </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="shop.jsp">Shop</a>
						<a class="dropdown-item" href="shop-list.jsp">Shop List</a>
						<a class="dropdown-item" href="product-single.jsp">Product Single</a>
						<a class="dropdown-item" href="cart.jsp">Cart</a>
						<a class="dropdown-item" href="shipping.jsp">Shipping Method</a>
						<a class="dropdown-item" href="payment.jsp">Payment Method</a>
						<a class="dropdown-item" href="review.jsp">Review</a>
						<a class="dropdown-item" href="confirmation.jsp">Confirmation</a>
						<a class="dropdown-item" href="track.jsp">Track Order</a>
					</div>
				</li> -->
	<!-- <li class="nav-item dropdown view">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false">
          pages
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="about.jsp">About Us</a>
          <a class="dropdown-item" href="contact.jsp">Contact Us</a>
          <a class="dropdown-item" href="login.jsp">Login</a>
          <a class="dropdown-item" href="signin.jsp">Signup</a>
          <a class="dropdown-item" href="forget-password.jsp">Forget Password</a>
          <a class="dropdown-item" href="dashboard.jsp">Dashboard</a>
          <a class="dropdown-item" href="faq.jsp">FAQ</a>
          <a class="dropdown-item" href="404.jsp">404 Page</a>
          <a class="dropdown-item" href="coming-soon.jsp">Coming Soon</a>
          <a class="dropdown-item" href="blog-grid.jsp">Blog</a>
          <a class="dropdown-item" href="blog-single.jsp">Blog Single</a>
        </div>
      </li> -->
				<li class="nav-item">
					<a class="nav-link" href="about.jsp">About Us</a>
				</li>
				<li class="nav-item dropdown mega-dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Mega Menu </a>
					<div class="dropdown-menu mega-menu">
						<%
						ArrayList<CategoriesModel> categories = new CategoriesModel().getAllCategories();
						for (CategoriesModel category : categories)
						{
							ArrayList<SubCategoriesModel> subcategories = new SubCategoriesModel().getAllSubCategoriesByCategory(category.getCategoryid());
						%>
						<div class="mx-3 mega-menu-item">
							<h6><%=category.getCategoryname()%></h6>
							<ul class="pl-0">
							<%
							for (SubCategoriesModel subcategory : subcategories) {
							%>
								<li><a href="shop.jsp?subcategoryid=<%= subcategory.getSubcategoryid() %>"><%=subcategory.getSubcategoryname()%></a></li>
							<%
							}
							%>
							</ul>

						</div>
						<%
						}
						%>

						<div class="mx-3 mega-megu-image">
							<img class="img-fluid h-100" src="images/mega-megu.jpg" alt="feature-img">
						</div>
					</div></li>
<%
	if(consumer!=null){
%>
				<li class="nav-item">
					<a class="nav-link" href="contact.jsp">Contact Us</a>
				</li>
<% 
	}
%>
				
			</ul>
		</div>
		<div class="order-3 navbar-right-elements">
			<div class="search-cart">
				<!-- search -->
				<!-- <div class="search">
					<button id="searchOpen" class="search-btn">
						<i class="ti-search"></i>
					</button>
					<div class="search-wrapper">
						<form action="#">
							<input class="search-box" id="search" type="search"
								placeholder="Enter Keywords...">
							<button class="search-icon" type="submit">
								<i class="ti-search"></i>
							</button>
						</form>
					</div>
				</div> -->
				<!-- cart -->
				<div class="cart">
				<%
				if(consumer!=null)
				{
				%>
					<button id="cartOpen" onclick="displaycart(<%= consumer.getConsumerid()%>)" class="cart-btn">
					<i class="ti-bag"></i><span class="d-xs-none">CART</span></button>
					<div class="cart-wrapper" style="max-width:468px;">
					<i id="cartClose" class="ti-close cart-close"></i>
					<h4 class="mb-4">Your Cart</h4>
					<span id="display"></span>
				<%
				} 
				%>
					</div>				
					</div>
			</div>
		</div>
	</nav>
	<!-- /navigation -->
	<script>
	var request = new XMLHttpRequest();
	function displaycart(consumerid)
	{
		var url="filter.jsp?consumerid="+consumerid;  
	  	try
	  	{  
			request.onreadystatechange=function()
			{  
				if(request.readyState==4)
				{  
					var val=request.responseText;  
					document.getElementById('display').innerHTML=val;  
				}  
			}  
			request.open("GET",url,true);  
			request.send();  
			
		}
	  	catch(e)
	  	{
	  		alert("Unable to connect to server");
	  	}  
	}
	</script>
</body>
</html>