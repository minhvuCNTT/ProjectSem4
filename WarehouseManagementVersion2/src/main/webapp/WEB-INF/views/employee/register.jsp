<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<mt:template title="Edit employee">
	<jsp:attribute name="content">
	
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          
					<!-- /.col -->
         
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
   <section class="content">
           <style type="text/css">
				.error {
					color: red;
				}
			</style>
              <!-- form start -->
    <div class="register-box" style="margin: auto !important">
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<b class="h1">Add</b>
			</div>
			<div class="card-body">

				<s:form
					action="${pageContext.request.contextPath }/employee/register"
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
								value="Add">
						</div>
						<!-- /.col -->
					</div>
				</s:form>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
    </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>