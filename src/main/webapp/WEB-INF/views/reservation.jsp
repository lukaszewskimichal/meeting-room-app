<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css"/>
    <script>
        // moment().format().toISOString();
        moment().format("DD-MM-YYYY HH:mm")

    </script>
    <title>Dodaj rezerwację</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jspf" %>

<div class="container">

    <div class="card m-md-auto w-50">
        <div class="card-header">
            <h5 class="card-title">Rezerwacja sali konferencyjnej</h5>

            <div class="card-body">

                <div class="form-group">
                    <form:form method="post" modelAttribute="reservation">

                        <form:hidden path="id" name="id"/>
                        <form:hidden path="user" name="user"/>

                        <div class="form-row">
                            <div class="col-md">
                                <label>Temat spotkania</label>
                                <div class="form-group">
                                    <form:input path="subject" class="form-control" id="nameId" name="subject"
                                                type="text"
                                                required="required"/>
                                    <form:errors path="subject" element="div"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class='col-md'>
                                <div class="form-group">
                                    <label>Czas rozpoczęcia</label>
                                    <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                        <form:input path="startTime" type="text"
                                                    class="form-control datetimepicker-input"
                                                    data-target="#datetimepicker1" required="required"/>
                                        <form:errors path="startTime" element="div"/>
                                        <div class="input-group-append" data-target="#datetimepicker1"
                                             data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class='col-md'>
                                <div class="form-group">
                                    <label>Czas zakończenia</label>
                                    <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                                        <form:input path="endTime" type="text" class="form-control datetimepicker-input"
                                                    data-target="#datetimepicker2" required="required"/>
                                        <form:errors path="endTime" element="div"/>
                                        <div class="input-group-append" data-target="#datetimepicker2"
                                             data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                $('#datetimepicker1').datetimepicker();
                                $('#datetimepicker2').datetimepicker({
                                    useCurrent: false
                                });
                                $('#datetimepicker1').on("change.datetimepicker", function (e) {
                                    $('#datetimepicker2').datetimepicker('minDate', e.date);
                                });
                                $('#datetimepicker1').on("change.datetimepicker", function (e) {
                                    $('#datetimepicker2').datetimepicker('maxDate', e.date);
                                });
                                $('#datetimepicker1').datetimepicker().format{
                                    ("DD-MM-YYYY HH:mm")
                                }
                                $('#datetimepicker2').datetimepicker().format{
                                    ("DD-MM-YYYY HH:mm")
                                }
                            });
                        </script>

                        <div class="form-row">
                            <div class="col-md">
                                <label>Nazwa sali</label>
                                <div class="form-group">
                                    <form:select path="room" items="${rooms}" class="form-control" id="room"/>
                                    <form:errors path="room" element="div"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md">
                            <button class="btn btn-secondary" type="submit" name="submit">Zapisz</button>
                        </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>
</body>
</html>