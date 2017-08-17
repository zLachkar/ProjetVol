<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title><spring:message code="reservationEdit.title"/></title>
</head>
<body>
	<div class="container">
		<fieldset>
			<legend><spring:message code="reservationEdit.fieldset"/></legend>
			<form:form modelAttribute="reservation" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />		
				
				<div class="form-group">
					<form:label path="dateResa"><spring:message code="reservationEdit.dateResa"/></form:label>
					<form:input path="dateResa" type="date" cssClass="form-control" cssStyle="width: 400px"/>
				<form:errors path="dateResa" /> 
				</div>
				
				<div class="form-group">
					<form:label path="numero"><spring:message code="reservationEdit.numero"/></form:label>
					<form:input path="numero" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				 <form:errors path="numero" /> 
				</div>
				
				
			
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<a href="cancel" class="btn btn-warning">
					<span class="glyphicon glyphicon-arrow-left"></span>
				</a>
			</form:form>
		</fieldset>
	</div>
</body>
</html>