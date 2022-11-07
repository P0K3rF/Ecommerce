<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Registration</title>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	 <div class="container py-5 ">
		<div class="col-md-5 offset-md-3">
			<div class="card">
				<div class="card-header text-center bg-primary">
					<h2>Registration Page</h2>
				</div>
				<div class="card-body">
					<form:form action="/customer/register" method="post" id="reg-form"
						modelAttribute="customerDto">

						<div class="form-group">
							<label for="email" style="margin-top: 5%">Email:<span
								style="color: red; padding-left: 5px">*</span></label>  <input
								type="text" class="form-control" id="useremail"
								placeholder="Enter email" name="email">
								<%-- <form:input cssClass="form-control" path="email"/> --%>
							<form:errors path="email" cssClass="error" />
						</div>

						<div class="form-group">
							<label for="firstname" style="margin-top: 5%">Name:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="firstName"
								placeholder="Enter your First Name" name="firstName"
								required="required">
							<form:errors path="firstName" cssClass="error" />
						</div>

						<div class="form-group">
							<label for="lastName" style="margin-top: 5%">Name:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="lastName"
								placeholder="Enter your Last Name" name="lastName"
								required="required">
							<form:errors path="lastName" cssClass="error" />
						</div>
						
							<div class="form-group">
							<label for="mobile" style="margin-top: 5%">Mobile No:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="mobile"
								placeholder="Enter mobile no" name="mobileNo"
								required="required">
								<form:errors path="mobileNo" cssClass="error" />
						</div>
						
						<div class="form-group">
							<label for="address" style="margin-top: 5%">Address:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="address"
								placeholder="Enter your home address " name="address"
								required="required">
								<form:errors path="address" cssClass="error" />
						</div>
						
						
						<div class="form-group">
							<label for="userpassword" style="margin-top: 5%">Password:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="password" class="form-control" id="userpassword"
								placeholder="Enter password" name="password" required="required">
								<form:errors path="password" cssClass="error" />
						</div>
						<span></span>
						<div class="container text-center py-3">
							<button type="submit" class="btn btn-default bg-primary ">Submit</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div> 
	
	
	
<%-- 	<form:form action="/customer/register" method="POST" modelAttribute="customerDto">
	Email :<form:input path="email"/><br><br>
	<form:errors path="email" cssClass="error" /><br><br>
	First Name :<form:input path="firstName"/><br><br>
	Last :<form:input path="lastName"/><br><br>
	Mobile :<form:input path="MobileNo"/><br><br>
	Address :<form:input path="address"/><br><br>
	Password :<form:input path="password"/><br><br>
	<input type="submit">
	
	
	</form:form> --%>
</body>
</html>