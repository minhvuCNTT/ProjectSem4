<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:template title="Update Info">
	<jsp:attribute name="content">
	 <style type="text/css">
				.error {
					color: red;
				}
	</style>
	<br>
    <!-- Main content -->
    <section class="content">
        <div class="col-md-7" style="left: 20%">
                <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Update Infor</h3>
              </div>
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
										src="${pageContext.request.contextPath }/resources/assets/uploads/${sessionScope.account.photo}"
										alt="User profile picture">
										<p class="text-muted text-center">${msg }</p>
                </div>
				<br>
			
                 <s:form class="form-horizontal" modelAttribute="account" method="post"
                 		enctype="multipart/form-data" action="${pageContext.request.contextPath }/account/updateInfo">
                      
                      <div class="form-group row">
                        <label for="fullName"
											class="col-sm-2 col-form-label">Fullname</label>
						
                        <div class="col-sm-10">
                          <s:input type="text" class="form-control"
												id="fullName" placeholder="FullName" 
												path="fullName"/>
												<s:errors path="fullName" cssClass="error"></s:errors>
                        </div>
                      </div>
                      <br>
                      <div class="form-group row">
                        <label for="phone"
											class="col-sm-2 col-form-label">Phone</label>
                        <div class="col-sm-10">
                          <s:input type="text" class="form-control"
												id="phone" placeholder="Phone"
												path="phone"/>
												<s:errors path="phone" cssClass="error"></s:errors>
                        </div>
                      </div>
                      <br>
                      <div class="form-group row">
                        <label for="email"
											class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <s:input type="text" class="form-control"
												id="email" placeholder="Email"
												path="email"/>
												<s:errors path="email" cssClass="error"></s:errors>
                        </div>
                      </div>
                      <br>
                      <div class="form-group row">
                        <label for="dob"
											class="col-sm-2 col-form-label">Birthday</label>
                        <div class="col-sm-10">
                          <s:input class="form-control"
												id="dob" placeholder="Birthday" autocomplete="off"
												path="dob"/>
												<s:errors path="dob" cssClass="error"></s:errors>
                        </div>
                      </div>
                      <br>
                      <div class="form-group row">
                        <label for="exampleInputFile"
											class="col-sm-2 col-form-label">New Photo</label>
                        <div class="col-sm-10">
                          <div class="custom-file">
                        <input type="file" class="custom-file-input"
									id="exampleInputFile" name="file">
                        <label class="custom-file-label"
									for="exampleInputFile">Choose file</label>
                      </div>
                        </div>
                      </div>
                      
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-danger">Save</button>
                        </div>
                      </div>
                      <s:hidden path="id"/>
                      <s:hidden path="username"/>
                      <s:hidden path="password"/>
                      <s:hidden path="role"/>
                      <s:hidden path="status"/>
                    </s:form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
          </div>
          <!-- /.col -->

			<!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>