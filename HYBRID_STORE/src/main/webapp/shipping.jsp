<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from demo.themefisher.com/elite-shop/shipping.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
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
					<li class="breadcrumb-item active" aria-current="page">Shipping
						Information</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<!-- shipping method -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="inner-wrapper border-box">
							<!-- navbar -->
							<div class="justify-content-between nav mb-5">
								<a href="#"
									class="text-center d-inline-block active nav-item" style="flex-basis: 50%;"> <i
									class="ti-bag d-block mb-2"></i> <span class="d-block h4">Select Branch</span>
								</a><!--  <a href="payment.jsp"
									class="text-center d-inline-block nav-item"> <i
									class="ti-wallet d-block mb-2"></i> <span class="d-block h4">Payment
										Method</span>
								</a> --> <a href="#"
									class="text-center d-inline-block nav-item" style="flex-basis: 50%;"> <i
									class="ti-eye d-block mb-2"></i> <span class="d-block h4">Review</span>
								</a>
							</div>
							<!-- /navbar -->

							<!-- shipping-address -->
							<h3 class="mb-5 border-bottom pb-2">Select Branch</h3>
							<form>
						
								<div class="row" style="width: 500px; padding-left: 35px;">
								<label for="branch" style="margin-top: 12px;">Branch</label> 
<%
	int cartid = new CartModel().getActiveCartidByConsumerid(consumer.getConsumerid());
%>
						<input type="hidden" id="cartid" value="<%= cartid %>">
								 <div class="col-sm-6">
									<select class="form-control" id="branch">
									
<%
	ArrayList<BranchesModel> branchlist = new BranchesModel().getAllBranches();
	for (BranchesModel branch : branchlist) 
	{
%>
											<option value="<%=branch.getBranchid()%>"><%=branch.getBranchname()%></option>
<%
	}
%>
									</select>
								</div>
								</div>
								
								<div class="table-responsive" style="display: ;">
											<table class="table cart-table">
												<thead>
													<tr>
														<!-- <th></th> -->
														<th>Product Name</th>
														<th></th>
														<th>Price</th>
														<th>Quantity</th>
														<th>Sub Total</th>
													</tr>
												</thead>
												<tbody id="products">
												</tbody>
											</table>
										</div> 
							</form>
							
							<!-- /shipping-address -->
							<div class="p-4 bg-gray text-right" id="continue" style="display: none;">
								<button id="viewOrderReview" class="btn btn-primary">Continue</button>
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
								<li class="d-flex justify-content-between"><span>Shipping
										& Handling</span> <span>$15.00</span></li>
								<li class="d-flex justify-content-between"><span>Estimated
										Tax</span> <span>$0.00</span></li>
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
		<!-- /shipping method -->

		<%@ include file="footer.jsp"%>

	</div>
	<!-- /main wrapper -->
	<script>
		
		window.onload = function(){
			
			var branchid = document.getElementById('branch');
			var cartid = document.getElementById('cartid');
			checkProducts();
			$('#branch').on('change',function(){
				checkProducts();
			});
			function checkProducts(){
				$.ajax({
					url : "filter.jsp",
					method : "GET",
					data : {
						branchid : branchid.value,
						cartid : cartid.value
					},
					success : function(data) {
						$('.table-responsive').css('display','block');
						var totalitems = (data.split("totalitems")[1]).split("value='")[1];
						if(totalitems != undefined)
						{
							$('#continue').css('display','');	
						}
						else
						{
							$('#continue').css('display','none');
						}
						$('#products').html((data.split('<body>'))[1].split('</html>')[0]);
						
						var ProductPrices = document.getElementsByName("ProductPrice");
						var Productids = document.getElementsByName("productids");
						for(var i=0;i<ProductPrices.length;i++)
						{
							gettotal( ProductPrices[i].value , i , Productids[i].value );
						}
					}
				})
			}
			$("#viewOrderReview").click(function(){
				window.location.href="review.jsp?cartid="+cartid.value+"&branchid="+branchid.value;
			});
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

<!-- Mirrored from demo.themefisher.com/elite-shop/shipping.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
</html>