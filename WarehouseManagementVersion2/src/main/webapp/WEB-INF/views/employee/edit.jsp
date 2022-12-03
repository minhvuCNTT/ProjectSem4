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
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">Edit Employee</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/employee/index">Employee</a></li>
              
            </ol>
          </div>
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
              <s:form
					action="${pageContext.request.contextPath }/employee/edit"
					modelAttribute="employee" method="post"
					enctype="multipart/form-data">
                <div class="card-body">
                  <div class="form-group">
                    <label for="username">Username</label>
                    <s:input class="form-control"
							id="username" placeholder="Enter email" path="username" readonly="true"/>
                  </div>
                   <div class="form-group">
                  
                    <label for="password">Password</label>
                    <br>
                    <s:errors path="password" cssClass="error"></s:errors>
                    <s:password class="form-control"
							id="password" path="password" value="*****" />
							
                  </div>
                  
                  <div class="form-group">
                  
                    <label for="fullname">Fullname</label>
                    <br>
                    <s:errors path="fullName" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="fullname" placeholder="Fullname" path="fullName"/>
                  </div>
                  <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <br>
                    <s:errors path="phone" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="phone" placeholder="Phone Number" path="phone"/>
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <br>
                    <s:errors path="email" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="email" placeholder="Email" path="email"/>
                  </div>
                  
                  <div class="form-group">
                    <label for="dob">Date of birth</label>
                     <br>
                    <s:errors path="dob" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="dob" placeholder="Date of birth" path="dob"/>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputFile">New Photo</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input"
									id="exampleInputFile" name="file">
                        <label class="custom-file-label"
									for="exampleInputFile">Choose file</label>
                      </div>
                    </div>
                  </div>
                  <div class="form-check">
                    <s:checkbox class="form-check-input"
							id="exampleCheck1" path="status"/>
                    <label class="form-check-label" for="exampleCheck1">Active</label>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Update</button>
                </div>
                <s:hidden path="id"/>
              </s:form>
            <!-- /.card -->
            </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>