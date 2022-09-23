<!DOCTYPE HTML>
<%@page import="hybridstore.util.DateTimeFormat"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-detail.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
<head>
	<%@ include file="staff-head.jsp" %>
	<script>
		$(document).ready(function () {
			$("#staff-dashboard").addClass("active");
		});
	</script>
</head>
<body>

<%@ include file="staff-aside-bar.jsp" %>
<%
	int orderid = Integer.parseInt(request.getParameter("orderid"));
	OrdersModel order = new OrdersModel().getOrderInformation(orderid);
	BranchesModel branchOfOrder = new BranchesModel().getBranch(staff.getBranchid());
	ConsumersModel consumerOfOrder = new ConsumersModel().getOrderConsumer(order.getOrderid());
	PaymentsModel paymentOfOrder = new PaymentsModel().getOrderPaymentMode(order.getOrderid());
	ArrayList<CartItemsModel> allCartitemsOfOrder = new CartItemsModel().getAllCartItemsByCart(order.getCartid());
%>
<main class="main-wrap">

	<header class="main-header navbar">
		<div class="col-search">
			<!-- <form class="searchform">
				<div class="input-group">
					<input list="search_terms" type="text" class="form-control" placeholder="Search term">
					<button class="btn btn-light bg" type="button"> <i class="material-icons md-search"></i> </button>
				</div>
				<datalist id="search_terms">
					<option value="Products">
					<option value="New orders">
					<option value="Apple iphone">
					<option value="Ahmed Hassan">
				</datalist>
			</form> -->
		</div>
		<div class="col-nav">
			<button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"> <i
					class="md-28 material-icons md-menu"></i> </button>
			<ul class="nav">
				<li class="nav-item" style="margin-right: 10px;">
					<a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> <i
							class="material-icons md-nights_stay"></i> </a>
				</li>
				<!-- <li class="nav-item">
					<a class="nav-link btn-icon" href="#"> <i class="material-icons md-notifications_active"></i> </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#"> English </a>
				</li> -->
				<li>
					<a href="../LoginController?action=logout" class="btn btn-outline-danger">Logout</a>
				</li>
				<!-- <li class="dropdown nav-item">
					<a class="dropdown-toggle" data-bs-toggle="dropdown" href="#"> <img class="img-xs rounded-circle"
							src="images/people/avatar1.jpg" alt="User"></a>
					<div class="dropdown-menu dropdown-menu-end">
						<a class="dropdown-item" href="#">My profile</a>
						<a class="dropdown-item" href="#">Settings</a>
						<a class="dropdown-item text-danger" href="#">Exit</a>
					</div>
				</li> -->
			</ul>
		</div>
	</header>

  <section class="content-main">

    <div class="content-header">
      <h2 class="content-title">Order Details</h2>
    </div>

        <div class="card">
          <header class="card-header">
            <div class="row align-items-center">
              <div class="col-lg-6 col-md-6">
                <span>
                  <i class="material-icons md-calendar_today"></i>
                  <!-- <b>Wed, Aug 13, 2020, 4:34PM</b> -->
                  <b><%= new DateTimeFormat().getDateTimeInFormat(order.getDatetime(), "MMM dd, yyyy hh:mm") %></b>
                </span> <br>
                <small class="text-muted">Order ID: <%= order.getOrderid() %></small>
              </div>
              
<% 
	if(order.getStatus().equalsIgnoreCase("confirmed"))
	{
%> 
				<div class="col-lg-6 col-md-6 ms-auto text-md-end">
	        		<a class="btn btn-outline-primary" href="../OrderController.do?btn=updateStatus&status=packed&orderid=<%=orderid%>">Change Status to Packed</a>
	        		<!-- <a class="btn btn-secondary ms-2" href="#"><i class="icon material-icons md-print"></i></a> -->
        		</div>
<%
	}
	else if(order.getStatus().equalsIgnoreCase("Packed"))
	{
%>
				<div class="col-lg-6 col-md-6 ms-auto text-md-end">
	        		<button class="btn btn-outline-primary" onclick="checkpayment()" >Change Status to Completed</button>
	        		<!-- <a class="btn btn-secondary ms-2" href="#"><i class="icon material-icons md-print"></i></a> -->
        		</div>
<%		
	}
%>
            </div>
          </header> <!-- card-header end// -->
          <div class="card-body">

            <div class="row mb-5 order-info-wrap">
              <div class="col-md-6">
                <article class="icontext align-items-start">
                  <span class="icon icon-sm rounded-circle bg-primary-light">
                    <i class="text-primary material-icons md-person"></i>
                  </span>
                  <div class="text">
                    <h6 class="mb-1">Customer</h6> 
                    <p class="mb-1">
                      <%= consumerOfOrder.getFirstname() + " " + consumerOfOrder.getLastname() %><br> 
                      <%= consumerOfOrder.getEmail() %><br>
                      +91 <%= consumerOfOrder.getPhoneno() %>
                    </p>
                    <!-- <a href="#">View profile</a> -->
                  </div>
                </article> 
              </div> <!-- col// -->
              <!-- <div class="col-md-4">
                <article class="icontext align-items-start">
                  <span class="icon icon-sm rounded-circle bg-primary-light">
                    <i class="text-primary material-icons md-local_shipping"></i>
                  </span>
                  <div class="text">
                    <h6 class="mb-1">Order info</h6> 
                    <p class="mb-1">
                      Shipping: Fargo express <br> Pay method: card <br> Status: new
                    </p>
                    <a href="#">Download info</a>
                  </div>
                </article> 
              </div> col// -->
              <div class="col-md-6">
                <article class="icontext align-items-start">
                  <span class="icon icon-sm rounded-circle bg-primary-light">
                    <i class="text-primary material-icons md-place"></i>
                  </span>
                  <div class="text">
                    <h6 class="mb-1">Branch Information</h6> 
                    <p class="mb-1">
<% 
	String[] address = branchOfOrder.getAddress().split(",");
	for(int i=0;i<address.length;i++)
	{
%>
						<%= address[i] %><br>
<%
	}
%>
                    </p>
                    <!-- <a href="#">View profile</a> -->
                  </div>
                </article> 
              </div> <!-- col// -->
            </div> <!-- row // -->

            <div class="row">
              <div class="col-lg-12">
                <div class="table-responsive">
                <table class="table border table-hover table-lg">
                  <thead>
                    <tr>
                      <th width="40%">Product</th>
                      <th width="20%">Unit Price</th>
                      <th width="20%">Quantity</th>
                      <th width="20%" class="text-end">Total</th>
                    </tr>
                  </thead>
                  <tbody>
<%
	for(int i=0;i<allCartitemsOfOrder.size();i++)
	{
		CartItemsModel cartItem = allCartitemsOfOrder.get(i); 
		ProductsModel product = new ProductsModel().getProduct(cartItem.getProductid());
%>
					<tr>
						<td>
							<a class="itemside" href="#">
								<div class="left">
								    <img src="../<%= product.getImg1() %>" width="40" height="40" class="img-xs" alt="Item">
								</div>
								<div class="info"><%= product.getProductname() %></div>
							</a>
						</td>
						<td>&#8377;<%= product.getPrice() %></td>
						<td><%= cartItem.getQuantity() %></td>
						<td class="text-end">&#8377;<%= cartItem.getTotal() %></td>
					</tr>
<%
	}
%>
                    <tr>
                      <td colspan="4"> 
                          <article class="float-end">
                            <dl class="dlist"> 
                                <dt>Subtotal :</dt> <dd>&#8377;<%= order.getTotal() %></dd> 
                              </dl>
                              <dl class="dlist"> 
                                <dt>Shipping cost :</dt> <dd>&#8377;0.00</dd> 
                              </dl>
                              <dl class="dlist"> 
                                <dt>Grand total :</dt> <dd> <b class="h5">&#8377;<%= order.getTotal() %></b> </dd> 
                              </dl>
                              <dl class="dlist"> 
                                <dt class="text-muted">Payment Status :</dt> 
                                <dd> 
<%
	if(paymentOfOrder.getMode() != null)
	{
%> 
                                  <span class="badge rounded-pill alert-success text-success" id="paymentstatus">Done</span>
<%
	}
	else
	{
%>
                                  <span class="badge rounded-pill alert-danger text-danger" id="paymentstatus">Pending</span>
<%
	}
%>
                                </dd> 
                              </dl>
                          </article>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div> <!-- table-responsive// -->
              </div>  <!-- col// -->
              <!-- <div class="col-lg-4">
                <div class="box shadow-sm bg-light">
                   <h6>Payment info</h6>
                   <p> 
                    <img src="images/card-brands/2.png" class="border" height="20"> Master Card **** **** 4768  <br>
                    Business name: Grand Market LLC <br>
                    Phone: +1 (800) 555-154-52
                   </p>
                </div>
                <div class="h-25 pt-4">
                  <div class="mb-3">
                    <label>Notes</label>
                    <textarea class="form-control" name="notes" id="notes" placeholder="Type some note"></textarea>
                  </div>
                  <button class="btn btn-primary">Save note</button>
                </div>
              </div> --> <!-- col// -->

            </div>
          </div> <!-- card-body end// -->
        </div> <!-- card end// -->

		<!-- Confirmation modal -->
			<div class="modal fade" id="confirmPayment" tabindex="-1" aria-labelledby="exampleModalPromoLabel2" aria-hidden="true" data-tor-parent="show">
				<div class="modal-dialog  modal-dialog-centered no-transform">
					<div class="modal-content" data-tor="show(p):{scale.from(75) fade.in} quad">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalPromoLabel2">Confirmation Of Payment</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Payment of this order done or not?</p>
						</div>
						<div class="modal-footer">
							<form method="get" action="../OrderController.do">
								<input type="hidden" name="orderid" id="orderid" value="<%= orderid %>"></input>
								<input type="hidden" name="status" value="completed"></input>
								<button type="submit" data-bs-dismiss="modal" class="btn mb-2 btn-danger">No</button>
								<button type="submit" name="btn" value="updateStatus" class="btn mb-2 btn-primary">Yes</button>
							</form>
						</div>
					</div>
				</div>
			</div>

  </section> <!-- content-main end// -->
</main>



<script>
    if(localStorage.getItem("darkmode")){
        var body_el = document.body;
        body_el.className += 'dark';
    }
    function checkpayment() {
    	
		var paymentstatus = document.getElementById("paymentstatus").innerText;
		if(paymentstatus == "Pending")
		{
			$("#confirmPayment").modal('show');
		}
		else
		{
			$.ajax({
				url : "../OrderController.do",
				method : "GET",
				data : {
					btn : "updateStatus",
					status : "completed",
					orderid : document.getElementById("orderid").value
				},
				success : function(data) {
					window.location.href = "staff-dashboard.jsp";
				}
			});
		}
	}
</script>

<script src="js/jquery-3.5.0.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script src="js/scriptc619.js?v=1.0"></script>


</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-detail.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:45 GMT -->
</html>