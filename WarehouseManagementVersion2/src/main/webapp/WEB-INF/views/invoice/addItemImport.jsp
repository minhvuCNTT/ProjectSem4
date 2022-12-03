<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:template title="Add item for import invoice">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Add item for Import invoice</h1>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/invoice/listimport">List Invoices Import</a></li>
              <li class="breadcrumb-item"><a
              					 href="${pageContext.request.contextPath }/product/add">Add Product</a></li>
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
           <style type="text/css">
.error {
	color: red;
}
</style>
              <!-- form start -->
              <form method="post"
				action="${pageContext.request.contextPath }/invoice/addItemImport">
                <div class="card-body">
                  <div class="form-group">
                    <label for="comboboxProductImport">Choose Product</label>
                    <select id="comboboxProductImport" name="comboboxProduct" class="form-control">
                    	<c:forEach var="product" items="${products }">
                    		<option value="${product.id }">${product.name }</option>
                    	</c:forEach>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label for="quantity">Quantity</label>
                    <br>
                    <input type="number" class="form-control" id="quantity" 
                    	name="quantity" min="1" 
                    	required="required">
                  </div>
                  
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" id="buttonAddImport">Add</button>
                </div>
               
              </form>
            <!-- /.card -->
            </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>