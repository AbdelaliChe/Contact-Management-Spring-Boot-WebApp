<%@ include file="header.jsp" %>
<div class="container" style="padding: 20px;">







<div>
			<h3>Ajouter Groupe</h3>
		</div>
		<div>

			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>



			<f:form action="/modifierGroupe" method="POST" modelAttribute="grpModel">

				<div class="row">
					<label>Nom</label>
					<input type="hidden" name="idGroupe" value="${grpModel.idGroupe}"/>
					<f:input path="Nom" type="text" class="form-control" placeholder="Nom" />
					<f:errors path="Nom" class="text-danger" />
				</div><br>
				<div class="row">
					<button type="submit" class="btn btn-primary">Modifier</button>
				</div>

			</f:form>
		</div>


	</div>
</body>
</html>