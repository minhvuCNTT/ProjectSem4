<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template title="Import Invoices">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Import invoices</h1>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/invoice/addItemImport">Add Import Invoices</a></li>
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
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable of Import invoices</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
	                  <tr>
	                  	<th>#</th>
	                    <th>Created By</th>
	                    <th>Date</th>
	                    <th>Supplier</th>
	                    <th>Payment</th>     
	                    <th style="visibility: hidden;">&nbsp;</th>        
	                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="invoice" items="${invoices }" varStatus="i">
                  <tr>
                    <td>${i.index + 1}</td>
                    <td>${invoice.account.fullName}
                    </td>
                    <td>${invoice.created }</td>
                    <td>${invoice.supplier.name}</td>
                    <td>${invoice.payment }</td>
                    <td>
                    	<a class="btn btn-success btn-sm" href="${pageContext.request.contextPath }/invoice/detailsImport?id=${invoice.id}">
                              <i class="fas fa-folder">
                              </i>
                              Details
                          </a>
                    </td>
                  </tr>
                  </c:forEach>
                  
                  </tbody>
                  <tfoot>
                  <tr>
                  	<th>#</th>
                    <th>Created By</th>
                    <th>Date</th>
                    <th>Supplier</th>
                    <th>Payment</th>
                    <th>&nbsp;</th>
                  </tr>
                  </tfoot>
                </table>
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