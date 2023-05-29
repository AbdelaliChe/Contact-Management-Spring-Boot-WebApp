<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">
	<div class="d-flex justify-content-between align-items-end mb-3">
		<h1 id="title">Affecter Contact à un Groupe</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-users"></i> Afficher Groupes
				</a>
			</button>
		</div>
	</div>
	<div>
		<form action="/ContactaffecterGroupe" method="POST" modelAttribute="contactModel">

			<input type="hidden" name="idContact" value="${contactModel.idContact}"/>
			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Contact</label>
				<div class="col-sm-10">
					<input path="nom" type="text" class="form-control" value="${contactModel.nom} ${contactModel.prenom}" disabled/>
				</div>
			</div>

			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Numeros Telephone</label>
				<div class="col-sm-10 d-flex">
					<div class="col me-2">
						<input path="telephonePersonnel" type="text" class="form-control" value="Personnel: ${contactModel.telephonePersonnel}" disabled/>
					</div>
					<div class="col ms-2">
						<input path="telephoneProfessionel" type="text" class="form-control" value=" Professionelle: ${contactModel.telephoneProfessionel}" disabled/>
					</div>
				</div>
			</div>

			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Groupes</label>
				<div class="col-sm-10">
					<c:if test="${not empty listGroupes}">
						<c:forEach items="${listGroupes}" var="groupe">
							<label class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="grpC" value="${groupe.idGroupe}"
									${contactModel.grpC == groupe ? 'checked' : ''}> ${groupe.nom}
							</label>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-10 offset-sm-2 d-flex justify-content-end">
					<div>
						<button type="submit" class="btn btn-primary"><i class="fa fa-user-plus text-light"></i> Affecter</button>
						<button type="button" class="btn btn-danger text-truncate">
							<a href="${pageContext.request.contextPath}/supprimerAffectation/${contactModel.idContact}" class="text-reset text-decoration-none text-truncate">
								<i class="fas fa-trash"></i> Supprimer Affectation
							</a>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>
