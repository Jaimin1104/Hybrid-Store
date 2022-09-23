<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.FeedbacksModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-reviews.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:48 GMT -->

	<head>
		<%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function () {
			     $("#admin-reviews").addClass("active");
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
					<h2 class="content-title">Reviews</h2>
				</div>
				<div class="card mb-4">
				<!-- 
					<header class="card-header">
						<div class="row gx-3">
							<div class="col-lg-4 col-md-6 me-auto">
								<input type="text" placeholder="Search..." class="form-control" />
							</div>
							<div class="col-lg-2 col-md-3 col-6">
								<select class="form-select">
									<option>Status</option>
									<option>Active</option>
									<option>Disabled</option>
									<option>Show all</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-3 col-6">
								<select class="form-select">
									<option>Show 20</option>
									<option>Show 30</option>
									<option>Show 40</option>
								</select>
							</div>
						</div>
					</header>
				 -->
					<!-- card-header end// -->
					
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<!-- <th>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</th> -->
										<th>#ID</th>
										<th>Email</th>
										<th>Consumer Name</th>
										<th>Subject</th>
										<th>Date</th>
										<th class="text-end">Action</th>
									</tr>
								</thead>
								<tbody>
<%
 	ArrayList<FeedbacksModel> feedbacklist = new ArrayList<FeedbacksModel>();
 	feedbacklist.addAll(new FeedbacksModel().getAllFeedbacks());
 	if(feedbacklist.isEmpty())
 	{
%>
									<tr>
										<td colspan="6" class="text-center">No Reviews Found</td>
									</tr>
<%
   	}
   	else
   	{
   		for(FeedbacksModel feedback : feedbacklist)
   		{
   			ConsumersModel consumer = new ConsumersModel().getConsumer(feedback.getConsumerid());
%>
									<tr>
										<!-- <td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td> -->
										<td><%= feedback.getFeedbackid() %></td>
										<td><b><%= consumer.getEmail() %></b></td>
										<td><%= consumer.getFirstname() + " " + consumer.getLastname() %></td>
										<td>
											<%= feedback.getSubject() %>
										<!-- <ul class="rating-stars">
												<li style="width: 60%;" class="stars-active">
													<img src="images/icons/stars-active.svg" height="16" alt="stars" />
												</li>
												<li>
													<img src="images/icons/starts-disable.svg" height="16" alt="stars" />
												</li>
											</ul> -->
										</td>
										<td><%= feedback.getDate() %></td>
										<td class="text-end">
											<button class="btn btn-light" onclick="viewReview(<%= feedback.getFeedbackid() %>)">Detail</button>
											<!-- <div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a>
													<a class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> --> 
											<!-- dropdown //end -->
										</td>
									</tr>
<%
		}
	}
%>
									<!-- <tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" />
											</div>
										</td>
										<td>23</td>
										<td><b>A-Line Mini Dress in Blue</b></td>
										<td>Devon Lane</td>
										<td>
											<ul class="rating-stars">
												<li style="width: 60%;" class="stars-active">
													<img src="images/icons/stars-active.svg" height="16" alt="stars" />
												</li>
												<li>
													<img src="images/icons/starts-disable.svg" height="16" alt="stars" />
												</li>
											</ul>
										</td>
										<td>10.03.2020</td>
										<td class="text-end"><a href="#" class="btn btn-light">Detail</a>
											<div class="dropdown">
												<a href="#" data-bs-toggle="dropdown" class="btn btn-light">
													<i class="material-icons md-more_horiz"></i>
												</a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">View detail</a>
													<a class="dropdown-item" href="#">Edit info</a>
													<a class="dropdown-item text-danger" href="#">Delete</a>
												</div>
											</div> dropdown //end
										</td>
									</tr> -->
								</tbody>
							</table>
						</div>
						<!-- table-responsive//end -->
					</div>
					<!-- card-body end// -->
				</div>
				<!-- card end// -->
			</section>
			<!-- content-main end// -->
			
			<!-- Reply of Feedback Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<span id="modal"></span>
					<!--<form method="post" action="../FeedbackController">
							<div class="modal-header">
							  <h5 class="modal-title" id="exampleModalLabel">Reply Feedback</h5>
							  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
							  	<div class="row">
							  		<div class="col-md-2">
							  			<img src="../images/default.png" style="height:100%;width:100%;border-radius: 50%;">
									</div>
									<div class="col-md-7">
										<p class="h3" style="margin-top: 4%;">jaimin koladiya</p>
									</div>
									<div class="col-md-3 text-right">
										<p style="margin-top: 18%;">11/04/2021</p>
									</div>
								</div>
								<div class="form-group text-center" style="margin-top: 10px;">
							  		<label class="col-form-label" style="font-size: 20px">about system</label>
								</div>	
								<div class="form-group" style="margin-top: 15px;">
							  		<label class="col-form-label justify-content-center">Hii this is nice system mdskbb dj jkn fnrjknf r jefb j fjbrjen frnjfnreuhn jfnrjnajfnren</label>
								</div>
								<div class="form-group" style="margin-top: 20px;">
									<label for="message-text" class="col-form-label">Reply</label>
									<textarea class="form-control" name="replyOfFeedback" id="message-text" placeholder="Type messsage here..." style="min-height: 100px;border-width: 1px;border-color: black;" read-only></textarea>
									<textarea class="form-control" name="replyOfFeedback" id="message-text" placeholder="Type messsage here..." style="min-height: 100px;border-width: 1px;border-color: black;"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<input type="hidden" id="feedbackid" value="1" name="feedbackid">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary" name="btn" value="Reply Feedback">Reply Feedback</button>
							</div>
						</form> -->
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
	        function viewReview(feedbackid){
	        	var url="admin-modal.jsp?feedbackid="+feedbackid;  
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
					$("#exampleModal").modal('show');
				}
			  	catch(e)
			  	{
			  		alert("Unable to connect to server");
			  	}
	        }
	        
	        /* $('#exampleModal').on('show.bs.modal', function (event) {
	        	  var button = $(event.relatedTarget) // Button that triggered the modal
	        	  var recipient = button.data('whatever') // Extract info from data-* attributes
	        	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	        	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	        	  var modal = $(this)
	        	  modal.find('.modal-title').text('New message to ' + recipient)
	        	  modal.find('.modal-body input').val(recipient)
	        }); */
	    </script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-reviews.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:49 GMT -->

</html>