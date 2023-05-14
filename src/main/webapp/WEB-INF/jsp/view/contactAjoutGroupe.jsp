<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Ajouter au groupe</title>
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
		<h3>Contacts a Ajouter au: ${grpModel.nom}</h3>
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
				<th>Ajouter</th>

			</tr>
			</thead>
			<tbody>
			<c:if test="${not empty listContacts}">
			<c:forEach items="${listContacts}" var="Contact">
			<c:if test="${!grpModel.getContact().contains(Contact)}">
				<tr>
					<td><c:out value="${Contact.idContact}"></c:out></td>
					<td><c:out value="${Contact.nom}"></c:out></td>
					<td><c:out value="${Contact.prenom}"></c:out></td>
					<td><c:out value="${Contact.telephonePeronnel}"></c:out></td>
					<td><c:out value="${Contact.telephoneProfessionel}"></c:out></td>
					<td><c:out value="${Contact.adresse}"></c:out></td>
					<td><c:out value="${Contact.emailPeronnel}"></c:out></td>
					<td><c:out value="${Contact.emailProfessionel}"></c:out></td>
					<td><c:out value="${Contact.genre}"></c:out></td>
					<td><button type="button" class="btn btn-dark btn-rounded btn-sm fw-bold"  data-mdb-ripple-color="dark">
						<a href="${pageContext.request.contextPath}/contactDansGroupe/${grpModel.idGroupe}/${Contact.idContact}" style="color:inherit">Ajouter</a></button></td>
				</tr><td>
			</c:if>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>