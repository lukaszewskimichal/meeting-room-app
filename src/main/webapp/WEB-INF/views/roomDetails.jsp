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

    <title>Dodaj salę konferencyjną!</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top mb-5">
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
                <li class="nav-item active">
                    <c:out value="<span class=\"nav-link\">Witaj ${currentUser.firstName}!</span>" escapeXml="false"/>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reservations/add">Zarezerwuj salę</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reservations/list">Lista rezerwacji</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/search">Znajdź rezerwację</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/rooms/list">Sale konferencyjne</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/">Wyloguj</a>
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
                    <h5 class="mx-auto w-100">Dane szczegółowe</h5>
                </div>
            </div>
            <div class="card-body bg-light">
                <div class="form-group">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th class="text-muted">nazwa sali</th>
                                <td>${roomDetails.name}</td>
                            </tr>
                            <tr>
                                <th class="text-muted">maksymalna liczba osób</th>
                                <td>${roomDetails.capacity}</td>
                            </tr>
                            <tr>
                                <th class="text-muted">projektor</th>
                                <td>${roomDetails.setProjectorLabel(roomDetails.projector)}</td>
                            </tr>
                            <tr>
                                <th class="text-muted">system do telekonferencji</th>
                                <td>${roomDetails.setTeleconferenceSystemLabel(roomDetails.teleconferenceSystem)}</td>
                            </tr>
                            <tr>
                                <th class="text-muted">flipchart</th>
                                <td>${roomDetails.setFlipchartLabel(roomDetails.flipchart)}</td>
                            </tr>
                            <tr>
                                <th class="text-muted">TV</th>
                                <td>${roomDetails.setTvLabel(roomDetails.tv)}</td>
                            </tr>
                            <tr>
                                <th class="text-muted">klimatyzacja</th>
                                <td>${roomDetails.setAirConditioningLabel(roomDetails.airConditioning)}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card-footer text-center">
                <a href="/rooms/list" class="btn mt-auto btn-outline-dark">
                    Powrót
                </a>

            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>