<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:template title="Add New Supplier">
	<jsp:attribute name="content">
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
<!-- Content Header (Page header) -->
<section class="content">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">Add New Supplier</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/supplier/index">List Supplier</a></li>
              <li class="breadcrumb-item active"><a
								href="${pageContext.request.contextPath }/invoice/addItemExport">Add Export</a></li>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="row">
		<div class="col-md-7" style="left: 20%">
                <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Form add</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <s:form enctype="multipart/form-data" method="post"
						modelAttribute="supplier"
						action="${pageContext.request.contextPath }/supplier/save">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputName">Supplier name</label>
                    <br>
                    <s:errors path="name" cssStyle="color: red"></s:errors>
                    <s:input path="name" class="form-control"
									id="exampleInputName" placeholder="Enter new Supplier name" />
                  </div>
                  <div class="form-group">
                    <label>Address</label>
                    <br>
                    <s:errors path="address" cssStyle="color: red"></s:errors>
                    <s:input path="address" class="form-control"
									placeholder="Address" />
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <br>
                    <s:errors path="email" cssStyle="color: red"></s:errors>
                    <s:input path="email" class="form-control"
									placeholder="Email" />
                  </div>
                  <div class="form-group">
                    <label>Business registration code</label>
                    <br>
                    <s:errors path="businessRegistration"
									cssStyle="color: red"></s:errors>
                    <s:input path="businessRegistration"
									class="form-control" placeholder="Business registration code" />
                  </div>
                  <div class="form-group">
                    <label>Phone</label>
                    <br>
                    <s:errors path="phone" cssStyle="color: red"></s:errors>
                    <s:input path="phone" class="form-control"
									placeholder="phone" />
                  </div>
                  <label>Logo</label>
                  <div class="input-group mb-3">
						<!-- <label for="customFile">Custom File</label> -->
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="customFile"
										name="file"> <label class="custom-file-label"
										for="customFile"></label>
						</div>
					</div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </div>
                
			</s:form>
            </div>

    <!-- Main content -->
   </div>
          <!-- /.col -->
          
        </div>
        <!-- /.row -->
</section>            
    <!-- /.content -->

    </jsp:attribute>
</mt:template>