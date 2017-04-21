<%-- 
    Document   : users
    Created on : Jan 17, 2017, 12:36:39 PM
    Author     : nuwan
--%>

<%@page import="com.CDCE.Model.Payment"%>
<%@page import="com.CDCE.DAOs.PaymentDAO"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%
//    if (session.getAttribute("username") == null) {
//        request.getRequestDispatcher("login.jsp").forward(request, response);
//    };
%>

<%@page import="com.CDCE.Model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.CDCE.DAOs.UserDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="includes/header_admin.jsp"%>
<%@include file="includes/side_navibar_admin.jsp" %>

<!-- Page -->
<div class="page animsition">

    <div class="page-header">
        <h1 class="page-title">Payments</h1>
        <ol class="breadcrumb">
            <li><a href="admin_dashboard.jsp">Dashboard</a></li>
            <li class="active">Payments</li>

        </ol>
    </div>
    <div class="page-content">
        <!-- Panel Table Individual column searching -->
        <div class="panel">
            <header class="panel-heading">
                <div class="panel-actions"></div>
                <h4 class="panel-title">Payment Types List &nbsp;<span class="tooltip-dark" data-toggle="tooltip" data-original-title="Help tips" data-trigger="focus / hover"><button type="button" class="btn-info popover-info btn-sm btn-icon btn-inverse btn-info btn-round" data-content="Can search any content through the table." data-toggle="popover" data-original-title="About this table..." data-trigger="click"><i class="grey-500 icon wb-info"></i></button></span></h4>
                <div class="page-header-actions">
                    <div class="btn-group" aria-label="Basic example" role="group">
                        <a href="payment_add.jsp"><button style="padding-left: 32px; padding-right: 32px" type="button" class="btn btn-primary">Add a New Payment</button></a>
                        
                    </div>
                </div>
            </header>
            <div class="panel-body">
                <table class="table table-hover dataTable table-striped width-full" id="exampleTableSearch">
                    <thead>
                        <tr>
                            <th>Payment Type</th>
                            <th>Year</th>
                            <th>Amount</th>
                            <th>Added Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Payment Type</th>
                            <th>Year</th>
                            <th>Amount</th>
                            <th>Added Date</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <!--Getting table data from database-->
                        <%
                            PaymentDAO pdao = new PaymentDAO();
                            List<Payment> payments = pdao.getPaymentsList();
                            //int i = 0;
                            for (Payment payment : payments) {
                        %>
                        <tr>
                            <td><%
                            if(String.valueOf(payment.getPaymentType()).equals("1")){
                                out.println("Application processing");
                            }else if(String.valueOf(payment.getPaymentType()).equals("2")){
                                out.println("Registration");
                            }else if(String.valueOf(payment.getPaymentType()).equals("3")){
                                out.println("Renewal Fee");
                            }else if(String.valueOf(payment.getPaymentType()).equals("4")){
                                out.println("Examination (100 Level Course)");
                            }else if(String.valueOf(payment.getPaymentType()).equals("5")){
                                out.println("Examination (200 Level Course)");
                            }else if(String.valueOf(payment.getPaymentType()).equals("6")){
                                out.println("Examination (300 Level Course)");
                            }
                            %></td>  
                            <td><%=payment.getPaymentYear() %></td>
                            <td><%=payment.getPaymentAmount() %></td>
                            <td><%=payment.getAddedDate()%></td>

                            <td> <div class="btn-group" aria-label="Basic example" role="group">

                                    <a href="payment_edit.jsp?action=edit&id=<%=payment.getId()%>"><button type="button" class="btn btn-round btn-info"><i class="icon wb-pencil" aria-hidden="true"></i>View/Edit</button></a>

                                </div>
                                <!--<div class="btn-group" aria-label="Basic example" role="group">

                                    <a href="DeletePayment?id=<%=payment.getId()%>"><button type="button" class="btn btn-round btn-info"><i class="icon wb-pencil" aria-hidden="true"></i>Delete</button></a>

                                </div>-->
                            </td>

                        </tr>
                        <%
                                //i++;
                            }
                        %>
                    </tbody>
                </table>

            </div>
        </div>
        <!-- End Panel Table Individual column searching -->
    </div>
</div> 
<!-- End Page -->

<!-- Footer -->
<%@include file="includes/footer_admin.jsp" %>

<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;

        $(document).ready(function ($) {
            Site.run();
        });

        // Individual column searching
        // ---------------------------
        (function () {
            $(document).ready(function () {
                var defaults = $.components.getDefaults("dataTable");

                var options = $.extend(true, {}, defaults, {
                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $(
                                    '<select class="form-control width-full"><option value=""></option></select>'
                                    )
                                    .appendTo($(column.footer()).empty())
                                    .on('change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                                $(this).val()
                                                );

                                        column
                                                .search(val ? '^' + val + '$' : '',
                                                        true, false)
                                                .draw();
                                    });

                            column.data().unique().sort().each(function (
                                    d, j) {
                                select.append('<option value="' + d +
                                        '">' + d + '</option>');
                            });
                        });
                    }
                });

                $('#exampleTableSearch').DataTable(options);
            });
        })();

        // Table Tools
        // -----------
        (function () {
            $(document).ready(function () {
                var defaults = $.components.getDefaults("dataTable");

                var options = $.extend(true, {}, defaults, {
                    "aoColumnDefs": [{
                            'bSortable': false,
                            'aTargets': [-1]
                        }],
                    "iDisplayLength": 5,
                    "aLengthMenu": [
                        [5, 10, 25, 50, -1],
                        [5, 10, 25, 50, "All"]
                    ],
                    "sDom": '<"dt-panelmenu clearfix"Tfr>t<"dt-panelfooter clearfix"ip>',
                    "oTableTools": {
                        "sSwfPath": "assets/vendor/datatables-tabletools/swf/copy_csv_xls_pdf.swf"
                    }
                });

                $('#exampleTableTools').dataTable(options);
            });

        })();

    })(document, window, jQuery);
</script>
