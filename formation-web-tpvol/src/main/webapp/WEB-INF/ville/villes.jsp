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
<title><spring:message code="villes.title"/></title>
</head>
<body>


<div class="container">
		<fieldset>
			<legend><spring:message code="villes.fieldset"/></legend>
			<table class="table table-striped">
				<tr>
	
					<th><spring:message code="villes.nom"/></th>
					
					<th>Aeroport</th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${villes}" var="ville">
					<tr>
						<td>${ville.nom}</td>
						
						<td><a href="arp?id=${ville.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-plane"></span></a></td>
						<td><a href="delete?id=${ville.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
						<td><a href="edit?id=${ville.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>