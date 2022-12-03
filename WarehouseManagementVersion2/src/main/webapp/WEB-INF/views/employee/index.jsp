<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template title="List Employee">
	<jsp:attribute name="content">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | User Profile</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0" style="color: gray">List Employee</h3>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath }/employee/index">Employee</a></li>
              <li class="breadcrumb-item active"><a
								href="${pageContext.request.contextPath }/employee/index">List</a></li>
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

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
        <div class="row no-print">
                <div class="col-12">
                  <a href="/employee/register" style="color: blue;"
								class="btn btn-default"><i class="fas fa-plus"></i>Add new employee</a>
                  
                </div>
              </div>
              <br>
        <form method="get"
						action="${pageContext.request.contextPath }/employee/searchByName">
				<div class="input-group input-group-lg" style="width: 70%">
                	<input type="search" name="name"
								class="form-control form-control-lg" placeholder="Emloyee Name">
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
                      <th class="col-1" style="width: 1%">
                          #
                      </th>
                      <th style="width: 20%">
                          Name and Birthday
                      </th>
                      <th class="text-center" style="width: 8%">
                          Photo
                      </th>
                      <th style="width: 10%">
                          Phone
                      </th>
                      <th style="width: 8%" class="text-center">
                          Status
                      </th>
                      <th class="text-center" style="width: 20%">
                      Acction
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="employee" items="${employees }"
								varStatus="i">
                  <tr>
                      <td>
                          ${i.index + 1}
                      </td>
                      <td>
                          <a>
                              ${employee.fullName }
                          </a>
                          <br />
                          <small>
                              ${employee.dob }
                          </small>
                      </td>
                      <td >
                          <ul class="list-inline text-center">
                              <li class="list-inline-item" >
                                  <img alt="Avatar" class="profile-user-img img-fluid img-circle" 
												src="${pageContext.request.contextPath }/assets/uploads/${employee.photo }">
                              </li>
                          </ul>
                      </td>
                      <td class="project_progress">
                          ${employee.phone }
                      </td>
                      <td class="project-state text-center">
                      <c:if test="${employee.status }">
                          <span class="badge badge-success">Active</span>
                          </c:if>
                           <c:if test="${!employee.status }">
                          <span class="badge badge-danger">Inactive</span>
                          </c:if>
                      </td>
                      <td class="project-actions text-right text-center">
                          <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath }/employee/edit?id=${employee.id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <c:if test="${employee.status }">
                          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath }/employee/disable?id=${employee.id}">
                              <i class="fas fa-ban">
                              </i>
                              Disable
                          </a>
                          </c:if>
                          <c:if test="${!employee.status }">
                          <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath }/employee/enable?id=${employee.id}">
                              <i class="fas fa-check">
                              </i>
                              Enable
                          </a>
                          </c:if>
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
    </jsp:attribute>
</mt:template>