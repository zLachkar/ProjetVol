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
<title>Liste des Vols</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
<div class="container">
		<fieldset>
			<legend>Liste des Vols</legend>
			<table class="table table-striped">
				<tr>
					<th>ID</th>
					<th>DateDepart</th>
					<th>DateArrivee</th>
					<th>HeureDepart</th>
					<th>HeureArrivee</th>
					<th>Depart</th>
					<th>Arrivee</th>
					<th>Escales</th>
					<th>Companies</th>
					<th>Reservations</th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${voles}" var="vol">
					<tr>
						<td>${vol.id}</td>
						<td><fmt:formatDate value="${vol.dateDepart}" pattern="dd/MM/yyyy"/></td>
						<td><fmt:formatDate value="${vol.dateArrivee}" pattern="dd/MM/yyyy"/></td>
						<td>${vol.heureDepart}</td>
						<td>${vol.heureArrivee}</td>
						
						<td><span class="glyphicon glyphicon-plane"></span>${vol.depart.nom}</td>
						
						<td><span class="glyphicon glyphicon-plane"></span>${vol.arrivee.nom}</td>
						<td><a href="escales?id=${vol.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-plane"></span></a></td>
						<!-- <button type="button" class="btn btn-primary">Primary <span class="badge">7</span></button> -->
						<td><a href="COMPA?id=${vol.id}" class="btn btn-primary btn-xs"> <span class="glyphicon glyphicon-list-alt"></span>   </a></td>
						<td><a href="../reservation/list?idVol=${vol.id}" class="btn btn-primary btn-xs"> <span class="glyphicon glyphicon-list-alt"></span>   </a></td>
						<%-- <td><a href="COMPA?id=${vol.id}" class="btn btn-info btn-xs">   <span class="glyphicon glyphicon-send"></span>   </a></td> --%>
						<td><a href="edit?id=${vol.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span></a></td>
						
						<td><a href="delete?id=${vol.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="11"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
<%-- <td><a href="COMPA?id=${vol.id}" class="btn btn-primary btn-xs"> CA  <span class="badge"></span>   </a></td>
 --%></html>