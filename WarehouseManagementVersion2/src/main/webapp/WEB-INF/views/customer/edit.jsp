<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<mt:template title="Edit customer">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
  <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray;">Add New Supplier</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/customer/index">Customer</a></li>
              <li class="breadcrumb-item active"><a
								href="${pageContext.request.contextPath }/customer/add">Add</a></li>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->	
    <div class="col-md-7" style="left: 20%">  
  <div class="card card-primary col-10"> 
   <div class="card card-header ">
   <h3 class="card-title">Edit form</h3>
   </div>
   
           <style type="text/css">
				.error {
					color: red;
				}
			</style>
              <!-- form start -->
              <div class="card-body p-0">
          
        </div>
              <s:form
					action="${pageContext.request.contextPath }/customer/edit"
					modelAttribute="customer" method="post"
					enctype="multipart/form-data">
                <div class="card-body">
                  <div class="form-group">
                    <label for="name">Customer ID</label>
                    <br>
                    <s:input class="form-control"
							id="id" path="id" readonly="true"/>
                  </div>
                  <div class="form-group">
                    <label for="fullName">Customer Name</label>
                    <br>
                    <s:errors path="fullName" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="fullName" placeholder="Enter new Customer name" path="fullName" />
                  </div>
                  
                  <div class="form-group">
                    <label for="address">Address</label>
                    <br>
                    <s:errors path="address" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="address" placeholder="Enter new address" path="address"/>
                  </div>
                  
                  <div class="form-group">
                    <label for="phone">Phone</label>
                    <br>
                    <s:errors path="phone" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="phone" placeholder="Enter new Phone" path="phone"/>
                  </div>
                  
                  <div class="form-group">
                    <label for="email">	Email</label>
                     <br>
                    <s:errors path="email" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="email" placeholder="Enter new email" path="email" />
                  </div>
                  </div>
                  <div class="card-footer">
                  <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure?')">Submit</button>
                </div>
              </s:form>
            <!-- /.card -->
            </div> 
          </div>   
          </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>