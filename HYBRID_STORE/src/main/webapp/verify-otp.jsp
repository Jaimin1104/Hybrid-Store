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
						<a class="navbar-brand order-2 order-lg-1" href="index.jsp"><span
							style="font-family: play;">HYBRID STORE</span></a>
						<!-- <h2 class="text-center">Welcome Back</h2> -->
						<form class="text-left clearfix" action="SignInController"
							method="post" onsubmit="return validateForm()">
							<p align="center">OTP has been sent to your registered email
								address.</p>
							<div class="form-group">
								<input type="text"
									name="enteredOtp" class="form-control" placeholder="OTP">
								<div class="invalid-feedback"></div>
							</div>
							<div class="text-center">
								<input type="submit" name="btn" value="Verify OTP"
									autocapitalize="none" class="btn btn-primary">
							</div>
						</form>
						<p class="mt-3">
							<a href="SignInController">Resend OTP</a>
						</p>
						<!-- <input type="url" name="link" value="resend otp"> -->
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- /main wrapper -->

	<!-- jQuery -->
	<script src="plugins/jQuery/jquery.min.js"></script>
	<script>
		function validateForm() {
			var result;
			var invalidFeedback = document.getElementsByClassName("invalid-feedback");
			
			// OTP Validation
			var enteredOtp = document.getElementsByName("enteredOtp");
			var otppattern = /^[0-9]\d{5}$/;
			if(enteredOtp[0].value == null || enteredOtp[0].value == "")
			{
				invalidFeedback[0].innerHTML = "OTP Can't be empty";
				$(enteredOtp[0]).addClass("is-invalid");
				result = false;
			}
			else if(otppattern.test(enteredOtp[0].value) == false)
			{
				invalidFeedback[0].innerHTML = "Invalid OTP";
				$(enteredOtp[0]).addClass("is-invalid");
				result = false;
			}
			else
			{
				invalidFeedback[0].innerHTML = "";
				$(enteredOtp[0]).removeClass("is-invalid");
				//$(enteredOtp[0]).addClass("is-valid");
				result = true;
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