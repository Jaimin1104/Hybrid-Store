<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/review.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>
	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>
	<!-- main wrapper -->
	<%
		int branchid = Integer.parseInt(request.getParameter("branchid"));
		int cartid = Integer.parseInt(request.getParameter("cartid"));
		BranchesModel branchModel = new BranchesModel().getBranch(branchid);
	%>
	<div class="main-wrapper">

		<!-- breadcrumb -->
		<nav class="bg-gray py-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Shipping
						Information</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<!-- ORDER-REVIEW -->
		<form method="post" action="OrderController.do">
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="inner-wrapper border-box">
							<!-- navbar -->
							<div class="justify-content-between nav mb-5">
								<a href="shipping.jsp"
									class="text-center d-inline-block nav-item" style="flex-basis: 50%;"> <i
									class="ti-bag d-block mb-2"></i> <span class="d-block h4">Select Branch</span>
								</a><!--  <a href="payment.jsp"
									class="text-center d-inline-block nav-item"> <i
									class="ti-wallet d-block mb-2"></i> <span class="d-block h4">Payment
										Method</span>
								</a> --> <a href="review.jsp"
									class="text-center d-inline-block active nav-item" style="flex-basis: 50%;"> <i
									class="ti-eye d-block mb-2"></i> <span class="d-block h4">Review</span>
								</a>
							</div>
							<!-- /navbar -->

							<!-- review -->
							<h3>Order Review</h3>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<td></td>
											<td>Product Name</td>
											<td>Quantity</td>
											<td>Sub Total</td>
										</tr>
									</thead>
									<tbody>
										<% 
												int count=0,total=0;
												ArrayList<ProductsModel> products = new ProductsModel().getAvailableProductsByBranch(cartid, branchid);
												for(ProductsModel product : products)
												{
													CartItemsModel cartitem = new CartItemsModel().getCartItemsByProduct(product.getProductid(),cartid);
										%>
										<tr>
											<td class="align-middle" style="width: 100px; height: 100px;"><img class="img-fluid" style="width: 100%; height: 100%;"
												src="<%= product.getImg1() %>" alt="product-img" /></td>
											<td class="align-middle"><%= product.getProductname() %></td>
											<td class="align-middle"><%= cartitem.getQuantity() %></td>
											<td class="align-middle"><span style="font-size: 18px;">&#x20B9;</span><%= cartitem.getTotal() %></td>
										</tr>
										<%
												total = total + cartitem.getTotal();
												}
										%>
										<tr>
										<td><strong  style="font-size: 18px;">Total</strong></td>
										<td></td>
										<td></td>
										<td>
											<strong><span style="font-size: 18px;">&#x20B9;</span><%= total %></strong>
											<input type="hidden" name="payprice" value="<%= total %>" >
											<input type="hidden" name="cartid" value="<%= cartid %>">
											<input type="hidden" name="branchid" value="<%= branchid %>">
										</td>
								
										</tr>
									</tbody>
								</table>
								
							</div>
							<!-- /review -->
							<h3 class="border-bottom pb-2">Address Of Branch</h3>
							<p><%= branchModel.getAddress() %></p>
							<!-- shipping-information -->
							<h3 class="mb-5 border-bottom pb-2">Select Payment Method</h3>
							<div class="row mb-5"> 
								<!-- <div class="col-md-4">
									<h4 class="mb-3">Shipping Address</h4>
									<ul class="list-unstyled">
										<li>Somrat</li>
										<li>Mohammadpur, Dhaka 120, Bangladesh</li>
										<li>248-321-5879</li>
										<li>example.site@email.com</li>
									</ul>
								</div>
								<div class="col-md-4">
									<h4 class="mb-3">Shipping Method</h4>
									<ul class="list-unstyled">
										<li>Standard Ground (USPS) - $9.50</li>
										<li>Delivered in 8-10 business days.</li>
									</ul>
								</div>
								<div class="col-md-4">
									<h4 class="mb-3">Payment Method</h4>
									<ul class="list-unstyled">
										<li>Credit Card:</li>
										<li>**** **** **** 2637</li>
									</ul>
								</div> -->
								<!-- <div class="col-12">
									<h3 class="mb-5 border-bottom pb-2">Select Payment
										Method</h3>
								</div> -->
								<div class="col-sm-6 mb-4">
									<input id="standard" class="custom-checkbox" type="radio"
										name="checkbox" value="Online" checked="checked"> <label 
										for="standard">Online</label> <small
										class="d-block ml-3">Online payment done through Paytm Only</small>
								</div>
								<div class="col-sm-6 mb-4">
									<input id="premium" type="radio" name="checkbox" value="Offline">
									<label for="premium">Offline</label> <small
										class="d-block ml-3">Offline payment done through Cash Only</small>
								</div>
							 </div> 

							<!-- buttons -->
							<div class="p-4 bg-gray d-flex justify-content-between">
								<a href="shipping.jsp" class="btn btn-dark">Back</a> 
								<button type="submit" class="btn btn-primary">Continue</button>
							</div>
						</div>
					</div>
					<!-- <div class="col-md-4">
						<div class="border-box p-4">
							<h4>Order Summery</h4>
							<p>Excepteur sint occaecat cupidat non proi dent
								sunt.officia.</p>
							<ul class="list-unstyled">
								<li class="d-flex justify-content-between"><span>Subtotal</span>
									<span>$237.00</span></li>
								<li class="d-flex justify-content-between"><span>Shipping & Handling</span> <span>$15.00</span></li>
								<li class="d-flex justify-content-between"><span>Estimated Tax</span> <span>$0.00</span></li>
							</ul>
							<hr>
							<div class="d-flex justify-content-between">
								<span>Total</span> <strong>USD $253.00</strong>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</section>
		</form>
		<!-- /ORDER-REVIEW -->

		<%@ include file="footer.jsp"%>

	</div>
	<!-- /main wrapper -->
	<script>
	/* window.onload = function () {
		$('#submit').click(function(){
			var checkbox = document.getElementsByName('checkbox');
			for(let i=0;i<checkbox.length;i++)
			{
				if(checkbox[i].checked == true)
				{
					if(checkbox[i].value == 'Online')
					{
						console.log(checkbox[i].value);
						window.location.href="paytmRedirect.jsp";
					}
				}
			}
		});
	} */
		
	</script>
	<!-- jQuery -->
	<script src="plugins/jQuery/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/venobox/venobox.min.js"></script>
	<script src="plugins/aos/aos.js"></script>
	<script src="plugins/syotimer/jquery.syotimer.js"></script>
	<script src="plugins/instafeed/instafeed.min.js"></script>
	<script src="plugins/zoom-master/jquery.zoom.min.js"></script>
	<script
		src="plugins/bootstrap-touchspin-master/jquery.bootstrap-touchspin.min.js"></script>
	<script src="plugins/nice-select/jquery.nice-select.min.js"></script>
	<script src="plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
	<!-- google map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&amp;libraries=places"></script>
	<script src="plugins/google-map/gmap.js"></script>
	<!-- Main Script -->
	<script src="js/script.js"></script>
</body>

<!-- Mirrored from demo.themefisher.com/elite-shop/review.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
</html>