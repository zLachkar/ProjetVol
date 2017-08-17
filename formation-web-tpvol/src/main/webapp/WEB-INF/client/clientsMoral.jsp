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
<title><spring:message code="clientsMoral.title"/></title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
<div class="container">

		<fieldset>
			<legend><spring:message code="clientsMoral.fieldset"/></legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="clientsMoral.id"/></th>
					<th><spring:message code="clientsMoral.version"/></th>
					<th><spring:message code="clientsMoral.nom"/></th>
					<th><spring:message code="clientsMoral.siret"/></th>
					<th><spring:message code="clientsMoral.numeroTel"/></th>
					<th><spring:message code="clientsMoral.numeroFax"/></th>
					<th><spring:message code="clientsMoral.email"/></th>
					<th><spring:message code="clientsMoral.rue"/></th>
					<th><spring:message code="clientsMoral.codePostal"/></th>
					<th><spring:message code="clientsMoral.ville"/></th>
						<th><spring:message code="clientsMoral.pays"/></th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${clientsMoral}" var="client">
					<tr>
						<td>${client.id}</td>
						<td>${client.version}</td>
						<td>${client.nom}</td>
						<td>${client.siret}</td>
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
					<td colspan="10"><a href="clientMoralAdd" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
					<td><a href="clientMoralEdit?id=${client.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span></a></td>
					<td><a href="clientDelete?id=${client.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>l>