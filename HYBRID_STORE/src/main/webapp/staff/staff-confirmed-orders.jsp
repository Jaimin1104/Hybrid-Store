<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
<head>
	<%@ include file="staff-head.jsp" %>
	<script>
		$(document).ready(function () {
			$("#staff-orders").addClass("active");
		});
	</script>
</head>
<body>

<%@ include file="staff-aside-bar.jsp" %>

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
			<h2 class="content-title">Confirmed Orders</h2>
			<!-- <div>
				<a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
			</div> -->
		</div>

		<div class="card mb-4">
			<header class="card-header">
				<div class="row gx-3">
					<div class="col-lg-4 col-md-6 me-auto">
						<input type="text" id="Search" onkeyup="searchOrder()" placeholder="Search by orderid ... " class="form-control">
					</div>
					<!-- <div class="col-lg-2 col-6 col-md-3">
						<select class="form-select">
							<option>Status</option>
							<option>Active</option>
							<option>Disabled</option>
							<option>Show all</option>
						</select>
					</div> -->
					<div class="col-md-3 col-6">
						<input type="date" class="form-control" id="Date" onchange="dateOrder()">
					</div>
					<div class="col-lg-2 col-6 col-md-3">
						<select class="form-select" id="showRecords" onchange="MaximumOrdersPerPage(this.value)">
							<option value="5">Show 5</option>
							<option value="10">Show 10</option>
							<option value="15">Show 15</option>
							<option value="20">Show 20</option>
						</select>
					</div>
				</div>
			</header> <!-- card-header end// -->
			<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#ID</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Total</th>
							<th scope="col">Status</th>
							<th scope="col">Date</th>
							<th scope="col" class="text-end">Action</th>
						</tr>
					</thead>
					<tbody id="displayPageOrders">
						
					</tbody>
				</table>
			</div> <!-- table-responsive //end -->
			</div> <!-- card-body end// -->
		</div> <!-- card end// -->

		<nav class="float-end mt-4" aria-label="Page navigation">
			<ul class="pagination">
			</ul>
		</nav>
	</section> <!-- content-main end// -->
</main>

<script>
	var numberOfRecords;
	var numberOfPagesRequired;
	var maximumRecordsPerPage;
	var currentPage = 1;
	var caller = "orders";
	var search = "";
	var date = "";
	var status = "confirmed";
	
	window.onload = function() {
		maximumRecordsPerPage = document.getElementById("showRecords").value;
		fetchrecords(caller,currentPage);
	}

    if(localStorage.getItem("darkmode")){
        var body_el = document.body;
        body_el.className += 'dark';
    }
    
    function searchOrder() {
		currentPage = 1;
		search = document.getElementById("Search").value;
		fetchrecords(caller,currentPage);
	}
    
    function MaximumOrdersPerPage(temp) {
    	currentPage = 1;
    	maximumRecordsPerPage = parseInt(temp);
    	console.log("maximumRecordsPerPage : " + maximumRecordsPerPage);
    	fetchrecords(caller,currentPage);
    }
	
	function dateOrder() {
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
			url : "staff-filter-orders.jsp",
			method : "GET",
			data : {
				caller : caller,
				pagenumber : pagenumber,
				date : date,
				status : status,
				search : search,
				maximumRecordsPerPage : maximumRecordsPerPage
			},
			success : function(data) {
				$('#displayPageOrders').html(data);
			}
		});
	}
	
	function data_counter() {
		$.ajax({
			url : "staff-filter-orders.jsp",
			method : "GET",
			data : {
				action : "counter",
				caller : caller,
				date : date,
				status : status,
				search : search,
				maximumRecordsPerPage : maximumRecordsPerPage
			},
			success : function(data) {
				var totalOrders = parseInt((data.split('<body>'))[1].split('<script>'));
				numberOfRecords = totalOrders;
				console.log("numberOfRecords : " + numberOfRecords);
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
<script src="js/scriptc619.js?v=1.0"></script>

</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-orders-1.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:44 GMT -->
</html>