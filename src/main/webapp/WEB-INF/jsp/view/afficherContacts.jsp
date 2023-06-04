<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">
	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Mes Contacts</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherFormContact" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-user-plus me-2"></i>Ajouter un Contact
				</a>
			</button>
			<button class="btn btn-outline-dark">
				<a href="${pageContext.request.contextPath}/rechercherContactParNom" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-search"></i>
				</a>
			</button>
		</div>
	</div>

	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:if test="${not empty listContacts}">
			<c:forEach items="${listContacts}" var="contact">
				<div class="col">
					<div class="card h-100">
						<div class="card-header d-flex justify-content-center align-items-center">
							 <h5 class="fw-bold">${contact.nom} ${contact.prenom}</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-phone me-2"></i>${contact.telephonePersonnel}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-phone-volume me-2"></i>${contact.telephoneProfessionel}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-map-marker-alt me-2"></i>${contact.adresse}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-envelope me-2"></i>${contact.emailPersonnel}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-envelope-circle-check me-2"></i>${contact.emailProfessionel}</li>
								<li class="fw-bold"><i class="fa fa-venus-mars me-2"></i>${contact.genre}</li>
							</ul>
						</div>
						<div class="card-footer bg-transparent d-flex justify-content-between h-100">
							<button type="button" class="btn btn-primary me-2" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/affectationForm/${contact.idContact}" class="text-reset text-decoration-none">
									<i class="fa fa-users me-2"></i>${contact.grpC.nom}
								</a>
							</button>
							<div>
							<button type="button" class="btn btn-light btn-outline-secondary me-2" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/modifierContactForm/${contact.idContact}" class="text-reset text-decoration-none">
									<i class="fa fa-edit"></i>
								</a>
							</button>
							<button type="button" class="btn btn-danger" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/supprimerContact/${contact.idContact}" class="text-reset text-decoration-none">
									<i class="fa fa-trash"></i>
								</a>
							</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>

</body>
</html>