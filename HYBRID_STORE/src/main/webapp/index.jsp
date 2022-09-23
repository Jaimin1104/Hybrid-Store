<%@page import="hybridstore.model.WishlistsModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from demo.themefisher.com/elite-shop/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:24 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>

	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>

	<!-- main wrapper -->
	<div class="main-wrapper">

		<section class="section bg-gray hero-area">
			<div class="container">
				<div class="hero-slider">

					<!-- Start first slide  -->
					<div class="slider-item">
						<div class="row">
							<div
								class="col-lg-6 align-self-center text-center text-md-left mb-4 mb-lg-0">
								<h3 data-duration-in=".5" data-animation-in="fadeInLeft"
									data-delay-in="0" data-animation-out="fadeOutLeft"
									data-delay-out="5" data-duration-out=".3">For Men’s</h3>
								<!-- Start Title -->
								<h1 data-duration-in=".5" data-animation-in="fadeInLeft"
									data-delay-in=".2" data-animation-out="fadeOutLeft"
									data-delay-out="5" data-duration-out=".3">High Quality
									Shoes</h1>
								<!-- end title -->
								<!-- Start Subtitle -->
								<%
									ProductsModel cheapestProduct = new ProductsModel().getCheapestProduct("Shoes");
									int subcategoryid = new SubCategoriesModel().getSubCategoryId("Shoes");
								%>
								<h3 class="mb-4" data-duration-in=".5"
									data-animation-in="fadeInLeft" data-delay-in=".4"
									data-animation-out="fadeOutLeft" data-delay-out="5"
									data-duration-out=".3">Starts at <%= cheapestProduct.getPrice() %></h3>
								<!-- end subtitle -->
								<!-- Start description -->
								<p class="mb-4" data-duration-in=".5"
									data-animation-in="fadeInLeft" data-delay-in=".6"
									data-animation-out="fadeOutLeft" data-delay-out="5"
									data-duration-out=".3"><%=cheapestProduct.getDescription()%></p>
								<!-- end description -->
								<!-- Start button -->
								<a href="shop.jsp?subcategoryid=<%=subcategoryid%>" class="btn btn-primary" data-duration-in=".5"
									data-animation-in="fadeInLeft" data-delay-in=".8"
									data-animation-out="fadeOutLeft" data-delay-out="5"
									data-duration-out=".3">Shop now</a>
								<!-- end button -->
							</div>
							<!-- Start slide image -->
							<div class="col-lg-6 text-center text-md-left">
								<!-- background letter -->
								<div class="bg-letter">
									<span data-duration-in=".5" data-animation-in="fadeInRight"
										data-delay-in="1.2" data-animation-out="fadeOutRight"
										data-delay-out="5" data-duration-out=".3"> S </span>
									<!-- Slide image -->
									<img class="img-fluid d-unset"
										src="images/hero-area/converse.png" alt="converse"
										data-duration-in=".5" data-animation-in="fadeInRight"
										data-delay-in="1" data-animation-out="fadeOutRight"
										data-delay-out="5" data-duration-out=".3">
								</div>
							</div>
							<!-- end slide image  -->
						</div>
					</div>
					<!-- end slider item -->

					<!-- Start slide  -->
					<div class="slider-item">
						<div class="row">
							<div
								class="col-lg-6 align-self-center text-center text-md-left mb-4 mb-lg-0">
								<h3 data-duration-in=".5" data-animation-in="fadeInDown"
									data-delay-in="0" data-animation-out="fadeOutDown"
									data-delay-out="5.8" data-duration-out=".3">For Women’s</h3>
								<h1 data-duration-in=".5" data-animation-in="fadeInDown"
									data-delay-in=".2" data-animation-out="fadeOutDown"
									data-delay-out="5.4" data-duration-out=".3">High Quality
									Bags</h1>
								<%
									cheapestProduct = new ProductsModel().getCheapestProduct("Bags");
									subcategoryid = new SubCategoriesModel().getSubCategoryId("Bags");
								%> 
								<h3 class="mb-4" data-duration-in=".5"
									data-animation-in="fadeInDown" data-delay-in=".4"
									data-animation-out="fadeOutDown" data-delay-out="5"
									data-duration-out=".3">Starts at <%=cheapestProduct.getPrice()%></h3> 
								<p class="mb-4" data-duration-in=".5"
									data-animation-in="fadeInDown" data-delay-in=".6"
									data-animation-out="fadeOutDown" data-delay-out="4.6"
									data-duration-out=".3"><%=cheapestProduct.getDescription()%></p>
								<a href="shop.jsp?subcategoryid=<%=subcategoryid%>" class="btn btn-primary" data-duration-in=".5"
									data-animation-in="fadeInDown" data-delay-in=".8"
									data-animation-out="fadeOutDown" data-delay-out="4.2"
									data-duration-out=".3">Shop now</a>
							</div>
							<div class="col-lg-6 text-center">
								<div class="bg-letter">
									<!-- background letter -->
									<span data-duration-in=".5" data-animation-in="fadeInRight"
										data-delay-in="1.2" data-animation-out="fadeOutRight"
										data-delay-out="5" data-duration-out=".3"> B </span> <img
										class="img-fluid d-unset" src="images/hero-area/bag.png"
										alt="converse" data-duration-in=".5"
										data-animation-in="fadeInRight" data-delay-in="1"
										data-animation-out="fadeOutRight" data-delay-out="5"
										data-duration-out=".3">
								</div>
							</div>
						</div>
					</div>
					<!-- end slide  -->

				</div>
			</div>
		</section>
		<!-- /hero area

<!-- categories -->
		<section class="section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-12 text-center">
						<h2 class="section-title">Top Categories</h2>
					</div>
					<!-- categories item -->
					<div class="col-lg-4 col-md-6 mb-50">
						<div class="card p-0">
							<div class="border-bottom text-center hover-zoom-img">
								<a href="shop.jsp">
									<img src="images/categories/product-big-1.jpg" class="rounded-top img-fluid w-100" alt="product-img">
								</a>
							</div>
							<ul class="d-flex list-unstyled pl-0 categories-list">
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-1.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-2.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-3.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
							</ul>
							<div class="px-4 py-3 border-top">
								<h4 class="d-inline-block mb-0 mt-1">Clothes</h4>
								<%
									int subCategoryId = new SubCategoriesModel().getSubCategoryId("Cloths");
								%>
								<a href="shop.jsp?subcategoryid=<%= subCategoryId %>" class="btn btn-sm btn-outline-primary float-right">View more</a>
							</div>
						</div>
					</div>
					<!-- categories item -->
					<div class="col-lg-4 col-md-6 mb-50">
						<div class="card p-0">
							<div class="border-bottom text-center hover-zoom-img">
								<a href="shop.jsp">
									<img src="images/categories/product-big-2.jpg" class="rounded-top img-fluid w-100" alt="product-img">
								</a>
							</div>
							<ul class="d-flex list-unstyled pl-0 categories-list">
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-4.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-5.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-6.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
							</ul>
							<div class="px-4 py-3 border-top">
								<h4 class="d-inline-block mb-0 mt-1">Shoes</h4>
								<%
									subCategoryId = new SubCategoriesModel().getSubCategoryId("Shoes");
								%>
								<a href="shop.jsp?subcategoryid=<%= subCategoryId %>" class="btn btn-sm btn-outline-primary float-right">View more</a>
							</div>
						</div>
					</div>
					<!-- categories item -->
					<div class="col-lg-4 col-md-6 mb-50">
						<div class="card p-0">
							<div class="border-bottom text-center hover-zoom-img">
								<a href="shop.jsp">
									<img src="images/categories/product-big-3.jpg" class="rounded-top img-fluid w-100" alt="product-img">
								</a>
							</div>
							<ul class="d-flex list-unstyled pl-0 categories-list">
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-7.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-8.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
								<li class="m-0 hover-zoom-img">
									<a href="shop.jsp">
										<img src="images/categories/product-sm-9.jpg" class="img-fluid w-100" alt="product-img">
									</a>
								</li>
							</ul>
							<div class="px-4 py-3 border-top">
								<h4 class="d-inline-block mb-0 mt-1">Fashion</h4>
								<%
									int categoryId = new CategoriesModel().getCategoryId("Fashion");
								%>
								<a href="shop.jsp?categoryid=<%= categoryId %>" class="btn btn-sm btn-outline-primary float-right">View more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /categories -->

		<section class="section overlay cta"
			data-background="images/backgrounds/cta.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h1 class="text-white mb-2">End of Season Sale</h1>
						<p class="text-white mb-4">Take 25% off all sweaters and
							knits. Discount applied at checkout.</p>
						<a href="shop.jsp" class="btn btn-light">shop now</a>
					</div>
				</div>
			</div>
		</section>

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
		<!-- collection -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-title">Top Collections</h2>
					</div>
					<div class="col-12">
						<div class="collection-slider">
<%
	ArrayList<ProductsModel> topProducts = new ProductsModel().getTopCollection();
	for(ProductsModel product : topProducts)
	{
%>
							<!-- product -->
							<div class="col-lg-4 col-sm-6">
								<div class="product text-center">
									<div class="product-thumb">
										<div class="overflow-hidden position-relative">
											<a href="product-single.jsp?productid=<%=product.getProductid()%>">
												<img class="img-fluid w-100 mb-3 img-first" style="min-height: 280px; max-height: 280px" src="<%= product.getImg1() %>" alt="product-img">
												<img class="img-fluid w-100 mb-3 img-second" style="min-height: 280px; max-height: 280px" src="<%= product.getImg2() %>" alt="product-img">
											</a>
											<div class="btn-cart">
												<a href="#" class="btn btn-primary btn-sm">Add To Cart</a>
											</div>
										</div>
									</div>
									<div class="product-info">
										<h3 class="h5">
											<a class="text-color" href="product-single.jsp"><%= product.getProductname() %></a>
										</h3>
										<span class="h5"><span style='font-size: 18px;'>&#x20B9;<%= product.getPrice() %></span></span>
									</div>
								</div>
							</div>
							<!-- //end of product -->
<%
	}
%>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /collection -->

		<!-- deal -->
		<section class="section bg-cover"
			data-background="images/backgrounds/deal.jpg">
			<div class="container">
				<div class="row">
					<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
						<h1>Deal of the day</h1>
						<h4 class="mb-40">Get at discounted price!</h4>
						<!-- syo-timer -->
						<div class="syotimer large">
							<div id="simple-timer" data-year="2019" data-month="12"
								data-day="1" data-hour="1"></div>
						</div>
						<a href="shop.jsp" class="btn btn-primary">shop now</a>
					</div>
					<div class="col-md-6 text-center text-md-left align-self-center">
						<img src="images/deal/product.png" alt="product-img"
							class="img-fluid up-down">
					</div>
				</div>
			</div>
		</section>
		<!-- /deal -->

		<!-- instagram -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-title">Most popular products</h2>
					</div>
					<div class="col-12">
						<div class="collection-slider">
<%
	int likes = 0;
	ArrayList<ProductsModel> mostPopularProducts = new ProductsModel().getMostLikedProducts();
	for (ProductsModel product:mostPopularProducts)
	{
		likes = new WishlistsModel().getLikes(product.getProductid());
%>
					
										<!-- product -->
							<div class="col-lg-4 col-sm-6">
								<div class="product text-center">
									<div class="product-thumb">
										<div class="overflow-hidden position-relative">
											<a href="product-single.jsp?productid=<%=product.getProductid()%>">
												<img class="img-fluid w-100 mb-3 img-first" style="min-height: 280px; max-height: 280px" src="<%= product.getImg1() %>" alt="product-img">
												<img class="img-fluid w-100 mb-3 img-second" style="min-height: 280px; max-height: 280px" src="<%= product.getImg2() %>" alt="product-img">
											</a>
											<div class="btn-cart">
												<a href="#" class="btn btn-primary btn-sm">Add To Cart</a>
											</div>
										</div>
									</div>
									<div class="product-info">
										<h3 class="h5">
											<a class="text-color" href="product-single.jsp"><%= product.getProductname() %></a>
										</h3>
										<span class="h5"><span style='font-size: 18px;'>&#x20B9;<%= product.getPrice() %></span></span>
									</div>
								</div>
							</div>
							<!-- //end of product -->
<%
	}
%>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /collection -->
					<%-- <div class="col-lg-2 col-md-3 col-sm-4 col-6 px-0 mb-4">
						<div class="instagram-post mx-2">
							<img class="img-fluid w-100" src="<%= product.getImg1() %>"
								alt="instagram-image" style="min-height: 240px; max-height: 240px">
							<ul class="list-inline text-center">
								<li class="list-inline-item"><a target="_blank"  class="text-white"><i class="ti-heart mr-2"></i><%= likes %></a></li>
								<!-- <li class="list-inline-item"><a href="%7b%7blink%7d%7d.jsp"
									target="_blank" class="text-white"><i
										class="ti-comments mr-2"></i>24</a></li> -->
							</ul>
						</div>
					</div> 
					
				</div>
				<!-- /without instagram image -->
			</div>
		</section>
		<!-- /instagram -->--%>

		<!-- service -->
		<section class="section-sm border-top">
			<div class="container">
				<div class="row text-center">
					<!-- service item -->
					<div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
						<div
							class="d-flex flex-sm-row flex-column align-items-center align-items-sm-start">
							<i class="ti-truck icon-lg mr-4 mb-3 mb-sm-0"></i>
							<div class="text-center text-sm-left">
								<h4>Free Shipping</h4>
								<p class="mb-0 text-gray">Free shipping on order over $70</p>
							</div>
						</div>
					</div> 
					<!-- service item -->
					<div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
						<div
							class="d-flex flex-sm-row flex-column align-items-center align-items-sm-start">
							<i class="ti-shield icon-lg mr-4 mb-3 mb-sm-0"></i>
							<div class="text-center text-sm-left">
								<h4>Secure Payment</h4>
								<p class="mb-0 text-gray">We ensure secure payment with PEV</p>
							</div>
						</div>
					</div>
					<!-- service item -->
					<div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
						<div
							class="d-flex flex-sm-row flex-column align-items-center align-items-sm-start">
							<i class="ti-timer icon-lg mr-4 mb-3 mb-sm-0"></i>
							<div class="text-center text-sm-left">
								<h4>Support 24/7</h4>
								<p class="mb-0 text-gray">Contact us 24 hours a day, 7 days
									a week</p>
							</div>
						</div>
					</div>
					<!-- service item -->
					<div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
						<div
							class="d-flex flex-sm-row flex-column align-items-center align-items-sm-start">
							<i class="ti-reload icon-lg mr-4 mb-3 mb-sm-0"></i>
							<div class="text-center text-sm-left">
								<h4>7 Days Return</h4>
								<p class="mb-0 text-gray">Simply return it within 7 days
									for an exchange.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /service -->

		<!-- newsletter -->
		<!-- <section class="section bg-gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-title">Our Newsletter</h2>
						<p class="mb-4">Subscribe to our Newsletter to receive early
							discount offers</p>
					</div>
					<div class="col-lg-6 col-md-8 col-sm-9 col-10 mx-auto">
						<form action="#" class="d-flex flex-column flex-sm-row">
							<input type="email"
								class="form-control rounded-0 border-0 mr-3 mb-4 mb-sm-0"
								id="mail" placeholder="Enter your email">
							<button type="submit" value="send" class="btn btn-primary">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</section>  -->
		<!-- /newsletter -->

		<!-- Newsletter Modal -->
		<!-- <div class="modal fade subscription-modal" id="subscriptionModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    modal content start
    <div class="modal-content">
      container start
      <div class="container-fluid">
        <div class="row">
            close button
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          <div class="col-lg-6 px-0">
            newsletter image
            <div class="image"><img src="images/newsletter-popup.jpg" alt="products" class="img-fluid w-100 rounded-left"></div>
          </div>
          <div class="col-lg-6 align-self-center p-5">
            Content start
            <div class="text-center align-self-center">
              <h3 class="mb-lg-5 mb-4">Lucky You!</h3>
              <h4>Want an Instant</h4>
              <h2 class="mb-lg-5 mb-4">10% OFF?</h2>
              newsletter form
              <div class="form">
                <input type="email" class="form-control mb-3" name="email" id="email" placeholder="Email Address">
                <button class="btn btn-primary w-100" type="submit">Join Us</button>
              </div>
            </div>
            Content end
          </div>
        </div>
      </div>
      container end
    </div>
    modal content end
  </div>
</div> -->
		<!-- /Newsletter Modal -->


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

<!-- Mirrored from demo.themefisher.com/elite-shop/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:49 GMT -->
</html>