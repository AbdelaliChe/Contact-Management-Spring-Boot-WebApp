<%@ include file="header.jsp" %>
<div class="container p-4">

	<div class="d-flex justify-content-between align-items-end mb-3">
		<h1 id="title">Mes Groupes</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/groupeForm" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-plus"></i> Ajouter des groupes
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
				<th>Ajouter Contact</th>
				<th>Afficher Contacts</th>
				<th>Modifier</th>
				<th>Supprimer</th>

			</tr>
			</thead>
			<tbody>
			<c:if test="${not empty listGroupes}">
			<c:forEach items="${listGroupes}" var="Groupe">
				<tr>
					<td><c:out value="${Groupe.idGroupe}"></c:out></td>
					<td><c:out value="${Groupe.nom}"></c:out></td>
					<td>
						<button type="button" class="btn btn-outline-dark">
							<a href="${pageContext.request.contextPath}/contactAjoutGroupe/${Groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
								<i class="fas fa-user-plus"></i> Affecter Contacts
							</a>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-outline-dark">
							<a href="${pageContext.request.contextPath}/GroupeContact/${Groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
								<i class="fas fa-users"></i> Afficher Contacts
							</a>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-primary me-2 text-truncate">
							<a href="${pageContext.request.contextPath}/modifierFormGrp/${Groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
								<i class="fas fa-edit"></i> Modifier
							</a>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger text-truncate">
							<a href="${pageContext.request.contextPath}/supprimerGroupe/${Groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
								<i class="fas fa-trash"></i> Supprimer
							</a>
						</button>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>