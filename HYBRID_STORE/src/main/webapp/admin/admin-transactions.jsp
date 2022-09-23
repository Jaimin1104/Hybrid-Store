<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-transactions-B.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function () {
			    $("#admin-transactions").addClass("active");
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
	
			<section class="content-main">
				<div class="content-header">
					<h2 class="content-title">Transactions</h2>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div>
								<header class="border-bottom mb-4 pb-4">
									<div class="row">
										<div class="col-lg-5 col-6 me-auto">
											<input type="text" id="Search" onkeyup="searchTransaction()" placeholder="Search By Consumers User name..." class="form-control">
										</div>
										<div class="col-md-3 col-6">
											<input type="date" class="form-control" id="Date" onchange="dateTransaction()">
										</div>
										<div class="col-lg-2 col-6">
											<select class="form-select" id="Mode" onchange="modeTransaction()">
												<option value="all">All</option>
												<option value="online">Online</option>
												<option value="offline">Offline</option>
											</select>
										</div>
									</div>
								</header>
								<!-- card-header end// -->
								<div class="table-responsive">
									<input type="hidden" id="numberOfPayments" value="<%= new PaymentsModel().getTotalPayments() %>">
									<table class="table table-hover">
										<thead>
											<tr>
												<th class="text-left">Payment ID</th>
												<th class="text-left">Order ID</th>
												<th class="text-left">Consumer name</th>
												<th class="text-left">Amount</th>
												<th class="text-left">Mode</th>
												<th class="text-left">Date</th>
												<!-- <th class="text-center"> Action </th> -->
											</tr>
										</thead>
										<tbody id="displayPageTransactions">
										
										</tbody>
									</table>
								</div>
								<!-- table-responsive.// -->
								<nav class="float-end mt-4" aria-label="Page navigation">
									<ul class="pagination">
									</ul>
								</nav>
							</div>
						</div>
						<!-- row // -->
					</div>
					<!-- card-body // -->
				</div>
				<!-- card // -->
			</section>
			<!-- content-main end// -->
			
		</main>
	
		<script type="text/javascript">
			var numberOfRecords;
			var numberOfPagesRequired;
			var maximumRecordsPerPage;
			var currentPage = 1;
			var caller = 'transactions';
			var search = "";
			var date = "";
			var mode = document.getElementById("Mode").value;
			
			window.onload = function() {
				fetchrecords(caller,currentPage);
			}
		
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
	        
	        function searchTransaction() {
				currentPage = 1;
				search = document.getElementById("Search").value;
				fetchrecords(caller,currentPage);
			}
			
			function modeTransaction() {
				currentPage = 1;
				mode = document.getElementById("Mode").value;
				console.log(mode);
				fetchrecords(caller,currentPage);
			}
			
			function dateTransaction() {
				currentPage = 1;
				date = "";
				day = document.getElementById("Date").value;
				var d = day.split("-");
				for(let i=d.length-1;i>=0;i--)
				{
					date = date + d[i];
					if(i!=0)
					{
						date = date + "/";
					}
				}
				console.log(date);
				fetchrecords(caller,currentPage);
			}
			
			function fetchrecords(caller, pagenumber) {
				data_counter();
			    console.log("Caller : " + caller);
			    console.log("Pagenumber : " + pagenumber);
			  	$.ajax({
					url : "admin-pagination.jsp",
					method : "GET",
					data : {
						caller : caller,
						pagenumber : pagenumber,
						date : date,
						mode : mode,
						search : search
					},
					success : function(data) {
						$('#displayPageTransactions').html(data);
					}
				});
			}
			
			function data_counter() {
				$.ajax({
					url : "admin-pagination.jsp",
					method : "GET",
					data : {
						action : "counter",
						caller : caller,
						date : date,
						mode : mode,
						search : search
					},
					success : function(data) {
						var totalOrders = parseInt((data.split('<body>'))[1].split('<script>'));
						numberOfRecords = totalOrders;
						console.log("numberOfRecords : " + numberOfRecords);
						maximumRecordsPerPage = 10;
						numberOfPagesRequired = Math.ceil(numberOfRecords/maximumRecordsPerPage);
						var pagination = document.getElementsByClassName("pagination");
						var previousElement = "<li id='previous' class='page-item'><a class='page-link' onclick='displayPreviousPage()' href='#'>Previous</a></li>";
						var nextElement = "<li id='next' class='page-item'><a class='page-link' onclick='displayNextPage()' href='#'>next</a></li>";
						pagination[0].innerHTML = previousElement;
						for(let i=1;i<=numberOfPagesRequired;i++)
						{
							var pageElement = "<li class='page-item'><a class='page-link' onclick='displayRecords(this)' href='#'>"+i+"</a></li>";
							pagination[0].innerHTML += pageElement;
						}
						pagination[0].innerHTML += nextElement;
						var allPages = document.getElementsByClassName("page-item");
						for(let i=0;i<allPages.length;i++)
						{
							var pages = parseInt(allPages[i].innerText);
							if(pages == currentPage)
							{
								allPages[i].className = "page-item active";
							}
						}
						checkPreviousNextPage();
					}
				});
			}
			<%@ include file="js/pagination.js" %>
	    </script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0" type="text/javascript"></script>
	
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-transactions-B.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->

</html>