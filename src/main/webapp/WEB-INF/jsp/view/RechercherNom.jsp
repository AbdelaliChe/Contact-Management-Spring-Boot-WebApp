<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>
<div class="container p-4">


	<div class="d-flex justify-content-between align-items-end mb-5">
		<h1 id="title">Rechercher Contacts Par Nom</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/rechercherNumContact" class="text-reset text-decoration-none text-truncate">
					<i class="fas fa-phone"></i> Par Numero de Telephone
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

		<f:form action="/NomContactrechercher" method="POST" modelAttribute="contactModel">
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
					<c:forEach items="${contactR}" var="contact">
						<tr>
							<td><c:out value="${contact.idContact}"></c:out></td>
							<td><c:out value="${contact.nom}"></c:out></td>
							<td><c:out value="${contact.prenom}"></c:out></td>
							<td><c:out value="${contact.telephonePeronnel}"></c:out></td>
							<td><c:out value="${contact.telephoneProfessionel}"></c:out></td>
							<td><c:out value="${contact.adresse}"></c:out></td>
							<td><c:out value="${contact.emailPeronnel}"></c:out></td>
							<td><c:out value="${contact.emailProfessionel}"></c:out></td>
							<td><c:out value="${contact.genre}"></c:out></td>
							<td>
								<button type="button" class="btn btn-primary me-2 text-truncate" data-mdb-ripple-color="dark">
									<a href="${pageContext.request.contextPath}/affectationForm/${contact.idContact}" class="text-reset text-decoration-none text-truncate">
										<i class="fas fa-users"></i>  ${contact.grpC.nom}
									</a>
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-light text-truncate btn-outline-secondary mx-1" data-mdb-ripple-color="dark">
									<a href="${pageContext.request.contextPath}/modifierForm/${contact.idContact}" class="text-reset text-decoration-none text-truncate">
										<i class="fas fa-edit"></i> Modifier
									</a>
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-danger text-truncate">
									<a href="${pageContext.request.contextPath}/supprimerContact/${contact.idContact}" class="text-reset text-decoration-none text-truncate">
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
</div>
</body>
</html>