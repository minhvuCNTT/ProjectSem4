<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Invoice Print</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">
</head>
<body>
<div class="wrapper">
 <!-- Main content -->
	  <section class="invoice">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fas fa-globe"></i> Invoice #${invoiceExport.id }
                    <small class="float-right">Date: ${invoiceExport.created }</small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                
                <div class="col-sm-4 invoice-col">
                  From
                  <address>
                    <strong>Warehouse</strong><br>
                    Ho Chi Minh City<br>
                    Phone: 0355844032<br>
                    Email: warehouseproject@gmail.com
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  To
                  <address>
                    <strong>${invoiceExport.customer.fullName }</strong><br>
                    ${invoiceExport.customer.address }<br>
                    Email: ${invoiceExport.customer.email }
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>Created by: ${invoiceExport.account.fullName }</b><br>
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
                    	<c:forEach var="invoicedetails" items="${invoiceExport.invoiceExportDetailses }" varStatus="i">
		                    <tr>
		                    <c:set var="total" value="${total + invoicedetails.price * invoicedetails.quantity }"></c:set>
		                      <td>${i.index + 1 }</td>
		                      <td>${invoicedetails.product.name }</td>
		                      <td><fmt:formatNumber type="CURRENCY" value="${invoicedetails.price }">
		                      	
		                      </fmt:formatNumber></td>
		                      <td>${invoicedetails.unit }</td>
		                      <td>${invoicedetails.quantity }</td>
		                      <td>
		                      
		                      <fmt:formatNumber type="CURRENCY" value="${invoicedetails.price * invoicedetails.quantity }">
		                      	
		                      </fmt:formatNumber>	
		                      </td>
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
                  <p class="lead">Payment Methods: <b>${invoiceExport.payment }</b></p>
                  <p class="text-muted well well-sm shadow-none"
										style="margin-top: 10px;">
                    ${invoiceExport.description }
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  

                  <div class="table-responsive">
                    <table class="table">
                      
                      <tr>
                        <th>Total:</th>
                        <td><fmt:formatNumber type="CURRENCY" value="${total }">
		                      	
		                      </fmt:formatNumber></td>
                      </tr>
                    </table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              
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
</div>
<!-- ./wrapper -->
<!-- Page specific script -->
<script>
  window.addEventListener("load", window.print());
</script>
</body>
</html>
