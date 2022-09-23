<%@page import="hybridstore.model.BrandsModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/shop.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:52 GMT -->
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
					<li class="breadcrumb-item"><a href="shop.jsp">Shop</a></li>

				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->
		
		<div id="quickView" class="quickview">
<%
	int productid = 1;
	ProductsModel product = new ProductsModel().getProduct(productid);
%>
			<div class="row w-100">
				<div class="col-lg-6 col-md-6 mb-5 mb-md-0 pl-5 pt-4 pt-lg-0 pl-lg-0">
					<img src="<%= product.getImg1() %>" alt="product-img" class="img-fluid">
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

		<!-- shop -->
		<section class="section">
			<div class="container">
				<div class="row">
					<!-- top bar -->
					<div class="col-lg-12 mb-50">
						<div class="d-flex border">
							<div class="flex-basis-15 p-2 p-sm-4 border-right text-center">
								<a 
									class="text-color d-inline-block px-1" onclick="fix_displayway('thumble')"><button
									class="ti-layout-grid3-alt" style="border: none;background-color: transparent;"></button></a> 
								<a
									class="text-gray d-inline-block px-1" onclick="fix_displayway('list')"><button
									class="ti-view-list-alt" style="border: none;background-color: transparent;"></button></a>
							</div>
							<div class="flex-basis-55 p-2 p-sm-4 align-self-sm-center">
								<p class="text-gray mb-0" id="pageDiscription">
									Showing <span class="text-color">1-9 of 20</span> Results
								</p>
							</div>
							<!-- <div
								class="flex-basis-15 p-2 p-sm-4 border-right border-left text-center">
								<select class="select" name="filter" id="filter">
									<option value="1">Filter</option>
									<option value="2">Popular</option>
									<option value="3">Top Products</option>
								</select>
							</div>
							<div class="flex-basis-15 p-2 p-sm-4 text-center">
								<select class="select" name="short" id="short">
									<option value="1">Short</option>
									<option value="2">A-Z</option>
									<option value="3">Z-A</option>
								</select>
							</div> -->
						</div>
					</div>
					<%
					int min = new ProductsModel().getMinimumPrice();
					int max = new ProductsModel().getMaximumPrice();
					%>
					<!-- sidebar -->
					<div class="col-lg-3">
						<!-- search product -->
						<div class="position-relative mb-5">
							<form action="#">
								<input type="search" class="form-control rounded-0" onkeyup="searchData()"
									id="search-product" placeholder="Search...">
								<!-- <button type="submit" class="search-icon pr-3 r-0">
									<i class="ti-search text-color"></i>
								</button> -->
							</form>
						</div>
						<!-- categories -->
						<%-- <div class="mb-30">
							<h4 class="mb-3">Shop by Category</h4>
								<%
								ArrayList<CategoriesModel> displaycategories = new CategoriesModel().getAllCategories();
								for (CategoriesModel dcategory : displaycategories) {
									int totalProducts = new ProductsModel().getTotalProductsByCategoryid(dcategory.getCategoryid());
									if(totalProducts>0)
									{
								%>
								<div class="d-flex justify-content-between custom-checkbox">
									<label class="label"><%=dcategory.getCategoryname()%><input
										type="checkbox" class="common_selector" id="category" name="category"
										value="<%=dcategory.getCategoryid()%>"> <span
										class="box" style="border-radius: 0%;"></span> </label> <span class="mt-2"><%= totalProducts%></span>
								</div>
								<%
									}
								}
								%>
						</div> --%>
						<span id="displayFilter">
						
							<%-- 	<%
								ArrayList<SubCategoriesModel> displaysubcategory = new SubCategoriesModel().getAllSubCategories();
								for (SubCategoriesModel dsubcategory : displaysubcategory) {
									int totalProducts = new ProductsModel().getTotalProductsBySubCategoryid(dsubcategory.getSubcategoryid());
									if(totalProducts>0)
									{
								%>
								<div class="d-flex justify-content-between custom-checkbox">
									<label class="label"><%=dsubcategory.getSubcategoryname()%><input
										type="checkbox" class="common_selector" id="subcategory" name="subcategory"
										value="<%=dsubcategory.getSubcategoryid()%>"> <span
										class="box" style="border-radius: 0%;"></span> </label> <span class="mt-2"><%= totalProducts %></span>
								</div>
								<%
									}
								}
								%> --%>
					<%-- <h4 class="mb-3">Shop by Brands</h4>
								<%
								ArrayList<BrandsModel> displaybrands = new BrandsModel().getAllBrands();
								for (BrandsModel brand : displaybrands) {
									int totalProducts = new ProductsModel().getTotalProductsByBrandid(brand.getBrandid());
									if(totalProducts>0)
									{
								%>
								<div class="d-flex justify-content-between custom-checkbox">
									<label class="label"><%=brand.getBrandname()%><input
										type="checkbox" class="common_selector" id="brand"
										value="<%=brand.getBrandid()%>"> <span class="box" style="border-radius: 0%;"></span>
									</label> <span class="mt-2"><%= totalProducts %></span>
								</div>
								<%
									}
								}
								%> --%>
					</span>
						<!-- price range -->
						 <div class="mb-30">
							<h4 class="mb-4">Shop by Price</h4>
							<input class="range-track" type="text" id="price_range"
								data-slider-min="<%=min%>" data-slider-max="<%=max%>"
								data-slider-step="1"
								data-slider-value="[<%=min%>,<%=max%>]" />
							<div class="d-flex justify-content-between">
								<button class="btn btn-sm btn-primary common_selector">Filter</button>
								<span class="value" id="price">&#x20B9;<%=min%> - &#x20B9;<%=min + (max * 20 / 100)%></span>
							</div>
						</div> 

						
						<!-- 
						<div class="color">
							<h4 class="mb-3">Shop by Color</h4>
							<ul class="list-inline">
								<li class="list-inline-item mr-4"><label class="radio">
										<input type="radio" name="radio"> <span
										class="radio-box bg-magenta"></span>
								</label></li>
								<li class="list-inline-item mr-4"><label class="radio">
										<input type="radio" name="radio"> <span
										class="radio-box bg-dark-green"></span>
								</label></li>
								<li class="list-inline-item mr-4"><label class="radio">
										<input type="radio" name="radio"> <span
										class="radio-box bg-sky-blue"></span>
								</label></li>
								<li class="list-inline-item mr-4"><label class="radio">
										<input type="radio" name="radio"> <span
										class="radio-box bg-red"></span>
								</label></li>
								<li class="list-inline-item mr-4"><label class="radio">
										<input type="radio" name="radio"> <span
										class="radio-box bg-dark"></span>
								</label></li>
							</ul>
						</div> -->
					</div>
					<!-- product-list -->
					<div class="col-lg-9">
						<div class="row" id="products">
							<!-- product -->

							<!-- //end of product -->
							<!-- product -->
						</div>
						<div class='col-12 mt-5'><nav><ul class='pagination justify-content-center'>
						</ul>
						</nav>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /shop -->

		<%@ include file="footer.jsp"%>

	</div>
	
	<!-- /main wrapper -->
	<script>
		var currentPage = 1;
	    var numberOfRecords;
	    var display_way = "thumble";
		var maximumRecordsPerPage;
		var numberOfPagesRequired;
		var search_data = '';
		var loadPage = window.location.search.substring(1);
		var queryString = loadPage.split('=');
		window.onload = function () {
			filter_data();
			$('.common_selector').click(function() {
				clicked_filter();
			});
			$('.pagination').click(function() {
				filter_data();
			});
		}
		function searchData() {
			search_data = document.getElementById('search-product').value;
			currentPage = 1;
			filter_data();
		}
		function fix_displayway(display){
			display_way = display;
			filter_data();
		}
		function clicked_filter() {
			currentPage = 1;
			filter_data();
		}
		function filter_data() {
			data_counter();
			var action = "Active";
			var brand = get_filter('brand');
			var category = get_filter('category');
			var subcategory = get_filter('subcategory');
			var price_range = $('#price_range').val();
			$.ajax({
				url : "filter.jsp",
				method : "GET",
				data : {
					action : action,
					brand : brand.toString(),
					category : category.toString(),
					subcategory : subcategory.toString(),
					price_range : price_range.toString(),
					search_data : search_data,
					currentPage : currentPage,
					display_products : display_way
				},
				success : function(data) {
					$('#products').html(data);
				}
			});
		}
		function data_counter() {
			var action = "counter";
			var brand = get_filter('brand');
			var category = get_filter('category');
			var subcategory = get_filter('subcategory');
			var price_range = $('#price_range').val();
			$.ajax({
				url : "filter.jsp",
				method : "GET",
				data : {
					action : 'side_filter',
					brand : brand.toString(),
					category : category.toString(),
					subcategory : subcategory.toString(),
					
				},
				success : function(data) {
					$('#displayFilter').html(data);
					
					var newcategory = document.getElementsByName('category');
					for(let i=0;i<newcategory.length;i++)
					{
						for(let j=0;j<category.length;j++)
						{
							if(newcategory[i].value === category[j])
							{
								newcategory[i].checked = true;
							}
						}
					}
					if(queryString[0] === 'categoryid')
					{
						for(let i=0;i<newcategory.length;i++)
						{
							if(newcategory[i].value === queryString[1])
							{
								newcategory[i].checked = true;
								queryString[1] = -1;
								filter_data()
							}
						}
						
					}
					var newsubcategory = document.getElementsByName('subcategory');
					for(let i=0;i<newsubcategory.length;i++)
					{
						for(let j=0;j<subcategory.length;j++)
						{
							if(newsubcategory[i].value === subcategory[j])
							{
								newsubcategory[i].checked = true;
							}
						}
					}
					if(queryString[0] === 'subcategoryid')
					{
						for(let i=0;i<newsubcategory.length;i++)
						{
							if(newsubcategory[i].value === queryString[1])
							{
								newsubcategory[i].checked = true;
								queryString[1] = -1;
								filter_data()
							}
						}
					}
					var newbrand = document.getElementsByName('brand');
					for(let i=0;i<newbrand.length;i++)
					{
						for(let j=0;j<brand.length;j++)
						{
							if(newbrand[i].value === brand[j])
							{
								newbrand[i].checked = true;
							}
						}
					} 
				}
			});
			$.ajax({
				url : "filter.jsp",
				method : "GET",
				data : {
					action : action,
					brand : brand.toString(),
					category : category.toString(),
					subcategory : subcategory.toString(),
					price_range : price_range.toString(),
					search_data : search_data,
					display_products : display_way
				},
				success : function(data) {
					var totalProducts = parseInt((data.split('<body>'))[1].split('<script>'));
					numberOfRecords = totalProducts;
					if(display_way == "thumble")
					{
						maximumRecordsPerPage = 12;
					}
					else
					{
						maximumRecordsPerPage = 8;
					}
					numberOfPagesRequired = Math.ceil(numberOfRecords/maximumRecordsPerPage);
					var previousElement = "<li id='previous' class='page-item'><a class='page-link big' onclick='displayPreviousPage()' href='#'>Prev</a></li>";
					var nextElement = "<li id='next' class='page-item'><a class='page-link big' onclick='displayNextPage()' href='#'>Next</a></li>";
					var list = document.getElementsByClassName("pagination");
					list[0].innerHTML = previousElement;
					for(let i=1;i<=numberOfPagesRequired;i++)
					{
						var pageElement = "<li class='page-item'><a class='page-link' onclick='displayRecords(this)' href='#'>"+i+"</a></li>";
						list[0].innerHTML += pageElement;
					}
					list[0].innerHTML += nextElement;
				 	var allPages = document.getElementsByClassName("page-item");
					for(let i=0;i<allPages.length;i++)
					{
						var pages = parseInt(allPages[i].innerText);
						if(pages == currentPage)
						{
							allPages[i].className = "page-item active";
						}
					}
					if(numberOfRecords>0)
					{
						if(numberOfPagesRequired == currentPage)
						{
							$('#pageDiscription').html("Showing <span class='text-color'>"+((currentPage - 1) * maximumRecordsPerPage + 1) +"-"+ numberOfRecords +" of "+numberOfRecords+"</span> Results");
						}
						else
						{
							$('#pageDiscription').html("Showing <span class='text-color'>"+((currentPage - 1) * maximumRecordsPerPage + 1) +"-"+((currentPage - 1) * maximumRecordsPerPage + maximumRecordsPerPage)+" of "+numberOfRecords+"</span> Results");
						}
					}
					else
					{
						$('#pageDiscription').html("");
					}
					checkPreviousNextPage();
				}
			});
		}
		function get_filter(id_name) {
			var filter = [];
			$('#' + id_name + ':checked').each(function() {
				filter.push($(this).val());
			});
			return filter;
		}
		function displayRecords(page) {
		    var allPages = document.getElementsByClassName("page-item active");
		    for (let i = 0; i < allPages.length; i++) {
		        allPages[i].className = allPages[i].className.replace(" active", "");
		    }
		    $(page).parent().addClass("active");
		    var pagenumber = parseInt(page.innerText);
		    currentPage = pagenumber;
		    console.log("currentPage : " + currentPage);
		    checkPreviousNextPage();
		}

		function displayNextPage() {
		    currentPage = currentPage + 1;
		    console.log("currentPage : " + currentPage);
		    var allPages = document.getElementsByClassName("page-item active");
		    for (let i = 0; i < allPages.length; i++) {
		        allPages[i].className = allPages[i].className.replace(" active", "");
		    }
		    var allPages = document.getElementsByClassName("page-item");
		    for (let i = 0; i < allPages.length; i++) {
		        if (allPages[i].innerText == currentPage) {
		            allPages[i].className = "page-item active";
		            break;
		        }
		    }
		    checkPreviousNextPage();
		}

		function displayPreviousPage() {
		    currentPage = currentPage - 1;
		    console.log("currentPage : " + currentPage);
		    var allPages = document.getElementsByClassName("page-item active");
		    for (let i = 0; i < allPages.length; i++) {
		        allPages[i].className = allPages[i].className.replace(" active", "");
		    }
		    var allPages = document.getElementsByClassName("page-item");
		    for (let i = 0; i < allPages.length; i++) {
		        if (allPages[i].innerText == currentPage) {
		            allPages[i].className = "page-item active";
		            break;
		        }
		    }
		    checkPreviousNextPage();
		}

		function checkPreviousNextPage() {
			if(numberOfPagesRequired <= 1){
				$(".pagination").css('display','none');
			}else if (currentPage == numberOfPagesRequired) {
		        $("#previous").removeClass("disabled");
		        $("#next").addClass("disabled");
		        $(".pagination").css('display','');
			} else if (currentPage == 1) {
		        $("#previous").addClass("disabled");
		        $("#next").removeClass("disabled"); 
		        $(".pagination").css('display','');
		    } else {
		        $("#previous").removeClass("disabled");
		        $("#next").removeClass("disabled");
		        $(".pagination").css('display','');
		    }
		}
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

	<script src="plugins/bootstrap-touchspin-master/jquery.bootstrap-touchspin.min.js"></script>
	<script src="plugins/nice-select/jquery.nice-select.min.js"></script>
	<script src="plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
	<!-- google map -->
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&amp;libraries=places"></script>
	 -->
	<script src="plugins/google-map/gmap.js"></script>
	<!-- Main Script -->
	
	<script src="js/script.js"></script>
</body>

<!-- Mirrored from demo.themefisher.com/elite-shop/shop.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:53 GMT -->
</html>