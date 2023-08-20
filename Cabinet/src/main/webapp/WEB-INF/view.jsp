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
<title>Testing 123...</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<style>
    /* Style for the top parent div */
    .top-half {
        display: flex;
        justify-content: space-between;
        align-items: stretch;
        height: 50vh; /* Adjust as needed */
        padding: 20px;
        border-bottom: 1px solid #ccc;
    }
    
    /* Style for the patient info div */
    .patient-info-div,
    .emergency-contact-div {
        flex: 1; /* Split equally into two columns */
        padding: 10px;
        border: 1px solid #ddd;
    }

    /* Style for the scrollable emergency contact div */
    .emergency-contact-div.scrollable {
        max-height: 440px; /* Set the maximum height for scrollability */
        overflow-y: auto; /* Enable vertical scrolling if content exceeds max height */
    }

  /* Style for the medical history div */
    .medical-history-div {
        padding: 20px;
        text-align: center;
        border: 1px solid #ddd;
    }
</style>
</head>
<body>
	<a href="/dashboard">Dashboard</a>
	<div class="top-half">
		<div class="patient-info-div" style="text-align: center;">
			<h2>Patient Information</h2>
			<p>Name: ${viewPatient.patientLastName}, ${viewPatient.patientFirstName}</p>
			<p>Date of Birth: <fmt:formatDate type="date" value="${viewPatient.dateOfBirth}"/></p>
			<p>MRN: ${viewPatient.medicalRecordsNumber}</p>
			<p>Type: ${viewPatient.patientType}</p>
			<p>Room Number: ${viewPatient.roomNumber}</p>
		</div>
	
	<div class="emergency-contact-div scrollable">
		<h2 style="text-align: center;">Emergency Contacts</h2>
		<c:if test="${not empty viewPatient.emergencyContact}">
        <c:forEach var="emergencyContact" items="${viewPatient.emergencyContact}" >
            <ul>
                <li>
                    <p>Name: ${emergencyContact.emergencyContactName}</p>
                    <p>Phone Number: ${emergencyContact.emergencyContactPhoneNumber}</p>
                    <p>Address: ${emergencyContact.emergencyContactAddress}</p>
                </li>
            </ul>
       		 <a class="btn btn-secondary" href="/emergencyContact/edit/${emergencyContact.id}">Edit Emergency Contact</a>
        </c:forEach>
		</c:if>
		</div>
	</div>
		<div class="bottom-half">
			<h2 style="text-align: center;">Medical History</h2>
			<c:forEach var="medicalHistory" items="${viewPatient.medicalHistory}">
				<ul>
					<li>
						<p>${medicalHistory}</p>
					</li>
				</ul>
			</c:forEach>
		</div>
	<div class="mt-3">
	<a class="btn btn-primary" href="/patients/edit/${patientId}">Edit Patient</a>
	<a class="btn btn-warning" href="/emergencyContact/create/${patientId}">Add Emergency Contact</a>
	<a class="btn btn-danger" href="/delete/${patientId}">Discharge Patient</a>
	</div>
</body>
</html>