<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:56 GMT -->
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
					<li class="breadcrumb-item active" aria-current="page">Cart</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<div class="section">
			<div class="cart shopping">
				<div class="container">
					<div class="row">
						<div class="col-md-10 mx-auto">
							<div class="block">
								<div class="product-list">
										<div class="table-responsive">
											<table class="table cart-table">
												<thead>
													<tr>
														<th></th>
														<th>Product Name</th>
														<th></th>
														<th>Price</th>
														<th>Quantity</th>
														<th>Sub Total</th>
													</tr>
												</thead>
												<tbody>
<%
	int count=0;
	int cartid = new CartModel().getActiveCartidByConsumerid(consumer.getConsumerid());
	ArrayList<CartItemsModel> cartitems = new CartItemsModel().getAllCartItemsByCart(cartid);
	if(cartitems.isEmpty())
	{
%>
										<tr>
										<td colspan="6" class="text-center"> Your Cart is Empty</td>
										</tr>
<%
	}
	else
	{
		for(CartItemsModel cartitem : cartitems)
		{
			ProductsModel product = new ProductsModel().getProduct(cartitem.getProductid());
%>
													<tr>
														<td>
															<form action="CartsController.do" method="post"> 
															<input type="hidden" name ="productid" value="<%= product.getProductid()%>">
															<input type="hidden" name ="consumerid" value="<%= consumer.getConsumerid()%>">
															<button style="border: 0px; background-color: white;" class="product-remove" name="btn" value="delete item">&times;</button>
															</form>
														</td>
														<td>
															<div class="product-info" style="width: 100px; height: 100px;">
																<img class="img-fluid img-sm img-thumbnail" style="width: 100%; height: 100%;" src="<%= product.getImg1() %>"
																	alt="product-img" /> 
															</div>
														</td>
														<td>
															<div class="product-info" style="width: 250px; height: 100px;">
															<a href="#"><%= product.getProductname() %></a>
															</div>
														</td>
														<td><span style="font-size: 18px;">&#x20B9;</span><%= product.getPrice() %></td>
														<td><input type="text" value="<%= cartitem.getQuantity() %>" onchange="gettotal(<%= product.getPrice() %>,<%= count %>,<%= product.getProductid() %>)" name="cart-quantity"></td>
														<td><label class="subtotal"><span style="font-size: 18px;">&#x20B9;</span><%= cartitem.getTotal() %></label></td>
													</tr>
<%
			count++;
		}
	}
%>
													
												</tbody>
											</table>
											<input type="hidden" id="totalitems" value="<%= count%>">
										</div>
										
										<hr>
										<!-- <div class="d-flex flex-column flex-md-row align-items-center">
											<input type="text"
												class="form-control text-md-left text-center mb-3 mb-md-0"
												name="coupon" id="coupon"
												placeholder="I have a discout coupon">
											<button
												class="btn btn-outline-primary ml-md-3 w-100 mb-3 mb-md-0">Apply
												Coupon</button>
											<a href="#" class="btn ml-md-4 btn-dark w-100">Update
												Cart</a>
										</div>
										<hr> -->
										<div class="row">
											<div class="col-12">
												<ul class="list-unstyled text-right">
													<!-- <li>Sub Total <span class="d-inline-block w-100px" id="subtotal">$800.00</span></li>
													<li>UK Vat <span class="d-inline-block w-100px">$10.00</span></li> -->
													<li>Grand Total <span class="d-inline-block w-100px" id="subtotal"></span></li>
												</ul>
											</div>
										</div>
										<hr>
										<a href="shipping.jsp" class="btn btn-primary float-right">Checkout</a>
								</div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>


		<%@ include file="footer.jsp"%>

	</div>
	<script>
	 window.onload = function()
	{
		var total = 0;
		var x = document.getElementsByClassName('subtotal');
		for(let i=0;i<totalitems.value;i++)
		{
			var price = (x[i].innerHTML).split("</span>");
			total = total + parseInt(price[1]);
		}
		document.getElementById('subtotal').innerHTML = "<span style='font-size: 18px;'>&#x20B9;</span>"+total;
	} 
	function gettotal(price,item,productid)
	{
		var total = 0;
		var totalitems = document.getElementById('totalitems');
		var quantity = document.getElementsByName('cart-quantity');
		for(let i=0;i<totalitems.value;i++)
		{
			if(parseInt(quantity[i].value) == 0)
			{
				alert("Quantity must be greater than 0");
				document.getElementsByName('cart-quantity')[i].value = 1;
			}
			if(i==item)
			{
			var subtotal = price * quantity[i].value;
			document.getElementsByClassName('subtotal')[i].innerHTML = "<span style='font-size: 18px;'>&#x20B9;</span>"+subtotal;
			var consumerid = document.getElementsByName('consumerid');
		
			$.ajax({
				url : "filter.jsp",
				method : "GET",
				data : {
					updatecart : "updatecart",
					consumerid : consumerid[0].value,
					productid : productid,
					quantity : quantity[i].value
				},
				success : function(data) {
				
				}
			});
			}
		}	
		var subtotal = document.getElementsByClassName('subtotal');
		for(let i=0;i<subtotal.length;i++)
		{
			total = total + parseInt(((subtotal[i].innerHTML).split("</span>"))[1]);
		}
		document.getElementById('subtotal').innerHTML = "<span style='font-size: 18px;'>&#x20B9;</span>"+total;
		
	}
	</script>
	
	
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

<!-- Mirrored from demo.themefisher.com/elite-shop/cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:57 GMT -->
</html>