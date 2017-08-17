<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title><spring:message code="passagers.title" /></title>
</head>
<body>

	<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="passagers.fieldset" />
			</legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="passagers.id" /></th>
					<th><spring:message code="passagers.nom" /></th>
					<th><spring:message code="passagers.prenom" /></th>
					<th><spring:message code="passagers.rue" /></th>
					<th><spring:message code="passagers.codePostal" /></th>
					<th><spring:message code="passagers.ville" /></th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${passagers}" var="passager">
					<tr>
						<td>${passager.id}</td>
						<td>${passager.nom}</td>
						<td>${passager.prenom}</td>
						<td>${passager.adresse.rue}</td>
						<td>${passager.adresse.codePostal}</td>
						<td>${passager.adresse.ville}</td>
						<td><a href="edit?id=${passager.id}"
							class="btn btn-info btn-xs"><span
								class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="delete?id=${passager.id}"
							class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="11"><a href="add" class="btn btn-success btn-sm"><span
							class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>