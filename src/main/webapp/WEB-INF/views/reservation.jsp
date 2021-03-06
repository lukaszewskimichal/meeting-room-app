<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<c:url value="/webjars/jquery/3.4.1/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/webjars/popper.js/1.15.0/umd/popper.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

    <link rel="icon" href="<c:url value="/resources/images/favicon.png"/>">
    <title>Dodaj rezerwację</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top mb-5">
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
    <form:form method="post" modelAttribute="reservation">
        <div class="row justify-content-center" style="margin-bottom: 100px">
            <div class="card w-50">
                <div class="card-header text-center">
                    <div class="d-flex align-items-center">
                        <h5 class="mx-auto w-100">Rezerwacja sali konferencyjnej</h5>
                    </div>
                </div>
                <div class="card-body bg-light">
                    <div class="form-group">

                        <form:hidden path="id" name="id"/>
                        <form:hidden path="user" name="user"/>

                        <div class="form-row">
                            <div class="col-md">
                                <label>Temat spotkania:</label>
                                <div class="form-group">
                                    <form:input path="subject" cssClass="form-control" id="nameId"/>
                                    <form:errors path="subject" element="div" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md">
                                <label>Liczba uczestników:</label>
                                <div class="form-group">
                                    <form:input path="numberOfPeople" cssClass="form-control" id="numberOfPeopleId"/>
                                    <form:errors path="subject" element="div" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md">
                                <div class="form-group">
                                    <label>Czas rozpoczęcia:</label>
                                    <form:input path="startTime" type="datetime-local" cssClass="form-control"
                                                id="startTimeId"/>
                                    <form:errors path="startTime" element="div" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md">
                                <div class="form-group">
                                    <label>Czas zakończenia:</label>
                                    <form:input path="endTime" type="datetime-local" cssClass="form-control"
                                                id="startTimeId"/>
                                    <form:errors path="endTime" element="div" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md">
                                <label>Nazwa sali:</label>
                                <div class="form-group">
                                    <form:select path="room.id" itemLabel="name"
                                                 itemValue="id"
                                                 cssClass="form-control"
                                                 id="room">
                                        <form:option value="" label="-- Wybierz --"/>
                                        <form:options items="${rooms}" itemLabel="name"
                                                      itemValue="id"/>
                                    </form:select>
                                    <form:errors path="room.id" element="div" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-center">
                    <button class="btn mt-auto btn-outline-dark" type="submit" name="submit">Zapisz</button>
                </div>
            </div>
        </div>
    </form:form>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>