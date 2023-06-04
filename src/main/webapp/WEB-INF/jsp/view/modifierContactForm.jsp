<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="header.jsp" %>

<div class="container p-4">

	<div class="d-flex justify-content-between align-items-center mb-4">
		<h1 id="title">Modifier Contact</h1>
		<div>
			<button class="btn btn-dark">
				<a href="${pageContext.request.contextPath}/afficherContacts" class="text-reset text-decoration-none text-truncate">
					<i class="fa fa-list me-2"></i>Liste des Contacts
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



			<f:form action="/modifierContact" method="POST" modelAttribute="contactModel">
				<input type="hidden" name="idContact" value="${contactModel.idContact}"/>
				<div class="form-group row mb-3">
					<label class="col-sm-2 col-form-label">Nom</label>
					<div class="col-sm-10">
						<f:input path="nom" type="text" class="form-control"
								 placeholder="Nom" />
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
					<div class="col me-2">
						<f:input path="telephonePersonnel" type="text" class="form-control" placeholder="Telephone Peronnel" />
						<f:errors path="telephonePersonnel" class="text-danger" />
					</div>
					<div class="col ms-2">
						<f:input path="telephoneProfessionel" type="text" class="form-control" placeholder="Telephone Professionel" />
						<f:errors path="telephoneProfessionel" class="text-danger" />
					</div>
				</div>
			</div>

			<div class="form-group row mb-3">
				<label class="col-sm-2 col-form-label">Emails</label>
				<div class="col-sm-10 d-flex">
					<div class="col me-2">
						<f:input path="emailPersonnel" class="form-control" placeholder="Email Peronnel" />
						<f:errors path="emailPersonnel" class="text-danger" />
					</div>
					<div class="col ms-2">
						<f:input path="emailProfessionel" class="form-control" placeholder="Email Professionel" />
						<f:errors path="emailProfessionel" class="text-danger" />
					</div>
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
							<input class="form-check-input me-1" type="radio" name="genre" id="femelleRadio" value="femelle" ${contactModel.genre == 'femelle' ? 'checked' : ''}>
							Female
						</label>
						<label class="list-group-item">
							<input class="form-check-input me-1" type="radio" name="genre" id="maleRadio"  value="male" ${contactModel.genre == 'male' ? 'checked' : ''}>
							Male
						</label>
						<f:errors path="genre" class="text-danger" />
					</div>
			</div>


			<f:hidden path="grpC" />


		    </div>
				<div class="row">
					<div class="col-sm-10 offset-sm-2 d-flex justify-content-end">
							<button type="submit" class="btn btn-primary"><i class="fa fa-pen text-light me-2"></i>Modifier le Contact</button>
					</div>
				</div>

			</f:form>
		</div>

	</div>
	</div>
</body>
</html>