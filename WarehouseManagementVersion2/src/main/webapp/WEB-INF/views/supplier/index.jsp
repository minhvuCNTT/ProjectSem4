<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="st"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template title="Supplier">
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
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/invoice/addItemImport">List Import</a></li>
              <st:authorize access="hasRole('ROLE_ADMIN')">
              <li class="breadcrumb-item active"><a
									href="${pageContext.request.contextPath }/supplier/add">Add</a></li>
              </st:authorize>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">	
          <div class="card-tools">
            <button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool"
							data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
          <form method="get"
						action="${pageContext.request.contextPath }/supplier/searchByName">
				<div class="input-group input-group-lg"
							style="width: 70%; right: 1%">
                	<input type="search" name="name"
								class="form-control form-control-lg" placeholder="supplier name">
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
                      <th>
                         Id
                      </th>
                      <th>
                          Supplier name
                      </th>
                      <th>
                          Address 
                      </th>
                      <th>
                          Email
                      </th>
                      <th>
                          Phone
                      </th>
                      <th class="text-center">
                          Logo
                      </th>
                      	
                      <th class="text-center" style="width: 18%">
                      	Business registration code
                      </th>
                      <st:authorize access="hasRole('ROLE_ADMIN')" >
                       <th class="text-center" style="width: 18%">
                      	Action
                      </th>
                      </st:authorize>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="supplier" items="${suppliers}">
                  <tr>
                      <td>
                          ${supplier.id }
                      </td>
                      <td>
                          <a>
                              ${supplier.name }
                          </a>
                          
                      </td>
                       <td>
                          ${supplier.address }
                      </td>
                       <td>
                          ${supplier.email }
                      </td>
                      <td>
                          ${supplier.phone }
                      </td>
                      <td class="text-center">
                      <img
										src="${pageContext.request.contextPath }/assets/logo/${supplier.logo }"
										height="80" width="80">
                         
                      </td>
                      <td class="text-center" >
                          ${supplier.businessRegistration }
                      </td>
                      
                       
                      <td class="project-actions text-right">
                      <a
										class="btn btn-primary btn-sm"
										href="${pagecontext.request.contextPath }/supplier/details/${supplier.id}">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <st:authorize access="hasRole('ROLE_ADMIN')">
                          <a class="btn btn-info btn-sm"
											href="${pageContext.request.contextPath }/supplier/edit/${supplier.id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                         
                          <a class="btn btn-danger btn-sm"
											onclick="return confirm('Are you sure?')"
											href="${pagecontext.request.contextPath }/supplier/delete/${supplier.id}">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                      </st:authorize>
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