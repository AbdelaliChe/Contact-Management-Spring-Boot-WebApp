<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">


	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Modifier Mot de Passe</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/modifierUserForm" class="text-reset text-decoration-none text-truncate">
				<i class="fa fa-user-pen me-2"></i>Modifier Profile
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


			<form action="/modifierMotDePasse" method="POST">
				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Votre MDP</label>
					<div class="col-sm-10">
						<input name="OldMotDePasse" type="password" class="form-control" placeholder="Votre Mot de Passe" />
					</div>
				</div>


				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Nouveau MDP</label>
					<div class="col-sm-10">
						<input name="NewMotDePasse" type="password" class="form-control" placeholder="Nouveau mot de Passe" />
					</div>
				</div>


				<div class="row">
					<div class="col-sm-10 offset-sm-2 d-flex justify-content-end">
						<button type="submit" class="btn btn-primary"><i class="fa-solid fa-pen-to-square me-2"></i>
							Modifier</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>