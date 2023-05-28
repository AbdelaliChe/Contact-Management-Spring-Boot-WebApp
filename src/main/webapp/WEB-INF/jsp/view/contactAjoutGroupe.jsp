<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">
	<div class="d-flex justify-content-between align-items-end mb-3">
		<h1 id="title">Ajouter Contacts a: ${grpModel.nom}</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/GroupeContact/${grpModel.idGroupe}" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-users"></i> Afficher Contacts de ce Groupe
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
				<th>Prenom</th>
				<th>Telephone Peronnel</th>
				<th>Telephone Professionel</th>
				<th>Adresse</th>
				<th>Email Peronnel</th>
				<th>Email Professionel</th>
				<th>Genre</th>
				<th>Groupe</th>
				<th>Ajouter</th>

			</tr>
			</thead>
			<tbody>
			<c:if test="${not empty listContacts}">
			<c:forEach items="${listContacts}" var="contact">
			<c:if test="${!grpModel.getContact().contains(contact)}">
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
						<button type="button" class="btn btn-primary me-2 text-truncate" data-mdb-ripple-color="dark" disabled>
							<i class="fas fa-users"></i>  ${contact.grpC.nom}
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-primary me-2 text-truncate" data-mdb-ripple-color="dark">
							<a href="${pageContext.request.contextPath}/contactDansGroupe/${grpModel.idGroupe}/${contact.idContact}" class="text-reset text-decoration-none text-truncate">
								<i class="fas fa-plus"></i> Ajouter
							</a>
						</button>
					</td>
				</tr><td>
			</c:if>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</div>
</body>
</html>