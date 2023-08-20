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
</head>
<body>
	<div class="d-flex justify-content-around align-items-center">
	<h1>Edit Emergency Contact</h1>
	<a href="/dashboard">Dashboard</a>
	</div>
	<form:form action="/emergencyContact/edit/${emergencyContactId}" method="PUT" modelAttribute="emergencyContactToEdit">
		
		<form:errors style="color:red" path="emergencyContactName"/>
		<form:label path="emergencyContactName">Name:</form:label>
		<form:input type="text" path="emergencyContactName" required="true"/>
		<form:errors style="color:red" path="emergencyContactPhoneNumber"/>
		<form:label path="emergencyContactPhoneNumber">Phone Number:</form:label>
		<form:input type="text" path="emergencyContactPhoneNumber" required="true"/>
		<form:errors style="color:red" path="emergencyContactAddress"/>
		<form:label path="emergencyContactAddress">Address:</form:label>
		<form:input type="text" path="emergencyContactAddress" required="true"/>
		<div>
			<a class="btn btn-danger" href="/emergencyContacts/delete/${emergencyContactId}">Delete</a>
			<form:button class="btn btn-primary">Submit</form:button>
		</div>
	</form:form>
</body>
</html>