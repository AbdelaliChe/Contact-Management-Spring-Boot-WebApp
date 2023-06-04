<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>
<div class="container p-4">

	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Mes Groupes</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/groupeForm" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-plus me-2"></i>Ajouter des groupes
				</a>
			</button>
			<button class="btn btn-outline-dark">
				<a href="${pageContext.request.contextPath}/rechercherGroupe" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-search"></i>
				</a>
			</button>
		</div>
	</div>
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:if test="${not empty listGroupes}">
			<c:forEach items="${listGroupes}" var="groupe">
				<div class="col">
					<div class="card h-100">
						<div class="card-header d-flex justify-content-between align-items-center">
							<h5 class="fw-bold">${groupe.nom}</h5>
							<div class="d-flex justify-content-between align-items-center">
								<button type="button" class="btn btn-primary me-2 text-truncate">
									<a href="${pageContext.request.contextPath}/ContactsToAjouterGroupe/${groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
										<i class="fa fa-user-plus"></i>
									</a>
								</button>
								<button type="button" class="btn btn-light btn-outline-secondary me-2">
									<a href="${pageContext.request.contextPath}/modifierGrpForm/${groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
										<i class="fa fa-edit"></i>
									</a>
								</button>
								<button type="button" class="btn btn-danger text-truncate">
									<a href="${pageContext.request.contextPath}/supprimerGroupe/${groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
										<i class="fa fa-trash"></i>
									</a>
								</button>
							</div>
						</div>
						<div class="card-body">
							<c:if test="${not empty groupe}">
								<ul class="list-unstyled overflow-auto max-height-150">
									<c:set var="contactCount" value="0" />
									<c:forEach items="${groupe.contacts}" var="contact">
									<c:if test="${contactCount < 4}">
									<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-user me-2"></i>
											${contact.nom} ${contact.prenom}
									</li>
									<c:set var="contactCount" value="${contactCount + 1}" />
									</c:if>
								</c:forEach>
								</ul>
							</c:if>
						</div>
						<div class="card-footer position-relative fw-bold d-flex justify-content-center align-items-center">
							<button type="button" class="btn">
								<a href="${pageContext.request.contextPath}/afficherContactsOfGroupe/${groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
									<i class="fa fa-users me-2"></i>Afficher toutes les Contacts du Groupe
								</a>
							</button>
							<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									${groupe.contacts.size()-contactCount}+
							</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	</div>
</div>
</body>
</html>
