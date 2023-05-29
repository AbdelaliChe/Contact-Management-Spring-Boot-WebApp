<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>
<div class="container p-4">


	<div class="d-flex justify-content-between align-items-end mb-5">
		<h1 id="title">Rechercher Groupes</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-list"></i> Afficher liste des groupes
				</a>
			</button>
		</div>
	</div>

	<c:if test="${infoMsg!=null}">
		<div class="alert alert-success" role="alert">${infoMsg}</div>
	</c:if>
	<c:if test="${errorMsg!=null}">
		<div class="alert alert-danger" role="alert">${errorMsg}</div>
	</c:if>

	<div>

		<f:form action="/groupeRechercher" method="POST" modelAttribute="grpModel">
			<div class="form-group row mb-5">
				<div class="input-group">
					<div class="form-outline flex-grow-1">
						<f:input path="nom" type="text" class="form-control"
								 placeholder="Nom" />
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</f:form>

	</div>


<c:if test="${not empty groupeR}">
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
				<c:forEach items="${groupeR}" var="Groupe">
					<tr>
						<td><c:out value="${Groupe.idGroupe}"></c:out></td>
						<td><c:out value="${Groupe.nom}"></c:out></td>
						<td>
							<button type="button" class="btn btn-light btn-outline-secondary mx-1">
								<a href="${pageContext.request.contextPath}/contactAjoutGroupe/${Groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
									<i class="fas fa-user-plus"></i> Affecter Contacts
								</a>
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-light btn-outline-secondary mx-1">
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
			</tbody>
		</table>
	</div>
</c:if>
</div>
</body>
</html>