<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="<c:url value="/webjars/jquery/3.4.1/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/webjars/popper.js/1.15.0/umd/popper.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

    <link rel="icon" href="<c:url value="/resources/images/favicon.png"/>">

    <title>Zaloguj się!</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top mb-5">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img height="60px" width="60px" src=
            <c:url value="/resources/images/meeting.png"></c:url> alt="logo"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="users/add">Zarejestruj się</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <form method="post">
        <div class="row justify-content-center">
            <div class="card w-25">

                <div class="card-header text-center">
                    <div class="d-flex align-items-center">
                        <h5 class="display-4 mx-auto w-60">Hello!</h5>
                    </div>
                </div>
                <div class="card-body bg-light">

                    <label for="emailId">Adres e-mail:</label>
                    <input type="text" name="email"  id="emailId" class="form-control"/>

                    <label for="passwordId">Hasło:</label>
                    <input type="password" name="password" id="passwordId" class="form-control mb-5"/>

                    <c:if test="${isLogged == false}">
                        <div class="error">Błąd logowania! Spróbuj ponownie</div>
                    </c:if>
                </div>
                <div class="card-footer text-center">
                    <button type="submit" value="Login" class="btn btn-dark block full-width m-b">
                        Zaloguj się
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>
</body>
</html>