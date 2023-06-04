<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<title>t-Contacts</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css">
<link rel="icon" type="image/svg" href="images/favicon.svg">
<script type="text/javascript" src="scripts/navlink.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" defer></script>


</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light navbar-dark bg-primary px-3">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/accueil">
				<i class="fa fa-square-phone text-light fa-lg me-2"></i><span class="fw-bold">t-Contacts</span>
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/accueil">Accueil</a></li>

					<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/afficherFormContact">Ajout Contact</a></li>
					<li class="nav-item"><a class="nav-link"
											aria-current="page"
											href="${pageContext.request.contextPath}/afficherContacts">Mes Contacts</a></li>
					<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/rechercherContactParNom">Rechercher Contact</a></li>
					<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/groupeForm">Ajout Groupe</a></li>
					<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/afficherGroupes">Mes Groupes</a></li>
					<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/rechercherGroupe">Rechercher Groupe</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<sec:authentication property="principal" var="userConnected" />
	<div class="btn-group dropup position-fixed bottom-0 end-0 m-3" style="z-index: 3;">
		<button class="btn btn-primary dropdown-toggle fw-bold" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			<i class="fa fa-circle text-light me-2"></i>${userConnected.user.getNom()} ${userConnected.user.getPrenom()}
		</button>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item text-primary" href="${pageContext.request.contextPath}/modifierUserForm">Modifier Profile<i class="fa fa-user-pen ms-2"></i></a></li>
			<li><hr class="dropdown-divider"></li>
			<li><a class="dropdown-item text-primary" href="${pageContext.request.contextPath}/logout">Se Deconnecter<i class="fa fa-arrow-right-from-bracket ms-2"></i></a></li>
		</ul>
	</div>
