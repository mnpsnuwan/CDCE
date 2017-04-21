<%-- 
    Document   : calendar
    Created on : Oct 4, 2016, 12:28:41 PM
    Author     : nuwan
--%>

<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%--
    if (session.getAttribute("username") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    };
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@include file="includes/header_admin.jsp" %>
<%@include file="includes/side_navibar_admin.jsp" %>


<div class="page animsition">
    <div class="page-header">
        <h1 class="page-title">Calendar</h1>
    </div>
    <div class="page-content calendar-container padding-horizontal-30 container-fluid">
        <div class="row">
            <!--div class="col-md-3">
                <div class="panel">
                    <header class="panel-heading">
                        <h3 class="panel-title">Calendars</h3>
                    </header>
                    <div class="panel-body">
                        <ul class="list-group calendar-list">
                            <li class="list-group-item">
                                <i class="wb-medium-point red-600 margin-right-10" aria-hidden="true"></i>Admin
                                calendar</li>
                            <li class="list-group-item">
                                <i class="wb-medium-point green-600 margin-right-10" aria-hidden="true"></i>Home
                                calendar</li>
                            <li class="list-group-item">
                                <i class="wb-medium-point orange-600 margin-right-10" aria-hidden="true"></i>Work
                                calendar</li>
                            <li class="list-group-item">
                                <i class="wb-medium-point cyan-600 margin-right-10" aria-hidden="true"></i>Calendar
                                One</li>
                        </ul>
                    </div>
                </div>
            </div-->
            <div class="col-md-12">
                <div class="panel">
                    <div class="padding-30" id="calendar"></div>
                </div>
                <div class="modal fade" id="addNewEvent" aria-hidden="true" aria-labelledby="addNewEvent"
                     role="dialog" tabindex="-1">
                    <div class="modal-dialog">
                        <form class="modal-content form-horizontal" action="#" method="post" role="form">
                            <div class="modal-header">
                                <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
                                <h4 class="modal-title">New Event</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="starts">Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="starts" name="starts">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="starts2">Starts:</label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="starts2" data-container="#addNewEvent"
                                                   data-plugin="datepicker">
                                            <span class="input-group-addon">
                                                <i class="icon wb-calendar" aria-hidden="true"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ends">Ends:</label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="ends" data-container="#addNewEvent"
                                                   data-plugin="datepicker">
                                            <span class="input-group-addon">
                                                <i class="icon wb-calendar" aria-hidden="true"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="repeats">Repeats:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="repeats" name="repeats" data-plugin="TouchSpin"
                                               data-min="0" data-max="10" value="0" />
                                    </div>
                                </div>
                                <!--div class="form-group">
                                    <label class="col-sm-2 control-label" for="people">People:</label>
                                    <div class="col-sm-10">
                                        <select id="people" multiple="multiple" data-plugin="jquery-selective"></select>
                                    </div>
                                </div-->
                            </div>
                            <div class="modal-footer">
                                <div class="form-actions">
                                    <button class="btn btn-primary" data-dismiss="modal" type="button">Add this event</button>
                                    <a class="btn btn-sm btn-white" data-dismiss="modal" href="javascript:void(0)">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Calendar Form -->
<div class="site-action">
    <button type="button" class="btn-raised btn btn-success btn-floating">
        <i class="front-icon wb-plus animation-scale-up" aria-hidden="true"></i>
        <i class="back-icon wb-trash animation-scale-up" aria-hidden="true"></i>
    </button>
</div>
<div class="modal fade" id="addNewCalendarForm" aria-hidden="true" aria-labelledby="addNewCalendarForm"
     role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <form class="modal-content" action="#" method="post" role="form">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
                <h4 class="modal-title">Create New Calendar</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="control-label margin-bottom-15" for="name">Calendar name:</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Calendar name">
                </div>
                <div class="form-group">
                    <label class="control-label margin-bottom-15" for="name">Choose a color:</label>
                    <ul class="color-selector">
                        <li class="bg-blue-600">
                            <input type="radio" checked name="colorChosen" id="colorChosen2">
                            <label for="colorChosen2"></label>
                        </li>
                        <li class="bg-green-600">
                            <input type="radio" name="colorChosen" id="colorChosen3">
                            <label for="colorChosen3"></label>
                        </li>
                        <li class="bg-cyan-600">
                            <input type="radio" name="colorChosen" id="colorChosen4">
                            <label for="colorChosen4"></label>
                        </li>
                        <li class="bg-orange-600">
                            <input type="radio" name="colorChosen" id="colorChosen5">
                            <label for="colorChosen5"></label>
                        </li>
                        <li class="bg-red-600">
                            <input type="radio" name="colorChosen" id="colorChosen6">
                            <label for="colorChosen6"></label>
                        </li>
                        <li class="bg-blue-grey-600">
                            <input type="radio" name="colorChosen" id="colorChosen7">
                            <label for="colorChosen7"></label>
                        </li>
                        <li class="bg-purple-600">
                            <input type="radio" name="colorChosen" id="colorChosen8">
                            <label for="colorChosen8"></label>
                        </li>
                    </ul>
                </div>
                <!--div class="form-group">
                    <label class="control-label margin-bottom-15" for="name">Choice people to your project:</label>
                    <select multiple="multiple" data-plugin="jquery-selective"></select>
                </div-->
            </div>
            <div class="modal-footer">
                <div class="form-actions">
                    <button class="btn btn-primary" data-dismiss="modal" type="button">Create</button>
                    <a class="btn btn-sm btn-white" data-dismiss="modal" href="javascript:void(0)">Cancel</a>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- Footer -->
<%@include file="includes/footer_admin.jsp"%>

<script>
    (function (document, window, $) {
        'use strict';
        var AppCalendar = window.AppCalendar;
        $(document).ready(function () {
            AppCalendar.run();
        });
    })(document, window, jQuery);
</script>

</body>

</html>