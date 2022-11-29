<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/style.css">
<style>
.error {
	color: red;
}.msg{
color:blue;
}
.square {
position:absolute;
color:red;
  height: 220px;
  width: 250px;
  border: 2px solid black;
    z-index: 1;
}
</style>
</head>
<body>

	<div class="wrapper">
		<%@include file="side_navbar.jsp"%>
		
		<div class="container">
		<h3 class="msg" id="msg">${param.msg}</h3>

			<div class="card shadow  mb-2 bg-white rounded h-8 my-3">
				<div class="row text-center">
					<h1>Profile Details :</h1>
				</div>
				<hr>
				<div class="card-body">
					<form:form action="profile" method="POST"
						modelAttribute="customerDto" id="profile-form">
						<div class="row">
							<div class="col-md-4">
								<label for="firstName" style="margin-top: 5%">First
									Name:</label> <input type="text" class="form-control font-weight-bold"
									id="firstName" name="firstName"
									value=${sessionScope.user.getFirstName()
									}
									readonly="readonly">
								<form:errors path="firstName" cssClass="error" />
								<p id="firstNameError" style="display: none;" class="error">Only
								Letters allowed</p>
								
								
								<br> <label for="LastName" style="margin-top: 5%">Last
									Name:</label> <input type="text" class="form-control font-weight-bold"
									id="lastName" name="lastName"
									value=${sessionScope.user.getLastName()
									}
									readonly="readonly">
									<p id="lastNameError" style="display: none;" class="error">Only
								Letters allowed</p>
								<form:errors path="lastName" cssClass="error" />
								
								
								

								
								
								
								<br> <label for="email" style="margin-top: 5%">Email
									:</label> <input type="email" class="form-control font-weight-bold"
									id="useremail" name="email"
									value=${sessionScope.user.getEmail()
									}
									readonly="readonly" onkeypress="return event.charCode != 32">
									<p id="emailError" style="display: none;" class="error">Invalid
								Email Format</p>
								<form:errors path="email" cssClass="error" />
								<br>
							</div>



							<div class="col-md-4 offset-md-1" >
								<label for="MobileNo" style="margin-top: 5%">Mobile No :</label>
								<input type="text" class="form-control font-weight-bold"
									id="mobile" name="mobileNo"
									value=${sessionScope.user.getMobileNo()
									}
									readonly="readonly">
									<p id="mobilenoError" style="display: none;" class="error">Phone
								number should be 10 digits only</p>
								<form:errors path="mobileNo" cssClass="error" />
								
								
								
								<br>  <label for="address" class="form-label"
									style="margin-top: 5%">Address :</label>
								<textarea class="form-control " id="address" rows="3"
									name="address" readonly="readonly">${sessionScope.user.getAddress()}</textarea>
								<p id="addressError" style="display: none;" class="error">Address
								length should be less than 255 letters</p>
								<form:errors path="address" cssClass="error" />
								
								<br><label for="Password" style="margin-top: 5%">Password
									:</label> <input type="password" class="form-control font-weight-bold"
									id="userpassword" name="password"
									value=${sessionScope.user.getPassword()
									}
									readonly="readonly"
									
									onkeyup="checkPassword()">
									<p id="passwordError" style="display: none;" class="error">
								<form:errors path="password" cssClass="error" />
								<p id="passworderror"></p>
								<br>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-1 offset-4">
								<button class="btn btn-primary" id="editprofile">Edit</button>
								<button type="submit" class="btn btn-success" id="updateprofile"
									style="display: none;">Update</button>
							</div>
						</div>
					</form:form>
				</div>
				<div class="col-1 offset-8">
					<button class="btn btn-danger" id="logout" onclick="logout()">Log
						out</button>
				</div>
				<div class="row my-3"></div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	
	
	setTimeout(function() {
		  $("#msg").remove();
		}, 3000);
	

		$('#editprofile').click(function(event) {
			event.preventDefault()
			$('#firstName').removeAttr("readonly")
			$('#lastName').removeAttr("readonly")
			$('#useremail').removeAttr("readonly")
			$('#mobile').removeAttr("readonly")
			$('#address').removeAttr("readonly")
			$('#userpassword').removeAttr("readonly")
			$('#editprofile').hide()
			$('#updateprofile').show()
		})

		function logout() {
			window.location.replace("http://localhost:8081/customer/logout")
		}

		$('#profile-form').on('submit', function(event) {
			event.preventDefault()
			if (checkValidation()) {
				$(this).unbind('submit').submit()
			}
		})

		function checkValidation() {

			var inputEmail = $('#useremail').val();
			var inputfirstName = $('#firstName').val()
			var inputlastName = $('#lastName').val()
			var inputmobile = $('#mobile').val()
			var inputpassword = $('#userpassword').val()
			var inputaddress = $('#address').val()
			
				let hasErrors = true

			if (hasErrors) {
				if (inputEmail == "" || checkEmail(inputEmail)) {
					$('#emailError').show()
					hasErrors = false
				} else {

					$('#emailError').hide()
				}
				if (inputfirstName == "" || onlyLetters(inputfirstName)) {
					$('#firstNameError').show()
					hasErrors = false
				} else {
					$('#firstNameError').hide()
				}
				if (inputlastName == "" || onlyLetters(inputlastName)) {
					hasErrors = false
					$('#lastNameError').show()
				} else {
					$('#lastNameError').hide()
				}
				if (inputmobile == "" || checkPhoneNumber(inputmobile)) {
					$('#mobilenoError').show()
					hasErrors = false
				} else {
					$('#mobilenoError').hide()
				}
				
				if(!checkPassword()){
					$('#passwordError').show()
					hasErrors = false
				}else{
					$('#passwordError').hide()
				}
				
				if (inputaddress.length > 255) {
					$('#addressError').show()
					hasErrors = false
				} else {
					$('#addressError').hide()

				}
			} else {
				hasErrors = true
			}
			return hasErrors

		}
		
		
		
		function checkPassword() {
			let userpass=$('#userpassword').val();
			 if (checkregxPassword(userpass)) {
				 $('#passwordError').html('Invalid password')
					$('#passwordError').hide()
				return true;

			} else {
				$('#passwordError').html('Invalid password')
				$('#passwordError').show()
				return false;
			} 
		}
		
		

		//Email Regex
		function checkEmail(email) {
			var regx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			return !regx.test(email);
		}

		function onlyLetters(Name) {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			return !regx.test(Name);
		}

		function checkPhoneNumber(mobile) {
			var regx = /^[0-9]{10}$/;
			return !regx.test(mobile);
		}
		function checkregxPassword(password) {
			var re = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$/;
			return re.test(password)
		}
		
	</script>




</body>
</html>