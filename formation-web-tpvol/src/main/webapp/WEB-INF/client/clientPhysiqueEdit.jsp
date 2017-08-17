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
<title><spring:message code="clientPhysiqueEdit.title"/></title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend><spring:message code="clientPhysiqueEdit.fieldset"/></legend>
			<form:form modelAttribute="client" action="clientPhysiqueSave" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />	
				<div class="form-group">
					<form:label path="nom"><spring:message code="clientPhysiqueEdit.nom"/></form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="nom"/>
				</div>
				
				<div class="form-group">
					<form:label path="prenom"><spring:message code="clientPhysiqueEdit.prenom"/></form:label>
					<form:input path="prenom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="prenom"/>
				</div>	
				<div class="form-group">
					<form:label path="numeroTel"><spring:message code="clientPhysiqueEdit.numeroTel"/></form:label>
					<form:input path="numeroTel" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="numeroTel"/>
				</div>	
				<div class="form-group">
					<form:label path="numeroFax"><spring:message code="clientPhysiqueEdit.numeroFax"/></form:label>
					<form:input path="numeroFax" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="numeroFax"/>
				</div>	
				<div class="form-group">
					<form:label path="email"><spring:message code="clientPhysiqueEdit.email"/></form:label>
					<form:input path="email" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="email"/>
				</div>	
				<div class="form-group">
					<form:label path="adresse.rue"><spring:message code="clientPhysiqueEdit.rue"/></form:label>
					<form:input path="adresse.rue" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
				<div class="form-group">
					<form:label path="adresse.codePostal"><spring:message code="clientPhysiqueEdit.codePostal"/></form:label>
					<form:input path="adresse.codePostal" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
			
				<div class="form-group">
					<form:label path="adresse.ville"><spring:message code="clientPhysiqueEdit.ville"/></form:label>
					<form:input path="adresse.ville" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.ville"><spring:message code="clientPhysiqueEdit.pays"/></form:label>
					<form:input path="adresse.ville" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<button class="btn btn-warning">
					<span class="glyphicon glyphicon-arrow-left"></span>
				</button>
			</form:form>
		</fieldset>
	</div>
</body>
</html>