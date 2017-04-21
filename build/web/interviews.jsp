<%-- 
    Document   : interviews
    Created on : Nov 2, 2016, 1:01:17 PM
    Author     : nuwan
--%>

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

<%@page import="com.CDCE.DAOs.ApplicationsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CDCE.Model.Applications"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="includes/header_admin.jsp"%>
<%@include file="includes/side_navibar_admin.jsp" %>

<!-- Page -->

<div class="page animsition">

    <div class="page-header">
        <h1 class="page-title">Interviews</h1>
        <ol class="breadcrumb">
            <li><a href="admin_dashboard.jsp">Dashboard</a></li>
            <li class="active">Pending Details > Interviews</li>

        </ol>

        <div class="page-header-actions">

        </div>
    </div>
    <div class="page-content">
        <!-- Panel Table Individual column searching -->
        <div class="panel">
            <header class="panel-heading">
                <h4 class="panel-title">Interviews Selected Applications &nbsp;<span class="tooltip-dark" data-toggle="tooltip" data-original-title="Help tips" data-trigger="focus / hover"><button type="button" class="btn-info popover-info btn-sm btn-icon btn-inverse btn-round" data-content="Can search any content of the table. ~'Others are not implement yet'~" data-toggle="popover" data-original-title="About this table..." data-trigger="click"><i class="grey-500 icon wb-info"></i></button></span></h4>
            </header>
            <div class="panel-body">
                <table class="table table-hover dataTable table-striped width-full" id="exampleTableSearch">
                    <thead>
                        <tr>
                            <th>Application No</th>
                            <th>NIC Number</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Gender</th>
                            <th>Registration(Accept/Reject)</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Application No</th>
                            <th>NIC Number</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Gender</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <!--Getting table data from database-->
                        <%

                            ApplicationsDAO adao = new ApplicationsDAO();
                            ArrayList<Applications> applicationDetails = new ArrayList<Applications>();
                            applicationDetails = adao.getApplicationDetailsForTables();
                            
                            int i = 0;
                            for (Applications applications : applicationDetails) {
                                if (applications.getStFlag() == 1 && applications.getiFlag() == 1 && applications.getrFlag() == 0) {
                        %>

                        <tr>
                            <td><a href="interview_view.jsp?action=edit&id=<%=applications.getId()%>" class="tooltip-dark btn btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="View fully Application details for <%=applications.getFullName()%>" data-trigger="focus / hover"><%=applications.getId()%></a></td>  
                            <td><%= applications.getNic()%></td>
                            <td><%= applications.getFullName()%></td>
                            <td><%= applications.getEmail()%></td>
                            <td><%= applications.getPermanentAddress()%></td>
                            <td><%= applications.getGender()%></td>
                            <td>
                                <div class="btn-group acrebtn" aria-label="Basic example" role="group">

                                    <a href="?accept" class="accept"><button value="<%=applications.getId()%>" name="IApprove" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Accept" data-trigger="focus / hover"><i class="green-700 icon wb-check" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>
                                    <a href="?reject" class="reject"><button value="<%=applications.getId()%>" name="IReject" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Reject" data-trigger="focus / hover"><i class="red-700 icon wb-close" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>


                                </div>

                            </td>

                        </tr>

                        <%
                                }
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

    function assignConfirmationToAccept() {
        if (confirm("Application will be Accepted and can't undo this operation!. Do you want to Approve this Record...?")) {
            
            return true;
        } else
        {
            return false;
        }

    }
</script>

<script>

    function assignConfirmationToReject() {
        if (confirm("Application will be Rejected and can't undo this operation!. Do you want to Reject this Record ?")) {
            return true;
        } else
        {
            return false;
        }

    }
</script>

<script>
    $(document).ready(function () {
        $('.acrebtn').delegate('.accept', 'click', function (e) {

            var confirm = assignConfirmationToAccept();
            if (confirm === true) {
                var Id = jQuery(this).find('input').val();
                var decision = "approved";

                $.ajax({url: 'InterviewServlet?id=' + Id + '&decision=' + decision, success: function (data) {
//                        alert("Any" + data);
//                        window.history.go(0);
//                        window.location.reload();
                        $("?accept").html(data);
                        window.location = "interviews.jsp";
                        

//                        window.location = "LoginServlet";
//                        window.location.reload(true);
                    }});
                // e.preventDefault();
            }
        });
    });
</script>

<script>
    $(document).ready(function () {
        $('.acrebtn').delegate('.reject', 'click', function (e) {

            var confirm = assignConfirmationToReject();
            if (confirm === true) {
                var Id = jQuery(this).find('input').val();
                var decision = "rejected";

                $.ajax({url: 'InterviewServlet?id=' + Id + '&decision=' + decision, success: function (data) {
                        $("?reject").html(data);
                        //window.location.reload();
                        window.location = "interviews.jsp";

                    }});
                // e.preventDefault();
            }
        });
    });
</script>

<!--Table creation area-->
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
                                        '">' + d + '</option>')
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

</body>

</html>


