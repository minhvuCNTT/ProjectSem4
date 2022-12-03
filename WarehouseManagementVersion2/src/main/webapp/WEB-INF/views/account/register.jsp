<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">


</head>
<body class="hold-transition register-page">
	<style type="text/css">
		.error {
			color: red;
		}
	</style>
	<div class="register-box">
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<b class="h1">Register</b>
			</div>
			<div class="card-body">

				<s:form
					action="${pageContext.request.contextPath }/account/register"
					modelAttribute="account" method="post"
					enctype="multipart/form-data">
					<s:errors path="username" cssClass="error"></s:errors>
					<div class="input-group mb-3">
						
						<s:input type="text" class="form-control" placeholder="Username"
							path="username" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					
					<s:errors path="password" cssClass="error"></s:errors>
					<div class="input-group mb-3">
						<s:input type="password" class="form-control"
							placeholder="Password" path="password" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					
					<span style="color: red">${msg }</span>
					<div class="input-group mb-3">
						 <input type="password"
							class="form-control" name="retypePassword"
							placeholder="Retype password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					
					<s:errors path="fullName" cssClass="error"></s:errors>
					<div class="input-group mb-3">
						<s:input type="text" class="form-control" placeholder="Full name"
							path="fullName" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					
					<s:errors path="email" cssClass="error"></s:errors>
					<div class="input-group mb-3">
						<s:input type="email" class="form-control" placeholder="Email"
							path="email" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<s:errors path="dob" cssClass="error"></s:errors>
					<div class="input-group mb-3">
						<s:input type="text" class="form-control"
							placeholder="Date of birth (dd/MM/yyyy)" id="dob" path="dob" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-calendar"></span>
							</div>
						</div>
					</div>
					
					<s:errors path="phone" cssClass="error"></s:errors>
					<div class="input-group mb-3">
						<s:input type="text" class="form-control"
							placeholder="Phone Number" path="phone" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-phone"></span>
							</div>
						</div>
					</div>
					
					<div class="input-group mb-3">
						<!-- <label for="customFile">Custom File</label> -->
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="customFile"
								name="file"> <label class="custom-file-label"
								for="customFile"></label>
						</div>
					</div>
					<div class="row">
						<!-- /.col -->
						<div class="col-12">
							<input type="submit" class="btn btn-primary btn-block"
								value="Register">
						</div>
						<!-- /.col -->
					</div>
				</s:form>


				<a href="${pageContext.request.contextPath }/account/login"
					class="text-center">I already have a membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/adminlte.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#dob").datepicker({
				dateFormat : 'dd/mm/yy'
			});
		});

		$(function() {
			bsCustomFileInput.init();
		});
	</script>
</body>
</html>
