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
<title>Cabinet</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="d-flex justify-content-around align-items-center">
			<h1>Cabinet</h1>
		<div>
		<a href="/patients/new">New Patient</a>
		<a href="/logout">Logout</a>
			
		</div>
	</div>
	<div>
		<h2>All Patients</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
				<th style="text-align:center">Patient Name</th>
				<th style="text-align:center">MRN</th>
				<th style="text-align:center">Room Number</th>
				<th style="text-align:center">Problem</th>
				<th style="text-align:center">Patient Type</th>
				<th style="text-align:center">Date of Birth</th>
				<th style="text-align:center">Doctor/Tech/Nurse</th>
				</tr>
			</thead>
			<c:forEach var="patient" items="${allPatients}">
				<tr>
					<td style="text-align:center">
						<a href = "/patients/${patient.id}">${patient.patientLastName}, ${patient.patientFirstName}</a>
					</td>
					<td style="text-align:center">
						<p>${patient.medicalRecordsNumber}</p>
					</td>
					<td style="text-align:center">
						<p>${patient.roomNumber}</p>
					</td>
					<td style="text-align:center">
						<p>${patient.patientProblem}</p>
					</td>
					<td style="text-align:center">
						<p>${patient.patientType}</p>
					</td>
					<td style="text-align:center">
						<p><fmt:formatDate type="date" value="${patient.dateOfBirth}"/></p>
					</td>
					<td style="text-align:center">
						<c:choose>
                    <c:when test="${patient.creator.position == 'Physician'}">
                        <p>Dr. ${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:when>
                    <c:when test="${patient.creator.position == 'Nurse'}">
                        <p>RN ${patient.creator.firstName} ${patient.creator.lastName}</p>
                    </c:when>
                    <c:otherwise>
                        <p>${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:otherwise>
                </c:choose>
            </td>
					</tr>
			</c:forEach>
		</table>
	</div>
		<div>
			<h2>Orthopedic Patients</h2>
	    	<table class="table table-bordered">
	        <thead>
	            <tr>
	                <th style="text-align:center">Patient Name</th>
	                <th style="text-align:center">MRN</th>
	                <th style="text-align:center">Room Number</th>
	                <th style="text-align:center">Problem</th>
	                <th style="text-align:center">Date of Birth</th>
	            	<th style="text-align:center">Doctor/Tech/Nurse</th>
	            </tr>
	        </thead>
	        <c:forEach var="patient" items="${allPatients}">
	            <c:if test="${patient.patientType == 'Orthopedic'}">
	                <tr>
	                    <td style="text-align:center">
	                        <a href="/patients/${patient.id}">${patient.patientLastName}, ${patient.patientFirstName}</a>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.medicalRecordsNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.roomNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.patientProblem}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p><fmt:formatDate type="date" value="${patient.dateOfBirth}"/></p>
	                    </td>
	                    <td style="text-align:center">
						<c:choose>
                    <c:when test="${patient.creator.position == 'Physician'}">
                        <p>Dr. ${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:when>
                    <c:when test="${patient.creator.position == 'Nurse'}">
                        <p>RN ${patient.creator.firstName} ${patient.creator.lastName}</p>
                    </c:when>
                    <c:otherwise>
                        <p>${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:otherwise>
                </c:choose>
            </td>
	                </tr>
	            </c:if>
	        </c:forEach>
	       </table>
      </div>
      <div>
			<h2>Med Surg Patients</h2>
	    	<table class="table table-bordered">
	        <thead>
	            <tr>
	                <th style="text-align:center">Patient Name</th>
	                <th style="text-align:center">MRN</th>
	                <th style="text-align:center">Room Number</th>
	                <th style="text-align:center">Problem</th>
	                <th style="text-align:center">Date of Birth</th>
	            	<th style="text-align:center">Doctor/Tech/Nurse</th>
	            </tr>
	        </thead>
	        <c:forEach var="patient" items="${allPatients}">
	            <c:if test="${patient.patientType == 'Med Surg'}">
	                <tr>
	                    <td style="text-align:center">
	                        <a href="/patients/${patient.id}">${patient.patientLastName}, ${patient.patientFirstName}</a>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.medicalRecordsNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.roomNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.patientProblem}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p><fmt:formatDate type="date" value="${patient.dateOfBirth}"/></p>
	                    </td>
	                    <td style="text-align:center">
						<c:choose>
                    <c:when test="${patient.creator.position == 'Physician'}">
                        <p>Dr. ${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:when>
                    <c:when test="${patient.creator.position == 'Nurse'}">
                        <p>RN ${patient.creator.firstName} ${patient.creator.lastName}</p>
                    </c:when>
                    <c:otherwise>
                        <p>${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:otherwise>
                </c:choose>
            </td>
	                </tr>
	            </c:if>
	        </c:forEach>
	       </table>
      </div>
      <div>
			<h2>Pediatric Patients</h2>
	    	<table class="table table-bordered">
	        <thead>
	            <tr>
	                <th style="text-align:center">Patient Name</th>
	                <th style="text-align:center">MRN</th>
	                <th style="text-align:center">Room Number</th>
	                <th style="text-align:center">Problem</th>
	                <th style="text-align:center">Date of Birth</th>
	            	<th style="text-align:center">Doctor/Tech/Nurse</th>
	            </tr>
	        </thead>
	        <c:forEach var="patient" items="${allPatients}">
	            <c:if test="${patient.patientType == 'Pediatric'}">
	                <tr>
	                    <td style="text-align:center">
	                        <a href="/patients/${patient.id}">${patient.patientLastName}, ${patient.patientFirstName}</a>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.medicalRecordsNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.roomNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.patientProblem}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p><fmt:formatDate type="date" value="${patient.dateOfBirth}"/></p>
	                    </td>
	                    <td style="text-align:center">
						<c:choose>
                    <c:when test="${patient.creator.position == 'Physician'}">
                        <p>Dr. ${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:when>
                    <c:when test="${patient.creator.position == 'Nurse'}">
                        <p>RN ${patient.creator.firstName} ${patient.creator.lastName}</p>
                    </c:when>
                    <c:otherwise>
                        <p>${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:otherwise>
                </c:choose>
            </td>
	                </tr>
	            </c:if>
	        </c:forEach>
	       </table>
      </div>
      <div>
			<h2>Surgery Patients</h2>
	    	<table class="table table-bordered">
	        <thead>
	            <tr>
	                <th style="text-align:center">Patient Name</th>
	                <th style="text-align:center">MRN</th>
	                <th style="text-align:center">Room Number</th>
	                <th style="text-align:center">Problem</th>
	                <th style="text-align:center">Date of Birth</th>
	            	<th style="text-align:center">Doctor/Tech/Nurse</th>
	            </tr>
	        </thead>
	        <c:forEach var="patient" items="${allPatients}">
	            <c:if test="${patient.patientType == 'Surgery'}">
	                <tr>
	                    <td style="text-align:center">
	                        <a href="/patients/${patient.id}">${patient.patientLastName}, ${patient.patientFirstName}</a>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.medicalRecordsNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.roomNumber}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p>${patient.patientProblem}</p>
	                    </td>
	                    <td style="text-align:center">
	                        <p><fmt:formatDate type="date" value="${patient.dateOfBirth}"/></p>
	                    </td>
	                    <td style="text-align:center">
						<c:choose>
                    <c:when test="${patient.creator.position == 'Physician'}">
                        <p>Dr. ${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:when>
                    <c:when test="${patient.creator.position == 'Nurse'}">
                        <p>RN ${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:when>
                    <c:otherwise>
                        <p>${patient.creator.lastName}, ${patient.creator.firstName}</p>
                    </c:otherwise>
                </c:choose>
            </td>
	                </tr>
	            </c:if>
	        </c:forEach>
	       </table>
      </div>
	
</body>
</html>