<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <title>t-Contacts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css">
    <link rel="icon" type="image/svg" href="images/favicon.svg">
    <script type="text/javascript" src="scripts/navlink.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" defer></script>
</head>

<body class="bg-primary">
    <div class="container py-5">
        <section class="jumbotron jumbotron-fluid text-center mt-5">
            <div class="container">
            <h1 class="text-light fw-bold mt-4">404 Error - Page Non trouvée</h1>
            <h5 class="text-light mt-2 mb-3">La page demandée n'a pas été trouvée.</h5>
            <a href="${pageContext.request.contextPath}/" class="btn btn-light btn-outline-primary"><i class="fas fa-house me-2"></i>Accueil</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger"><i class="fas fa-arrow-right-from-bracket me-2"></i>Se Déconnecter</a>
            </div>
        </section>
        <div class="position-fixed bottom-0 start-0 end-0" style="z-index: -1">
            <img src="images/contacts2.png" alt="accueil" class="img-fluid">
        </div>
    </div>
</body>
</html>
