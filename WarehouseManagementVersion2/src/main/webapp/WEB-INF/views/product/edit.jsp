<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<mt:template title="Edit product">
	<jsp:attribute name="content">
	
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">Edit Product</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/product/index">Product</a></li>
              
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
  <div class="row"> 
   <div class="col-md-7" style="left: 20%">
  <div class="card card-primary">
  <div class="card-header">
   <h3 class="card-title">Edit form</h3>
   </div>
           
              <!-- form start -->
              <s:form
					action="${pageContext.request.contextPath }/product/edit"
					modelAttribute="product" method="post"
					enctype="multipart/form-data">
                <div class="card-body">
                  <div class="form-group">
                    <label for="name">Product ID</label>
                    <br>
                    <s:input class="form-control"
							id="id" path="id" readonly="true"/>
                  </div>
                  <div class="form-group">
                    <label for="name">Product Name</label>
                    <br>
                    <s:errors path="name" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="name" placeholder="Enter new product name" path="name" />
                  </div>
                  <div>
                  <label>Category</label>
                    <s:select path="category"
							class="form-control select2 select2-danger"
							data-dropdown-css-class="select2-danger" style="width: 100%;" >
							<s:option value="${product.category.id }">${product.category.name}</s:option>
					<c:forEach var="category" items="${categories}">
                    <s:option value="${category.id }">${category.name}</s:option>
                    </c:forEach>
                  </s:select>
				</div>
                  <div class="form-group">
                  <br/>
                    <label for="price">Price</label>
                    <s:errors path="price" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="price" placeholder="Enter new price" path="price"/>
                  </div>
                  <div class="form-group">
                    <label for="quantity">Quantity</label>
                    <s:input class="form-control"
							id="quantity" path="quantity" readonly="true"/>
                  </div>
                  <div class="form-group">
                    <label for="unit">Unit</label>
                     <br>
                    <s:errors path="unit" cssClass="error"></s:errors>
                    <s:input class="form-control"
							id="unit" placeholder="Enter new unit" path="unit"/>
                  	</div>
                  </div>
                  <div class="form-group row offset-sm-1 col-sm-10">
                  <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure?')">Save</button>
                </div>
              </s:form>
            <!-- /.card -->
            </div>
          </div>   
          </div>
          </section>
    <!-- /.content -->
    </jsp:attribute>
</mt:template>