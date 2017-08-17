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
<title>Edit Ville</title>
</head>
<body>
	<div class="container">
		<fieldset>
			<legend>Edit ville</legend>
			<form:form modelAttribute="ville" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />
				
				<div class="form-group">
					<form:label path="nom">Nom</form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"  readonly="${mode == 'edit'}"/>
				<FONT color="red">	<form:errors path="nom" cssClass="error" /></FONT>
				</div>
				
				
				
				<div class="form-group">
					<label for="idARP" path="aeroports">Aeroports</label>
					<select  name="idARP" cssClass="form-control" cssStyle="width: 400px" >
						<!-- <option  disabled selected>Choisir Aeroport!</option> -->
						<option value="" selected>Choisir Aeroport!</option>
						<c:forEach items="${aeroports}" var="civ">
							<option value="${civ.id}" >${civ.nom}</option>
						</c:forEach>
						
					</select>
				</div>			
			<%-- 	<div class="form-group">
					<label for="idFormateur"><spring:message code="eleveEdit.formateur"/></label>
					<select name="idFormateur" cssClass="form-control" cssStyle="width: 400px">
						<c:forEach items="${formateurs}" var="formateur">
							<option value="${formateur.id.nom}|${formateur.id.prenom}">${formateur.id.nom} ${formateur.id.prenom}</option>
						</c:forEach>
					</select>
				</div> --%>
			
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<a href="cancel" class="btn btn-warning">
					<span class="glyphicon glyphicon-arrow-left"></span>
				</a>
			</form:form>
		</fieldset>
	</div>
</body>
</html>