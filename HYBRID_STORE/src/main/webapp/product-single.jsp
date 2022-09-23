<%@page import="java.util.Collections"%>
<%@page import="java.util.Random"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from demo.themefisher.com/elite-shop/product-single.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:53 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>
	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>
	<!-- main wrapper -->
	<div class="main-wrapper">

		<!-- breadcrumb -->
		<nav class="bg-gray py-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Product
						Single</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<div id="quickView" class="quickview">
			<div class="row w-100">
				<div
					class="col-lg-6 col-md-6 mb-5 mb-md-0 pl-5 pt-4 pt-lg-0 pl-lg-0">
					<img src="images/feature/product.png" alt="product-img"
						class="img-fluid">
				</div>
				<div
					class="col-lg-5 col-md-6 text-center text-md-left align-self-center pl-5">
					<h3 class="mb-lg-2 mb-2">Woven Crop Cami</h3>
					<span class="mb-lg-4 mb-3 h5">$90.00</span>
					<p class="mb-lg-4 mb-3 text-gray">Excepteur sint occaecat
						cupidatat non proident, sunt in culpa qui officia deserunt mollit
						anim id est laborum. sed ut perspic atis unde omnis iste natus</p>
					<form action="#">
						<select class="form-control w-100 mb-2" name="color">
							<option value="brown">Brown Color</option>
							<option value="gray">Gray Color</option>
							<option value="black">Black Color</option>
						</select> <select class="form-control w-100 mb-3" name="size">
							<option value="small">Small Size</option>
							<option value="medium">Medium Size</option>
							<option value="large">Large Size</option>
						</select>
						<button class="btn btn-primary w-100 mb-lg-4 mb-3">add to
							cart</button>
					</form>
					<ul class="list-inline social-icon-alt">
						<li class="list-inline-item"><a href="#"><i
								class="ti-facebook"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="ti-twitter-alt"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="ti-vimeo-alt"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="ti-google"></i></a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- product-single -->
		<section class="section">
			<%
			ProductsModel product = new ProductsModel().getProduct(Integer.parseInt(request.getParameter("productid")));			
			%>
			<div class="container">
				<div class="row">
					<div class="col-lg-6 mb-4 mb-lg-0">
						<!-- product image slider -->
						<div class="product-slider">
							<div data-image="<%= product.getImg1() %>">
								<img class="img-fluid w-100 image-zoom"
									src="<%= product.getImg1() %>" alt="product-img"
									data-zoom="<%= product.getImg1() %>">
							</div>
							<div data-image="<%= product.getImg2() %>">
								<img class="img-fluid w-100 image-zoom"
									src="<%= product.getImg2() %>" alt="product-img"
									data-zoom="<%= product.getImg2() %>">
							</div>
							<div data-image="<%= product.getImg3() %>">
								<img class="img-fluid w-100 image-zoom"
									src="<%= product.getImg3() %>" alt="product-img"
									data-zoom="<%= product.getImg3() %>">
							</div>
							<div data-image="<%= product.getImg4() %>">
								<img class="img-fluid w-100 image-zoom"
									src="<%= product.getImg4() %>" alt="product-img"
									data-zoom="<%= product.getImg4() %>">
							</div>
						</div>
					</div>
					<!-- produt details -->
					<div class="col-lg-6 mb-100">
						<h2><%= product.getProductname() %></h2>
						<!-- <i class="ti-check-box text-success"></i> <span
							class="text-success">Instock</span> 
						<ul class="list-inline mb-4">
							<li class="list-inline-item mx-0"><a href="#" class="rated"><i
									class="ti-star"></i></a></li>
							<li class="list-inline-item mx-0"><a href="#" class="rated"><i
									class="ti-star"></i></a></li>
							<li class="list-inline-item mx-0"><a href="#" class="rated"><i
									class="ti-star"></i></a></li>
							<li class="list-inline-item mx-0"><a href="#" class="rated"><i
									class="ti-star"></i></a></li>
							<li class="list-inline-item mx-0"><a href="#" class="rated"><i
									class="ti-star"></i></a></li>
							<li class="list-inline-item"><a href="#"
								class="text-gray ml-3">( 3 Reviews )</a></li>
						</ul> -->
						<h4 class="text-primary h3" style="margin-bottom: 40px;">
							&#x20B9;<%= product.getPrice()%>
						</h4>
						<%-- <h6 class="mb-4">
							You save: <span class="text-primary">&#x20B9;<%= (int)(product.getPrice()*0.07) %> (7%)</span>
						</h6> --%>
					
						<form action="CartsController.do" method="post">
							<%-- <div class="d-flex flex-column flex-sm-row justify-content-between mb-4">
								<input id="quantity" class="quantity mr-sm-2 mb-3 mb-sm-0" type="text" value="" name="quantity">
								<input type="hidden" name="productid" value="<%= product.getProductid()%>">
								<input type="hidden" name="consumerid" value="1001">
								<select
									class="form-control mx-sm-2 mb-3 mb-sm-0" name="color">
									<option value="brown">Brown Color</option>
									<option value="gray">Gray Color</option>
									<option value="black">Black Color</option>
								</select>
								<select class="form-control ml-sm-2 mb-3 mb-sm-0" name="size">
									<option class="form-control" value="small">Small Size</option>
									<option value="medium">Medium Size</option>
									<option value="large">Large Size</option>
								</select> 
							</div> --%>
							<input type="hidden" name="productid" value="<%= product.getProductid()%>">
							<input type="hidden" name="consumerid" value="1001">
							<button name="btn" value="add item" class="btn btn-primary mb-4">Add to cart</button>
						</form>
					
						<div class="payment-option border border-primary mt-5 mb-4">
							<h5 class="bg-white">Guaranted Safe Checkout</h5>
							<img class="img-fluid w-100 p-3"
								src="images/payment-card/all-card.png" alt="payment-card">
						</div>
						<h5 class="mb-3">4 Great Reason to Buy From Us</h5>
						<div class="row">
							<!-- service item -->
							<div class="col-lg-3 col-6 mb-4 mb-lg-0">
								<div class="d-flex">
									<i class="ti-truck icon-md mr-3"></i>
									<div class="align-items-center">
										<h6>Free Shipping</h6>
									</div>
								</div>
							</div>
							<!-- service item -->
							<div class="col-lg-3 col-6 mb-4 mb-lg-0">
								<div class="d-flex">
									<i class="ti-shield icon-md mr-3"></i>
									<div class="align-items-center">
										<h6>Secure Payment</h6>
									</div>
								</div>
							</div>
							<!-- service item -->
							<div class="col-lg-3 col-6 mb-4 mb-lg-0">
								<div class="d-flex">
									<i class="ti-money icon-md mr-3"></i>
									<div class="align-items-center">
										<h6>Lowest Price</h6>
									</div>
								</div>
							</div>
							<!-- service item -->
							<div class="col-lg-3 col-6 mb-4 mb-lg-0">
								<div class="d-flex">
									<i class="ti-reload icon-md mr-3"></i>
									<div class="align-items-center">
										<h6>30 Days Return</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12" style="margin:40px;">
						<h3 class="mb-3">Product Description</h3>
						<p class="text-gray mb-4"><%= product.getDescription() %></p>
						<!-- <h4>Product Features</h4>
						<ul class="features-list">
							<li>Mapped with 3M™ Thinsulate™ Insulation [40G Body /
								Sleeves / Hood]</li>
							<li>Embossed Taffeta Lining</li>
							<li>DRYRIDE Durashell™ 2-Layer Oxford Fabric [10,000MM,
								5,000G]</li>
						</ul> -->
					</div>
				</div>
			</div>
		</section>
		<!-- /product-single -->


		<!-- testimonial -->
	<!--<section class="section bg-gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="mb-4">What Our Customers Think?</h3>
					</div>
					testimonial-item
					<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
						<div class="d-flex">
							<div>
								<img class="rounded-circle mr-4"
									src="images/customer/customer-1.jpg" alt="customer-img">
							</div>
							<div>
								<ul class="list-inline">
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
								</ul>
								<h4 class="text-dark">Best quality for the price</h4>
								<p class="text-gray">Sed ut perspiciatis unde omnis iste
									natus error sit voluptatem accusantium doloremqe laudant tota
									rem ape riamipsa eaque.</p>
								<h5 class="customer-name text-dark">Maggie Scott</h5>
							</div>
						</div>
					</div>
					testimonial-item
					<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
						<div class="d-flex">
							<div>
								<img class="rounded-circle mr-4"
									src="images/customer/customer-2.jpg" alt="customer-img">
							</div>
							<div>
								<ul class="list-inline">
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
								</ul>
								<h4 class="text-dark">Best quality for the price</h4>
								<p class="text-gray">Sed ut perspiciatis unde omnis iste
									natus error sit voluptatem accusantium doloremqe laudant tota
									rem ape riamipsa eaque.</p>
								<h5 class="customer-name text-dark">Maggie Scott</h5>
							</div>
						</div>
					</div>
					testimonial-item
					<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
						<div class="d-flex">
							<div>
								<img class="rounded-circle mr-4"
									src="images/customer/customer-3.jpg" alt="customer-img">
							</div>
							<div>
								<ul class="list-inline">
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
									<li class="list-inline-item mx-0"><a href="#"
										class="rated"><i class="ti-star"></i></a></li>
								</ul>
								<h4 class="text-dark">Best quality for the price</h4>
								<p class="text-gray">Sed ut perspiciatis unde omnis iste
									natus error sit voluptatem accusantium doloremqe laudant tota
									rem ape riamipsa eaque.</p>
								<h5 class="customer-name text-dark">Maggie Scott</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section> -->
		<!-- /testimonial -->

<%
	String query = "select * from products where subcategoryid = " + product.getSubcategoryid();
	System.out.println(query);
	ArrayList<ProductsModel> allProductsOfSubCategory = new ProductsModel().getAllProducts(query);
%>

		<!-- related products -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="mb-4">Related Products</h2>
					</div>
<%
	Collections.shuffle(allProductsOfSubCategory);
	for(int i=0;i<4;i++)
	{
		if(i>=allProductsOfSubCategory.size()-1)
		{
			continue;
		}
		ProductsModel randomProduct = new ProductsModel().getProduct((allProductsOfSubCategory.get(i)).getProductid());
%>
					<!-- product -->
					<div class="col-lg-3 col-sm-6 mb-5 mb-lg-0">
						<div class="product text-center">
							<div class="product-thumb">
								<div class="overflow-hidden position-relative">
									<a href="product-single.jsp?productid=<%= randomProduct.getProductid() %>">
										<img class="img-fluid w-100 mb-3 img-first" style="min-height: 300px;max-height: 300px;" src="<%= randomProduct.getImg1() %>" alt="product-img">
										<img class="img-fluid w-100 mb-3 img-second" style="min-height: 300px;max-height: 300px;" src="<%= randomProduct.getImg2() %>" alt="product-img">
									</a>
									<div class="btn-cart">
										<!-- <a href="#" class="btn btn-primary btn-sm">Add To Cart</a> -->
										<form action="CartsController.do" method="post">
<%
		if(consumer!=null)
		{
%>
											<input type="hidden" name="consumerid" value="<%= consumer.getConsumerid() %>">
<%
		}
%>
											<input type="hidden" name="caller" value="main">
											<input type="hidden" name="productid" value="<%= randomProduct.getProductid() %>">
											<button name="btn" value="add item" class="btn btn-primary btn-sm">Add To Cart</button>
										</form>
									</div>
								</div>
								<div class="product-hover-overlay">
									<a href="#" class="product-icon favorite" data-toggle="tooltip" data-placement="left" title="Wishlist">
										<i class="ti-heart"></i>
									</a>
									<a data-vbtype="inline" href="#quickView" class="product-icon view venobox" style="top: 70px;" data-toggle="tooltip" data-placement="left" title="Quick View">
										<i class="ti-search"></i>
									</a>
								</div>
							</div>
							<div class="product-info">
								<h3 class="h5">
									<a class="text-color" href="product-single.jsp?productid=<%= randomProduct.getProductid() %>"><%= randomProduct.getProductname() %></a>
								</h3>
								<span class="h5"><span style='font-size: 23px;'>&#x20B9;<%= randomProduct.getPrice() %></span></span>
							</div>
							<!-- product label badge -->
							<div class="product-label new">new</div>
						</div>
					</div>
					<!-- //end of product -->
<%
	}
%>
					<!-- product -->	
				</div>
			</div>
		</section>
		<!-- /related products -->

	<%@ include file="footer.jsp"%>

	</div>
	<!-- /main wrapper -->

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

<!-- Mirrored from demo.themefisher.com/elite-shop/product-single.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:56 GMT -->
</html>