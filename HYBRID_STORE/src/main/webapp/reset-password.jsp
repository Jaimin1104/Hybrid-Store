<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from demo.themefisher.com/elite-shop/forget-password.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:58 GMT -->
<head>
	<%@ include file="head.jsp" %>
</head>

<body>
	<%@ include file="preloader.jsp"%>

	<section class="forget-password-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 mx-auto">
					<div class="block text-center">
						<!-- <a class="logo" href="index.jsp">
            <img src="images/logo.png" alt="logo">
          </a> -->
						<a class="navbar-brand order-2 order-lg-1"><span
							style="font-family: play;">HYBRID STORE</span></a>
						<!-- <h2 class="text-center">Welcome Back</h2> -->
						<form class="text-left clearfix" action="LoginController"
							method="post" onsubmit="return validateForm()">
							<p>After confirmation this new password should be used to
								login your account.</p>
							<div class="form-group">
								<div class="input-group mb-3">
									<input type="password" class="form-control" name="new password"
										placeholder="Enter new password" id="inputPassword" onkeyup="changePassword()"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
									<div class="input-group-append">
	    								<i class="fa fa-eye input-group-text" style="padding-top: 19px;" id="eye" aria-hidden="true"></i>
	    								<i class="fa fa-eye-slash input-group-text" style="padding-top: 19px;display: none;" id="eyeslash" aria-hidden="true"></i>
	  								</div>
									<div class="invalid-feedback"></div>
								</div>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="confirm password" 
									placeholder="Retype password"
									title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
								<div class="invalid-feedback"></div>
							</div>
							<div class="text-center">
								<input type="submit" name="btn" value="Reset password"
									class="btn btn-primary">
							</div>
						</form>
						<p class="mt-3">
							<a href="login.jsp">Back to log in</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

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
	
		// Form Validation
		function validateForm() {
			var allresult = [];
			var result;
			var invalidFeedback = document.getElementsByClassName("invalid-feedback");
			
			// New Password Validation
			var newPassword = document.getElementsByName("new password");
			var digitpattern = /(?=.*\d)/;
			var leadingpattern = /^(?=.*[A-Za-z])/;
			var specialpattern = /(?=.*[^a-zA-Z0-9])(?!.*\s)/;
			if(newPassword[0].value == null || newPassword[0].value == "")
			{
				invalidFeedback[0].innerHTML = "Password can't be empty";
				$(newPassword[0]).addClass("is-invalid");
				result = false;
			}
			else if(newPassword[0].value.length < 8 || newPassword[0].value.length > 16)
			{
				invalidFeedback[0].innerHTML = "Password length should be between 8-16 character";
				$(newPassword[0]).addClass("is-invalid");
				result = false;
			}
			else if(digitpattern.test(newPassword[0].value) == false)
			{
				invalidFeedback[0].innerHTML = "Password must contains at least 1 digit";
				$(newPassword[0]).addClass("is-invalid");
				result = false;
			}
			else if(leadingpattern.test(newPassword[0].value) == false)
			{
				invalidFeedback[0].innerHTML = "Password must starts with character";
				$(newPassword[0]).addClass("is-invalid");
				result = false;
			}
			else if(specialpattern.test(newPassword[0].value) == false)
			{
				invalidFeedback[0].innerHTML = "Password must contains at least 1 special character";
				$(newPassword[0]).addClass("is-invalid");
				result = false;
			}
			else
			{
				invalidFeedback[0].innerHTML = "";
				$(newPassword[0]).removeClass("is-invalid");
				//$(newPassword[0]).addClass("is-valid");
				result = true;
			}
			allresult.push(result);
			
			// Confirm Password Validation
			var confirmPassword = document.getElementsByName("confirm password");
			if(newPassword[0].value === confirmPassword[0].value)
			{
				invalidFeedback[1].innerHTML = "";
				$(confirmPassword[0]).removeClass("is-invalid");
				//$(confirmPassword[0]).addClass("is-valid");
				result = true;
			}
			else
			{
				invalidFeedback[1].innerHTML = "Password must be same as new Password";
				$(confirmPassword[0]).addClass("is-invalid");
				result = false;
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

<!-- Mirrored from demo.themefisher.com/elite-shop/forget-password.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Nov 2021 03:36:58 GMT -->
</html>