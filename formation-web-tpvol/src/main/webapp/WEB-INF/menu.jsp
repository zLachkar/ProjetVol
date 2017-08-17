<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"> <spring:message code="home.nav"/></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href = "<c:url value= "/" />"><spring:message code="home.accueil"/></a></li>
      <li><a href = "<c:url value= "/ville/" />"><spring:message code="home.ville"/></a></li>
      <li><a href = "<c:url value= "/aeroport/" />"><spring:message code="home.aeroport"/></a></li>
      <li><a href = "<c:url value= "/vol/" />"><spring:message code="home.vols"/></a></li>
      <li><a href = "<c:url value= "/reservation/" />"><spring:message code="home.reservations"/></a></li>
      <li><a href = "<c:url value= "/passager/" />"><spring:message code="home.passager"/></a></li>
      <li><a href = "<c:url value= "/client/" />"><spring:message code="home.client"/></a></li>
      <li><a href = "<c:url value= "/login/" />"><spring:message code="home.login"/></a></li>
    </ul>
  </div>
</nav>