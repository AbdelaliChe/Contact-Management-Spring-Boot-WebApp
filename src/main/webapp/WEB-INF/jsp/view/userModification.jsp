<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">


	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Modifier Profile</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/MotDePasseForm" class="text-reset text-decoration-none text-truncate">
				<i class="fa fa-lock me-2"></i>Modifier Mot de Passe
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


			<f:form action="/modifierUser" method="POST" modelAttribute="userModel">
				<input type="hidden" name="idUser" value="${userModel.idUser}"/>
				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Nom</label>
					<div class="col-sm-10">
						<f:input path="nom" type="text" class="form-control" placeholder="Nom" />
						<f:errors path="nom" class="text-danger" />
					</div>
				</div>
				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Prenom</label>
					<div class="col-sm-10">
						<f:input path="prenom" type="text" class="form-control"
								 placeholder="Prenom" />
						<f:errors path="prenom" class="text-danger" />
					</div>
				</div>


				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Numeros Telephone</label>
					<div class="col-sm-10 d-flex">
						<f:input path="telephone" type="text" class="form-control" placeholder="Numero Telephone" />
						<f:errors path="telephone" class="text-danger" />
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10 d-flex">
						<f:input path="emailPersonnel" class="form-control" placeholder="Email Peronnel" />
						<f:errors path="emailPersonnel" class="text-danger" />
					</div>
				</div>



				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Adresse</label>
					<div class="col-sm-10">
						<f:input path="adresse" type="text" class="form-control"
								 placeholder="ex: Morocco" />
						<f:errors path="adresse" class="text-danger" />
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Genre</label>
					<div class="col-sm-10">
						<label class="list-group-item">
							<input class="form-check-input me-1" type="radio" name="genre" id="femelleRadio" value="femelle" ${userModel.genre == 'femelle' ? 'checked' : ''}>
							Female
						</label>
						<label class="list-group-item">
							<input class="form-check-input me-1" type="radio" name="genre" id="maleRadio"  value="male" ${userModel.genre == 'male' ? 'checked' : ''}>
							Male
						</label>
						<f:errors path="genre" class="text-danger" />
					</div>
				</div>

				<f:hidden path="motDePasse" />


				<div class="row">
					<div class="col-sm-10 offset-sm-2 d-flex justify-content-end">
						<button type="submit" class="btn btn-primary"><i class="fa fa-user-pen text-light me-2"></i>Modifier Profile</button>
					</div>
				</div>
			</f:form>
		</div>
	</div>
</body>
</html>