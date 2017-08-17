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
<title><spring:message code="logins.title" /></title>
</head>
<body>
	<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="logins.fieldset" />
			</legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="logins.id" /></th>
					<th><spring:message code="logins.login" /></th>
					<th><spring:message code="logins.motDePasse" /></th>
					<th><spring:message code="logins.admin" /></th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${logins}" var="login">
					<tr>
						<td>${login.id}</td>
						<td>${login.login}</td>
						<td>${login.motDePasse}</td>
						<td><label class="checkbox disabled"><input
								type="checkbox" checked="${login.admin}" disabled>Admin</label></td>
						<td><a href="edit?id=${login.id}" class="btn btn-info btn-xs"><span
								class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="delete?id=${login.id}"
							class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8"><a href="add" class="btn btn-success btn-sm"><span
							class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>