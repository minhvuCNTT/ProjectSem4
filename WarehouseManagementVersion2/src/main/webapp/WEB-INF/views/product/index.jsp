<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:template title="List Product">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">List Product</h3>
           
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/product/add">Add Product</a></li>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
			
    </div>
    
    <section class="content">
 <span style="color: red">${msg }</span>
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
                      <th class="text-center">
                         Id
                      </th>
                      <th>
                          Product name
                      </th>
                      <th>
                          Price 
                      </th>
                      <th ">
                          Quantity
                      </th>
                      <th  class="text-center">
                          Unit
                      </th>
                      	<th  class="text-center">
                      	Category
                      </th>
                      <th  class="text-center">
                      	Action
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="product" items="${products }">
                  <tr>
                      <td>
                          ${product.id }
                      </td>
                      <td>
                          <a>
                              ${product.name }
                          </a>
                          
                      </td>
                       <td >
		                      <fmt:formatNumber type="CURRENCY" value=" ${product.price }">
		                      </fmt:formatNumber>
                      </td>
                       <td >
                          ${product.quantity }
                      </td>
                      <td class="text-center">
                          ${product.unit }
                      </td>
                      <td class="project-state text-center">
                          ${product.category.name }
                      </td>
                      <td class="project-actions text-right text-center">
                          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath }/product/details/${product.id}">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath }/product/edit/${product.id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')" href="${pagecontext.request.contextPath }/product/delete/${product.id}">
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

    
    <!-- /.content-header -->
    

    <!-- Main content -->
    
    
    
    
    
    <!-- /.content -->
    </jsp:attribute>
</mt:template>