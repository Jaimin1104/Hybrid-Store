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
	<!-- footer -->
	<footer class="bg-light">
		<div class="section">
			<div class="container">
				<div class="row">
					<div
						class="col-md-3 col-sm-6 mb-5 mb-md-0 text-center text-sm-left">
						<h4 class="mb-4">Contact</h4>
						<ul class="pl-0 list-unstyled">
							<li class="mb-2"><p>Shop No. 23, Nikol, Ahmedabad, Gujarat 382350</p></li>
							<li class="mb-2"><a class="text-color" href="tel:9737482707">+91 6351021898</a></li>
							<li class="mb-2"><a class="text-color" href="mailto:hybridstore8@gmail.com?subject=Mail from our Website">hybridstore8@gmail.com</a></li>
						</ul>
						<ul class="list-inline social-icons" style="margin-top: 10px">
							<li class="list-inline-item"><a href="#"><i
									class="ti-facebook"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="ti-twitter-alt"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="ti-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="ti-google"></i></a></li>
						</ul>
					</div>
					<div
						class="col-md-3 col-sm-6 mb-5 mb-md-0 text-center text-sm-left">
						<h4 class="mb-4">Category</h4>
						<ul class="pl-0 list-unstyled">
<%
	ArrayList<CategoriesModel> allCategories = new CategoriesModel().getAllCategories();
	for(CategoriesModel category : allCategories)
	{
%>
							<li class="mb-2"><a class="text-color" href="shop.jsp?categoryid=<%= category.getCategoryid() %>"><%= category.getCategoryname() %></a></li>
<%
	}
%>
						</ul>
					</div>
					<div
						class="col-md-3 col-sm-6 mb-5 mb-md-0 text-center text-sm-left">
						<h4 class="mb-4">Useful Link</h4>
						<ul class="pl-0 list-unstyled">
							<li class="mb-2"><a class="text-color" href="about.jsp">News
									&#38; Tips</a></li>
							<li class="mb-2"><a class="text-color" href="about.jsp">About
									Us</a></li>
							<li class="mb-2"><a class="text-color" href="contact.jsp">Support</a></li>
							<li class="mb-2"><a class="text-color" href="shop.jsp">Our
									Shop</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 text-center text-sm-left">
						<h4 class="mb-4">Our Policies</h4>
						<ul class="pl-0 list-unstyled">
							<li class="mb-2"><a class="text-color" href="404.jsp">Privacy
									Policy</a></li>
							<li class="mb-2"><a class="text-color" href="404.jsp">Terms
									&#38; Conditions</a></li>
							<li class="mb-2"><a class="text-color" href="404.jsp">Cookie
									Policy</a></li>
							<li class="mb-2"><a class="text-color" href="404.jsp">Terms
									of Sale</a></li>
							<li class="mb-2"><a class="text-color" href="dashboard.jsp">Free
									Shipping &#38; Returns</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="bg-dark py-4">
			<div class="container">
				<div class="row">
					<div
						class="col-md-5 text-center text-md-left mb-4 mb-md-0 align-self-center">
						<p class="text-white mb-0">Logo &copy; 2022 all right reserved</p>
					</div>
					<div class="col-md-4 text-center text-md-left mb-4 mb-md-0">
						<!-- <img src="images/logo.png" alt="logo"> -->
						<span class="font-weight-bold  align-middle h3" style="font-family: play;color: white;">HYBRID STORE</span>
					</div>
					<div class="col-md-3 text-center text-md-right mb-4 mb-md-0">
						<ul class="list-inline">
							<li class="list-inline-item"><img
								class="img-fluid rounded atm-card-img"
								src="images/payment-card/card-1.jpg" alt="card"></li>
							<li class="list-inline-item"><img
								class="img-fluid rounded atm-card-img"
								src="images/payment-card/card-2.jpg" alt="card"></li>
							<li class="list-inline-item"><img
								class="img-fluid rounded atm-card-img"
								src="images/payment-card/card-3.jpg" alt="card"></li>
							<li class="list-inline-item"><img
								class="img-fluid rounded atm-card-img"
								src="images/payment-card/card-4.jpg" alt="card"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- /footer -->
</body>
</html>