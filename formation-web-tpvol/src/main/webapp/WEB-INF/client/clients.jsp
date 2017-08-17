<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title><spring:message code="clients.title" /></title>
<style>
.nodisplay, .displayondemand {
	display: none;
}

#showForm1:checked ~ #form1 {
	display: block;
}

#showForm2:checked ~ #form2 {
	display: block;
}

input[name=showForm]:checked+label {
	text-decoration: underline;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<!--         <input  id=showForm1 name=showForm type=radio class="nodisplay"> -->
		<!--         <label for=showForm1>Client Physique</label> -->
		<!--         &nbsp; -->
		<!--         <input  id=showForm2 name=showForm type=radio class="nodisplay"> -->
		<!--         <label for=showForm2>Client Moral </label> -->

<a href="listClientsPhysique">Client Physique</a><br>
<a href="listClientsMoral">Client Moral</a>
		<fieldset>
			<legend>
				<spring:message code="clients.fieldset" />
			</legend>


			<table class="table table-striped">
				<tr>
					<th><spring:message code="clients.id" /></th>
					<th><spring:message code="clients.version" /></th>
					<th><spring:message code="clients.nom" /></th>
					<th><spring:message code="clients.titre" /></th>
					<th><spring:message code="clients.numeroTel" /></th>
					<th><spring:message code="clients.numeroFax" /></th>
					<th><spring:message code="clients.email" /></th>
					<th><spring:message code="clients.rue" /></th>
					<th><spring:message code="clients.codePostal" /></th>
					<th><spring:message code="clients.ville" /></th>
					<th><spring:message code="clients.pays" /></th>
					<th><spring:message code="clients.edit" /></th>
					<th><spring:message code="clients.delete" /></th>
				</tr>
				<c:forEach items="${clients}" var="client">

					<tr>
						<td>${client.id}</td>
						<td>${client.version}</td>


						<td>${client.nom}</td>
						<td>${client.titre}<c:if
								test="${client.getClass().simpleName eq 'ClientPhysique'}">
								<td>${client.prenom}</td>

							</c:if> <c:if test="${client.getClass().simpleName eq 'ClientMoral'}">
								<td>${client.siret}</td>
							</c:if>
						</td>
						<td>${client.numeroTel}</td>
						<td>${client.numeroFax}</td>
						<td>${client.email}</td>
						<td>${client.adresse.rue}</td>
						<td>${client.adresse.codePostal}</td>
						<td>${client.adresse.ville}</td>
						<td>${client.adresse.pays}</td>
						<td><a href="clientEdit?id=${client.id}"
							class="btn btn-info btn-xs"><span
								class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="clientDelete?id=${client.id}"
							class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-trash"></span></a></td>

					</tr>

				</c:forEach>



				<tr>
					<td colspan="10"><a href="clientMoralAdd"
						class="btn btn-success btn-sm"><span
							class="glyphicon glyphicon-plus">Moral</span></a></td>
					<td colspan="10"><a href="clientPhysiqueAdd"
						class="btn btn-success btn-sm"><span
							class="glyphicon glyphicon-plus">Physique</span></a></td>

				</tr>

			</table>


		</fieldset>
	</div>
</body>
</html>