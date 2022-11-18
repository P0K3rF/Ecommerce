
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.concerto.ecommerce.entity.Product"%>
<%@page import="com.concerto.ecommerce.dto.CustomerRequestDto"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
CustomerRequestDto userDto = (CustomerRequestDto) session.getAttribute("user");
List<Product> products = (List<Product>) request.getAttribute("products");
int Pagecount = (Integer) request.getAttribute("count");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Ecommerce Application</title>

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

.modal-footer {
	border-top: 0 none;
}
.btn-outline-warning{
border:2px solid red;
}
.btn-outline-info{
border:2px solid blue;
}
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
</head>

<body>

	<div class="wrapper">
		<!-- Sidebar  -->
		<%@include file="side_navbar.jsp" %>

		<!-- Page Content  -->
		<div id="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light"
				aria-labelledby="container-fluid">
				<div class="container-fluid">

					<button class="navbar-toggler" type="button"
						data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
						aria-controls="sidebarMenu" aria-expanded="false"
						aria-label="Toggle navigation">
						<em class="fas fa-bars"></em>
					</button>


					<!-- Search form -->
					<form class="d-none d-md-flex input-group w-auto my-auto"
						action="SearchProduct" method="POST" id="search-form">
						<input autocomplete="off" type="search" id="input-search"
							class="form-control rounded" placeholder='Search For Product'
							style="min-width: 225px" /> <span
							class="input-group-text border-0">
							<button type="submit" class="btn" id="search-product"
								onclick="searchProduct()">
								<span class="fas fa-search"></span> search
							</button>
						</span>
					</form>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<em class="fas fa-align-justify"></em>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">

							<%
							if (userDto == null) {
							%>
							<li class="nav-item "><a class="nav-link" href="login"><span
									class="fas fa-sign-in-alt"></span> Log in</a></li>
							<%
							} else {
							%>
							<li class="nav-item "><h6 class="nav-link">
									<%=userDto.getEmail()%></h6></li>
							<%
							}
							%>


							<li class="nav-item "><a class="nav-link" href="#"><span
									class="fas fa-bell"></span> Notifications</a></li>
							<li class="nav-item"><a class="nav-link" href="#"
								data-bs-toggle="modal" data-bs-target="#add-post-modal"><span
									class="fas fa-cart-plus"></span> Cart </a></li>

						</ul>
					</div>
				</div>
			</nav>
			<!-- Card  -->
			<div class="container" id="product-container">
				<%
				for (Product p : products) {
				%>
				<div class="card shadow  mb-2 bg-white rounded h-8">

					<div class="row no-gutters">
						<div class="col-sm-4" style="border-right: 2px solid blue;">
							<img class="card-img-top img-fluid my-2 img-responsive"
								src="../productimages/<%=p.getItemPhoto()%>"
								alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
						</div>
						<div class="col-sm-8">
							<div class="card-body" style="height: 180px">
								<h5 class="card-title"><%=p.getItemName()%></h5>
								<%
								int descriptionsize=p.getItemDescription().length();
								if(descriptionsize>200){
									%>
									
									<p class="card-text"><%=p.getItemDescription().substring(0, 200)%>...</p>
								<% }
								else{
									%>
									<p class="card-text"><%=p.getItemDescription()%>...</p>
								<%
								}
								%>
								
							<h4 class="mx-2"><%=p.getItemPrice() %></h4>
							</div>
							
							<div class="card-footer text-right" style="border: 0;">
									
								
								
								<a class="btn btn-outline-warning text-dark" id="addCart"
										onclick="addToCart(<%=p.getItemId()%>)">Add to Cart</a> <a
										class="btn btn-outline-info mx-2 text-dark"
										onclick="viewProduct(<%=p.getItemId()%>)">View Product</a>
							</div>
						</div> 
					</div>
				</div>

				<%
				}
				%>
			</div>
			<div class="pagination">

			<%
			for (int i = 0; i < Pagecount; i++) {
			%>

			<a onclick="changeActiveness(<%=i%>,this)" class="link-active"><%=i + 1%></a>

			<%
			}
			%>
		</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade " id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4>CART ITEM</h4>
				</div>
				<div class="modal-body" id="modalbody"></div>
			</div>
		</div>
	</div>

	<!-- Popper.JS -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
	
	
	function changeActiveness(pageno,temp){
		window.location.href="http://localhost:8081?page="+pageno;
	}
	
	
	
	$(document).ready(function(){
		$.ajax({
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'getCartProduct',  
			data:{"data":"data"},
			 success:function(result){
				 $('#modalbody').html('');
				 $.each(result,function(index,item){
					 console.log(result)
					 
					  let htmlVar = '<div class="card shadow  mb-2 bg-white rounded">'+
		              '<div class="row no-gutters">'+
	                   '<div class="col-sm-3" style="border-right: 2px solid blue;">'+
	                       '<img class="card-img-top img-fluid my-2"  src="../productimages/'+item.itemPhoto+'" alt="Suresh Dasari Card" style="height: 100px; width: 200px;">'+
	                   '</div>'+
	                  '<div class="col-sm-9">'+
	                       '<div class="card-body" style="height: 80px">'+
	                           '<h6 class="card-title">'+item.itemName+'</h6>'+
	                   
	                       '</div>'+
	                      '<div class="card-footer" style="border: 0;">'+
	                           '<div class="text-right">'+
	                           '<a class="btn btn-outline-info mx-2 text-dark" onclick="removeProduct('+item.itemId+')">Remove</a>'+
	                               '<a class="btn btn-outline-info mx-2 text-dark" onclick="viewProduct('+item.itemId+')">View Product</a>'+
	                           '</div>'+
	                       '</div>'+
	                  ' </div>'+
	               '</div>'+
	           '</div>'
				;
				$("#modalbody").append(htmlVar); 
					 
				 })
			 },
			 error: function(xhr, status, error) {
				 $("#modalbody").append('<h1>Cart is Empty </h1>'); 
			   }
		
	});
	});

	
	function viewProduct(pid){
		console.log
		
		var url = new URL("http://localhost:8081/viewproduct?product_id=");
		url.searchParams.set('product_id',pid);
		
		window.location.href=url;
		
	}
	
	
	function removeProduct(pid){
		let prodId={
				"pid":pid
			}
		$.ajax({	
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'removeproduct',  
			 data:JSON.stringify(prodId),
			 success:function(result){
				 $('#modalbody').html('');
				 $.each(result,function(index,item){
					 console.log(result)
					 
					  let htmlVar = '<div class="card shadow  mb-2 bg-white rounded">'+
		              '<div class="row no-gutters">'+
	                   '<div class="col-sm-3" style="border-right: 2px solid blue;">'+
	                       '<img class="card-img-top img-fluid my-2"  src="../productimages/'+item.itemPhoto+'" alt="Suresh Dasari Card" style="height: 100px; width: 200px;">'+
	                   '</div>'+
	                  '<div class="col-sm-9">'+
	                       '<div class="card-body" style="height: 80px">'+
	                           '<h6 class="card-title">'+item.itemName+'</h6>'+
	                          
	                       '</div>'+
	                      '<div class="card-footer" style="border: 0;">'+
	                           '<div class="text-right">'+
	                           '<a class="btn btn-outline-info mx-2 text-dark" onclick="removeProduct('+item.itemId+')">Remove</a>'+
	                               '<a class="btn btn-outline-info mx-2 text-dark" onclick="viewProduct('+item.itemId+')">View Product</a>'+
	                           '</div>'+
	                       '</div>'+
	                  ' </div>'+
	               '</div>'+
	           '</div>'
				;
				$("#modalbody").append(htmlVar); 
					 
				 })
			 },
			 error: function(xhr, status, error) {
				 window.location.replace("http://localhost:8081/login")
			   },			
		});
		
	}
	

	function addToCart(pid){
		let prodId={
			"pid":pid
		}
		$.ajax({	
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'proudctId',  
			 data:JSON.stringify(prodId),

			 success:function(result){
					 $('#modalbody').html('');
				 $.each(result,function(index,item){
					 console.log(result)
					 
					  let htmlVar = '<div class="card shadow  mb-2 bg-white rounded">'+
		              '<div class="row no-gutters">'+
	                   '<div class="col-sm-3" style="border-right: 2px solid blue;">'+
	                       '<img class="card-img-top img-fluid my-2"  src="../productimages/'+item.itemPhoto+'" alt="Suresh Dasari Card" style="height: 100px; width: 200px;">'+
	                   '</div>'+
	                  '<div class="col-sm-9">'+
	                       '<div class="card-body" style="height: 80px">'+
	                           '<h6 class="card-title">'+item.itemName+'</h6>'+
	                          
	                       '</div>'+
	                      '<div class="card-footer" style="border: 0;">'+
	                           '<div class="text-right">'+
	                           '<a class="btn btn-outline-info mx-2 text-dark" onclick="removeProduct('+item.itemId+')">Remove</a>'+
	                               '<a class="btn btn-outline-info mx-2 text-dark" onclick="viewProduct('+item.itemId+')">View Product</a>'+
	                           '</div>'+
	                       '</div>'+
	                  ' </div>'+
	               '</div>'+
	           '</div>'
				;
				$("#modalbody").append(htmlVar); 
					 
				 })
			 },
			 error: function(xhr, status, error) {
				 window.location.replace("http://localhost:8081/login")
			   },			
		});
	}


function searchProduct(){
	
	
	document.getElementById("search-form").addEventListener("click", function(event){
		  event.preventDefault()
		});
	
	let prodname=$('#input-search').val();	
	let searchval={
	"productName":prodname
	}
	$.ajax({
		type:"POST",
		contentType : 'application/json; charset=utf-8',
		 dataType : 'json',
		url:'search',  
		 data:JSON.stringify(searchval),
		 success:function(result){
			 console.log(result);
			 $('#product-container').html('');
			 $.each(result,function(index,item){
				 let htmlVar ='<div class="card shadow  mb-2 bg-white rounded h-8">'+
					'<div class="row no-gutters">'+
					'<div class="col-sm-3" style="border-right: 2px solid blue;">'+
						'<img class="card-img-top img-fluid my-2" src="../productimages/'+item.itemPhoto+'" alt="Suresh Dasari Card" style="height: 200px; width: 350px;"/>'+
					'</div>'+
				'<div class="col-sm-9">'+
						'<div class="card-body" style="height: 180px">'+
							'<h5 class="card-title">'+item.itemName+'</h5>'+
							'<p class="card-text">'+item.itemDescription+'</p>'+
					'</div>'+
						'<div class="card-footer" style="border: 0;">'+

						'<div class="text-right">'+
						'<a class="btn btn-outline-warning text-dark" onclick="addToCart('+item.itemId+')">Add to Cart</a>'+
                        '<a class="btn btn-outline-info mx-2 text-dark" onclick="viewProduct('+item.itemId+')">View Product</a>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'
			;
				 $('#product-container').append(htmlVar);
			 })	 
		 },
		 error: function(xhr, status, error) {
			console.log(error)
			
		   },	
	})
	
}		

/* 
       function buyProduct(pid){
    	   let prodid={
    			   "productId":pid
    	   }
    	   
    		$.ajax({
    			type:"POST",
    			contentType : 'application/json; charset=utf-8',
    			 dataType : 'json',
    			url:'buyproduct',  
    			 data:JSON.stringify(prodid),
    			 success:function(result){
    				 if(result.statusCode==200){
    					 swal("Order Placed Succesfully click OK to Track your order")
    					 .then((value)=>{
    						 window.location="http://localhost:8081/customer/order";
    					 })
    				 }
    				 else{
    					 
    				 }
    			 
    			 },
    			 error: function(xhr, status, error) {
    				console.log(error)
    				
    			   },	
    		})
    	   
    	   
    	   
       }
 */
</script>

</body>

</html>