<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">
	<div class="d-flex justify-content-between align-items-end mb-3">
		<h1 id="title">Contacts du Groupe: <span class="fw-bold">${grpModel.nom}</span></h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/ContactsToAjouterGroupe/${grpModel.idGroupe}" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-user-plus me-2"></i>Ajouter autre Contacts
				</a>
			</button>
		</div>
	</div>

	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:if test="${not empty listContacts}">
			<c:forEach items="${listContacts}" var="contact">
				<div class="col">
					<div class="card h-100">
						<div class="card-header d-flex justify-content-between align-items-center">
							<h5 class="fw-bold">${contact.nom} ${contact.prenom}</h5>
							<button type="button" class="btn btn-danger text-truncate">
								<a href="${pageContext.request.contextPath}/supprimerContactOfGroupe/${grpModel.idGroupe}/${contact.idContact}" class="text-reset text-decoration-none text-truncate">
									<i class="fa fa-user-minus me-2"></i> Enlever
								</a>
							</button>
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
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
</div>
</body>
</html>