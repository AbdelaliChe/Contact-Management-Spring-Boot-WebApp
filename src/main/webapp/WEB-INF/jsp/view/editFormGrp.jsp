<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Ajouter Contact Forme</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
form {
	margin-bottom: 60px;
	margin-top: 10px;
	padding: 10px;
}

h3 {
	margin-top: 20px;
}
</style>


</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
												href="${pageContext.request.contextPath}/afficherForm">Ajout Contact</a></li>
						<li class="nav-item"><a class="nav-link"
												aria-current="page"
												href="${pageContext.request.contextPath}/afficherContacts">Mes Contacts</a></li>
						<li class="nav-item"><a class="nav-link"
												href="${pageContext.request.contextPath}/rechercherNomContact">Rechercher Contact</a></li>
						<li class="nav-item"><a class="nav-link active"
												href="${pageContext.request.contextPath}/groupeForm">Ajout Groupe</a></li>
						<li class="nav-item"><a class="nav-link"
												href="${pageContext.request.contextPath}/afficherGroupes">Mes Groupes</a></li>
						<li class="nav-item"><a class="nav-link active"
												href="${pageContext.request.contextPath}/rechercherGroupe">Rechercher Groupe</a></li>
					</ul>
				</div>
			</div>
		</nav>






		<div>
			<h3>Ajouter Groupe</h3>
		</div>
		<div>

			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>



			<f:form action="/modifierGroupe" method="POST" modelAttribute="grpModel">

				<div class="row">
					<label>Nom</label>
					<input type="hidden" name="idGroupe" value="${grpModel.idGroupe}"/>
					<f:input path="Nom" type="text" class="form-control" placeholder="Nom" />
					<f:errors path="Nom" class="text-danger" />
				</div><br>
				<div class="row">
					<button type="submit" class="btn btn-primary">Modifier</button>
				</div>

			</f:form>
		</div>


	</div>
</body>
</html>