<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>t-Contacts</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css">
	<link rel="icon" type="image/svg" href="images/favicon.svg">
	<script type="text/javascript" src="js/navlink.js" defer></script>
</head>
<body class="bg-primary">
<nav class="navbar navbar-expand-lg navbar-light navbar-dark bg-primary px-3 fixed-top">
	<div class="container-fluid">
		<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/accueil">Accueil</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/afficherFormContact">Ajout Contact</a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/afficherContacts">Mes Contacts</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/rechercherContactParNom">Rechercher Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/groupeForm">Ajout Groupe</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/afficherGroupes">Mes Groupes</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/rechercherGroupe">Rechercher Groupe</a></li>
			</ul>
		</div>
	</div>
</nav>

<div class="container py-5">
	<section class="jumbotron jumbotron-fluid text-center mt-4">
		<div class="container">
			<h1 class="display-4">
				<i class="fas fa-square-phone text-light me-2"></i><span class="fw-bold text-light">t-Contacts</span>
			</h1>
			<h2 class="text-light fw-bold mt-4">Gérez facilement vos contacts et groupes</h2>
			<h5 class="text-light mt-2">Simplifiez votre organisation, gardez vos contacts et groupes sous contrôle avec t-Contacts WebApp</h5>
		</div>
	</section>

	<section class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-body">
						<h5 class="card-title">Contacts</h5>
						<p class="card-text">Consulter votre liste des Contacts</p>
					</div>
					<div class="card-footer bg-transparent d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-danger me-2" data-mdb-ripple-color="dark">
							<a href="${pageContext.request.contextPath}/afficherContacts" class="text-reset text-decoration-none">
								<i class="fas fa-users me-2"></i>${nbrOfConatcts} contacts
							</a>
						</button>
						<div>
							<button class="btn btn-outline-dark">
								<a href="${pageContext.request.contextPath}/rechercherContactParNom" class="text-reset text-decoration-none text-truncate">
									<i class="fas fa-search"></i>
								</a>
							</button>
							<button type="button" class="btn btn-light btn-dark" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/afficherFormContact" class="text-reset text-decoration-none">
									<i class="fas fa-plus"></i>
								</a>
							</button>
							<button type="button" class="btn btn-primary" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/afficherContacts" class="text-reset text-decoration-none">
									<i class="fas fa-eye"></i>
								</a>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-body">
						<h5 class="card-title">Groupes</h5>
						<p class="card-text">Consulter votre Groupes de Contacts</p>
					</div>
					<div class="card-footer bg-transparent d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-danger me-2" data-mdb-ripple-color="dark">
							<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none">
								<i class="fas fa-users me-2"></i>${nbrOfGroupes} groupes
							</a>
						</button>
						<div>
							<button class="btn btn-outline-dark">
								<a href="${pageContext.request.contextPath}/rechercherGroupe" class="text-reset text-decoration-none text-truncate">
									<i class="fas fa-search"></i>
								</a>
							</button>
							<button type="button" class="btn btn-light btn-dark" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/groupeForm" class="text-reset text-decoration-none">
									<i class="fas fa-plus"></i>
								</a>
							</button>
							<button type="button" class="btn btn-primary" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none">
									<i class="fas fa-eye"></i>
								</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<div class="image-container">
	<img src="images/contacts1.svg" alt="accueil" class="img-fluid">
</div>

<footer class="footer bg-light text-center py-3 d-flex align-items-center">
	<div class="container">
		<p class="mb-0">&copy; 2023 t-Contacts.</p>
	</div>
</footer>

</body>
</html>
