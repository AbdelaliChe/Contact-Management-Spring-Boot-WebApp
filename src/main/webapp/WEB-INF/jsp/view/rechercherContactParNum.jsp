<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>
<div class="container p-4">


	<div class="d-flex justify-content-between align-items-end mb-5">
		<h1 id="title">Rechercher Contacts Par Num-Tele</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/rechercherContactParNom" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-user me-2"></i>Par Nom
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

		<f:form action="/NumContactRechercher" method="POST">
			<div class="form-group row mb-5">
				<div class="input-group">
					<div class="form-outline flex-grow-1">
						<input name="telephone" type="text" class="form-control"
							   placeholder="Telephone Peronnel ou Professionelle" />
						<f:errors path="telephone" class="text-danger" />
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</f:form>

	</div>

	<c:if test="${not empty contactR}">
		<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="card h-100">
						<div class="card-header d-flex justify-content-center align-items-center">
							<h5 class="fw-bold">${contactR.nom} ${contactR.prenom}</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-phone me-2"></i>${contactR.telephonePersonnel}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-phone-volume me-2"></i>${contactR.telephoneProfessionel}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-map-marker-alt me-2"></i>${contactR.adresse}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-envelope me-2"></i>${contactR.emailPersonnel}</li>
								<li class="border-bottom pb-2 mb-2 fw-bold"><i class="fa fa-envelope-circle-check me-2"></i>${contactR.emailProfessionel}</li>
								<li class="fw-bold"><i class="fas fa-venus-mars me-2"></i>${contactR.genre}</li>
							</ul>
						</div>
						<div class="card-footer bg-transparent d-flex justify-content-between h-100">
							<button type="button" class="btn btn-primary me-2" data-mdb-ripple-color="dark">
								<a href="${pageContext.request.contextPath}/affectationForm/${contactR.idContact}" class="text-reset text-decoration-none">
									<i class="fas fa-users"></i> ${contactR.grpC.nom}
								</a>
							</button>
							<div>
								<button type="button" class="btn btn-light btn-outline-secondary me-2" data-mdb-ripple-color="dark">
									<a href="${pageContext.request.contextPath}/modifierContactForm/${contactR.idContact}" class="text-reset text-decoration-none">
										<i class="fas fa-edit"></i>
									</a>
								</button>
								<button type="button" class="btn btn-danger" data-mdb-ripple-color="dark">
									<a href="${pageContext.request.contextPath}/supprimerContact/${contactR.idContact}" class="text-reset text-decoration-none">
										<i class="fas fa-trash"></i>
									</a>
								</button>
							</div>
						</div>
					</div>
				</div>
		</div>
	</c:if>
</div>
</div>
</body>
</html>