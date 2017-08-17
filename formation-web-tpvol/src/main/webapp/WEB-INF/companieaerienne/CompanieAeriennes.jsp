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
<title>Companie Aeriennes</title>
</head>
<body>
	<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>Companie Aeriennes</legend>
			<table class="table table-striped">
				<tr>

					<th>Nom</th>
					<th>Vol ID</th>
					<th></th>
				</tr>

				<c:forEach items="${companiesOFvoles}" var="X">
					<tr>

						<td>${X.nom}</td>
						<td>${vol.id}</td>


						<td><a href="edit?id=${vol.id}" class="btn btn-info btn-xs"><span
								class="glyphicon glyphicon-pencil"></span></a></td>

						<%-- <td><a href="delete?id=${vol.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td> --%>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3"><a href="add" class="btn btn-success btn-sm"><span
							class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>