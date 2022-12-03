<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:template title="New import invoice">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">New import invoice</h1>
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
	 <form method="post" action="${pageContext.request.contextPath }/invoice/addimport">
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fas fa-globe"></i> Warehouse Project
                    <small class="float-right"><b>Create by:</b> ${sessionScope.account.username }</small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                
                <!-- /.col -->
                
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- Table row -->
              
              <div class="row">
                <div class="col-12 table-responsive">
                <form method="post" action="${pageContext.request.contextPath }/invoice/updatequantityimport">
                  <table id="tableDetails" class="table table-striped">
                    <thead>
                    <tr>
                      <th>#</th>
                      <th>Product</th>
                      <th>
                      	<input type="submit"  class="btn btn-default"
                      	formaction="${pageContext.request.contextPath }/invoice/updatequantityimport" 
                      	value="update quantity">
                      </th>
                      <th>Unit</th>
                      <th>Price</th>
                      <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody>
                   
                    	<c:set var="total" value="0"></c:set>
                    	<c:forEach var="item" items="${sessionScope.cartImport }" varStatus="i">
                    	<c:set var="total" value="${total + item.product.price * item.quantity}"></c:set>
                    	<tr>
                    		<td>${i.index + 1 }</td>
                    		<td>${item.product.name}</td>
                    		<td>
                    			<input type="number" 
                    					name="quantities" 
                    					value="${item.quantity}"
                    					min="1"> 
                    		</td>
                    		<td>${item.product.unit}</td>
                    		<td>
                    		<fmt:formatNumber type="CURRENCY" value="${item.product.price}">
		                      	
		                      </fmt:formatNumber>
                    		</td>
                    		<td>
                    		<fmt:formatNumber type="CURRENCY" value="${item.product.price * item.quantity}">
		                      	
		                      </fmt:formatNumber></td>
                    	</tr>
                    	</c:forEach>
                    </tbody>
                  </table>
                  </form>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
				<br>
				 <a href="${pageContext.request.contextPath }/invoice/addItemImport" class="btn btn-default">Continue</a>
              <br><br><br>
               <a href="${pageContext.request.contextPath }/invoice/cancel" class="btn btn-default">Destroy invoice</a>
              
              
              <div class="col-sm-4 invoice-col">
              <input type="hidden" name="accountId" value="${sessionScope.account.id }">
                  Supplier
                  <div class="form-group">
                    <select class="form-control" name="comboboxSupplier">
                    <c:forEach var="supplier" items="${suppliers }">
                    	<option value="${supplier.id }">${supplier.name}</option>
                    </c:forEach>
                    </select>
                    </div>
                </div>
              <div class="row">
                <!-- accepted payments column -->
                <div class="col-6">
                  <p class="lead">Payment and description:</p>
                  
                  	<input type="text" class="form-control" name="payment"
						value="cash" required="required">
                  

                  <p class="text-muted well well-sm shadow-none"
						style="margin-top: 10px;">
                    <textarea class="form-control" rows="5" name="description"
							placeholder="description..."></textarea>
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  <p class="lead">Date created: <input class="col-8"
							type="text" value="${today }" readonly="readonly">
					</p>

                  <div class="table-responsive">
                    <table class="table">
                                            <tr>
                        <th>Total:</th>
                        <td>
                        <fmt:formatNumber type="CURRENCY" value="${total}">
		                      	
		                      </fmt:formatNumber>
                        </td>
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
                  
                  <button onclick="return confirm('Are you sure ?')" type="submit" formaction="${pageContext.request.contextPath }/invoice/addimport"
						class="btn btn-success float-right">
						<i class="far fa-credit-card"></i> Submit
                    Invoice
                  </button>
                 
                </div>
              </div>
            </div>   
      </form>      
    <!-- /.content -->
    </jsp:attribute>
</mt:template>