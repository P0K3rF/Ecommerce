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
.btn-link{
border:0;
}

.card-img-top {
	object-fit: contain;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="side_navbar.jsp"%>
		<div class="container">
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3">
				<div class="row">

					<div class="card-header text-center">
						<h2>
							Lenovo Phone with 2 gb ram<span style="color: blue">(&#8377;
								2000)</span>
						</h2>

					</div>
				</div>
				<div class="card-body" style="border: 2px solid black">
					<div class="row" style="border: 2px solid red">
						<div class="col-7" style="border: 2px solid green">
							<p>Popularized in the 17th century, the verb “tote” meant “to
								carry by hand” or, less gracefully put, “to lug.” While tote
								bags are traditionally made of canvas, there are no actual
								limitations to what a tote bag is made of. As long as it can be
								lugged around, it's a tote bag!</p>

						</div>
						<div class="col-5" style="border: 2px solid blue">
						<img class="card-img-top img-fluid my-2 img-responsive"
							src="../productimages/graphic card.jfif" alt="Suresh Dasari Card"
							style="height: 200px; width: 350px;">
						
				</div>
					</div>
					<form>
					<div class="row">
					<h4 class="my-3">Your Details :</h4>
					<div class="col-4" >
					
							<label for="firstName" style="margin-top: 5%">First Name:</label> <input
								type="text" class="form-control" id="firstName"
								 name="firstName" value=${sessionScope.user.getFirstName()} readonly="readonly">
						
					</div>
					
					<div class="col-4">
					
							<label for="LastName" style="margin-top: 5%">Last Name:</label> <input
								type="text" class="form-control" id="lastName"
								 name="lastName" value=${sessionScope.user.getLastName()} readonly="readonly">
						
					</div>
					
					<div class="col-4">
					
							<label for="email" style="margin-top: 5%">Email:</label>
							 <button type="button" class="btn-link" onclick="changeEmail()">Change Email</button>
							<em class="fa fa-refresh fa-1x fa-spin" id="loader" style="display: none" ></em>
							<em id="invalidEmail" style="color:red;display: none">Invalid email</em>
							<button type="button" id="updateEmail"  class="btn btn-sm btn-success py-0" style="font-size: 0.8em;display: none;" >Update</button>
							 <input
								type="text" class="form-control" id="email"
								 name="email" value=${sessionScope.user.getEmail()} readonly="readonly">
								 
								 
						
					</div>
					
					
					</div>
					<div class="row">
					
					</div>
					</form>

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
	
	function changeEmail(){
	$('#loader').show()
let customerEmail={
		"email":$('#email').val()
	}
	
	
	$.ajax({
		type:"POST",
		contentType : 'application/json; charset=utf-8',
		 dataType : 'json',
		url:'checkforEmail',  
		 data:JSON.stringify(customerEmail),
		 success:function(data){
			 $('#loader').hide()
			 if(data.statusCode==200){
				 $('#updateEmail').show()
				 $('#invalidEmail').hide()
				 $('#email').removeAttr("readonly") 
			 }
			 if(data.statusCode==401){
				 $('#updateEmail').hide()
				 swal(data.t)
				 $('#invalidEmail').show()
			 }
		 },
		 error:function(xhr, status, error)
		 {
			 console.log(error)
			 $('#loader').hide()
		 }
	})
	}

	$("#updateEmail").click(function(){
		let customerEmail={
				"email":$('#email').val()
			}
		$.ajax({
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'updateEmail',  
			 data:JSON.stringify(customerEmail),
			 success:function(data){
				 if(data.statusCode==200){
					 $('#updateEmail').hide()
					 swal('Updated Email successfully');
				 }
				 if(data.statusCode==500){
					 $('#updateEmail').hide()
					 swal('Something Went Wrong please try again!')
				 }
			 },
			 error:function(xhr, status, error)
			 {
				 console.log(error)
			 }
		})
		
		});
	
	
	</script>
	
	
	
</body>

</html>