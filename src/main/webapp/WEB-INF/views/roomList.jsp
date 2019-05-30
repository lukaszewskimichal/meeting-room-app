<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Lista sal</title>
</head>

<body>

<div class="container">

    <div class="card">
        <div class="card-body">
            <a href="add" class="btn btn-primary">Dodaj salę</a>
        </div>
    </div>

    <div class="card mt-4">

        <div class="card-body">

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>nazwa</th>
                        <th>liczba osób</th>
                        <%--                    <th>projektor</th>--%>
                        <%--                    <th>system do telekonferencji</th>--%>
                        <%--                    <th>flipchart</th>--%>
                        <%--                    <th>tv</th>--%>
                        <%--                    <th>klimatyzacja</th>--%>
                        <th style="width: 15%"></th>
                        <th style="width: 15%"></th>
                    </tr>
                    <c:forEach items="${rooms}" var="room">
                        <tr>
                            <td>${room.name}</td>
                            <td>${room.capacity}</td>
                                <%--                        <td>${room.setProjectorLabel(room.projector)}</td>--%>
                                <%--                        <td>${room.setTeleconferenceSystemLabel(room.teleconferenceSystem)}</td>--%>
                                <%--                        <td>${room.setFlipchartLabel(room.flipchart)}</td>--%>
                                <%--                        <td>${room.setTvLabel(room.tv)}</td>--%>
                                <%--                        <td>${room.setAirConditioningLabel(room.airConditioning)}</td>--%>
                            <td>
                                <a href="update/${room.id}" class="btn btn-info">Szczegóły</a>
                            </td>
                            <td>
                                <a href="update/${room.id}" class="btn btn-success">Edytuj</a>
                                <a href="delete/${room.id}" class="btn btn-danger">Usuń</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>
