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
<title><spring:message code="passagerEdit.title" /></title>
</head>
<body>
	<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="passagerEdit.fieldset" />
			</legend>
			<form:form modelAttribute="passager" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="nom">
						<spring:message code="passagerEdit.nom" />
					</form:label>
					<form:input path="nom" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
					<form:errors path="nom" />
				</div>

				<div class="form-group">
					<form:label path="prenom">
						<spring:message code="passagerEdit.prenom" />
					</form:label>
					<form:input path="prenom" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
					<form:errors path="prenom" />
				</div>
				<div class="form-group">
					<form:label path="adresse.rue">
						<spring:message code="passagerEdit.rue" />
					</form:label>
					<form:input path="adresse.rue" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
				</div>

				<div class="form-group">
					<form:label path="adresse.codePostal">
						<spring:message code="passagerEdit.codePostal" />
					</form:label>
					<form:input path="adresse.codePostal" type="text"
						cssClass="form-control" cssStyle="width: 400px" />
				</div>

				<div class="form-group">
					<form:label path="adresse.ville">
						<spring:message code="passagerEdit.ville" />
					</form:label>
					<form:input path="adresse.ville" type="text"
						cssClass="form-control" cssStyle="width: 400px" />
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