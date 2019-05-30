<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Dodaj salę konferencyjną</title>
</head>
<body>
<div class="container">
    <form:form method="post" modelAttribute="room">

        <form:hidden path="id" name="id"/>

        <div class="form-group row">
            <label for="nameId" class="col-4 col-form-label">Nazwa sali</label>
            <div class="col-8">
                <form:input path="name" id="nameId" name="name" placeholder="wprowadź nazwę sali" type="text"
                            required="required" class="form-control"/>
                <form:errors path="name" element="div"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="capacityId" class="col-4 col-form-label">Liczba osób</label>
            <div class="col-8">
                <form:input path="capacity" id="capacityId" name="capacity" placeholder="wprowadź liczbę osób"
                            type="text"
                            class="form-control" required="required"/>
                <form:errors path="capacity" element="div"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label">Wyposażenie</label>
            <div class="col-8">
                <div class="custom-controls-stacked">
                    <div class="custom-control custom-checkbox">
                        <form:checkbox path="projector" name="" id="projectorId" required=""
                                       class="custom-control-input"/>
                        <form:errors path="projector" element="div"/>
                        <label for="projectorId" class="custom-control-label">projektor</label>
                    </div>
                </div>
                <div class="custom-controls-stacked">
                    <div class="custom-control custom-checkbox">
                        <form:checkbox path="teleconferenceSystem" name="" id="teleconferenceSystemId" required=""
                                       class="custom-control-input"/>
                        <form:errors path="teleconferenceSystem" element="div"/>
                        <label for="teleconferenceSystemId" class="custom-control-label">system do
                            telekonferencji</label>
                    </div>
                </div>
                <div class="custom-controls-stacked">
                    <div class="custom-control custom-checkbox">
                        <form:checkbox path="flipchart" name="" id="flipchartId" required=""
                                       class="custom-control-input"/>
                        <form:errors path="flipchart" element="div"/>
                        <label for="flipchartId" class="custom-control-label">flipchart</label>
                    </div>
                </div>
                <div class="custom-controls-stacked">
                    <div class="custom-control custom-checkbox">
                        <form:checkbox path="tv" name="" id="tvId" required=""
                                       class="custom-control-input"/>
                        <form:errors path="tv" element="div"/>
                        <label for="tvId" class="custom-control-label">TV</label>
                    </div>
                </div>
                <div class="custom-controls-stacked">
                    <div class="custom-control custom-checkbox">
                        <form:checkbox path="airConditioning" name="" id="airConditioningId" required=""
                                       class="custom-control-input"/>
                        <form:errors path="airConditioning" element="div"/>
                        <label for="airConditioningId" class="custom-control-label">klimatyzacja</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="offset-4 col-8">
                <button name="submit" type="submit" class="btn btn-primary">Zapisz</button>
            </div>
        </div>
    </form:form>
</div>
</body>
</html>