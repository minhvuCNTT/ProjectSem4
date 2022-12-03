<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:template title="Add New Customer">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->

<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">List Supplier</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/customer/index">List customer</a></li>
              <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath }/invoice/addItemExport">Add Export</a></li>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
<br>
<section class="content">
<style type="text/css">
				.error {
					color: red;
				}
			</style>
		<div class="row">
		<div class="col-md-7" style="left: 20%">
                <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Form add</h3>
              </div>			
          
					<!-- /.col -->
       
                <s:form method="post" modelAttribute="customer"
				action="${pageContext.request.contextPath }/customer/save">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputName">Customer name</label>
                    <br>
                    <s:errors path="fullName" cssClass="error"></s:errors>
                    <s:input path="fullName" class="form-control"
							id="exampleInputName" placeholder="Enter new customer name" />
							<br>
                  </div>
                  <div class="form-group">
                    <label>Phone</label>
							<br>
                    <s:errors path="phone" cssClass="error"></s:errors>
                    <s:input path="phone" class="form-control"
							placeholder="Phone" />
							
                  </div>
                  <div class="form-group">
                    <label>Address</label>
                    <br>
                    <s:errors path="address" cssClass="error"></s:errors>
                    <s:input path="address" class="form-control"
							placeholder="Address" />
							
							
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <br>
                    <s:errors path="email" cssClass="error"></s:errors>
                    <s:input path="email" class="form-control"
							placeholder="Email" />
							
                  </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </s:form>
    <!-- Main content -->
   </div>

    <!-- Main content -->
   </div>
          <!-- /.col -->
          
        </div>
 </section>              
    <!-- /.content -->
    </jsp:attribute>
</mt:template>