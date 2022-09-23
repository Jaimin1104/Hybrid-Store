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
            
<%
	ProductsModel product = new ProductsModel();
	CategoriesModel productcategory = new CategoriesModel();
	SubCategoriesModel productsubcategory = new SubCategoriesModel();
	BrandsModel productbrand = new BrandsModel();
	BranchesModel productbranch = new BranchesModel();
	product = product.getProduct(Integer.parseInt(request.getParameter("productid")));
	productcategory = productcategory.getCategory(product.getCategoryid());
	productsubcategory = productsubcategory.getSubCategory(product.getSubcategoryid());
	productbrand = productbrand.getBrand(product.getBrandid());
%>
			<form action="../ProductsController" method="post" enctype="multipart/form-data">
				<section class="content-main" style="max-width: 1200px">
					<div class="content-header">
						<h2 class="content-title">Edit Product</h2>
						<div>
							<input type="hidden" name="productid" value="<%=product.getProductid()%>">
							<button type="submit" name="btn" value="update product" onclick="validate_form()" class="btn btn-primary">Update</button>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-xl-8 col-lg-8">
							<div class="card mb-4">
								<div class="card-body">
									<div class="mb-4">
										<label for="product_title" class="form-label">Product title</label>
										<input type="text" name="productname" autocomplete="off" value="<%=product.getProductname()%>" placeholder="Type here" class="form-control" id="product_name">
									</div>
									<div class="mb-4">
										<label class="form-label">Category</label>
										<input value="<%=productcategory.getCategoryname()%>" class="form-control" autocomplete="off" placeholder="Search Here..." list="category_browser" name="category">
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
										<input value="<%=productsubcategory.getSubcategoryname()%>" class="form-control" placeholder="Search Here..." list="subcategory_browsers" autocomplete="off" name="subcategory" id="browser">
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
								</div>
							</div>
							<!-- card end// -->
							
							<div class="card mb-4"  style="padding: 20px;">
								<div class="mb-1">
									<label class="form-label">Images</label>
									<input type="hidden" id="productImage1" value="<%= product.getImg1() %>">
									<input type="hidden" id="productImage2" value="<%= product.getImg2() %>">
									<input type="hidden" id="productImage3" value="<%= product.getImg3() %>">
									<input type="hidden" id="productImage4" value="<%= product.getImg4() %>">
								</div>
								<div class="card mb-4" style="width:100%;height: 160px;flex-direction: row;" id="uploadImages">
									<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;" class="insertImage">
										<input type="file" style="display:none" name="file" class="productImage" multiple="multiple">
<%
	if(product.getImg1() == null)
	{
%>
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="" style="cursor: default; display:none; height: 100%; width: 100%;">
<%
	}
	else
	{
%>		
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: none;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="../<%= product.getImg1() %>" style="cursor: default;height: 100%;width: 100%;">
<%
	}
%>								
										<div data-type="image-buttons" class="row justify-content-center mt-2">
											<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
												<span class="fa fa-pencil-alt mr-2"></span>Modify
											</button>
										</div>
									</div>
									<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;margin-left: 19px;" class="insertImage">
										<input type="file" style="display:none" name="file" class="productImage" multiple="multiple">
<%
	if(product.getImg2() == null)
	{
%>
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="" style="cursor: default; display:none; height: 100%; width: 100%;">
<%
	}
	else
	{
%>		
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: none;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="../<%= product.getImg2() %>" style="cursor: default;height: 100%;width: 100%;">
<%
	}
%>
										<div data-type="image-buttons" class="row justify-content-center mt-2">
											<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
												<span class="fa fa-pencil-alt mr-2"></span>Modify
											</button>
										</div>
									</div>
									<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;margin-left: 19px;" class="insertImage">
										<input type="file" style="display:none" name="file" class="productImage" multiple="multiple">
<%
	/* product.setImg3(null); */
	if(product.getImg3() == null)
	{
%>
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="" style="cursor: default; display:none; height: 100%; width: 100%;">
<%
	}
	else
	{
%>		
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: none;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="../<%= product.getImg3() %>" style="cursor: default;height: 100%;width: 100%;">
<%
	}
%>
										<div data-type="image-buttons" class="row justify-content-center mt-2">
											<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
												<span class="fa fa-pencil-alt mr-2"></span>Modify
											</button>
										</div>
									</div>
									<div style="height: 100%;width: 23%;border: 2px solid black;position: relative;margin-left: 19px;" class="insertImage">
										<input type="file" style="display:none" name="file" class="productImage" multiple="multiple">
<%
	/* product.setImg4(null); */
	if(product.getImg4() == null)
	{
%>
										<img data-type="noimage" class="cameraImage" src="images/photo-camera-gray.svg" style="cursor: pointer;display: block;height: 100%;width: 100%;">
										<img data-type="preview" class="previewImage" src="" style="cursor: default; display:none; height: 100%; width: 100%;">
<%
	}
	else
	{
%>		
										<img data-type="preview" class="previewImage" src="../<%= product.getImg4() %>" style="cursor: default;height: 100%;width: 100%;">
<%
	}
%>
										<div data-type="image-buttons" class="row justify-content-center mt-2">
											<button data-type="btn-modify" type="button" class="btn btn-outline-success m-0 modifyImage" data-toggle="popover" data-placement="right" style="width: 100px;top: 70%;position: absolute;display: none;background-color: white;" >
												<span class="fa fa-pencil-alt mr-2"></span>Modify
											</button>
										</div>
									</div>
								</div>
								<!-- card end// -->
							</div>
							
							<%-- <div class="card mb-4">
								<div class="mb-4">
									<div style="padding: 20px;">
										<label class="form-label">Images</label>
										<input type="hidden" id="productImage1" value="<%= product.getImg1() %>">
										<input type="hidden" id="productImage2" value="<%= product.getImg2() %>">
										<input type="hidden" id="productImage3" value="<%= product.getImg3() %>">
										<input type="hidden" id="productImage4" value="<%= product.getImg4() %>">
										<input class="form-control" id="imagesOfProducts" type="file" name="file" multiple>
									</div>
								</div>
							</div> --%>
							<!-- card end// -->
							
						</div>
						<!-- col end// -->
						
						<aside class="col-xl-4 col-lg-4">
							<div class="card mb-4">
								<div class="card-body">
									<div class="mb-4">
										<label class="form-label">Price</label>
										<input type="text" autocomplete="off" value="<%=product.getPrice()%>" name="price" inputmode="numeric" placeholder="Enter Price" class="form-control">
									</div>
									<!-- <div class="mb-4">
											<label class="form-label">Status</label> <select name="status" class="form-select">
												<option>Published</option>
												<option>Draft</option>
												<option>Active</option>
											</select>
									</div> -->
									<div class="mb-4">
										<label class="form-label">Brand</label>
										<input value="<%= productbrand.getBrandname() %>" class="form-control" placeholder="Search Here..." list="brand_browser" autocomplete="off" name="brand" id="browser">
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
									<%-- <div class="mb-4">
										<label class="form-label">Branch</label>
										<input value="<%= productbranch.getBranchname() %>" autocomplete="off" class="form-control" placeholder="Search Here..." list="branch_browser" name="branch" id="browser">
										<datalist id="branch_browser">
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
									</div> --%>
									<hr>
									<div>
										<label class="form-label">Description</label>
										<textarea name="description" placeholder="Type here" autocomplete="off" class="form-control" rows="4"><%= product.getDescription() %></textarea>
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
			
		    var currentDivTag = 0;
		    var activeDivTag;
		    var insertImage = document.getElementsByClassName("insertImage");
    		var cameraImage = document.getElementsByClassName("cameraImage");
    		var productImage = document.getElementsByClassName("productImage");
    		var previewImage = document.getElementsByClassName("previewImage");
    		var modifyImage = document.getElementsByClassName("modifyImage");
    		var image1 = document.getElementById("productImage1").value;
			var image2 = document.getElementById("productImage2").value;
			var image3 = document.getElementById("productImage3").value;
			var image4 = document.getElementById("productImage4").value;
			
    		var list1 = new DataTransfer();
    		var list2 = new DataTransfer();
    		var list3 = new DataTransfer();
    		var list4 = new DataTransfer();
    		
    		var file1 = new File(["content"], image1);
			list1.items.add(file1);
			var file2 = new File(["content"], image2);
			list2.items.add(file2);
			var file3 = new File(["content"], image3);
			list3.items.add(file3);
			var file4 = new File(["content"], image4);
			list4.items.add(file4);
			
			productImage[0].files = list1.files;
			productImage[1].files = list2.files;
			productImage[2].files = list3.files;
			productImage[3].files = list4.files;
			
    		
		    $(document).ready(function(event) {
	    		
		    	$(".insertImage").hover(function(){
		    		activeDivTag = $(".insertImage").index(this);
		    	});
		    	
		    	$(".cameraImage").click(function(){
		    		var productImage = document.getElementsByClassName("productImage");
			    	for(let i=0;i<productImage.length;i++)
					{
						console.log(productImage[i].files);
					} 
		    		$(".productImage")[activeDivTag].click();
		    	});	
		    	
		    	$(".productImage").change(function(e){
		    		var file = e.target.files[0];
		    		console.log(file);
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