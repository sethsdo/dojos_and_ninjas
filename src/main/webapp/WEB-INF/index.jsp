<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Index</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/style.css">
	</head>

	<body>
		<div class="container">
			<h1>Dojos And Ninjas</h1>
			<br>
			<!-- Trigger the modal with a button -->
			<div class="row">
				<button type="button" class="btn btn-info btn-lg col-xs-6 bt1" data-toggle="modal" data-target="#dojoModal">New Dojo</button>
				<button type="button" class="btn btn-info btn-lg col-xs-6 bt1" data-toggle="modal" data-target="#ninjaModal">New Ninja</button>
			</div>
			
		
			<!-- Modal -->
			<div class="modal fade" id="ninjaModal" role="dialog">
				<div class="modal-dialog">
		
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Add Ninja</h4>
						</div>
						<div class="modal-body">
							<form:form method="POST" action="/addNinja" modelAttribute="ninja">
								<form:label path="firstName">First Name:
									<form:input path="firstName" />
									<form:errors path="firstName" />
								</form:label><br>
								<form:label path="lastName">Last Name:
									<form:input path="lastName" />
									<form:errors path="lastName" />
								</form:label><br>
								<form:label path="age">Age:	
									<form:input path="age" />
									<form:errors path="age" />
								</form:label>
								<br>
								<form:label path="dojo">Location:
								<form:select path="dojo">
									<c:forEach items="${dojos}" var="dojo">
										<option value="${dojo.id}">${dojo.name}</option>
									</c:forEach>
								</form:select>
								</form:label><br>
								<input type="submit" class="btn btn-primary" value="Create" />
							</form:form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="dojoModal" role="dialog">
				<div class="modal-dialog">
			
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Add Dojo Location</h4>
						</div>
						<div class="modal-body">
							<form:form method="POST" action="/addDojo" modelAttribute="dojo">
								<form:label path="name">Name:
									<form:input path="name" />
									<form:errors path="name" />
								</form:label>
								<input type="submit" class="btn btn-primary" value="Create" />
							</form:form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<h3>Dojo Ninjas:</h3>
			<div class="row">
				<div class="col-xs-8">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Location</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Age</th>
							</tr>
						</thead>
						<c:forEach items="${ninjas}" var="ninja">
							<tbody>
								<tr>
									<td>${ninja.dojo.name}</td>
									<td>${ninja.firstName}</td>
									<td>${ninja.lastName}</td>
									<td>${ninja.age}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<div class="col-xs-4">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Location</th>
							</tr>
						</thead>
						<c:forEach items="${dojos}" var="dojo">
							<tbody>
								<tr>
									<td><button type="button" data-toggle="modal" data-target="#currentModal${dojo.id}" >${dojo.name}</button></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
			<c:forEach items="${dojos}" var="dojo">
			<div class="modal fade" id="currentModal${dojo.id}" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">${dojo.name}</h4>
						</div>
						<div class="modal-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Location</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Age</th>
									</tr>
								</thead>
								<c:forEach items="${ninjas}" var="ninja">
									<tbody>
										<c:if test="${ninja.dojo.id == dojo.id}">
											<tr>
												<td>${ninja.dojo.name}</td>
												<td>${ninja.firstName}</td>
												<td>${ninja.lastName}</td>
												<td>${ninja.age}</td>
											</tr>
										</c:if>
									</tbody>
								</c:forEach>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</body>
</html>