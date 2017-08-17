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
<title><spring:message code="home.accueil" /></title>
<style>
a {
    color: #E0E0E0;
    text-decoration: none;
    text-style: bold;
}

.tile {
	width: 45%;
	height: 150px;
	font-size: 35px;
	text-align: center;
	margin: 10px 25px;
	background: #1abc9c;
	color: #fff;
	position: relative;
	float: left;
	cursor: pointer;
}

.span-text {
	padding-top: 30px;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<div class="tile">
			<a href = "<c:url value= "/reservation/" />"> <span
				class="span-text glyphicon glyphicon-check"> <spring:message
						code="home.btnReservation" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#2ecc71;">
			<a href="vol/"> <span class="span-text glyphicon glyphicon-road">
					<spring:message code="home.btnVol" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#16a085">
			<a href = "<c:url value= "/passager/" />"> <span
				class="span-text glyphicon glyphicon-user"> <spring:message
						code="home.btnPassager" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#f1c40f">
			<a href = "<c:url value= "/client/" />"> <span
				class="span-text glyphicon glyphicon-user"> <spring:message
						code="home.btnClient" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#27ae60">
			<a href = "<c:url value= "/login/" />"> <span
				class="span-text glyphicon glyphicon-user"> <spring:message
						code="home.btnLogin" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#f39c12">
			<a href = "<c:url value= "/compagnieaerienne/" />"> <span
				class="span-text glyphicon glyphicon-home"> <spring:message
						code="home.btnCompagnieAerienne" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#2980b9">
			<a href = "<c:url value= "/aeroport/" />"> <span
				class="span-text glyphicon glyphicon-plane"> <spring:message
						code="home.btnAeroport" />
			</span>
			</a>
		</div>

		<div class="tile" style="background-color:#9b59b6">
			<a href = "<c:url value= "/ville/" />"> <span
				class="span-text glyphicon glyphicon-home"> <spring:message
						code="home.btnVille" />
			</span>
			</a>
		</div>

	</div>
</body>
</html>