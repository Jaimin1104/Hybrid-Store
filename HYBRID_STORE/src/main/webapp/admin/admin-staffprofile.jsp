<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.PaymentsModel"%>
<%@page import="hybridstore.model.OrdersModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.BranchesModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="admin-head.jsp"%>
<script>
			$(document).ready(function() {
				$("#admin-staff").addClass("active");
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

		<div class="card-body">
			<div class="row">
				<div class="col-md-5">
					<%
					int staffid = Integer.parseInt(request.getParameter("staffid"));
					StaffModel staffMember = new StaffModel().getStaff(staffid);
					%>
					<div>
						<%
						if (staffMember.getProfilepicture() == null) {
						%>
						<img class="img-md img-avatar" src="..\images\default.png"
							alt="User pic">
						<%
						} else {
						%>
						<img class="img-md img-avatar"
							src="..\<%=staffMember.getProfilepicture()%>" alt="User pic">
						<%
						}
						%>
					</div>
					<div>
						<div class="row mt-3">
							<div class="col-md-6">
								<%
								BranchesModel branch = new BranchesModel();
								branch = branch.getBranch(staffMember.getBranchid());
								%>
								<label class="labels">Branch</label> <input type="text"
									class="form-control" value="<%=branch.getBranchname()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">User Name</label> <input type="text"
									class="form-control" value="<%=staffMember.getUsername()%>">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-6">
								<label class="labels">Name</label> <input type="text"
									class="form-control"
									value="<%=staffMember.getFirstname()%> <%=staffMember.getLastname()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">DOB</label> <input type="text"
									class="form-control" value="<%=staffMember.getDob()%>">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-6">
								<label class="labels">Contact no.</label> <input type="text"
									class="form-control" value="<%=staffMember.getPhoneno()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">Email</label> <input type="text"
									class="form-control" value="<%=staffMember.getEmail()%>">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">Address</label>
								<textarea class="form-control" rows="3"><%=staffMember.getAddress()%></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8" style="margin-top: 5%">
				<table class="table table-hover">
					<thead>
						<tr>
							<!-- <th>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" />
												</div>
									</th> -->
							<th>OrderID</th>
							<th>Status</th>
							<th>Payment Mode</th>
							<th>Amount</th>
							<th>Date</th>
							<th class="text-end">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<OrdersModel> ordersOfStaff = new OrdersModel().getOrdersByStaff(staffMember.getStaffid());
						if (ordersOfStaff.isEmpty()) {
						%>
						<tr>
							<td colspan="6" class="text-center">No Orders are Assigned</td>
						</tr>
						<%
						} else {
						for (OrdersModel order : ordersOfStaff) {
							PaymentsModel paymentOfOrder = new PaymentsModel().getOrderPaymentMode(order.getOrderid());
							paymentOfOrder.setMode("Online");
						%>
						<tr>
							<td><%=order.getOrderid()%></td>
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
							<%
							if (paymentOfOrder.getMode().equalsIgnoreCase("Online"))
							{
							%>
							<td><span class="badge rounded-pill alert-dark"><%=paymentOfOrder.getMode()%></span>
							</td>
							<%
							}
							if (paymentOfOrder.getMode().equalsIgnoreCase("Offline")) {
							%>
							<td><span class="badge rounded-pill alert-secondary"><%=paymentOfOrder.getMode()%></span>
							</td>
							<%
							}
							%>
							<td><%=order.getTotal()%></td>
							<td><%=order.getDatetime()%></td>
							<td class="text-end">
								<button class="btn btn-light"
									onclick="viewOrder(<%=order.getOrderid()%>)">Detail</button>
							</td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<div id="largeModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<span id="modal"></span>
				</div>
			</div>
		</div>

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
			
			var request = new XMLHttpRequest();
			function viewOrder(orderid)
			{
				var url="admin-modal.jsp?orderid="+orderid;  
			  	try
			  	{  
					request.onreadystatechange=function()
					{  
						if(request.readyState==4)
						{  
							var val=request.responseText;  
							document.getElementById('modal').innerHTML=val;  
						}  
					}  
					request.open("GET",url,true);  
					request.send();  
					$("#largeModal").modal('show');
				}
			  	catch(e)
			  	{
			  		alert("Unable to connect to server"+e);
			  	}
			}
		</script>

	<script src="js/jquery-3.5.0.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- Custom JS -->
	<script src="js/search.js"></script>
	<script src="js/scriptc619.js?v=1.0"></script>
</body>

</html>