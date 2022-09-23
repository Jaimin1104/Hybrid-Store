<%@page import="hybridstore.model.CategoriesModel"%>
<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-index-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:32 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function () {
				$("#admin-dashboard").addClass("active");
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
	if(admin.getProfilepicture()==null  || admin.getProfilepicture().equalsIgnoreCase("(null)"))
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
			
			<section class="content-main">
				<div class="content-header">
					<h2 class="content-title">Dashboard</h2>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="card card-body mb-4">
							<article class="icontext">
								<span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-monetization_on"></i>
								</span>
								<div class="text">
									<h6 class="mb-1">Total Sales</h6>
									<span><%= new PaymentsModel().getTotalSales() %></span>
								</div>
							</article>
						</div>
						<!-- card  end// -->
					</div>
					<!-- col end// -->
					<div class="col-lg-4">
						<div class="card card-body mb-4">
							<article class="icontext">
								<span class="icon icon-sm rounded-circle bg-success-light">
									<i class="text-success material-icons md-local_shipping"></i>
								</span>
								<div class="text">
									<h6 class="mb-1">Total Orders</h6>
									<span><%= new OrdersModel().getTotalOrders() %></span>
								</div>
							</article>
						</div>
						<!-- card end// -->
					</div>
					<!-- col end// -->
					<div class="col-lg-4">
						<div class="card card-body mb-4">
							<article class="icontext">
								<span class="icon icon-sm rounded-circle bg-warning-light">
									<i class="text-warning material-icons md-shopping_basket"></i>
								</span>
								<div class="text">
									<h6 class="mb-1">Total Products</h6>
									<span><%= new ProductsModel().getTotalProducts() %></span>
								</div>
							</article>
						</div>
						<!--  end// -->
					</div>
					<!-- col end// -->
				</div>
				<!-- row end// -->
				
				<div class="row">
					<div class="col-xl-8 col-lg-12">
						<div class="card mb-4">
							<article class="card-body">
								<h5 class="card-title">Sales statistics</h5>
								<canvas height="120" id="myChart"></canvas>
							</article>
							<!-- card-body end// -->
						</div>
						<!-- card end// -->
					</div>
					<!-- col end// -->
					<div class="col-xl-4 col-lg-12">
						<div class="card mb-4">
							<article class="card-body">
								<h5 class="card-title">Products sold by Categories</h5>
								<canvas height="270" id="pieChart"></canvas>
							</article>
							<!-- card-body end// -->
						</div>
						<!-- card end// -->
					</div>
					<!-- col end// -->
					<!-- <div class="col-xl-4 col-lg-12">
						<div class="card mb-4">
							<article class="card-body">
								<h5 class="card-title">Marketing</h5>
								<span class="text-muted">Facebook page</span>
								<div class="progress mb-3">
									<div class="progress-bar progress-bar-striped" role="progressbar" style="width: 15%">15%</div>
								</div>
								<span class="text-muted">Instagram page</span>
								<div class="progress mb-3">
									<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 65%">65%</div>
								</div>
								<span class="text-muted">Google search</span>
								<div class="progress mb-3">
									<div class="progress-bar progress-bar-striped bg-danger" role="progressbar" style="width: 51%">51%</div>
								</div>
								<span class="text-muted">Other links</span>
								<div class="progress mb-3">
									<div class="progress-bar progress-bar-striped bg-secondary" role="progressbar" style="width: 80%">80%</div>
								</div>
								<br>
								<a href="#" class="btn btn-light">Open analytics
									<i class="material-icons md-open_in_new"></i>
								</a>
							</article>
							card-body end//
						</div>
						card end//
					</div> -->
					<!-- col end// -->
				</div>
				<!-- row end// -->
				<div class="card mb-4">
					<div class="card-body">
						<h5 class="card-title">Latest orders</h5>
						<div class="table-responsive">
							<table class="table table-hover">
<%
	ArrayList<OrdersModel> latestorders = new OrdersModel().getLatestOrders(10);
	for(OrdersModel order:latestorders)
	{
		ConsumersModel consumer = new ConsumersModel().getOrderConsumer(order.getOrderid());
		PaymentsModel payment = new PaymentsModel().getOrderPaymentMode(order.getOrderid());
%>
								<tr>
									<td><%= order.getOrderid() %></td>
									<td><b><%= consumer.getFirstname() + " " + consumer.getLastname() %></b></td>
									<td><%= consumer.getEmail() %></td>
<%
		if(payment.getMode()!=null)
		{
			if(payment.getMode().equalsIgnoreCase("Online"))
			{
%>
												<td>
													<span class="badge rounded-pill alert-dark"><%=payment.getMode()%></span>
												</td>
<%
			}
			if (payment.getMode().equalsIgnoreCase("Offline"))
			{
%>
												<td>
													<span class="badge rounded-pill alert-secondary"><%=payment.getMode()%></span>
												</td>
<%
			}
		}
		else
		{
%>
												<td>
													<span class="badge rounded-pill alert-secondary">Offline</span>
												</td>
<%	
		}
%>
									<td><%= order.getTotal() %></td>
									<td>
<%
		if(order.getStatus().equalsIgnoreCase("confirmed"))
		{
%>
										<span class="badge rounded-pill alert-primary"><%= order.getStatus() %></span>
<%
		}
		else if(order.getStatus().equalsIgnoreCase("packed"))
		{
%>
										<span class="badge rounded-pill alert-info"><%= order.getStatus() %></span>
<%
		}
		else if(order.getStatus().equalsIgnoreCase("completed"))
		{
%>
										<span class="badge rounded-pill alert-success"><%= order.getStatus() %></span>
<%
		}
		else if(order.getStatus().equalsIgnoreCase("cancelled"))
		{
%>
										<span class="badge rounded-pill alert-danger"><%= order.getStatus() %></span>
<%
		}
%>
									</td>
									<td><%= order.getDatetime() %></td>
									<!-- <td class="text-end"><a href="#" class="btn btn-light">Detail</a>
										<div class="dropdown">
											<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
												<i class="material-icons md-more_horiz"></i>
											</a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#">View detail</a> <a
													class="dropdown-item" href="#">Edit info</a> <a
													class="dropdown-item text-danger" href="#">Delete</a>
											</div>
										</div> dropdown //end
									</td> -->
								</tr>
<%
	}
%>
							</table>
						</div>
						<!-- table-responsive end// -->
					</div>
					<!-- card-body end// -->
				</div>
				<!-- card end// -->
			</section>
			<!-- content-main end// -->
			
<%
	for(int i=0;i<12;i++)
	{
%>
			<input type="hidden" name="TotalSalesOfMonth" value="<%= new OrdersModel().getTotalSalesOfMonth(i) %>">
<%
	}
%>

<%
	ArrayList<CategoriesModel> allCategories = new CategoriesModel().getAllCategories();
	for(CategoriesModel category : allCategories)
	{
%>
			<input type="hidden" name="categoryname" value="<%= category.getCategoryname() %>">
			<input type="hidden" name="TotalSalesOfCategory" value="<%= new OrdersModel().getTotalSalesOfCategory(category.getCategoryid()) %>">
<%
	}
%>
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
		</script>	
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- ChartJS files-->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>
	
		<!-- ChartJS customize-->
		<script>
			var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
			var today = new Date();
			var month = parseInt(today.getMonth());
			var displayedMonths = months.slice(0,month+1);
			console.log(displayedMonths);
			var input = document.getElementsByName("TotalSalesOfMonth");
			var TotalSalesOfMonths = [];
			for(let i=0;i<=month;i++)
			{
				TotalSalesOfMonths.push(parseInt(input[i].value));
			}
			
			var temp1 = document.getElementsByName("TotalSalesOfCategory");
			var temp2 = document.getElementsByName("categoryname");
			var TotalSalesOfCategories = [];
			var allCategoryNames = [];
			for(let i=0;i<temp1.length;i++)
			{
				TotalSalesOfCategories.push(parseInt(temp1[i].value));
				allCategoryNames.push(temp2[i].value);
			}
			
			var ctx = document.getElementById('myChart').getContext('2d');
			var chart = new Chart(ctx, {
				// The type of chart we want to create
				type: 'line',

				// The data for our dataset
				data: {
					labels: displayedMonths,
					datasets: [
						{
							label: 'Sales',
							/* backgroundColor: 'rgb(44, 120, 220)', */
							borderColor: 'rgb(44, 120, 220)',
							data: TotalSalesOfMonths
						}
						/* ,
						{
							label: 'Visitors',
							backgroundColor: 'rgb(180, 200, 230)',
							borderColor: 'rgb(180, 200, 230)',
							data: [40, 20, 17, 9, 23, 35, 39, 30, 34, 25, 27, 17]
						} */

					]
				},

				// Configuration options go here
				options: {}
			});
			
			var ctx2 = document.getElementById('pieChart').getContext('2d');
			var chart = new Chart(ctx2, {
				type : "pie",
				data: {
					labels: allCategoryNames,
					datasets: [{
					  label: 'My First Dataset',
					  data: TotalSalesOfCategories,
					  backgroundColor: [
					    'rgb(255, 99, 132)',
					    'rgb(54, 162, 235)',
					    'rgb(255, 205, 86)',
					    'rgb(85, 234, 212)'
					  ],
					  hoverOffset: TotalSalesOfCategories.length
					}]
				},
				options: {}
			});
		</script>
	</body>


<!-- Mirrored from www.ecommerce-admin.com/demo/page-index-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:40 GMT -->

</html>