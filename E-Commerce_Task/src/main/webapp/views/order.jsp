<%@page import="java.text.DateFormat"%>
<%@page import="com.concerto.ecommerce.entity.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<style>
.card-img-top {
	object-fit: contain;
}
</style>
</head>

<body>
<div class="wrapper">
	
	<nav id="sidebar" aria-labelledby="sidebar-header">
			<div class="sidebar-header">
				<h3>Ecommerce Application</h3>
			</div>

			<ul class="list-unstyled components">
				<p class="font-weight-normal">Main Menu</p>
				<li><a href="http://localhost:8081/">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Portfolio</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</nav>
	
	<div class="content">
<%
List<Order> orders=(List<Order>)request.getAttribute("orders");
if(orders.isEmpty())
{
	%>
	
	<h2>No Order Placed</h2>
	<% 
}else{
	%>
	
	<div class="container" id="product-container">
				<%
				for (Order o : orders) {
				%>
				<div class="card shadow  mb-2 bg-white rounded h-8">
					<div class="row no-gutters">
						<div class="col-sm-3" style="border-right: 2px solid blue;">
							<img class="card-img-top img-fluid my-2"
								src="../productimages/<%=o.getProduct().getItemPhoto()%>"
								alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
						</div>
						<div class="col-sm-9">
							<div class="card-body" style="height: 180px">
								<h5 class="card-title"><%=o.getProduct().getItemName()%></h5>
								<p class="card-text"><%=o.getProduct().getItemDescription()%></p>
							</div>
							<div class="card-footer" style="border: 0;">
							<div class="text-right">
							<h5>Order Placed on:  <%=DateFormat.getDateInstance().format(o.getOrderDate()) %></h5>
							</div>


							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
	<% 
	
}
	
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>