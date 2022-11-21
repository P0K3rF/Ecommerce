<%@page import="com.concerto.ecommerce.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>View Product</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<!-- Our Custom CSS -->
<link rel="stylesheet" href="/css/style.css">
<link rel="text/javascript" href="/js/index.js">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<%
Product product = (Product) request.getAttribute("product");
%>

</head>

<body>
	<div class="wrapper">
		<%@include file="side_navbar.jsp"%>


		<div class="container">
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3">

				<div class="card-body">
					<div class="row">
						<div class="col-4 text-center">
							<img class="card-img-top img-fluid my-5"
								src="../productimages/<%=product.getItemPhoto()%>"
								alt="Suresh Dasari Card"
								style="height: 400px; width: 350px; border-right: 2px solid blue;">
							<h4 class="mx-5 ">
								<sup>&#8377; </sup><%=product.getItemPrice()%></h4>
						</div>
						<div class="col-md-8">
							<div class="container py-5">
								<h3><%=product.getItemName()%></h3>

								<p class="card-text"><%=product.getItemDescription()%></p>

								<a class="btn btn-danger mx-2 text-white"
									onclick="buyProduct(<%=product.getItemId()%>)">Buy Now</a>
									<p id="outOfStock" style="color:red"></p>
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
	

    function buyProduct(pid){
 	   let prodid={
 			   "productId":pid
 	   }
 	   
 		$.ajax({
 			type:"POST",
 			contentType : 'application/json; charset=utf-8',
 			 dataType : 'json',
 			url:'checkoutofstock',  
 			 data:JSON.stringify(prodid),
 			 success:function(result){
 				 if(result.statusCode==200){
 					window.location="http://localhost:8081/customer/payment?product_id="+pid;
 				 }
 				 else{
 					 $('#outOfStock').html("This Item is currently out of stock")
 				 }
 			 
 			 },
 			 error: function(xhr, status, error) {
 				if(status=="error") {
 					swal("You have to login first")
					 .then((value)=>{
						 window.location="http://localhost:8081/login";
					 })
 				}
 			   },	
 		})
 	   
 	   
 	   
    }
	
	
	</script>
	
</body>
</html>