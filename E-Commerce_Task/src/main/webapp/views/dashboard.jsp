<%@page import="com.concerto.ecommerce.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />

<%
List<Product> products = (List<Product>) request.getAttribute("products");
%>

</head>
<body>
	<div class="container-fluid my-3">

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#add-product-modal">Add Product</button>

		<!--Add Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="add_Post_form" action="AddPostServlet" method="POST"
							enctype="multipart/form-data">

							<br>
							<div class="form-group">
								Product Title : <input name="post_title" type="text"
									placeholder="Enter Post Title" class="form-control">
							</div>
							<br>
							<div class="form-group">
								Product Description :
								<textarea name="post_content"
									placeholder="Enter Product Description" class="form-control"
									style="height: 200px"></textarea>
							</div>
							<br>
							<div class="form-group">
								Product Price: <input type="text" name="post_code"
									placeholder="Enter Product Price" class="form-control" />
							</div>

							<div class="form-group">
								Product Quantity: <input type="number" name="post_code"
									placeholder="Enter Product Quantity" class="form-control" />
							</div>
							<br>
							<div class="form-group">

								<label id="1st" class="btn custom-input-btn" style="color: blue">
									<i class="fa fa-cloud-upload" style="color: blue"></i> <input
									type="file" name="profile_pic" multiple>
								</label>

							</div>
							<br>
							<div class="container text-end">
								<button type="submit" class="btn btn-outline-dark btn-lg">Add
									Product</button>
							</div>

						</form>


					</div>

				</div>
			</div>
		</div>


		<table class="table table-primary table-hover my-3 table-bordered"  style="border-color:black;">
			<thead>
				<tr class="text-center">
					<th scope="col">Table Id</th>
					<th scope="col">Product Id</th>
					<th scope="col">Title</th>
					<th scope="col">Description</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Image</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
				int count = 1;
				for (Product p : products) {
				%>
				<tr>
					<th scope="row" ><%=count%></th>
					<td><%=p.getItemId()%></td>
					<td><%=p.getItemName()%></td>
					<td><%=p.getItemDescription()%></td>
					<td><%=p.getItemPrice()%></td>
					<td><%=p.getItemQuantity()%></td>
					
					<td ><img
						src="../productimages/<%=p.getItemPhoto()%>" style="height: 60px" width="60px"
						class="img-fluid img-thumbnail" alt="Sheep"></td>
						<td><button type="button" class="btn btn-success" 
						data-bs-toggle="modal" data-bs-target="#update-product-modal"
						onclick="updateProduct(<%=p.getItemId()%>)">Update</button></td>
						<td><button type="button" class="btn btn-danger" onclick="deleteProduct(<%=p.getItemId()%>)">Delete</button></td>
				</tr> 



				<%
				count++;
				}
				%>
			</tbody>
		</table>
		
		
		<!-- Update Modal -->
		<div class="modal fade" id="update-product-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Update Product</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="modal-body">
						<form id="update_Post_form" action="updateproduct" method="POST"
							enctype="multipart/form-data">

							<br>
							<div class="form-group">
								Product Title : <input name="title" id="title" type="text"
									placeholder="Enter Post Title" class="form-control" >
							</div>
							<br>
							<div class="form-group">
								Product Description :
								<textarea name="description" id="description"
									placeholder="Enter Product Description"  class="form-control"
									style="height: 200px"></textarea>
							</div>
							<br>
							<div class="form-group">
								Product Price: <input type="text" name="price" id="price"
									placeholder="Enter Product Price" class="form-control" />
							</div>

							<div class="form-group">
								Product Quantity: <input type="number" name="quantity" id="quantity"
									placeholder="Enter Product Quantity" class="form-control" />
							</div>
							<br>
							<div class="form-group" id="itemImage" style="border: 2px solid black;display: inline-block;">
							</div>
							<div class="form-group">

								<label id="1st" class="btn custom-input-btn" style="color: blue" onchange="changepro(event)">
									<i class="fa fa-cloud-upload" style="color: blue"></i> <input
									type="file" name="itemImage" multiple>
								</label>
								

							</div>
							<br>
							<div class="container text-end">
								<button type="submit" class="btn btn-outline-dark btn-lg">Update
									Product</button>
							</div>

						</form>


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
	
	function updateProduct(pid){
		let prodId={
				"productId":pid
		}
		
		$.ajax({
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'getproductbyid',  
			 data:JSON.stringify(prodId),
			 success:function(result){
				 $('#title').val(result.t.itemName)
				 $('#description').val(result.t.itemDescription)
				 $('#price').val(result.t.itemPrice)
				 $('#quantity').val(result.t.itemQuantity)
				 
			let htmlvar='<img src="../productimages/'+result.t.itemPhoto+'" id="output" class="img-fluid" style="border-radius: 50%; height: 155px; width: 150px" /><br>'
				 
				 $('#itemImage').html(htmlvar)
			 },
			 error(xhr, status, error){
				 console.log(error)
			 },
			
		});
	
	}
	var changepro = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};
	
	function deleteProduct(pid){
		console.log("Delete button clicked for product id " +pid)
	}
	
	</script>
	
</body>
</html>