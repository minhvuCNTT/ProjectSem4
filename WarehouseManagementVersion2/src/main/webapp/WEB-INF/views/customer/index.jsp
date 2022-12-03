<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="st"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template title="Customer">
	<jsp:attribute name="content">
	<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">List Customer</h3	>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/invoice/addItemExport">Add Export</a></li>
              <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath }/customer/add">Add customer</a></li>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<!-- Content Header (Page header) -->
  
    <!-- /.content-header -->
    <br>
    <section class="content">

      <!-- Default box -->
      <div class="card">
      
        <div class="card-header">
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
          <form method="get"
						action="${pageContext.request.contextPath }/product/searchByName">
				<div class="input-group input-group-lg" style="width: 70%">
                	<input type="search" name="name"
								class="form-control form-control-lg" placeholder="Product name">
						<div class="input-group-append">
                                    <button type="submit"
									class="btn btn-lg btn-default">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            </form>
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered">
              <thead>
                  <tr>
                      <th >
                         Id
                      </th>
                      <th >
                          Customer name
                      </th>
                      <th >
                          Phone 
                      </th>
                      <th>
                          Address
                      </th>
                      <th >
                          Email
                      </th>
                      <th  class="text-center">
                      	Action
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="customer" items="${customers}">
                  <tr>
                      <td>
                          ${customer.id }
                      </td>
                      <td>
                          <a>
                              ${customer.fullName }
                          </a>
                          
                      </td>
                       <td >
                          ${customer.phone }
                      </td>
                       <td >
                          ${customer.address }
                      </td>
                      <td >
                          ${customer.email }
                      </td>
                      
                      <td class="project-actions text-right text-center">
                          <a class="btn btn-primary btn-sm" href="${pagecontext.request.contextPath }/customer/details/${customer.id}">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          
                          <a class="btn btn-info btn-sm" href="${pagecontext.request.contextPath }/customer/edit/${customer.id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                           
                          <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')" href="${pagecontext.request.contextPath }/customer/delete/${customer.id}">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                         
                      </td>
                  </tr>
                  </c:forEach>
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->

    <!-- Main content -->
    
    
    
    
    
    <!-- /.content -->
    </jsp:attribute>
</mt:template>