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
<title><spring:message code="loginEdit.title"/></title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend><spring:message code="loginEdit.fieldset"/></legend>
			<form:form modelAttribute="login" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />	
				<div class="form-group">
					<form:label path="login"><spring:message code="loginEdit.login"/></form:label>
					<form:input path="login" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="login"/>
				</div>
				
				<div class="form-group">
					<form:label path="motDePasse"><spring:message code="loginEdit.motDePasse"/></form:label>
					<form:input path="motDePasse" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="motDePasse"/>
				</div>	
				<div class="form-group">
					<form:label path="admin"><spring:message code="loginEdit.admin"/></form:label>
					<form:input path="admin" type="boolean" cssClass="form-control" cssStyle="width: 400px"/>
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