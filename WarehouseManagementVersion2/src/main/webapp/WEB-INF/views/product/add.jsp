<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:template title="Add New Product">
	<jsp:attribute name="content">
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray;">Add New Product</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/category/index">Add Category</a></li>
              <li class="breadcrumb-item active"><a
								href="${pageContext.request.contextPath }/product/index">List Product</a></li>
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
    <div class="row">
    
            <div class="col-md-7" style="left: 20%">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Product information</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <s:form enctype="multipart/form-data" method="post"
				modelAttribute="product"
				action="${pageContext.request.contextPath }/product/save">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputName">Product name</label>
                    <br>
                    <s:errors path="name" cssStyle="color: red"></s:errors>
                    <s:input path="name" class="form-control"
							id="exampleInputName" placeholder="Enter new product name" />
                  </div>
                  <div class="form-group">
                    <label>Price</label>
                    <br>
                    <s:errors path="price" cssStyle="color: red"></s:errors>
                    <s:input path="price" class="form-control"
							placeholder="Price" />
                  </div>
                  <div class="form-group">
                    <label>Quantity</label>
                    <s:input readonly="true" path="quantity"
							class="form-control" placeholder="Quantity" />
                  </div>
                  <div class="form-group">
                    <label>Unit</label>
                    <br>
                    <s:errors path="unit" cssStyle="color: red"></s:errors>
                    <s:input path="unit" class="form-control"
							placeholder="Unit" />
                  </div>
                  <div>
                  <label>Category</label>
                    <s:select path="category"
							class="form-control select2 select2-danger"
							data-dropdown-css-class="select2-danger" style="width: 100%;">
					<c:forEach var="category" items="${categories}">
                    <s:option value="${category.id }">${category.name}</s:option>
                    </c:forEach>
                  </s:select>
				</div>
                  <div class="form-group">
                  <br/>
                    <label for="exampleInputFile">Photo</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input name="files" type="file"
									multiple="multiple" class="custom-file-input"
									id="exampleInputFile">
                        <label class="custom-file-label"
									for="exampleInputFile">Choose file</label>
                      </div>
                    </div>
                  </div>
                   
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </s:form>
             
            </div>
</div>
    <!-- Main content -->
   </div>
            </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>