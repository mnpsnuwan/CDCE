<%-- 
    Document   : table
    Created on : Oct 11, 2016, 2:40:09 PM
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
<%@page import="com.CDCE.Model.Applications"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="includes/header_admin.jsp"%>
<%@include file="includes/side_navibar_admin.jsp" %>

<!-- Page -->

<div class="page animsition">

    <div class="page-header">
        <h1 class="page-title">Applications</h1>
        <ol class="breadcrumb">
            <li><a href="admin_dashboard.jsp">Dashboard</a></li>
            <li class="active">Applications</li>

        </ol>

        <div class="page-header-actions">

        </div>
    </div>
    <div class="page-content">
        <!-- Panel Table Individual column searching -->
        <div class="panel">
            <header class="panel-heading">
                <h4 class="panel-title">Applications &nbsp;<span class="tooltip-dark" data-toggle="tooltip" data-original-title="Help tips" data-trigger="focus / hover"><button type="button" class="btn-info popover-info btn-sm btn-icon btn-inverse btn-info btn-round" data-content="Can accept or reject any applications for selection test in this table. And can search any content of the table. And also can view fully application through the id." data-toggle="popover" data-original-title="About this table..." data-trigger="click"><i class="grey-500 icon wb-info"></i></button></span></h4>
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
                            <th>Selection Test</th>
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

                        </tr>
                    </tfoot>
                    <tbody>
                        <!--Getting table data from database-->
                        <%                            ApplicationsDAO adao = new ApplicationsDAO();
                            ArrayList<Applications> applicationDetails = new ArrayList<Applications>();
                            applicationDetails = adao.getApplicationDetailsForTables();

                            int i = 0;
                            for (Applications applications : applicationDetails) {
                                if (applications.getStFlag() == 0 && applications.getiFlag() == 0 && applications.getrFlag() == 0) {
                        %>

                        <tr>
                            <%--<td><a href="application_view.jsp?action=edit&id=<%=applications.getId()%>" class="tooltip-dark btn btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="View fully Application details for <%=applications.getFullName()%>" data-trigger="focus / hover"><%=i = (i + 1)%></a></td>--%>
                            <td><a href="application_view.jsp?action=edit&id=<%=applications.getId()%>" class="tooltip-dark btn btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="View fully Application details for <%=applications.getFullName()%>" data-trigger="focus / hover"><%=applications.getId()%></a></td>
                            <td><%= applications.getNic()%></td>
                            <td><%= applications.getFullName()%></td>
                            <td><%= applications.getEmail()%></td>
                            <td><%= applications.getPermanentAddress()%></td>
                            <td><%= applications.getGender()%></td>
                            <td>
                                <div class="btn-group acrebtn" aria-label="Basic example" role="group">

                                    <%--
                                        if (applications.getiFlag() == 1 && applications.getrFlag() == 0) {
                                    %>

                                    <button value="<%=applications.getId()%>" name="STApprove" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Accepted to Selection Test" data-trigger="focus / hover"><i class="black icon wb-check" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button>
                                    <button value="<%=applications.getId()%>" name="STReject" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="" data-trigger="focus / hover"><i class="black icon wb-close" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button>

                                    <%
                                    } else {
                                  --%>
                                    <a href="?accept" class="accept"><button value="<%=applications.getId()%>" name="STApprove" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Accept" data-trigger="focus / hover"><i class="green-700 icon wb-check" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>
                                    <a href="?reject" class="reject"><button value="<%=applications.getId()%>" name="STReject" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Reject" data-trigger="focus / hover"><i class="red-700 icon wb-close" aria-hidden="true"><input type="hidden" value="<%=applications.getId()%>"></i></button></a>
                                                <%--
                                                    }
                                                --%>

                                </div>
                            </td>


                            <%--                              <td>
                                                              <div class="btn-group" aria-label="Basic example" role="group">
                                                                  <button value="<%=applications.getId()%>" id="STApprove<%=applications.getId()%>" type="button" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Accept" data-trigger="focus / hover"><i class="green-700 icon wb-check" aria-hidden="true"></i></button>
                                                                  <button value="<%=applications.getId()%>" id="STReject<%=applications.getId()%>" type="button" class="tooltip-dark btn-sm btn-icon btn-inverse btn-round" data-toggle="tooltip" data-original-title="Reject" data-trigger="focus / hover"><i class="red-700 icon wb-close" aria-hidden="true"></i></button>
                              
                                                              </div>
                              
                                                          </td> --%>

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

<!--For approval alerts(sweet alert)-->
<%--<script>

    (function (document, window, $) {

        (function () {
    <%
        for (Applications applications : applicationDetails) {
    %>

            $('#STReject<%=applications.getId()%>').on("click", function () {
                swal({
                    title: "Are you sure...?",
                    text: "You will not be able to undo this operation...!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Yes, Reject..!',
                    cancelButtonText: "No, cancel..!",
                    closeOnConfirm: false,
                    closeOnCancel: true
                },
                        function (isConfirm) {
                            if (isConfirm) {
                                swal("Rejected!",
                                        "Application has been rejected successfully...!!!",
                                        "success");
                                //$('#STApprove, #STReject').attr("disabled", true);//after confirmed disable accept button
                            } else {
                                swal("Cancelled", "Application has not been rejected!",
                                        "error");

                            }
                        });
            });

            $('#STAccept<%=applications.getId()%>').on("click", function () {
                swal({
                    title: "Are you sure...?",
                    text: "You will not be able to undo this operation...!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#000',
                    confirmButtonText: 'Yes, Accept..!',
                    cancelButtonText: "No, cancel..!",
                    closeOnConfirm: false,
                    //closeOnCancel: false
                },
                        function (isConfirm) {
                            if (isConfirm) {
                                swal("Rejected!",
                                        "Application has been accepted successfully...!!!",
                                        "success");
                                //$('#STApprove, #STReject').attr("disabled", true);
                                //$('#RApprove, #RReject').attr("disabled", false); //after confirmed enable registration button(removed that)
                            } else {
                                swal("Cancelled", "Application has not been rejected!",
                                        "error");
                            }
                        });
            });

    <%
            }
    %>


        })();
    })(document, window, jQuery);

</script>--%>

<!--Confirm box create area for accept button-->
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

<!--Confirm box create area for reject button-->
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
                var Id = jQuery(this).find('input').val(); //getting input button value for accept button
                var decision = "approved";

                $.ajax({url: 'ApplicationServlet?id=' + Id + '&decision=' + decision, success: function (data) {

                        $("?accept").html(data);
                        window.location = "applications.jsp";

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
                var Id = jQuery(this).find('input').val(); //getting input button value for reject button
                var decision = "rejected";

                $.ajax({url: 'ApplicationServlet?id=' + Id + '&decision=' + decision, success: function (data) {

                        $("?reject").html(data);
                        window.location = "applications.jsp";

                    }});
                // e.preventDefault();
            }
        });
    });
</script>

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

</body>

</html>

