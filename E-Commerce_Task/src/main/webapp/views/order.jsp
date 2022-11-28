<%@page import="java.text.DateFormat"%>
<%@page import="com.concerto.ecommerce.entity.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
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
<style>
.card-img-top {
	object-fit: contain;
}

.btn-link {
	border: 0;
}
</style>
</head>

<body>
	<div class="wrapper">

		<%@include file="side_navbar.jsp"%>
		<%
		List<Order> orders = (List<Order>) request.getAttribute("orders");
		if (orders.isEmpty()) {
		%>

		<h2>No Order Placed</h2>
		<%
		} else {
		%>

		<div class="container" id="product-container">
			<%
			for (Order o : orders) {
			%>

			<div class="card shadow  mb-2 bg-white rounded h-8 my-3">

				<div class="row no-gutters">
					<div class="col-sm-4" style="border-right: 2px solid blue;">
						<img class="card-img-top img-fluid my-2 img-responsive"
							src="../productimages/<%=o.getProduct().getItemPhoto()%>"
							alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
					</div>
					<div class="col-sm-8">
						<div class="card-body" style="height: 180px">
							<div class="row">
								<h5 class="card-title"><%=o.getProduct().getItemName()%></h5>
							</div>

							<h4 style="color: grey">
								<sup>&#8377;<%=o.getOrderPrice()%>(<%=o.getOrderQuantity()%>)
								</sup>
							</h4>
							<%
							int descriptionsize = o.getProduct().getItemDescription().length();
							if (descriptionsize > 200) {
							%>

							<p class="card-text"><%=o.getProduct().getItemDescription().substring(0, 200)%>...
							</p>
							<%
							} else {
							%>
							<p class="card-text"><%=o.getProduct().getItemDescription()%>...
							</p>
							<%
							}
							%>

						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-7 text-right">
									<button type="button" data-bs-toggle="modal"
										data-bs-target="#order-modal" class="btn-link"
										onclick="viewDetails(<%=o.getOrderId()%>)">Show
										Details</button>
								</div>
								<div class="col-5 text-right">
									<h5>
										Order Placed on:
										<%=DateFormat.getDateInstance().format(o.getOrderDate())%></h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<%
		}
		%>


		<!-- Update Modal -->
		<div class="modal fade" id="order-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Order Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="modal-body">


						<br>
						<div class="form-group">
							Product Name : <input name="itemName" id="title" type="text"
								placeholder="Enter Post Title" class="form-control"  readonly="readonly">
						</div>
						<br>
						<div class="form-group">
							Description :
							<textarea name="itemDescription" id="description"
								class="form-control" style="height: 200px"  readonly="readonly"></textarea>
						</div>
						<br>
						<div class="form-group">
							Price: <input type="text" name="itemPrice" id="price"
								class="form-control"  readonly="readonly"/>
						</div>

						<div class="form-group">
							Quantity: <input type="number" name="itemQuantity" id="quantity"
								class="form-control"  readonly="readonly"/>
						</div>
						<div class="form-group">
							Email: <input type="text" name="email" id="email"
								class="form-control" readonly="readonly"/>
						</div>
						<div class="form-group">
							Mobile No: <input type="text" name="mobileNo" id="mobileNo"
								class="form-control"  readonly="readonly"/>
						</div>
						<div class="form-group">
							Address :
							<textarea name="address" id="address" class="form-control"
								style="height: 200px"  readonly="readonly"></textarea>
						</div>
						<br>
						<div class="form-group" id="itemImage"
							style="border: 2px solid black; display: inline-block;" >
							</div>
						<br>
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
		
	
	
	function viewDetails(orderId){
		let orderData={
				"orderId":orderId
		}
		$.ajax({
		
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'getOrderById',  
			 data:JSON.stringify(orderData),
			 success:function(data){
				 $('#title').val(data.t.product.itemName)
			 	  $('#description').val(data.t.product.itemDescription)
			 	 	  $('#price').val(data.t.orderPrice)
			 	 	  $('#quantity').val(data.t.orderQuantity)
			 	 	 $('#email').val(data.t.customer.email)
				  $('#mobileNo').val(data.t.customer.mobileNo)
				  $('#address').val(data.t.address)
let htmlvar='<img src="../productimages/'+data.t.product.itemPhoto+'" id="output" class="img-fluid" style="height: 155px; width: 150px" /><br>'				  
$('#itemImage').html(htmlvar)
			 },
			 error:function(xhr, status, error){
				 console.log(error)
			
			 },
			
			
		})
		
		
		
	}
	
	
	
	
	
	
	
	
	</script>
</body>
</html>