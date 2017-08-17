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
<<<<<<< .mine
<title><spring:message code="loginEdit.title"/></title>
=======
<title><spring:message code="loginsEdit.title" /></title>
>>>>>>> .theirs
</head>
<body>
<<<<<<< HEAD
	<jsp:include page="/WEB-INF/menu.jsp" />
=======
<jsp:include page="/WEB-INF/menu.jsp" />
>>>>>>> 2775dec... KM
	<div class="container">
		<fieldset>
<<<<<<< .mine
			<legend><spring:message code="loginEdit.fieldset"/></legend>
			<form:form modelAttribute="login" action="Save" method="post">


=======
			<legend>
				<spring:message code="loginsEdit.fieldset" />
			</legend>
			<form:form modelAttribute="login" action="save" method="post">
>>>>>>> .theirs
				<form:hidden path="id" />
<<<<<<< .mine
				<form:hidden path="version" />	

=======
				<form:hidden path="version" />

>>>>>>> .theirs
				<div class="form-group">
<<<<<<< .mine
					<form:label path="login"><spring:message code="loginEdit.login"/></form:label>
					<form:input path="login" type="text" cssClass="form-control" cssStyle="width: 400px"/>












=======
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
>>>>>>> .theirs
					<form:errors path="login"/>
				</div>

				<div class="form-group">
<<<<<<< .mine
					<form:label path="motDePasse"><spring:message code="loginEdit.motDePasse"/></form:label>
					<form:input path="motDePasse" type="text" cssClass="form-control" cssStyle="width: 400px"/>



=======
					<form:label path="motDePasse">
						<spring:message code="loginsEdit.motDePasse" />
					</form:label>
					<form:input path="motDePasse" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
>>>>>>> .theirs
<<<<<<< .mine
					<form:errors path="motDePasse"/>
				</div>	
=======
				</div>

>>>>>>> .theirs
				<div class="form-group">
<<<<<<< .mine
					<form:label path="admin"><spring:message code="loginEdit.admin"/></form:label>
					<form:input path="admin" type="boolean" cssClass="form-control" cssStyle="width: 400px"/>



=======
					<form:label path="admin">
						<spring:message code="loginsEdit.admin" />
					</form:label>
					<form:input path="admin" type="text" cssClass="form-control"
						cssStyle="width: 400px" />
>>>>>>> .theirs
				</div>
<<<<<<< .mine

=======

>>>>>>> .theirs
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
<<<<<<< .mine
				<button class="btn btn-warning">
					<span class="glyphicon glyphicon-arrow-left"></span>
=======
				<a href="cancel" class="btn btn-warning"> <span
					class="glyphicon glyphicon-arrow-left"></span>
>>>>>>> .theirs
				</button>
			</form:form>
		</fieldset>
	</div>
</body>
</html>