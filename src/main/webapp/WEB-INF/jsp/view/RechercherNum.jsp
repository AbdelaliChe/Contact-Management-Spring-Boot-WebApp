<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>
<div class="container p-4">


	<div class="d-flex justify-content-between align-items-end mb-5">
		<h1 id="title">Rechercher Contacts Par Num-Tele</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/rechercherNomContact" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-user"></i> Par Nom
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

		<f:form action="/ContactrechercherNum" method="POST">
			<div class="form-group row mb-5">
				<div class="input-group">
					<div class="form-outline flex-grow-1">
						<input name="telephone" type="text" class="form-control"
							   placeholder="Telephone Peronnel ou Professionelle" />
						<f:errors path="telephone" class="text-danger" />
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</f:form>

	</div>

	<c:if test="${not empty contactR}">
	<div>
		<div class="table-responsive">
			<table class="table align-middle mb-0 bg-white">
				<thead class="bg-light">
				<tr>
					<th>Id</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Téléphone Personnel</th>
					<th>Téléphone Professionnel</th>
					<th>Adresse</th>
					<th>Email Personnel</th>
					<th>Email Professionnel</th>
					<th>Genre</th>
					<th>Groupe</th>
					<th>Modifier</th>
					<th>Supprimer</th>
				</tr>
				</thead>
				<tbody>
						<tr>
							<td><c:out value="${contactR.idContact}"></c:out></td>
							<td><c:out value="${contactR.nom}"></c:out></td>
							<td><c:out value="${contactR.prenom}"></c:out></td>
							<td><c:out value="${contactR.telephonePeronnel}"></c:out></td>
							<td><c:out value="${contactR.telephoneProfessionel}"></c:out></td>
							<td><c:out value="${contactR.adresse}"></c:out></td>
							<td><c:out value="${contactR.emailPeronnel}"></c:out></td>
							<td><c:out value="${contactR.emailProfessionel}"></c:out></td>
							<td><c:out value="${contactR.genre}"></c:out></td>
							<td>
								<button type="button" class="btn btn-primary me-2 text-truncate" data-mdb-ripple-color="dark">
									<a href="${pageContext.request.contextPath}/affectationForm/${contactR.idContact}" class="text-reset text-decoration-none text-truncate">
										<i class="fas fa-users"></i>  ${contactR.grpC.nom}
									</a>
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-light text-truncate btn-outline-secondary mx-1" data-mdb-ripple-color="dark">
									<a href="${pageContext.request.contextPath}/modifierForm/${contactR.idContact}" class="text-reset text-decoration-none text-truncate">
										<i class="fas fa-edit"></i> Modifier
									</a>
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-danger text-truncate">
									<a href="${pageContext.request.contextPath}/supprimerContact/${contactR.idContact}" class="text-reset text-decoration-none text-truncate">
										<i class="fas fa-trash"></i> Supprimer
									</a>
								</button>
							</td>
						</tr>
				</tbody>
			</table>
		</div>
		</c:if>
	</div>
</div>
</body>
</html>