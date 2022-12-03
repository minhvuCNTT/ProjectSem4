<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:template title="Category">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
 <section class="content">
				<style type="text/css">
				.error {
					color: red;
				}
			</style>
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">List Category </h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/product/add">Add Product</a></li>
            </ol>
          </div>
          
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
			<div class="row">	
          <div class="col-12">
            <div class="card">
              <div class="card-header">
              	<span style="color: red">${error }</span>
                <div class="card-tools" >
        <form  method="get"
						action="${pageContext.request.contextPath }/category/searchByName">
                    <input type="text" name="table_search"
										class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default" style="left: 84%">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                    </form>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="row">
             
              <div class="col-6">
              
              <div class="card-body table-responsive p-0">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>Category ID</th>
                      <th>Category Name</th>
                      <th class="text-center">
                      	Actions
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="category" items="${categories }">
                    <tr>
                      <td>${category.id }</td>
                      <td>${category.name }</td> 
                      <td>
                      <div class="row">
                      	<div class="col-6">
                      <a href="${pagecontext.request.contextPath }/category/index?edit=true&id=${category.id}">
                      	<button type="button" class="btn btn-block btn-warning">Edit</button> 
                      	 </a>
                      	 </div>
                      	 <div class="col-6">
                      	 <a onclick="return confirm('Are you sure?')"
                      	 	href="${pagecontext.request.contextPath }/category/delete/${category.id}">
                      <button type="button" 
                      		class="btn btn-block btn-danger">Delete</button> 
                      	 </a>
                      </div>
                      </div>
                     
                      </td>          
                    </tr>   
                    </c:forEach>                 
                  </tbody>
                </table>
              </div>
              </div>
              <div class="col-6">
								<div>
             <div class="card card-secondary">
              <div class="card-header">
              <h3 class="card-title">Edit form</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool"
													data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <s:form method="post" modelAttribute="category2"
											action="${pageContext.request.contextPath }/category/edit">
            <div class="card-body">
              
                <label for="inputName">Category ID</label>
                
												<br />
                <div class="row">
                
                 <div class="col-3">
                <s:input type="text" id="inputName" path="id"
					 class="form-control" readonly="true" />              
				</div>

                 <div class="col-8">
               <s:input path="name" class="form-control" required="required"
					id="exampleInputName"
					placeholder="Enter new category name" />
              </div>
              
				<span style="color: red">${editerr }</span>
            </div>

        
										</div>
       
         	        <c:if test="${msg }">
        <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
         	                  </c:if>
                </s:form>
      </div> 
                  
      
      <s:form method="post" modelAttribute="category"
										action="${pageContext.request.contextPath }/category/save">
											
			<div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">Add Form</h3>
              <div class="card-tools">
                <button type="button" class="btn btn-tool"
														data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
             
                  <div class="form-group">
                    <label for="exampleInputName">Category name</label>
                    <s:input path="name" class="form-control"
														id="exampleInputName"
														placeholder="Enter new category name"
														required="required"/>
                  </div>
                   <span style="color: red">${adderr }</span>
                </div>
               
            <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div> 
            </s:form>
          </div> 	
              </div>
              </div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        <!-- /.container-fluid -->
        </div>
    <!-- /.content-header -->
    </section>
    </jsp:attribute>
</mt:template>