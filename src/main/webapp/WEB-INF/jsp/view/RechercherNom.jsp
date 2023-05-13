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
					<li class="nav-item"><a class="nav-link active"
											href="${pageContext.request.contextPath}/rechercherNomContact">Rechercher Contact</a></li>
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


	<div>
		<h3> Rechercher Contacts Par Nom</h3>
	</div>
	<div class="col text-right">
		<button type="button" class="btn btn-light btn-rounded btn-sm fw-bold"  data-mdb-ripple-color="dark">
			<a href="${pageContext.request.contextPath}/rechercherNomContact" style="color:inherit">Rechercher Par Nom</a></button>
		<button type="button" class="btn btn-light btn-rounded btn-sm fw-bold"  data-mdb-ripple-color="dark">
			<a href="${pageContext.request.contextPath}/rechercherNumContact" style="color:inherit">Rechercher Par Tele</a></button>
	</div>

	<c:if test="${infoMsg!=null}">
		<div class="alert alert-success" role="alert">${infoMsg}</div>
	</c:if>
	<c:if test="${errorMsg!=null}">
		<div class="alert alert-danger" role="alert">${errorMsg}</div>
	</c:if>

	<div>

		<f:form action="/NomContactrechercher" method="POST" modelAttribute="contactModel">
		<div class="row">
			<label>Nom</label>
			<f:input path="Nom" type="text" class="form-control"
					 placeholder="Nom" />
			<f:errors path="Nom" class="text-danger" />
		</div><br>
		<div class="row">
			<button type="submit" class="btn btn-primary">Chercher</button>
		</div>
		</f:form>

	</div>

	<div>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
			<tr>
				<th>Id</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Telephone Peronnel</th>
				<th>Telephone Professionel</th>
				<th>Adresse</th>
				<th>Email Peronnel</th>
				<th>Email Professionel</th>
				<th>Genre</th>
				<th>Modifier</th>
				<th>Supprimer</th>

			</tr>
			</thead>
			<tbody>
			<c:if test="${not empty contactR}">
			<c:forEach items="${contactR}" var="contact">
			<tr>
					<td><c:out value="${contact.idContact}"></c:out></td>
					<td><c:out value="${contact.nom}"></c:out></td>
					<td><c:out value="${contact.prenom}"></c:out></td>
					<td><c:out value="${contact.telephonePeronnel}"></c:out></td>
					<td><c:out value="${contact.telephoneProfessionel}"></c:out></td>
					<td><c:out value="${contact.adresse}"></c:out></td>
					<td><c:out value="${contact.emailPeronnel}"></c:out></td>
					<td><c:out value="${contact.emailProfessionel}"></c:out></td>
					<td><c:out value="${contact.genre}"></c:out></td>
					<td><button type="button" class="btn btn-light btn-rounded btn-sm fw-bold"  data-mdb-ripple-color="dark">
						<a href="${pageContext.request.contextPath}/modifierForm/${contact.idContact}" style="color:inherit">Modifier</a></button></td>
					<td><button type="button" class="btn btn-dark btn-rounded btn-sm fw-bold" data-mdb-ripple-color="dark">
						<a href="${pageContext.request.contextPath}/supprimerContact/${contact.idContact}" style="color:inherit">Supprimer</a></button></td>
			</tr>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>