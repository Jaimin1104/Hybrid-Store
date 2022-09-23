<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="hybridstore.model.BrandsModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.CategoriesModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

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
			<form action="../ProductsController" method="post" enctype="multipart/form-data">
				<section class="content-main" style="max-width: 1200px">
					<div class="content-header">
						<h2 class="content-title">New Product</h2>
						<div>
							<a href="admin-addproduct.jsp" class="btn btn-outline-danger">&times;Discard</a>
							<button type="submit" name="btn" value="save as draft product" onclick="notrequirestock()" class="btn btn-outline-secondary">
								Save As Draft
							</button>
							<button type="submit" name="btn" value="add product" onclick="requirestock()" class="btn btn-primary">
								Publish now
							</button>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-xl-8 col-lg-8">
							<div class="card mb-4">
								<div class="card-body">
									<div class="mb-4">
										<label for="product_title" class="form-label">Product title</label>
										<input type="text" name="productname" autocomplete="off" placeholder="Type here" class="form-control" id="product_name" required>
									</div>
									<div class="mb-4">
										<label class="form-label">Category</label>
										<input class="form-control" autocomplete="off" placeholder="Search Here..." list="category_browser" name="category" required>
										<datalist id="category_browser">
<%
	ArrayList<CategoriesModel> categorylist = new CategoriesModel().getAllCategories();
	for (CategoriesModel category : categorylist) 
	{
%>
											<option value="<%=category.getCategoryname()%>">
<%
	}
%>	
										</datalist>
									</div>
									<div class="mb-4">
										<label class="form-label">Sub Category</label>
										<input class="form-control" placeholder="Search Here..." list="subcategory_browsers" autocomplete="off" name="subcategory" id="browser" required>
										<datalist id="subcategory_browsers">
<%
	ArrayList<SubCategoriesModel> subcategorylist = new SubCategoriesModel().getAllSubCategories();
	for (SubCategoriesModel subcategory : subcategorylist) 
	{
%>
											<option value="<%=subcategory.getSubcategoryname()%>">
<%
	}
%>	
										</datalist>
									</div>
									
									<div class="mb-1">
										<label class="form-label">Images</label>
									</div>
									<div class="card mb-4" style="width:100%;height: 160px;flex-direction: row;" id="uploadImages">
										<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;" class="insertImage">
											<input type="file" style="display:none" name="file" class="productImage">
											<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
											<img data-type="preview" class="previewImage" src="" style="cursor: default;display:none;height: 100%;width: 100%;">
											<div data-type="image-buttons" class="row justify-content-center mt-2">
												<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
													<span class="fa fa-pencil-alt mr-2"></span>Modify
												</button>
											</div>
										</div>
										<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;display: none;margin-left: 19px;" class="insertImage">
											<input type="file" style="display:none" name="file" class="productImage">
											<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
											<img data-type="preview" class="previewImage" src="" style="cursor: default;display:none;height: 100%;width: 100%;">
											<div data-type="image-buttons" class="row justify-content-center mt-2">
												<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
													<span class="fa fa-pencil-alt mr-2"></span>Modify
												</button>
											</div>
										</div>
										<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;display: none;margin-left: 19px;" class="insertImage">
											<input type="file" style="display:none" name="file" class="productImage">
											<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
											<img data-type="preview" class="previewImage" src="" style="cursor: default;display:none;height: 100%;width: 100%;">
											<div data-type="image-buttons" class="row justify-content-center mt-2">
												<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
													<span class="fa fa-pencil-alt mr-2"></span>Modify
												</button>
											</div>
										</div>
										<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;display: none;margin-left: 19px;" class="insertImage">
											<input type="file" style="display:none" name="file" class="productImage">
											<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
											<img data-type="preview" class="previewImage" src="" style="cursor: default;display:none;height: 100%;width: 100%;">
											<div data-type="image-buttons" class="row justify-content-center mt-2">
												<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
													<span class="fa fa-pencil-alt mr-2"></span>Modify
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- card end// -->
							
							<!-- <div class="card mb-4">
								<div class="mb-4">
									<div style="padding: 20px;">
										<label class="form-label">Images</label>
										<input class="form-control" type="file" name="file" multiple>
									</div>
								</div>
							</div> -->
							<!-- card end// -->
							
						</div>
						<!-- col end// -->
						
						<aside class="col-xl-4 col-lg-4">
							<div class="card mb-4">
								<div class="card-body">
									<div class="mb-4">
										<label class="form-label">Price</label>
										<input type="text" name="price" autocomplete="off" inputmode="numeric" placeholder="Enter Price" class="form-control" required>
									</div>
									<div class="mb-4">
										<label class="form-label">Stock</label>
										<input type="text" id="stock" name="stock" autocomplete="off" inputmode="numeric" placeholder="Enter stock" class="form-control">
									</div>
									<div class="mb-4">
										<label class="form-label">Brand</label>
										<input class="form-control" placeholder="Search Here..." list="brand_browser" autocomplete="off" name="brand" id="browser" required>
										<datalist id="brand_browser">
<%
	ArrayList<BrandsModel> brandlist = new BrandsModel().getAllBrands();
	for (BrandsModel brand : brandlist) 
	{
%>
											<option value="<%=brand.getBrandname()%>">
<%
	}
%>	
										</datalist>
									</div>
									<div class="mb-4">
										<label class="form-label">Branch</label>
										<input class="form-control" placeholder="Search Here..." list="branch" autocomplete="off" name="branchname" id="branches" required>
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
									<hr>
									<div>
										<label class="form-label">Description</label>
										<textarea name="description" autocomplete="off" placeholder="Type here" class="form-control" rows="4" required></textarea>
									</div>
								</div>
							</div>
						</aside>
					</div>
				</section>
			</form>
	
		</main>

		<script type="text/javascript">
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
			
			function requirestock() {
				var x = document.getElementById('stock');
				x.required="required";
				var y = document.getElementById('branches');
				y.required="required";
			}
			
			function notrequirestock() {
				$("#stock").removeAttr("required");
				$("#branches").removeAttr("required");
			}
			
		    var currentDivTag = 0;
		    var activeDivTag;
		    var insertImage = document.getElementsByClassName("insertImage");
    		var cameraImage = document.getElementsByClassName("cameraImage");
    		var productImage = document.getElementsByClassName("productImage");
    		var previewImage = document.getElementsByClassName("previewImage");
    		var modifyImage = document.getElementsByClassName("modifyImage");
		    $(document).ready(function() {
		    	
		    	$(".insertImage").hover(function(){
		    		activeDivTag = $(".insertImage").index(this);
		    	});
		    	
		    	$(".cameraImage").click(function(){
		    		$(".productImage")[activeDivTag].click();
		    	});	
		    	
		    	$(".productImage").change(function(e){
		    		if(currentDivTag < 3)
		    		{
		    			currentDivTag += 1;
		    			insertImage[currentDivTag].style.display = "block";
		    		}
		    		var file = e.target.files[0];
		    		var reader = new FileReader();
		    	    reader.onload = function(){
		    	      var output = previewImage[activeDivTag];
		    	      output.src = reader.result;
		    	      output.style.display = "block";
		    	      cameraImage[activeDivTag].style.display = "none";
		    	    };
		    	    reader.readAsDataURL(e.target.files[0]);
		    	});
		    	
		    	$(".modifyImage").click(function(){
		    		activeDivTag = $(".modifyImage").index(this);
		    		$(".productImage")[activeDivTag].click();
		    	});
		    	
		    	$(".previewImage").hover(function(){
		    		activeDivTag = $(".previewImage").index(this);
		    		$(modifyImage[activeDivTag]).css("opacity","1");
		    		$(modifyImage[activeDivTag]).css("display","block");
		    	});
		    	
		    	$(".modifyImage").hover(function(){
		    		activeDivTag = $(".modifyImage").index(this);
		    		$(this).css("opacity","1");
		    		$(this).css("display","block");
		    		$(previewImage[activeDivTag]).css("opacity","0.3");
		    		$(this).css({"background-color":"#00b517","font-color":"black"});
		    	});
		    	
		    	$(".modifyImage").mouseout(function(){
		    		$(this).css("opacity","0");
		    		$(this).css({"background-color":"white","font-color":"#00b517"});
		    		$(previewImage[activeDivTag]).css("opacity","1");
		    		$(previewImage[activeDivTag]).css("display","block");
		    	});
		    	
		    	$(".insertImage").mouseout(function(){
		    		$(modifyImage[activeDivTag]).css("opacity","0");
		    		$(modifyImage[activeDivTag]).css("display","none");
		    		$(insertImage[activeDivTag]).css("border","2px solid black");
		    	});
		    });
		</script>

		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>
		
	</body>
</html>