<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

    <title>Wykaz rezerwacji</title>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top mb-5">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img height="60px" width="60px" src=
            <c:url value="/resources/images/meeting.png"></c:url> alt=""/>
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
                    <a class="nav-link" href="/search/">Znajdź rezerwację</a>
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

    <div class="row justify-content-center" style="margin-bottom: 100px">
        <div class="card w-100">
            <div class="card-header text-center">
                <div class="d-flex align-items-center">
                    <h5 class="mx-auto w-100">Lista rezerwacji</h5>
                </div>
            </div>
            <div class="card-body bg-light">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="tab-header-background">
                        <tr>
                            <th>numer rezerwacji</th>
                            <th>temat spotkania</th>
                            <th>liczba uczestników</th>
                            <th>czas rozpoczęcia</th>
                            <th>czas zakończenia</th>
                            <th>nazwa sali</th>
                            <th>imię użytkownika</th>
                            <th>nazwisko użytkownika</th>
                            <th style="width: 15%" colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${reservations}" var="reservation">
                            <tr>

                                <td>${reservation.id}</td>
                                <td>${reservation.subject}</td>
                                <td>${reservation.numberOfPeople}</td>
                                <td>${reservation.startTime}</td>
                                <td>${reservation.endTime}</td>
                                <td>${reservation.room.name}</td>
                                <td>${reservation.user.firstName}</td>
                                <td>${reservation.user.lastName}</td>

                                <td colspan="2" align="center" class="d-inline-flex">
                                    <a href="update/${reservation.id}" class="btn btn-outline-secondary btn-sm mx-1">Edytuj</a>
                                    <a href="delete/${reservation.id}"
                                       class="btn btn-outline-danger btn-sm mx-1">Usuń</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer text-center">
                <a href="/reservations/add" class="btn btn-outline-dark">Dodaj rezerwację</a>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>
</body>

</html>
