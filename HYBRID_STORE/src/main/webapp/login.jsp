<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from demo.themefisher.com/elite-shop/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:52 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>

	<%@ include file="preloader.jsp"%>
	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 mx-auto">
					<div class="block text-center">
						<!-- <a class="logo" href="index.jsp">
            <img src="images/logo.png" alt="logo">
          </a> -->
						<a class="navbar-brand order-2 order-lg-1" href="index.jsp"><span
							style="font-family: play;">HYBRID STORE</span></a>
						<!-- <h2 class="text-center">Welcome Back</h2> -->
						<form method="post" action="LoginController" class="text-left clearfix" name="loginform" onsubmit="return validateForm()">
							<div class="input-group mb-3">
								<input type="text" name="username" class="form-control" placeholder="Username">
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group mb-3">
								<input type="password" name="password" class="form-control" id="inputPassword"
								placeholder="Password" onkeyup="changePassword()"
								title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
								<div class="input-group-append">
    								<i class="fa fa-eye input-group-text" style="padding-top: 19px;" id="eye" aria-hidden="true"></i>
    								<i class="fa fa-eye-slash input-group-text" style="padding-top: 19px;display: none;" id="eyeslash" aria-hidden="true"></i>
  								</div>
								<div class="invalid-feedback"></div>
							</div>
							<div class="text-center">
								<button type="submit" name="btn" value="login"
									class="btn btn-primary">Login</button>
							</div>
						</form>
						<p class="mt-3">
							New in this site?<a href="signin.jsp"> Create New Account</a>
						</p>
						<p>
							<a href="forget-password.jsp"> Forgot your password?</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /main wrapper -->

	<!-- jQuery -->
	<script src="plugins/jQuery/jquery.min.js"></script>
	
	<script>
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
		
		function validateForm() {
			var allresult = [];
			var result = true;
			var invalidFeedback = document.getElementsByClassName("invalid-feedback");
			var username = document.getElementsByName("username");
			var password = document.getElementsByName("password");
			var digitpattern = /(?=.*\d)/;
			var leadingpattern = /^(?=.*[A-Za-z])/;
			var specialpattern = /(?=.*[^a-zA-Z0-9])(?!.*\s)/;
			
			if(username[0].value == null || username[0].value == "")
			{
				invalidFeedback[0].innerHTML = "Username can't be Empty";
				$(username[0]).addClass("is-invalid");
				result = false;
			}
			else
			{
				$.ajax({
					url : "validation.jsp",
					method : "GET",
					data : {
						username : username[0].value
					},
					success : function(data) {
						var temp = data.split("<body>")[1].split("</body>")[0];
						console.log("Username Returned Data : " + temp);
						if(temp.includes("false"))
						{
							invalidFeedback[0].innerHTML = "Incorrect Username.";
							$(username[0]).addClass("is-invalid");
							result = false;
						}
						else
						{
							invalidFeedback[0].innerHTML = "";
							$(username[0]).removeClass("is-invalid");
							//$(username[0]).addClass("is-valid");
							result = true;
						}
					}
				});
			}
			allresult.push(result);
			
			if(password[0].value == null || password[0].value == "")
			{
				invalidFeedback[1].innerHTML = "Password can't be empty.";
				$(password[0]).addClass("is-invalid");
				result = false;
			}
			else if(password[0].value.length < 8)
			{
				invalidFeedback[1].innerHTML = "Password must contains at least 8 character";
				$(password[0]).addClass("is-invalid");
				result = false;
			}
			else if(!password[0].value.match(digitpattern))
			{
				invalidFeedback[1].innerHTML = "Password must contains at least 1 digit.";
				$(password[0]).addClass("is-invalid");
				result = false;
			}
			else if(!password[0].value.match(leadingpattern))
			{
				invalidFeedback[1].innerHTML = "Password must starts with character";
				$(password[0]).addClass("is-invalid");
				result = false;
			}
			else if(!password[0].value.match(specialpattern))
			{
				invalidFeedback[1].innerHTML = "Password must contains at least 1 special character.";
				$(password[0]).addClass("is-invalid");
				result = false;
			}
			else
			{
				$.ajax({
					url : "validation.jsp",
					method : "GET",
					data : {
						loginUsername : username[0].value,
						password : password[0].value
					},
					success : function(data) {
						var temp = data.split("<body>")[1].split("</body>")[0];
						if(temp.includes("false"))
						{
							invalidFeedback[1].innerHTML = "Incorrect Password.";
							$(password[0]).addClass("is-invalid");
							result = false;
						}
						else
						{
							invalidFeedback[1].innerHTML = "";
							$(password[0]).removeClass("is-invalid");
							//$(password[0]).addClass("is-valid");
							result = true;
						}
					}
				});
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

<!-- Mirrored from demo.themefisher.com/elite-shop/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:52 GMT -->
</html>