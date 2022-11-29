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
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />

<%
List<Product> products = (List<Product>) request.getAttribute("products");
int Pagecount = (Integer) request.getAttribute("count");
%>



<style>
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
.error{
color:red;
}
</style>


</head>
<body>
	<div class="container-fluid my-3">
		<!-- Button trigger modal -->
		<div style="display: inline;">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#add-product-modal">Add Product</button>
			<form id="upload-file" method="POST" action="uploadfile"
				enctype="multipart/form-data" style="display: inline">
				<button type="submit" class="btn btn-warning mx-4">Upload
					Excel File</button>
				<input type="file" name="file" required="required">
				<em class="fa fa-refresh fa-2x fa-spin" id="loader" style="display: none;"></em>
			</form>
		</div>
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
						<form id="addProduct" action="addproductasd" method="POST"
							enctype="multipart/form-data">

							<br>
							<div class="form-group">
								Product Title : <input name="itemName" id="itemName" type="text"
									placeholder="Enter Post Title" class="form-control" required="required">
									<p id="itemNameError" style="display: none;" class="error"></p>
							</div>
							<br>
							<div class="form-group">
								Product Description :
								<textarea name="itemDescription" id="itemDescription"
									placeholder="Enter Product Description" class="form-control"
									style="height: 200px" required="required"></textarea>
									<p id="itemDescriptionError" style="display: none;" class="error"></p>
							</div>
							<br>
							<div class="form-group">
								Product Price: <input type="text" name="itemPrice" id="price"
									placeholder="Enter Product Price" class="form-control" required="required"/>
							<p id="itemPriceError" style="display: none;" class="error"></p>
							</div>

							<div class="form-group">
								Product Quantity: <input type="number" name="itemQuantity" id="itemQuantity"
									placeholder="Enter Product Quantity" class="form-control" required="required"/>
							<p id="itemQuantityError" style="display: none;" class="error"></p>
							</div>
							<br>
							<div class="form-group">

								<label id="1st" class="btn custom-input-btn" style="color: blue">
									<em class="fa fa-cloud-upload" style="color: blue"></em> <input
									type="file" name="image" multiple required="required">
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


		<table class="table table-primary table-hover my-3 table-bordered"
			style="border-color: black;" aria-describedby="mydesc">
			<thead>
				<tr class="text-center">
					
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
				
				for (Product p : products) {
				%>
				<tr>
					
					<td><%=p.getItemId()%></td>
					<td><%=p.getItemName()%></td>
					<td><%=p.getItemDescription()%></td>
					<td><%=p.getItemPrice()%></td>
					<td><%=p.getItemQuantity()%></td>

					<td><img src="../productimages/<%=p.getItemPhoto()%>"
						style="height: 60px" width="60px" class="img-fluid img-thumbnail"
						alt="Sheep"></td>
					<td><button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#update-product-modal"
							onclick="getUpdateData(<%=p.getItemId()%>)">Update</button></td>
					<td><button type="button" class="btn btn-danger"
							onclick="deleteProduct(<%=p.getItemId()%>)">Delete</button></td>
				</tr>



				<%
				
				}
				%>
			</tbody>
		</table>
		<div class="pagination">

			<%
			for (int i = 0; i < Pagecount; i++) {
			%>

			<a onclick="changeActiveness(<%=i%>,this)" class="link-active"><%=i + 1%></a>

			<%
			}
			%>
		</div>

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
						<form id="update_Post_form" action="updateproductasd"
							method="POST" enctype="multipart/form-data">

							<br>
							<div class="form-group">
								Product Title : <input name="itemName" id="title" type="text"
									placeholder="Enter Post Title" class="form-control" required="required">
							</div>
							<br>
							<div class="form-group">
								Product Description :
								<textarea name="itemDescription" id="description"
									placeholder="Enter Product Description" class="form-control"
									style="height: 200px" required="required"></textarea>
							</div>
							<br>
							<div class="form-group">
								Product Price: <input type="text" name="itemPrice" id="updatePrice"
									placeholder="Enter Product Price" class="form-control" required="required"/>
							<p id="itemUpdatePriceError" style="display: none;" class="error"></p>
							</div>

							<div class="form-group">
								Product Quantity: <input type="number" name="itemQuantity"
									id="quantity" placeholder="Enter Product Quantity"
									class="form-control" required="required"/>
									<p id="itemQuantityError" style="display: none;" class="error"></p>
							</div>
							<br>
							<div class="form-group" id="itemImage"
								style="border: 2px solid black; display: inline-block;"></div>
							<div class="form-group">

								<label id="1st" class="btn custom-input-btn" style="color: blue"
									onchange="changepro(event)"> <em
									class="fa fa-cloud-upload" style="color: blue"></em> <input
									type="file" id="file" name="image" multiple >
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
	
	function changeActiveness(pageno,temp){
		window.location.href="http://localhost:8081/admin/dashboard?page="+pageno;
	}


	
	
	$('#upload-file').on('submit',function(event){
		event.preventDefault();
		$("#loader").show();
	   let form=new FormData(this);   
	   console.log("event handle")
	   
	 	$.ajax({
			url : "excelUpload",
			type : "POST",
			data : form,
			success : function(data, textStatus, jqXHR) {
				if(data.statusCode==200){
				 $("#loader").hide();
				swal("Uploaded Data successfully Clic ok to refresh")
				 .then((value)=>{
					 location.reload()
				 })
				}else if(data.statusCode==500){
					swal("Something went wrong on the server side please retry once!")
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(errorThrown)
			},
			processData : false,
			contentType : false
		})  
	})
	
	
	
	var productId="";
	
 	function getUpdateData(pid){
		console.log(pid)
		productId=pid;
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
				 if(result.statusCode==200){
					 console.log(result)
				 $('#title').val(result.t.itemName)
				 $('#description').val(result.t.itemDescription)
				 $('#updatePrice').val(result.t.itemPrice)
				 $('#quantity').val(result.t.itemQuantity)
			let htmlvar='<img src="../productimages/'+result.t.itemPhoto+'" id="output" class="img-fluid" style="height: 155px; width: 150px" /><br>'
				 $('#itemImage').html(htmlvar)
				 }else if(result.statusCode==400){
					 swal("No Product found with the given id")
				 }
			 },
			 error:function(xhr, status, error){
				 console.log(error)
			 },
			
		});
	
	} 

		
		$('#addProduct').on('submit',function(event){
			event.preventDefault();
			if(checkAddValidation()){
           let form=new FormData(this);   
           console.log("event handle")
		 	$.ajax({
				url : "addproduct",
				type : "POST",
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log()
					swal("Added Succesfully")
					 .then((value)=>{
						 location.reload()
					 })
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(errorThrown)
				},
				processData : false,
				contentType : false
			}) 
			}
	})
	
		$('#update_Post_form').on('submit',function(event){
			event.preventDefault();
			if(checkUpdateValidation()){
           let form=new FormData(this);   
           form.set("itemId",productId)
		 	$.ajax({
				url : "updateproduct",
				type : "POST",
				data : form,
				success : function(data, textStatus, jqXHR) {
					swal("Updated Succesfully")
					 .then((value)=>{
						 location.reload()
					 })
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(errorThrown)
				},
				processData : false,
				contentType : false
			})  
			}
	})
	var changepro = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};
	
	function deleteProduct(pid){
		let prodId={
				"productId":pid
		}
		
		$.ajax({
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'deleteproductbyid',  
			 data:JSON.stringify(prodId),
			 success:function(result){
				 if(result.statusCode==200){
					 swal("Deleted Succesfully")
					 .then((value)=>{
						 location.reload()
					 })
				 }
				 else{
					 
				 }
			 },
			 error(xhr, status, error){
				 console.log(error)
			 },
				
		});
	}
	
	

	function checkAddValidation(){
		let hasError=true
		let itemPrice=$('#price').val()

		if(!checkItemQuantity(itemPrice)){
			$('#itemPriceError').show()
			$('#itemPriceError').html('Price should be in number only')
			hasError=false
		}else{
			hasError=true
			$('#itemPriceError').hide()
		}
		
		return hasError
		
		
	}
	
	function checkUpdateValidation(){
		let hasError=true
		let itemPrice=$('#updatePrice').val()

		if(!checkItemQuantity(itemPrice)){
			$('#itemUpdatePriceError').show()
			$('#itemUpdatePriceError').html('Price should be in number only')
			hasError=false
		}else{
			hasError=true
			$('#itemUpdatePriceError').hide()
		}
		
		return hasError
		
		
	}
	
	function checkItemQuantity(price) {
		var regx = /^-?\d+\.?\d*$/;
		return regx.test(price);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>

</body>
</html>