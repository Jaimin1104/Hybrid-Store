<%@page import="hybridstore.model.AdminModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

	<head>
        <%@ include file="admin-head.jsp" %>
		<script>
			$(document).ready(function () {
				$("#admin-consumers").addClass("active");
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

			<section class="content-main" style="max-width: 1200px">
				<div class="content-header">
					<h2 class="content-title">New Consumer</h2>
					<div>
						<a href="admin-addconsumer.jsp" class="btn btn-outline-danger"> &times; Discard </a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<form method="post" action="../ConsumersController" enctype="multipart/form-data" onsubmit="return validateForm()">
							<div class="mb-4">
								<label for="consumer_firstname" class="form-label">First Name</label>
								<input type="text" class="form-control" name="firstname" placeholder="First Name">
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-4 form-group">
								<label for="consumer_lastname" class="form-label">Last Name</label> 
								<input type="text" class="form-control" name="lastname" placeholder="Last Name">
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-4 form-group">
								<label for="consumer_username" class="form-label">User Name</label>
								<input type="text" class="form-control" name="username" placeholder="Username">
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-4 form-group">
								<label for="consumer_dob" class="form-label">Date of Birth</label>
								<input type="date" class="form-control disableFuturedate" name="dob" id="dob" style="border-radius: 0%;">
								<div class="invalid-feedback"></div>
							</div>
							<!-- <div class="mb-4 form-group">
								<label for="consumer_password" class="form-label">Password</label>
								<input type="password" class="form-control" name="password" 
									placeholder="Confirm password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
									title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
									required="required">
							</div> -->
							<div class="mb-4 form-group">
								<label>Password</label><br>
								<div class="input-group mb-3">
									<input type="password" name="password" class="form-control" id="inputPassword"
									placeholder="Password" onkeyup="changePassword()"
									title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
									<div class="input-group-append">
	    								<i class="fa fa-eye input-group-text" style="padding: 12px;" id="eye" aria-hidden="true"></i>
	    								<i class="fa fa-eye-slash input-group-text" style="padding: 12px;display: none;" id="eyeslash" aria-hidden="true"></i>
	  								</div>
									<div class="invalid-feedback"></div>
								</div>
							</div>
							<div class="mb-4 form-group">
								<label for="consumer_email" class="form-label">Email</label>
								<input type="email" class="form-control" name="email" placeholder="Email">
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-4 form-group">
								<label for="consumer_phoneno" class="form-label">Phone Number</label>
								<input type="text" class="form-control" name="phoneno" pattern="[0-9]{10}" placeholder="Phone no">
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-4 form-group">
								<label for="consumer_address" class="form-label">Address</label>
								<input type="text" class="form-control" name="address" placeholder="Address">
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-4 form-group">
								<label for="profilephoto" class="form-label">Profile Picture</label> 
								<input type="file" class="form-control" name="profilepicture" placeholder="Profile Picture">
							</div>
							<div class="text-left">
								<input type="submit" name="btn" value="Add Consumer" class="btn btn-primary">
							</div>
						</form>
					</div>
				</div>
				<!-- card end// -->
			</section>
			<!-- content-main end// -->
		
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
			
			const eye = document.querySelector('#eye');
			const eyeslash = document.querySelector('#eyeslash');
		  	const password = document.querySelector('#inputPassword');
			changePassword();
			function changePassword() {
				if(password.value == null || password.value == "")
				{
					password.setAttribute('type', "password");
					eye.style.display = 'none';
					eyeslash.style.display = 'none';
				}
				else
				{
					var disp = eyeslash.style.display === '' ? 'none' : '';
					eye.style.display = disp;	
				}
			}
			eye.addEventListener('click', function (e) {
			    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
			    password.setAttribute('type', type);
			    this.style.display = 'none';
				eyeslash.style.display = '';
			});
			eyeslash.addEventListener('click', function (e) {
			    const type = password.getAttribute('type') === 'text' ? 'password' : 'text';
			    password.setAttribute('type', type);
			    this.style.display = 'none';
				eye.style.display = '';
			});
			
			// Form Validation
			function validateForm() {
				var allresult = [];
				var result = false;
				var invalidFeedback = document.getElementsByClassName("invalid-feedback");
				
				// Firstname Validation
				var firstname = document.getElementsByName("firstname");
				var firstnamepattern = /^[a-zA-Z]+$/;
				if(firstname[0].value == null || firstname[0].value == "")
				{
					invalidFeedback[0].innerHTML = "Firstname can't be Empty";
					$(firstname[0]).addClass("is-invalid");
					result = false;
				}
				else if(firstnamepattern.test(firstname[0].value) == false)
				{
					invalidFeedback[0].innerHTML = "Firstname must contain only characters";
					$(firstname[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					invalidFeedback[0].innerHTML = "";
					$(firstname[0]).removeClass("is-invalid");
					//$(firstname[0]).addClass("is-valid");
					result = true;
				}
				allresult.push(result);
				
				// Lastname Validation
				var lastname = document.getElementsByName("lastname");
				var lastnamepattern = /^[a-zA-Z]+$/;
				if(lastname[0].value == null || lastname[0].value == "")
				{
					invalidFeedback[1].innerHTML = "Lastname can't be Empty";
					$(lastname[0]).addClass("is-invalid");
					result = false;
				}
				else if(lastnamepattern.test(lastname[0].value) == false)
				{
					invalidFeedback[1].innerHTML = "Lastname must contain only characters";
					$(lastname[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					invalidFeedback[1].innerHTML = "";
					$(lastname[0]).removeClass("is-invalid");
					//$(lastname[0]).addClass("is-valid");
					result = true;
				}
				allresult.push(result);
				
				// username Validation
				var username = document.getElementsByName("username");
				var usernamepattern = /^[a-zA-Z0-9]+$/;
				if(username[0].value == null || username[0].value == "")
				{
					invalidFeedback[2].innerHTML = "Username can't be Empty";
					$(username[0]).addClass("is-invalid");
					result = false;
				}
				else if(usernamepattern.test(username[0].value) == false)
				{
					invalidFeedback[2].innerHTML = "Invalid Username";
					$(username[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					$.ajax({
						url : "../validation.jsp",
						method : "GET",
						data : {
							username : username[0].value
						},
						success : function(data) {
							var temp = data.split("<body>")[1].split("</body>")[0];
							console.log(temp);
							if(temp.includes("true"))
							{
								invalidFeedback[2].innerHTML = "Username already exist";
								$(username[0]).addClass("is-invalid");
								result = false;
							}
							else
							{
								invalidFeedback[2].innerHTML = "";
								$(username[0]).removeClass("is-invalid");
								//$(username[0]).addClass("is-valid");
								result = true;
							}
						}
					});
				}
				allresult.push(result);
				
				// Date Validation
				var dob = document.getElementsByName("dob");
				var parts = dob[0].value.split("-");
	            var dtDOB = new Date(parts[0] + "/" + parts[1] + "/" + parts[2]);
				var dtCurrent = new Date();
				console.log("currentDate : " + dtCurrent);
				console.log("dobDate : " + dtDOB);
				if(dob[0].value == null || dob[0].value == "")
				{
					invalidFeedback[3].innerHTML = "Please select date of Birth";
					$(dob[0]).addClass("is-invalid");
					result = false;
				}
				else if(dtCurrent.getFullYear() - dtDOB.getFullYear() < 15)
				{
					invalidFeedback[3].innerHTML = "Age must be greater than 15";
					$(dob[0]).addClass("is-invalid");
					result = false;
		        }
				else if (dtCurrent.getFullYear() - dtDOB.getFullYear() == 15) 
				{
		            if (dtCurrent.getMonth() > dtDOB.getMonth()) 
		            {
		            	invalidFeedback[3].innerHTML = "you have to wait "+ (dtCurrent.getMonth() - dtDOB.getMonth()) +" month to sign up";
						$(dob[0]).addClass("is-invalid");
						result = false;
		            }
		            if (dtCurrent.getMonth() == dtDOB.getMonth()) 
		            {
		                if (dtCurrent.getDate() > dtDOB.getDate()) 
		                {
		                	invalidFeedback[3].innerHTML = "you have to wait " + (dtCurrent.getDate() - dtDOB.getDate()) - 1 +" day to sign up";
		 					$(dob[0]).addClass("is-invalid");
		 					result = false;
		                }
		            }
				}
				else
				{
					invalidFeedback[3].innerHTML = "";
					$(dob[0]).removeClass("is-invalid");
					//$(dob[0]).addClass("is-valid");
					result = true;
				}
				allresult.push(result);
				
				// Password Validation
				var password = document.getElementsByName("password");
				var digitpattern = /(?=.*\d)/;
				var leadingpattern = /^(?=.*[A-Za-z])/;
				var specialpattern = /(?=.*[^a-zA-Z0-9])(?!.*\s)/;
				if(password[0].value == null || password[0].value == "")
				{
					invalidFeedback[4].innerHTML = "Password can't be empty";
					$(password[0]).addClass("is-invalid");
					result = false;
				}
				else if(password[0].value.length < 8 || password[0].value.length > 16)
				{
					invalidFeedback[4].innerHTML = "Password length should be between 8-16 character";
					$(password[0]).addClass("is-invalid");
					result = false;
				}
				else if(digitpattern.test(password[0].value) == false)
				{
					invalidFeedback[4].innerHTML = "Password must contains at least 1 digit";
					$(password[0]).addClass("is-invalid");
					result = false;
				}
				else if(leadingpattern.test(password[0].value) == false)
				{
					invalidFeedback[4].innerHTML = "Password must starts with character";
					$(password[0]).addClass("is-invalid");
					result = false;
				}
				else if(specialpattern.test(password[0].value) == false)
				{
					invalidFeedback[4].innerHTML = "Password must contains at least 1 special character";
					$(password[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					invalidFeedback[4].innerHTML = "";
					$(password[0]).removeClass("is-invalid");
					//$(password[0]).addClass("is-valid");
					result = true;
				}
				allresult.push(result);
				
				// Email Validation
				var email = document.getElementsByName("email");
				var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if(email[0].value == null || email[0].value == "")
				{
					invalidFeedback[5].innerHTML = "Email can't be Empty";
					$(email[0]).addClass("is-invalid");
					result = false;
				}
				else if(emailpattern.test(email[0].value) == false)
				{
					invalidFeedback[5].innerHTML = "Invalid email address";
					$(email[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					$.ajax({
						url : "../validation.jsp",
						method : "GET",
						data : {
							email : email[0].value
						},
						success : function(data) {
							var temp = data.split("<body>")[1].split("</body>")[0];
							console.log(temp);
							if(temp.includes("true"))
							{
								invalidFeedback[5].innerHTML = "Email already exist";
								$(email[0]).addClass("is-invalid");
								result = false;
							}
							else
							{
								invalidFeedback[5].innerHTML = "";
								$(email[0]).removeClass("is-invalid");
								//$(email[0]).addClass("is-valid");
								result = true;
							}
						}
					});
				}
				allresult.push(result);
				
				// Phone number Validation
				var phoneno = document.getElementsByName("phoneno");
				var phonepattern = /^[6-9]\d{9}$/;
				if(phoneno[0].value == null || phoneno[0].value == "")
				{
					invalidFeedback[6].innerHTML = "Phonenumber is required";
					$(phoneno[0]).addClass("is-invalid");
					result = false;
				}
				else if(phonepattern.test(phoneno[0].value) == false)
				{
					invalidFeedback[6].innerHTML = "Invalid Phone number";
					$(phoneno[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					invalidFeedback[6].innerHTML = "";
					$(phoneno[0]).removeClass("is-invalid");
					//$(phoneno[0]).addClass("is-valid");
					result = true;
				}
				allresult.push(result);
				
				// Address Validation
				var address = document.getElementsByName("address");
				if(address[0].value == null || address[0].value == "")
				{
					invalidFeedback[7].innerHTML = "Address is required";
					$(address[0]).addClass("is-invalid");
					result = false;
				}
				else
				{
					invalidFeedback[7].innerHTML = "";
					$(address[0]).removeClass("is-invalid");
					//$(address[0]).addClass("is-valid");
					result = true;
				}
				allresult.push(result);
				
				for(let i=0;i<allresult.length;i++)
				{
					if(allresult[i] == false)
					{
						result = false;
						break;
					}
					else
					{
						result = true;
					}
				}
				
				return result;
			}
		</script>
	
		<script src="js/jquery-3.5.0.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
	
		<!-- Custom JS -->
		<script src="js/search.js"></script>
		<script src="js/scriptc619.js?v=1.0"></script>


	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-form-product-3.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:47 GMT -->

</html>