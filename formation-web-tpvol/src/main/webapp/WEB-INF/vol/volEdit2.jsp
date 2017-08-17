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
<title>Edit Vol</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp" />
	<div class="container">
		<fieldset>
			<legend>Edit vol</legend>
			<form:form modelAttribute="vol"  action="save" method="post">
			<%-- <input type="hidden" name="mode" value="${mode}"/> --%>
				<form:hidden path="id" />
				<form:hidden path="version" />
				
				<div class="form-group">
					<form:label path="dateDepart">Date de Depart</form:label>
				
					<form:input path="dateDepart" type="date" cssClass="form-control" cssStyle="width: 400px"/>
				<FONT color="red">	<form:errors path="dateDepart" cssClass="error" /></FONT>
				</div>
				<div class="form-group">
					<form:label path="dateArrivee">Date d'arrivée</form:label>
					<form:input path="dateArrivee" type="date" cssClass="form-control" cssStyle="width: 400px"  />
				<FONT color="red">	<form:errors path="dateDepart" cssClass="error" /></FONT>
				</div>
				<div class="form-group">
					<form:label path="heureDepart">Heure de Depart</form:label>
					<form:input path="heureDepart" type="time" cssClass="form-control" cssStyle="width: 400px"  />
				<FONT color="red">	<form:errors path="heureDepart" cssClass="error" /></FONT>
				</div>
				<div class="form-group">
					<form:label path="heureArrivee">Heure d'arrivée</form:label>
					<form:input path="heureArrivee" type="time" cssClass="form-control" cssStyle="width: 400px"  />
				<FONT color="red">	<form:errors path="heureArrivee" cssClass="error" /></FONT>
				</div>
				
				
				<div class="form-group">
 <FONT color="blue"><label for="idARPD" path="aeroports">Depart  :</label></FONT>
					<select  name="idARPD" cssClass="form-control" cssStyle="width: 400px" >
						<!-- <option  disabled selected>Choisir Aeroport!</option> -->
						
						<c:forEach items="${aeroports}" var="civ">
							<option value="${civ.id}" >${civ.nom}</option>
						</c:forEach>
						
					</select>
				</div>
				
				
				
				<div class="form-group">
  <FONT color="green"><label for="idARPA" path="aeroports">Arrivée  :</label></FONT>
					<select  name="idARPA" cssClass="form-control" cssStyle="width: 400px" >
						<!-- <option  disabled selected>Choisir Aeroport!</option> -->
						
						<c:forEach items="${aeroports}" var="civ">
							<option value="${civ.id}" >${civ.nom}</option>
						</c:forEach>
						
					</select>
				</div>	
				<div class="form-group">
 <FONT color="blue"><label for="idCA" path="CA">Compagnie  :</label></FONT>
					<select  name="idCA" cssClass="form-control" cssStyle="width: 400px" >
						<!-- <option  disabled selected>Choisir Aeroport!</option> -->
						
						<c:forEach items="${CA}" var="civ">
							<option value="${civ.id}" >${civ.nom}</option>
						</c:forEach>
						
					</select>
				</div>	
				
			

<%-- 					<a href="EDITESCALE?id=${vol.id}" class="btn btn-primary btn-xs"> <span class="glyphicon glyphicon-list-alt"></span>   </a>
 --%>				<div id="escaleDiv" class="form-group" style="display:none;" class="form-group">
 					<label for="idAEscale" >Creer un escale :aeroport </label>
					<select  name="idAEscale" cssClass="form-control" cssStyle="width: 400px" >
						<!-- <option  disabled selected>Choisir Aeroport!</option> -->
						<c:forEach items="${aeroports}" var="civ">
							<option value="${civ.id}" >${civ.nom}</option>
						</c:forEach>
					</select>
				
					<label for="idHD" >Heure de Depart(hh:mm:ss)</label>
					
					<input  name="idHD" type="text" cssClass="form-control" cssStyle="width: 400px"  />
					
					<label for="idHA" >Heure d' Arrivee(hh:mm:ss)</label>
					<input  name="idHA" type="text" cssClass="form-control" cssStyle="width: 400px"  />
					
					
				</div>
 
 			
				
				
				<!-- <div id="escaleDiv"  style="display:none;" class="form-group" > WELCOME</div> -->
				<input type="button" name="answer" value="Creer un escale" onclick="showDiv()" />	
				<div class="form-group">
					<script>
						function showDiv() {
  							 document.getElementById('escaleDiv').style.display = "block";
						}
					</script>	
				</div>
				
					
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