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
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">

                            <div class="col-md-6 col-lg-5 d-none d-md-block d-flex justify-content-center align-items-center">
                                <img src="images/contacts.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;object-fit: cover; width: 100%;height: 100%;">
                            </div>

                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <i class="fa fa-square-phone fa-3x me-3 text-primary"></i>
                                        <span class="h1 fw-bold mb-0">t-Contacts</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3">Connecter à votre Compte</h5>

                                    <c:if test="${errorMsg!=null}">
                                        <div class="alert alert-danger" role="alert">${errorMsg}</div>
                                    </c:if>

                                    <form action="login" method="POST">

                                        <div class="mb-3">
                                            <label class="mb-2 text-muted">Identifiant</label>
                                            <input type="identifiant" class="form-control" name="username" placeholder="Numero Telephone">
                                        </div>


                                        <div class="mb-4">
                                            <label class="mb-2 text-muted">Mot de Passe</label>
                                            <input type="password" class="form-control" name="password" placeholder="Mot de passe">
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <button type="submit" class="btn btn-primary w-100">
                                                Se Connecter
                                            </button>
                                        </div>


                                        <div class="text-center mt-5 text-dark">
                                            Vous n'avez pas encore de compte? <a href="${pageContext.request.contextPath}/inscrirptionForm"class="text-primary">S'inscrire</a>
                                        </div>
                                        <div class="text-center mt-5 text-secondary">
                                            &copy; 2023 t-Contacts
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>