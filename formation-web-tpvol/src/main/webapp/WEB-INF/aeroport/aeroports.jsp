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
<title><spring:message code="aeroports.title"/></title>
</head>
<body>


<div class="container">
		<fieldset>
			<legend><spring:message code="aeroports.fieldset"/></legend>
			<table class="table table-striped">
				<tr>
					
					<th><spring:message code="aeroports.nom"/></th>
					<th>Ville</th>
					
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${aeroports}" var="aeroport">
					<tr>
			
						<td>${aeroport.nom}</td>
						<td><a href="listvilles?id=${aeroport.id}"><span class="glyphicon glyphicon-home"></span></a></td>
						<%-- <td><a href="listvilles?id=${aeroport.id}" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-home"></span></a></td> --%>
						<td><a href="delete?id=${aeroport.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>