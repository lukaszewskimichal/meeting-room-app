<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

    <title>Lista sal</title>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top mb-5">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img alt="logo" height="60px" width="60px" src="<c:url value="/resources/images/meeting.png"/>"/>
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

    <div class="row justify-content-center" style="margin-bottom: 100px">
        <div class="card w-50">
            <div class="card-header text-center">
                <div class="d-flex align-items-center">
                    <h5 class="mx-auto w-100">Wykaz sal konferencyjnych</h5>
                </div>
            </div>
            <div class="card-body bg-light">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="tab-header-background">
                        <tr>
                            <th>nazwa</th>
                            <th>liczba osób</th>
                            <th style="width: 15%" colspan="4"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rooms}" var="room">
                        <tr>

                            <td>${room.name}</td>
                            <td>${room.capacity}</td>
                            <td colspan="4" align="center" class="d-inline-flex">
                                <a href="/rooms/details/${room.id}" class="btn btn-outline-info btn-sm mx-1">Szczegóły</a>
                                <a href="/reservations/add" class="btn btn-outline-dark btn-sm mx-1">Zarezerwuj</a>
                                <a href="update/${room.id}" class="btn btn-outline-secondary btn-sm mx-1">Edytuj</a>
                                <a href="delete/${room.id}" class="btn btn-outline-danger btn-sm mx-1">Usuń</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer text-center">
                <a href="add" class="btn btn-outline-dark">Dodaj salę</a>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>
</body>

</html>
