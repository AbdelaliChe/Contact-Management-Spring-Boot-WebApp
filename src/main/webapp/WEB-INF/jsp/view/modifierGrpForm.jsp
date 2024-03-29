<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">

	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Modifier Groupe</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherGroupes" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-list me-2"></i>Liste des Groupes
				</a>
			</button>
		</div>
	</div>
	<div>

		<c:if test="${infoMsg!=null}">
			<div class="alert alert-success" role="alert">${infoMsg}</div>
		</c:if>
		<c:if test="${errorMsg!=null}">
			<div class="alert alert-danger" role="alert">${errorMsg}</div>
		</c:if>



		<f:form action="/modifierGroupe" method="POST" modelAttribute="grpModel">

			<input type="hidden" name="idGroupe" value="${grpModel.idGroupe}"/>
			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Nom</label>
				<div class="col-sm-10">
					<f:input path="nom" type="text" class="form-control"
							 placeholder="Nom" />
					<f:errors path="nom" class="text-danger" />
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10 offset-sm-2 d-flex justify-content-end">
					<button type="submit" class="btn btn-primary"><i class="fa fa-pen text-light me-2"></i>Modifier le Groupe</button>
				</div>
			</div>

		</f:form>
	</div>


</div>
</body>
</html>