<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<!-- Bootstrap CSS CDN -->
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
<!-- Our Custom CSS -->
<link rel="stylesheet" href="/css/style.css">
<link rel="text/javascript" href="/js/index.js">


<style>
.btn-link {
	border: 0;
}

.card-img-top {
	object-fit: contain;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.paycard {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.proceedbtn {
	background-color: #04AA6D;
	color: white;
	padding: 12px;
	margin: 10px 120px;
	border: none;
	width: 50%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

span.price {
	float: right;
	color: grey;
}

.proceedbtn:hover {
	background-color: #45a049;
}

.cartproduct {
	color: #2196F3;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="side_navbar.jsp"%>
		<div class="container">
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3">
				
				<div class="card-body">
				
					<form id="userDetail">
						<div class="row">
							<h4 class="my-3">Your Details :</h4>
							<div class="col-4">

								<label for="firstName" style="margin-top: 5%">First
									Name:</label> <input type="text" class="form-control font-weight-bold"
									id="firstName" name="firstName"
									value=${sessionScope.user.getFirstName()
									}
									readonly="readonly">

							</div>

							<div class="col-4">

								<label for="LastName" style="margin-top: 5%">Last Name:</label>
								<input type="text" class="form-control font-weight-bold"
									id="lastName"
									value=${sessionScope.user.getLastName()
									}
									readonly="readonly">

							</div>

							<div class="col-4">

								<label for="email" style="margin-top: 5%">Email:</label>
								<button type="button" class="btn-link" onclick="changeEmail()">Change
									Email</button>
								<em class="fa fa-refresh fa-1x fa-spin" id="loader"
									style="display: none"></em> <em id="invalidEmail"
									style="color: red; display: none">Invalid email</em>
								<button type="button" id="updateEmail"
									class="btn btn-sm btn-success py-0"
									style="font-size: 0.8em; display: none;">Update</button>
								<input type="text" class="form-control font-weight-bold"
									id="email" name="email" value=${sessionScope.user.getEmail() }
									readonly="readonly">

							</div>


						</div>
						<div class="row my-3">
						<div class="col-4">
								<label for="email" class="form-label">Mobile No:</label> <input
									type="text" class="form-control font-weight-bold" id="mobileno"
									name="mobileno" value=${sessionScope.user.getMobileNo() }
									readonly="readonly" style="font-family: sans-serif;">

							</div>
							<div class="col-6">
								<label for="address" class="form-label">Address :</label>
								<button type="button" class="btn-link" onclick="changeAddress()">Edit</button>
								<button type="button" id="updateEmail"
									class="btn btn-sm btn-success py-0"
									style="font-size: 0.8em; display: none;">Update</button>
								<textarea class="form-control " id="address" rows="3"
									readonly="readonly">${sessionScope.user.getAddress()}</textarea>
							</div>
							


						</div>
					</form>
					<hr>

					<div class="row my-4">
						<div class="col-6 mx-3"
							style="background-color: #f2f2f2; font-family: Arial;">
							<h4 class="my-3">Payment :</h4>
							<label for="fname">Accepted Cards</label>
							<div class="icon-container">
								<em class="fa fa-cc-visa" style="color: navy;"></em> <em
									class="fa fa-cc-amex" style="color: blue;"></em> <em
									class="fa fa-cc-mastercard" style="color: red;"></em> <em
									class="fa fa-cc-discover" style="color: orange;"></em>
							</div>

							<div class="blck">
								<label for="cname" style="display: block">Name on Card</label> <input
									type="text" id="cname" class="paycard" name="cardname"
									placeholder="John More Doe"> <label for="ccnum"
									style="display: block">Credit card number</label> <input
									type="text" id="ccnum" name="cardnumber" class="paycard"
									placeholder="1111-2222-3333-4444"> <label
									for="expmonth" style="display: block">Exp Month</label> <input
									type="text" id="expmonth" name="expmonth" class="paycard"
									placeholder="September">
							</div>
							<div class="row">
								<div class="col-6">
									<label for="expyear" style="display: block">Exp Year</label> <input
										type="text" id="expyear" class="paycard" name="expyear"
										placeholder="2018">
								</div>
								<div class="col-6">
									<label for="cvv" style="display: block">CVV</label> <input
										type="text" id="cvv" class="paycard" name="cvv"
										placeholder="352">
								</div>
							</div>
							<input type="submit" value="Proceed to buy" class="proceedbtn">

						</div>

						<div class="col-5"
							>
							<div class="container" style="background-color: #f2f2f2; border-radius: 3px; font-family: Arial;">
							<h4 class="py-3">
								Cart <span class="price" style="color: black"> <em
									class="fa fa-shopping-cart"></em> <b>4</b></span>
							</h4>
							
							<p>
								<a class="cartproduct" href="#">Product 1</a> <span
									class="price">$15</span>
							</p>
							
							<hr>
							<p>
								Total <span class="price" style="color: black"><b>$30</b></span>
							</p>
							</div>
						</div>
					</div>

				</div>

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
	
	
	
	$(document).ready(function(){
		let name = ${product};
	/* 	/* let prod=JSON.stringify(name); */
		/*console.log(name.itemName)
		console.log(typeof(obj)) */
		$.each(name,function(index,item){
			console.log(item)
		})
	})
	
	
	
	
		function changeAddress() {
			swal("Note: This address is associated with this specific order only")
			$('#address').removeAttr("readonly")
		}

		function changeEmail() {
			$('#loader').show()
			let customerEmail = {
				"email" : $('#email').val()
			}

			$.ajax({
				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'checkforEmail',
				data : JSON.stringify(customerEmail),
				success : function(data) {
					$('#loader').hide()
					if (data.statusCode == 200) {
						$('#updateEmail').show()
						$('#invalidEmail').hide()
						$('#email').removeAttr("readonly")
					}
					if (data.statusCode == 401) {
						$('#updateEmail').hide()
						swal(data.t)
						$('#invalidEmail').show()
					}
				},
				error : function(xhr, status, error) {
					console.log(error)
					$('#loader').hide()
				}
			})
		}

		$("#updateEmail").click(function() {
			let customerEmail = {
				"email" : $('#email').val()
			}
			$.ajax({
				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'updateEmail',
				data : JSON.stringify(customerEmail),
				success : function(data) {
					if (data.statusCode == 200) {
						$('#updateEmail').hide()
						swal('Updated Email successfully');
					}
					if (data.statusCode == 500) {
						$('#updateEmail').hide()
						swal('Something Went Wrong please try again!')
					}
				},
				error : function(xhr, status, error) {
					console.log(error)
				}
			})

		});
	</script>



</body>

</html>