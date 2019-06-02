<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Dodaj rezerwację</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jspf" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <div class="d-flex align-items-center">
                    <h5 class="mx-auto w-100">Rezerwacja sali konferencyjnej</h5>
                </div>
            </div>
            <div class="card-body bg-light">

                <div class="form-group">
                    <form:form method="post" modelAttribute="reservation">

                    <form:hidden path="id" name="id"/>
                    <form:hidden path="user" name="user"/>

                    <div class="form-row">
                        <div class="col-md">
                            <label>Temat spotkania:</label>
                            <div class="form-group">
                                <form:input path="subject" cssClass="form-control" id="nameId"/>
                                <form:errors path="subject" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md">
                            <div class="form-group">
                                <label>Czas rozpoczęcia:</label>
                                <form:input path="startTime" cssClass="form-control" id="startTimeId"/>
                                <form:errors path="startTime" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md">
                            <div class="form-group">
                                <label>Czas zakończenia:</label>
                                <form:input path="endTime" cssClass="form-control" id="startTimeId"/>
                                <form:errors path="endTime" element="div"/>
                            </div>
                        </div>
                    </div>
                        <%--                        <div class="form-row">--%>
                        <%--                            <div class='col-md'>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <label>Czas rozpoczęcia</label>--%>
                        <%--                                    <div class="input-group date" id="datetimepicker1" data-target-input="nearest">--%>
                        <%--                                        <form:input path="startTime" type="text"--%>
                        <%--                                                    class="form-control datetimepicker-input"--%>
                        <%--                                                    data-target="#datetimepicker1"/>--%>
                        <%--                                        <form:errors path="startTime" element="div"/>--%>
                        <%--                                        <div class="input-group-append" data-target="#datetimepicker1"--%>
                        <%--                                             data-toggle="datetimepicker">--%>
                        <%--                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                            <div class='col-md'>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <label>Czas zakończenia</label>--%>
                        <%--                                    <div class="input-group date" id="datetimepicker2" data-target-input="nearest">--%>
                        <%--                                        <form:input path="endTime" type="text" class="form-control datetimepicker-input"--%>
                        <%--                                                    data-target="#datetimepicker2" required="required"/>--%>
                        <%--                                        <form:errors path="endTime" element="div"/>--%>
                        <%--                                        <div class="input-group-append" data-target="#datetimepicker2"--%>
                        <%--                                             data-toggle="datetimepicker">--%>
                        <%--                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <%--                        <script type="text/javascript">--%>
                        <%--                            $(function () {--%>
                        <%--                                $('#datetimepicker1').datetimepicker({--%>
                        <%--                                    language: 'pl', format: 'DD-MM-YYYY HH:mm',--%>
                        <%--                                    useCurrent: true--%>
                        <%--                                });--%>
                        <%--                                $('#datetimepicker2').datetimepicker({--%>
                        <%--                                    language: 'pl', format: 'DD-MM-YYYY HH:mm',--%>
                        <%--                                    useCurrent: false--%>
                        <%--                                });--%>
                        <%--                                $('#datetimepicker1').on("change.datetimepicker", function (e) {--%>
                        <%--                                    $('#datetimepicker2').datetimepicker('minDate', e.date);--%>
                        <%--                                });--%>
                        <%--                                $('#datetimepicker1').on("change.datetimepicker", function (e) {--%>
                        <%--                                    $('#datetimepicker2').datetimepicker('maxDate', e.date);--%>
                        <%--                                });--%>
                        <%--                            });--%>
                        <%--                        </script>--%>

                    <div class="form-row">
                        <div class="col-md">
                            <label>Nazwa sali:</label>
                            <div class="form-group">
                                <form:select path="room" var="room" items="${rooms}" class="form-control"
                                             id="room"/>
                                <form:errors path="room" element="div"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="card-footer text-center">
                    <button class="btn mt-auto btn-outline-dark" type="submit" name="submit">Zapisz</button>
                </div>
                </form:form>

        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/footer.jspf" %>
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