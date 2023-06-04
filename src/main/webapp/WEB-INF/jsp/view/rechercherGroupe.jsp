<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>
<div class="container p-4">


	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Rechercher Groupes</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-list me-2"></i>Afficher liste des groupes
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
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</f:form>

	</div>


<c:if test="${not empty groupeR}">
	<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach items="${groupeR}" var="groupe">
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
						<div class="card-footer fw-bold d-flex justify-content-center align-items-center">
							<button type="button" class="btn">
								<a href="${pageContext.request.contextPath}/afficherContactsOfGroupe/${groupe.idGroupe}" class="text-reset text-decoration-none text-truncate">
									<i class="fa fa-users me-2"></i>Afficher toutes les Contacts du Groupe
								</a>
							</button>
						</div>
					</div>
				</div>
			</c:forEach>
	</div>
</c:if>
</div>
</body>
</html>