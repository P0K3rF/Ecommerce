<%@page import="com.concerto.ecommerce.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<title>Insert title here</title> 
<% 
List <Product> products = (List<Product>) request.getAttribute("products"); 
int Pagecount= (Integer) request.getAttribute("count");
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
</style>
</head>

<body>




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
		for(int i=0;i<Pagecount;i++){
			%>
			
		<a onclick="changeActiveness(<%=i%>,this)" class="link-active"><%=i+1%></a>
		
		<%	
		}
		%>
</div>
<script>
function changeActiveness(pageno,temp){
	window.location.href='http://localhost:8081/admin/testdashboard?page='+pageno;
}


</script>
</body>
</html>