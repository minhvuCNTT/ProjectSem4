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
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-5" style="left: 30%">
				
            <!-- Profile Image -->
            <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Change Password</h3>
              </div>
              <div class="card-body box-profile">
                 <form class="form-horizontal" method="post" 
                 	action="${pageContext.request.contextPath }/account/changePassword">
                      
                      <div class="form-group row">
                        <label for="oldPassword"
											class="col-sm-2 col-form-label">Old Password</label>
						
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="oldPassword" 
												id="oldPassword" placeholder="Old Password" 
												required="required">
												
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="newPassword"
											class="col-sm-2 col-form-label">New Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="newPassword"
												id="newPassword" placeholder="New Password"
												required="required">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="retypePassword" 
											class="col-sm-2 col-form-label">Retype Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="retypePassword"
												id="retypePassword" placeholder="Retype Password"
												required="required">
                        </div>
                      </div>
                     
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-danger">Save</button>
                        </div>
                      </div>
                      <p style="color: red;">${msg }</p>
                    </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
          </div>
          <!-- /.col -->
          
        </div>
        <!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>