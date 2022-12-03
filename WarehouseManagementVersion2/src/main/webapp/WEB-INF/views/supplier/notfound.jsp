<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404 Error</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">
</head>
<body>
	<!-- Main content -->
	<section class="content">
		<div class="error-page">
			<h2 class="headline text-warning">404</h2>

			<div class="error-content">
				<h3>
					<i class="fas fa-exclamation-triangle text-warning"></i> Oops! Page
					Not Found
				</h3>

				<p>We could not find the page you were looking for. Meanwhile,
					you may return to dashboard or try using the search form.</p>
			</div>
		</div>
		<!-- /.error-page -->

	</section>
	<!-- /.content -->



	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>
</body>
</html>


