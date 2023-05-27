<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">
	<div class="d-flex justify-content-between align-items-end mb-3">
		<h1 id="title">Contacts du Groupe: ${grpModel.nom}</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/contactAjoutGroupe/${grpModel.idGroupe}" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-user-plus"></i> Ajouter autre Contacts
				</a>
			</button>
		</div>
	</div>

	<div class="table-responsive">
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
			<tr>
				<th>Id</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Téléphone Personnel</th>
				<th>Téléphone Professionnel</th>
				<th>Adresse</th>
				<th>Email Personnel</th>
				<th>Email Professionnel</th>
				<th>Genre</th>
				<th>Supprimer</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${not empty listContacts}">
			<c:forEach items="${listContacts}" var="contact">
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
				<td>
					<button type="button" class="btn btn-danger text-truncate">
						<a href="${pageContext.request.contextPath}/supprimerContactGroupe/${grpModel.idGroupe}/${contact.idContact}" class="text-reset text-decoration-none text-truncate">
							<i class="fas fa-trash"></i> Enlever du Groupe
						</a>
					</button>
				</td>
			</tr><td>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>