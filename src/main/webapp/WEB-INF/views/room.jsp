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

<!-- Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" role="dialog" aria-labelledby="submitModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Dodanie sali konferencyjnej</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Czy chcesz dodać salę konferencyjną?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Nie</button>
                <button type="button" class="btn btn-primary">Tak</button>
            </div>
        </div>
    </div>
</div>

<div class="container">

    <div class="row justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <div class="d-flex align-items-center">
                    <h5 class="mx-auto w-100">Dodaj salę konferencyjną</h5>
                </div>
            </div>
            <div class="card-body bg-light">
                <div class="form-group">
                    <form:form method="post" modelAttribute="room">

                    <form:hidden path="id" name="id"/>

                    <div class="form-row">
                        <div class="col-md">
                            <label>Nazwa sali:</label>
                            <div class="col-8">
                                <form:input path="name" id="nameId" name="name"
                                            required="required" class="form-control"/>
                                <form:errors path="name" element="div" cssClass="error"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md">
                            <label>Maksymalna liczba osób:</label>
                            <div class="col-8">
                                <form:input path="capacity" id="capacityId" type="text" class="form-control"
                                            required="required"/>
                                <form:errors path="capacity" element="div" cssClass="error"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Wyposażenie:</label>
                        <div class="col-8">
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <form:checkbox path="projector" id="projectorId" class="custom-control-input"/>
                                    <label for="projectorId" class="custom-control-label">projektor</label>
                                </div>
                            </div>
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <form:checkbox path="teleconferenceSystem" id="teleconferenceSystemId"
                                                   class="custom-control-input"/>
                                    <label for="teleconferenceSystemId" class="custom-control-label">system do
                                        telekonferencji</label>
                                </div>
                            </div>
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <form:checkbox path="flipchart" id="flipchartId" class="custom-control-input"/>
                                    <label for="flipchartId" class="custom-control-label">flipchart</label>
                                </div>
                            </div>
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <form:checkbox path="tv" id="tvId" class="custom-control-input"/>
                                    <label for="tvId" class="custom-control-label">TV</label>
                                </div>
                            </div>
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <form:checkbox path="airConditioning" id="airConditioningId"
                                                   class="custom-control-input"/>
                                    <label for="airConditioningId" class="custom-control-label">klimatyzacja</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer text-center">
                <button type="submit" class="btn mt-auto btn-outline-dark">
                    Dodaj
                </button>

            </div>
            </form:form>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>