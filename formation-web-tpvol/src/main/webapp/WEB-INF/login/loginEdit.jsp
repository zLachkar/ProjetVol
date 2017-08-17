<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title><spring:message code="loginsEdit.title" /></title>
</head>
<body>
	<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="loginsEdit.fieldset" />
			</legend>
			<form:form modelAttribute="login" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="id">
						<spring:message code="loginsEdit.id" />
					</form:label>
					<form:input path="id" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
					<form:errors path="id" />
				</div>

				<div class="form-group">
					<form:label path="login">
						<spring:message code="loginsEdit.login" />
					</form:label>
					<form:input path="login" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
				</div>

				<div class="form-group">
					<form:label path="motDePasse">
						<spring:message code="loginsEdit.motDePasse" />
					</form:label>
					<form:input path="motDePasse" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
				</div>

				<div class="form-group">
					<form:label path="admin">
						<spring:message code="loginsEdit.admin" />
					</form:label>
					<form:input path="admin" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
				</div>

				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<a href="cancel" class="btn btn-warning"> <span
					class="glyphicon glyphicon-arrow-left"></span>
				</a>
			</form:form>
		</fieldset>
	</div>
</body>
</html>