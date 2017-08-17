<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"> <spring:message code="home.nav"/></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#"><spring:message code="home.accueil"/></a></li>
      <li><a href="/formation-web-tpvol/ville/"><spring:message code="home.ville"/></a></li>
      <li><a href="/formation-web-tpvol/aeroport/"><spring:message code="home.aeroport"/></a></li>
      <li><a href="/formation-web-tpvol/vol/"><spring:message code="home.vols"/></a></li>
      <!--<li><a href="/formation-web-tpvol/vol/COMPA?id=${vol.id}"><spring:message code="home.compagnieAerienne"/></a></li>-->
      <li><a href="/formation-web-tpvol/reservation/"><spring:message code="home.reservations"/></a></li>
      <li><a href="/formation-web-tpvol/passager/"><spring:message code="home.passager"/></a></li>
      <li><a href="/formation-web-tpvol/client/"><spring:message code="home.client"/></a></li>
      <li><a href="/formation-web-tpvol/login/"><spring:message code="home.login"/></a></li>
    </ul>
  </div>
</nav>