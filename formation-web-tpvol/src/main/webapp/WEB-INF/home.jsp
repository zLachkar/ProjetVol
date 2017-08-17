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
<title><spring:message code="home.accueil"/></title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="container">

<c:url value="/reservation/" var="resaUrl"/>
<c:url value="/vol/" var="volUrl"/>
<c:url value="/passager/" var="passUrl"/>
<c:url value="/client/" var="cliUrl"/>
<c:url value="/login/" var="loginUrl"/>
<c:url value="/compagnieaerienne/" var="cieaUrl"/>
<c:url value="/aeroport/" var="aeroUrl"/>
<c:url value="/ville/" var="villeUrl"/>

<table> 
	<tr>
		<td><a href="${resaUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnReservation"/>" />  </a></td>
		<td><a href="${volUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnVol"/>" />  </a></td>
	</tr>
	<tr>
		<td><a href="${passUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnPassager"/>" />  </a>	</td>
		<td><a href="${cliUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnClient"/>" />  </a></td>
		<td><a href="${loginUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnLogin"/>" />  </a></td>
	</tr>
	<tr>
		<td><a href="/COMPA/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnCompagnieAerienne"/>" />  </a></td>
		<td><a href="${aeroUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnAeroport"/>" /> </a></td>
		<td><a href="${villeUrl}"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnVille"/>" />  </a></td>
	</tr>
	
	
	
	
	
	
	
 </table>
</div>
</body>
</html>