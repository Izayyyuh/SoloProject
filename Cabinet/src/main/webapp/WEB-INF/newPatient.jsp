<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Patient</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<div class="d-flex justify-content-around align-items-center">
		<h1>New Patient</h1>
		<a href="/dashboard">Dashboard</a>
		</div>
		<div>
			<form:form action="/patients/create" method="POST" modelAttribute="newPatient">
					<form:errors style="color:red" path="patientFirstName"/>
					<form:label path="patientFirstName">First Name:</form:label>
					<form:input type="text" path="patientFirstName" required="true"/>
					<form:errors style="color:red" path="patientLastName"/>
					<form:label path="patientLastName">Last Name:</form:label>
					<form:input type="text" path="patientLastName" required="true"/>
					<form:errors style="color:red" path="dateOfBirth"/>
					<form:label path="dateOfBirth">Date of Birth:</form:label>
					<form:input type="date" path="dateOfBirth" required="true"/>
					<form:errors style="color:red" path="roomNumber"/>
					<form:label path="roomNumber">Room Number:</form:label>
					<form:input type="number" path="roomNumber" required="true"/>
					<form:errors style="color:red" path="patientProblem"/>
					<form:label path="patientProblem">Problem:</form:label>
					<form:input type="text" path="patientProblem" required="true"/>
					<form:errors style="color:red" path="patientType"/>
					<div class="text-center form-outline w-35 d-flex mt-1">
					<form:label for="formControlInput" class="form-label text-nowrap" path="patientType">Patient Type:</form:label>
					<form:select for="formControlInput" class="form-label text-nowrap" name="patientType" path="patientType">
					<form:option class="input-group input-group-sm" id="formControlInput" value="Orthopedic" required="true">Orthopedic</form:option>
					<form:option class="input-group input-group-sm" id="formControlInput" value="Surgery" required="true">Surgery</form:option>
					<form:option class="input-group input-group-sm" id="formControlInput" value="Pediatric" required="true">Pediatric</form:option>
					<form:option class="input-group input-group-sm" id="formControlInput" value="Med Surg" required="true">Med Surg</form:option>
					</form:select>
					</div>
					<div>
						<h2>Medical History</h2>
						<div>
						<form:checkbox path="medicalHistory" value="Chest Pain" style="display: inline-block;" />
						<p style="display: inline;">Chest Pain</p>
						</div> <br>
						<div>
						<form:checkbox path="medicalHistory" value="Diabetes" style="display: inline-block;" />
						<p style="display: inline;">Diabetes</p>
						</div> <br>
						<div>
						<form:checkbox path="medicalHistory" value="Ashtma" style="display: inline-block;" />
						<p style="display: inline;">Asthma</p>
						</div><br>
						<div>
						<form:checkbox path="medicalHistory" value="Arthritis" style="display: inline-block;" />
						<p style="display: inline;">Arthritis</p>
						</div>
					</div>
					<button class= "btn btn-primary">Submit</button>
			</form:form>		
		</div>
		
					
	</div>
</body>
</html>