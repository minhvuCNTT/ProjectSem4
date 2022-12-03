	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<mt:template title="Edit product">
	<jsp:attribute name="content">
	<!-- Content Header (Page header) -->
	<section class="content">
           <style type="text/css">
				.error {
					color: red;
				}
			</style>
    <!-- Main content -->
   <div class="row">
   <div class="col-md-7" style="left: 20%">
   <div class="card card-primary">
   	<div class="card-header">
   		<h3 class="card-title">Edit form</h3>
   	</div>
   
              <!-- form start -->
              <s:form
					action="${pageContext.request.contextPath }/supplier/edit"
					modelAttribute="supplier" method="post"
					enctype="multipart/form-data">
                <div class="card-body">
                  <div class="form-group">
                    <label for="id">Supplier ID</label>
                    <br>
                    <s:input class="form-control"
							id="id" path="id" readonly="true"/>
                  </div>
                  <div class="form-group">
                    <label for="name">Supplier Name</label>
                    <br>
                    <s:errors path="name" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="name" placeholder="Enter new product name" path="name" />
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
                  <div class="form-group">
                    <label for="unit">Business registration code</label>
                     <br>
                    <s:errors path="businessRegistration" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="businessRegistration" placeholder="Enter new businessRegistration" path="businessRegistration"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">New Logo</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input"
									id="exampleInputFile" name="file">
                        <label class="custom-file-label"
									for="exampleInputFile">Choose file</label>
                      </div>
                    </div>
                  </div>
                  </div>
                  <div class="card-footer">
                  <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure?')">Submit</button>
                </div>
              </s:form>
            <!-- /.card -->
            </div>
          </div>   
          </div> 
          </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>