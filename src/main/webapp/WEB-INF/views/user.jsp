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

    <title>Zarejestruj się!</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top mb-5">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img height="60px" width="60px" src=
            <c:url value="/resources/images/meeting.png"></c:url>/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Zaloguj się</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row justify-content-center">
        <div class="card w-50">

            <div class="card-header text-center">
                <div class="d-flex align-items-center">
                    <h5 class="mx-auto w-100">Rejestracja użytkownika</h5>
                </div>
            </div>
            <div class="card-body bg-light">
                <form:form method="post" modelAttribute="user">
                <form:hidden path="id" name="id"/>

                <label for="firstNameId">Imię:</label>
                <form:input path="firstName" type="text" id="firstNameId" class="form-control"/>
                <form:errors path="firstName" element="div" cssClass="error"/>

                <label for="lastNameId">Nazwisko:</label>
                <form:input path="lastName" type="text" id="lastNameId" class="form-control"/>
                <form:errors path="lastName" element="div" cssClass="error"/>

                <label for="emailId">Adres e-mail:</label>
                <form:input path="email" type="email" id="emailId" class="form-control"/>
                <form:errors path="email" element="div" cssClass="error"/>

                <label for="passwordId">Hasło:</label>
                <form:input path="password" type="password" id="passwordId" class="form-control"/>
                <form:errors path="password" element="div" cssClass="error"/>

            </div>
            <div class="card-footer text-center">
                <button type="submit" class="btn mt-auto btn-dark">
                    Zarejestruj się
                </button>
                </form:form>
            </div>

        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>