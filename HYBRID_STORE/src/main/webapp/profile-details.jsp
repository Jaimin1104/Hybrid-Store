<%@page import="hybridstore.util.DateTimeFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/profile-details.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>

	<%@ include file="preloader.jsp"%>
	<%@ include file="header.jsp"%>
	
<%
	consumer = consumer.getConsumer(consumer.getConsumerid());
%>
	<!-- main wrapper -->
	<div class="main-wrapper">

		<!-- breadcrumb -->
		<nav class="bg-gray py-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">My
						Accounts</li>
				</ol>
			</div>
		</nav>
		<!-- /breadcrumb -->

		<section class="user-dashboard section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="list-inline dashboard-menu text-center">
							<li class="list-inline-item"><a href="dashboard.jsp">Dashboard</a></li>
							<li class="list-inline-item"><a href="order.jsp">Orders</a></li>
							<li class="list-inline-item"><a href="wishlist.jsp">WishList</a></li>
							<li class="list-inline-item"><a class="active"
								href="profile-details.jsp">Profile Details</a></li>
						</ul>
						<div class="dashboard-wrapper dashboard-user-profile">
						<form action="ConsumerProfileController.do" method="post" enctype="multipart/form-data">
							<div class="media">
								<div class="text-center">
									<input class="form-control" type="file" id="inputProfilePicture" name="profilepicture" style="display: none;">
<%
	if(consumer.getProfilepicture()==null)
	{
%>
									<img class="media-object user-img" style="height: 180px;width: 180px;" id="profilepicture" src="images/default.png"
										alt="Image">
<%
	}
	else
	{
%>
									<img class="media-object user-img" style="height: 180px;width: 180px;" id="profilepicture" src="<%= consumer.getProfilepicture() %>"
										alt="Image">
<% 
	}
%>
									<!-- <a href="#" class="btn btn-sm mt-3 d-block">Change
										Image</a> -->
									
										
								</div>
								<div class="media-body">
									<ul class="user-profile-list" id="old-details" style="display: block;">
										<li><span>Full Name :</span> <%= consumer.getFirstname() %> <%= consumer.getLastname() %> </li>
										<li><span>Address :</span><%= consumer.getAddress() %></li>
										<li><span>Email :</span><%= consumer.getEmail() %></li>
										<li><span>Phone :</span><%= consumer.getPhoneno() %></li>
										<li><span>Date of Birth :</span><%= new DateTimeFormat().getDateInFormat(consumer.getDob(), "MMMM dd, yyyy") %></li>
									</ul>
									
									<ul class="user-profile-list" id="new-details" style="display: none;">
										<li><span>First Name :</span> <input type="text" name="firstname" value="<%= consumer.getFirstname() %>"> </li>
										<li><span>Last Name :</span> <input type="text" name="lastname" value="<%= consumer.getLastname() %>"> </li>										
										<li><span>Address :</span> <input type="text" name="address" value="<%= consumer.getAddress() %>"> </li>
										<li><span>Phone :</span> <input type="text" name="phone" value="<%= consumer.getPhoneno() %>"> </li>
										<li><span>Date of Birth :</span> <input type="date" name="dob" value="<%= consumer.getDob() %>"> </li>
										<!-- <li> <input type="submit" name="btn" value="update profile"> </li> -->
										<li><input type="hidden" name="consumerid" value="<%= consumer.getConsumerid() %>"></li>
									</ul>
									
								</div>
							
							</div>
							<div class="col-6" style="margin-left: 70px;margin-top: 20px;">
									<!-- <i class="fa fa-edit" style="font-size:18px"></i> -->
									<button type="button" class="btn btn-primary" name="btn" id="EditProfileButton" value="update profile">Edit Profile</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		<%@ include file="footer.jsp"%>

	</div>
	<!-- /main wrapper -->
	
	<!-- jQuery -->
	<script src="plugins/jQuery/jquery.min.js"></script>
	
	<script>
		$("#EditProfileButton").click(function(){
			var btn = document.getElementById("EditProfileButton").innerHTML;
			if(btn == "Edit Profile")
			{
				$("#old-details").css('display','none');
				$("#new-details").css('display','block');
				document.getElementById("EditProfileButton").innerHTML = "Save changes";
			}	
			else
			{
				console.log("inside else");
				var btn = document.getElementById("EditProfileButton");
				btn.setAttribute("type", "submit")
				btn.setAttribute("name", "btn");
				btn.setAttribute("value", "update profile");
				btn.click();
			}
		});
	
		$("#profilepicture").click(function(){
			var btn = document.getElementById("EditProfileButton").innerHTML;
			if(btn == "Save changes")
			{
				$("#inputProfilePicture").click();
			}
		});
		
		$("#profilepicture").hover(function(){
			var btn = document.getElementById("EditProfileButton").innerHTML;
			if(btn == "Save changes")
			{
				$("#profilepicture").attr("cursor","pointer");
			}
		});
		
		$("#inputProfilePicture").change(function(e){
			var file = e.target.files[0];
			var reader = new FileReader();
		    reader.onload = function(){
		      var output = document.getElementById("profilepicture");
		      output.src = reader.result;
		    };
		    reader.readAsDataURL(e.target.files[0]);
		});
	</script>
	
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

<!-- Mirrored from demo.themefisher.com/elite-shop/profile-details.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:37:02 GMT -->
</html>