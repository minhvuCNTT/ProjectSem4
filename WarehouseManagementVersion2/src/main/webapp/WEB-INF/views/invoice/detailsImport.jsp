<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:template title="Deatils import invoice">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Details import invoice</h1>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/invoice/listimport">Import Invoices</a></li>
              
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
            
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fas fa-globe"></i> Invoice #${invoiceImport.id }
                    <small class="float-right">Date: ${invoiceImport.created }</small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                  From
                  <address>
                    <strong>${invoiceImport.supplier.name }</strong><br>
                    ${invoiceImport.supplier.address }<br>
                    Phone: ${invoiceImport.supplier.phone }<br>
                    Email: ${invoiceImport.supplier.email }
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  To
                  <address>
                    <strong>Warehouse</strong><br>
                    Ho Chi Minh City<br>
                    Phone: 0355844032<br>
                    Email: warehouseproject@gmail.com
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>Created by: ${invoiceImport.account.fullName }</b><br>
                  <br>
                  
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                    <tr>
                      <th>#</th>
                      <th>Product</th>
                      <th>Price</th>
                      <th>Unit</th>
                      <th>Quantity</th>
                      <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="invoicedetails" items="${invoiceImport.invoiceImportDetailses }" varStatus="i">
		                    <tr>
		                    <c:set var="total" value="${total + invoicedetails.price * invoicedetails.quantity }"></c:set>
		                      <td>${i.index + 1 }</td>
		                      <td>${invoicedetails.product.name }</td>
		                      <td>
		                      <fmt:formatNumber type="CURRENCY" value="${invoicedetails.price }">
		                      	
		                      </fmt:formatNumber></td>
		                      <td>${invoicedetails.unit }</td>
		                      <td>${invoicedetails.quantity }</td>
		                      <td>
		                      <fmt:formatNumber type="CURRENCY" value="${invoicedetails.price * invoicedetails.quantity }">
		                      	
		                      </fmt:formatNumber></td>
		                    </tr>
	                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-6">
                  <p class="lead">Payment Methods: <b>${invoiceImport.payment }</b></p>
                  <p class="text-muted well well-sm shadow-none"
										style="margin-top: 10px;">
                    ${invoiceImport.description }
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  

                  <div class="table-responsive">
                    <table class="table">
                      
                      <tr>
                        <th>Total:</th>
                        <td> <fmt:formatNumber type="CURRENCY" value="${total }">
		                      	
		                      </fmt:formatNumber></td>
                      </tr>
                    </table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- this row will not appear when printing -->
              <div class="row no-print">
                <div class="col-12">
                  <a href="${pageContext.request.contextPath }/invoice/invoiceImportPrint?id=${invoiceImport.id }" 
                  						rel="noopener"
										target="_blank" class="btn btn-default"><i
										class="fas fa-print"></i> Print</a>
                  
                </div>
              </div>
            </div>
            <!-- /.invoice -->
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