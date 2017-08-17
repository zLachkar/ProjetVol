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
<title>Escales</title>
</head>
<body>
	<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>Escale</legend>
			<table class="table table-striped">
				<tr>
					<th>Aeroport</th>
					<th>Vol</th>
					<th></th>
					<th>HeureArrivee</th>
					<th>HeureDepart</th>
				</tr>

				<c:forEach items="${escales}" var="escale">
					<tr>
						<td>${escale.aeroport.nom}</td>
						<td>${escale.vol.id}</td>
						<th></th>
						<td>${escale.heureArrivee}</td>
						<td>${escale.heureDepart}</td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="5"><a href="cancel" class="btn btn-warning"><span
							class="glyphicon glyphicon-arrow-left"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>