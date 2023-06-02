<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
    <title>t-Contacts</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
            crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css">
    <link rel="icon" type="image/svg" href="images/favicon.svg">

</head>

<body class="vh-100 bg-primary d-flex align-items-center justify-content-center">
<div>
    <section>
        <div class="container">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between mb-3 pb-1">
                    <h3 class="mb-0 fw-bold"><i class="fa fa-square-phone me-2 text-primary"></i>t-Contacts</h3>
                    <h3><a href="${pageContext.request.contextPath}/login" class="mb-0 fw-bold">
                        <i class="fa fa-angle-right text-outline-primary"></i>
                    </a></h3>
                </div>

                <div class="card-body">

                    <c:if test="${infoMsg!=null}">
                        <div class="alert alert-success" role="alert">${infoMsg}</div>
                    </c:if>
                    <c:if test="${errorMsg!=null}">
                        <div class="alert alert-danger" role="alert">${errorMsg}</div>
                    </c:if>


                    <f:form action="inscrirption" method="POST" modelAttribute="userModel">

                        <div class="row mb-3">
                            <div class="col me-2">
                                <label class="mb-2 text-muted">Nom</label>
                                <f:input path="nom" type="text" class="form-control"
                                         placeholder="Nom" />
                                <f:errors path="nom" class="text-danger" />
                            </div>
                            <div class="col me-2">
                                <label class="mb-2 text-muted">Prenom</label>
                                <f:input path="prenom" type="text" class="form-control"
                                         placeholder="Prenom" />
                                <f:errors path="prenom" class="text-danger" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col me-2">
                                <label class="mb-2 text-muted">Email</label>
                                <f:input path="emailPersonnel" type="text" class="form-control"
                                         placeholder="Email" />
                                <f:errors path="emailPersonnel" class="text-danger" />
                            </div>
                            <div class="col me-2">
                                <label class="mb-2 text-muted">Adresse</label>
                                <f:input path="adresse" type="text" class="form-control"
                                         placeholder="Adresse" />
                                <f:errors path="adresse" class="text-danger" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col me-2">
                                <label class="mb-2 text-muted">Numero Telephone<strong>*</strong></label>
                                <f:input path="telephone" type="text" class="form-control"
                                         placeholder="Numero Telephone" />
                                <f:errors path="telephone" class="text-danger" />
                            </div>
                            <div class="col me-2">
                                <label class="mb-2 text-muted">Mot de passe<strong>*</strong></label>
                                <f:input path="motDePasse" type="password" id="mdp" class="form-control"
                                         placeholder="Mot de Passe" />
                                <f:errors path="motDePasse" class="text-danger" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="mb-2 text-muted">Genre</label>
                            <label class="list-group-item">
                                <input class="form-check-input me-1" type="radio" name="genre" id="femelleRadio" value="femelle">
                                Female
                            </label>
                            <label class="list-group-item">
                                <input class="form-check-input me-1" type="radio" name="genre" id="maleRadio"  value="male">
                                Male
                            </label>
                            <f:errors path="genre" class="text-danger" />
                        </div>


                        <div class="pt-1 mb-4">
                            <button type="submit" class="btn btn-primary w-100">
                                S'inscrire
                            </button>
                        </div>
                    </f:form>
                    <div class="text-center text-dark">
                        Vous avez deja un compte? <a href="${pageContext.request.contextPath}/login"class="text-primary">Se Connecter</a>
                    </div>
                    <div class="text-center mt-3 text-secondary">
                        &copy; 2023 t-Contacts
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>