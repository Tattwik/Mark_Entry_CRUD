<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MARK ENTRY FORM</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
 
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
 
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script> -->

</head>
<body>
<c:if test="${msg ne null}">
		<div class="alert alert-success" id="alId">${msg}</div>
	</c:if>


	<div class="container mt-4">

		<div class="h3 text-primary text-center">Mark Entry Form</div>

		<form action="./registerMark" method="post" id="regdFormId"
			enctype="multipart/form-data" >
			<div class="row">
				<div class="col-3">
					<div>
						<label>Select Batch</label> <select class="form-control"
							name="batch" id="batchId"
							onchange="getSubscriptionByProviderId(this.value)">
							<option value="0">-select-</option>
							<c:forEach items="${batchList}" var="batch">
								<option value="${batch.batchId }">${batch.batchName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-3">
					<div>
						<label>Select Technology</label> <select class="form-control"
							name="technology" id="technologyId" onchange="getEmpByBatchandTechId()">
							<option value="0">-select-</option>
							<c:forEach items="${techList}" var="tech">
								<option value="${tech.technologyId }">${tech.technologyName}</option>
							</c:forEach>


						</select>
					</div>
				</div>
				<div class="col-3">
					<div>
						<label>Select Employee Name</label> <select class="form-control"
							name="empName" id="empNameId">

						</select>
					</div>
				</div>
				<div class="col-3">
					<div>
						<label>Mark</label> <input type="text" class="form-control"
							name="mark" id="markId">

					</div>
				</div>
			</div>
			<div class="row mt-3 justify-content-center">
				<div class="col-md-6 text-center">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
				</div>
			</div>
		</form>
		
		
		
		
		
		
		
		
		
		
		<div class="card mt-4">
			<div class="card-header">
				<h4>Data Section</h4>
			</div>
			<div class="card-body">

				<form action="./batchFilter" method="get">
					<div class="row mb-3">
						<div class="col-md-4">
							<h5>Filter</h5>
							<label>Batch Filter</label> <select class="form-control"
								name="batchFilter" id="batchFilterId">
								<option value="0">-select-</option>
								<c:forEach items="${batchList}" var="batch">
								<option value="${batch.batchId }">${batch.batchName}</option>
							</c:forEach>
							</select>
						</div>
						<div class="col-md-2 d-flex align-items-end">
							<button type="submit" class="btn btn-primary"
								>Show Report</button>
						</div>
					</div>
				</form>

				<div class="card mt-4">
					<div class="card-body">
						<table class="table table-bordered" id="vTableId">
							<thead>
								<tr>
									<th>Sl No</th>
									<th>Batch Name</th>
									<th>Batch Start Date</th>
									<th>Technology Name</th>
									<th>Employee Name</th>
									<th>Employee Phone</th>
									<th>Mark</th>

								</tr>
							</thead>
							<tbody id="registrationDetails">

								 <c:forEach items="${dataLst}" var="data" varStatus="counter">
									<tr>
										<td>${counter.count}</td>
										<td>${data.batchName }</td>
										<td><fmt:formatDate value="${data.batchStartDate }"
												pattern="dd/MM/yyyy" /></td>
										<td>${data.technologyName}</td>
										<td>${data.employeeName}</td>										
										<td>${data.employeePhone}</td>
										<td>${data.mark}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		setTimeout(function() {
			document.getElementById("alId").style.display = 'none';
		}, 5000);
	});
	
	$(function() {
		$("#vTableId").dataTable({
			"lengthMenu" : [ 3, 5, 10, 15, "All" ]
		});
	});
	
	
		function getEmpByBatchandTechId() {
			var technologyId=$("#technologyId").val();
			var batchId=$("#batchId").val();
			console.log(technologyId,batchId);
			$.ajax({
				url : 'getEmpByBatchandTechId',
				type : 'GET',
				data : {
					technologyId : technologyId,
					batchId : batchId
				},

				success : function(response) {
					$("#empNameId").html(response);
				},
				error : function(error) {
					console.log(error)
				}
			});

		}

		function validateForm() {
			if ($("#providerId option:selected").val() == '0') {
				alert("Please select a provider");

				return false;
			}
			if ($("#subscriptionId option:selected").val() == '0') {
				alert("Please select a subscription");

				return false;
			}

			return false;
		}
	</script>
</body>
</html>