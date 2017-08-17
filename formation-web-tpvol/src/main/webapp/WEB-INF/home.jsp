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
<table>
	<tr>
		<td><a href="reservation/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnReservation"/>" />  </a></td>
		<td><a href="vol/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnVol"/>" />  </a></td>
	</tr>
	<tr>
		<td><a href="passager/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnPassager"/>" />  </a>	</td>
		<td><a href="client/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnClient"/>" />  </a></td>
		<td><a href="login/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnLogin"/>" />  </a></td>
	</tr>
	<tr>
		<td><a href="compagnieaerienne/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnCompagnieAerienne"/>" />  </a></td>
		<td><a href="aeroport/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnAeroport"/>" /> </a></td>
		<td><a href="ville/"> <input type="button" class="btn btn-primary btn-lg" value="<spring:message code="home.btnVille"/>" />  </a></td>
	</tr>
	
	
	
	
	
	
	
 </table>
</div>
</body>
</html>