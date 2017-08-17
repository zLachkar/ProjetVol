<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title><spring:message code="clientsPhysique.title"/></title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
<div class="container">

		<fieldset>
			<legend><spring:message code="clientsPhysique.fieldset"/></legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="clientsPhysique.id"/></th>
					<th><spring:message code="clientsPhysique.version"/></th>
					
					<th><spring:message code="clientsPhysique.nom"/></th>
<%-- 					<th><spring:message code="clientsPhysique.prenom"/></th> --%>
					<th><spring:message code="clientsPhysique.numeroTel"/></th>
					<th><spring:message code="clientsPhysique.numeroFax"/></th>
					<th><spring:message code="clientsPhysique.email"/></th>
					<th><spring:message code="clientsPhysique.rue"/></th>
					<th><spring:message code="clientsPhysique.codePostal"/></th>
					<th><spring:message code="clientsPhysique.ville"/></th>
						<th><spring:message code="clientsPhysique.pays"/></th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${clientsPhysique}" var="client">
					<tr>
						<td>${client.id}</td>
						<td>${client.version}</td>
						<td>${client.nom}</td>
						<td>${client.prenom}</td> 
						<td>${client.numeroTel}</td>
						<td>${client.numeroFax}</td>
						<td>${client.email}</td>
						<td>${client.adresse.rue}</td>
						<td>${client.adresse.codePostal}</td>
						<td>${client.adresse.ville}</td>
						<td>${client.adresse.pays}</td>
						
					</tr>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="10"><a href="clientPhysiqueAdd" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
					<td><a href="clientPhysiqueEdit?id=${client.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span></a></td>
					<td><a href="clientDelete?id=${client.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>