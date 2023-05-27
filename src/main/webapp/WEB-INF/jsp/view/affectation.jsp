<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">

	<div class="d-flex justify-content-between align-items-end mb-3">
		<h1 id="title">Affecter un Contact à un Groupe</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-list"></i> Afficher Groupes
				</a>
			</button>
		</div>
	</div>
	<div>
		<c:if test="${infoMsg != null}">
			<div class="alert alert-success" role="alert">${infoMsg}</div>
		</c:if>
		<c:if test="${errorMsg != null}">
			<div class="alert alert-danger" role="alert">${errorMsg}</div>
		</c:if>

		<f:form action="/affecterContactGrp" method="POST" modelAttribute="contactModel">
			<input type="hidden" name="idContact" value="${contactModel.idContact}"/>
			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Nom</label>
				<div class="col-sm-10">
					<input path="nomPrenom" type="text" class="form-control" value="${contactModel.nom} ${contactModel.prenom}" disabled/>
				</div>
			</div>

			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Groupes</label>
				<div class="col-sm-10">
					<c:if test="${not empty listGroupes}">
						<c:forEach items="${listGroupes}" var="groupe">
							<label class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="GroupContactId" value="${groupe.nom}" ${contactModel.grpC == groupe ? 'checked' : ''}>
									${groupe.nom}
								<input type="hidden" name="groupId" value="${groupe.idGroupe}" />
							</label>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-10 offset-sm-2 d-flex justify-content-end">
					<div>
						<button type="submit" class="btn btn-primary"><i class="fa fa-users text-light"></i> Affecter</button>
						<button type="reset" class="btn btn-outline-primary">
							<i class="fas fa-undo"></i> Réinitialiser
						</button>
					</div>
				</div>
			</div>
		</f:form>
	</div>
</div>
</body>
</html>
