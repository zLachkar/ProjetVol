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
<title><spring:message code="reservations.title"/></title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
<div class="container">
		<fieldset>
			<legend><spring:message code="reservations.fieldset"/></legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="reservations.id"/></th>
					<th><spring:message code="reservations.dateResa"/></th>
					<th><spring:message code="reservations.numero"/></th>
					
					<th></th><th></th>
				</tr>

				<c:forEach items="${reservations}" var="reservation">
					<tr>
						<td>${reservation.id}</td>
						<td><fmt:formatDate value="${reservation.dateResa}" pattern="dd/MM/yyyy"/></td>
						<td>${reservation.numero}</td>
						<td><a href="edit?id=${reservation.id}" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="delete?id=${reservation.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
						<th></th>
					</tr>
				</c:forEach>
				<tr>
				<th></th>
					<td colspan="5"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>