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
<title>Login Page</title>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
${msg}
	<div class="container py-5 ">
		<div class="col-md-5 offset-md-3">
			<div class="card">
				<div class="card-header text-center bg-danger">
					<h2>Login Page</h2>
				</div>
				<div class="card-body">
					<form:form action="login" method="post" id="log-form" modelAttribute="loginCredentialDto">
						<div class="form-group">
							<label for="email" style="margin-top: 5%">Email:<span
								style="color: red; padding-left: 5px">*</span></label>  <input
								type="text" class="form-control" id="useremail"
								placeholder="Enter email" name="email">
								<%-- <form:input cssClass="form-control" path="email"/> --%>
							<form:errors path="email" cssClass="error" />
						</div>
						<div class="form-group">
							<label for="userpassword" style="margin-top: 5%">Password:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="password" class="form-control" id="userpassword"
								placeholder="Enter password" name="password" >
									<form:errors path="password" cssClass="error" />
						</div>
						<span></span>
						<div class="container text-center py-3">
							<button type="submit" class="btn btn-default bg-danger">Submit</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>