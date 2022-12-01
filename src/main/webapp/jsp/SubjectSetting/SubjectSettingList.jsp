<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : SubjectSettingList
    Created on : Jun 2, 2022, 9:26:58 PM
    Author     : tqbao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="typeValue" value="${sessionScope.typeValue}"></c:set>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">

        <title>Group 1 - List Setting</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="icon" href="img/cai nay hoi la.png" type="image/gif" sizes="16x16">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="css/css379.css" rel="stylesheet">

    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="../Sidebar.jsp"></jsp:include>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                    <jsp:include page="../Header.jsp"></jsp:include>
                        <!-- End of Topbar -->
                        <!-- Begin Page Content -->
                        <div class="container-fluid">                                                         
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h3 class="m-0 font-weight-bold text-primary">Subject Setting List</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <form action="SearchSet" method="POST">
                                        <a class="LinkHere" href="SubjectSettingList?go=addSubjectSetting">Add Setting</a>
                                    </form>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Setting ID</th>
                                                <th>Subject Code</th>
                                                <th>Type</th>
                                                <th>Setting Title</th>
                                                <th>Setting Value</th>
                                                <th>Display Order</th>
                                                <th>Status</th>
                                                <th>Options</th>
                                                <th>Update Status</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Setting ID</th>
                                                <th>Subject Code</th>
                                                <th>Type</th>
                                                <th>Setting Title</th>
                                                <th>Setting Value</th>
                                                <th>Display Order</th>
                                                <th>Status</th>
                                                <th>Options</th>
                                                <th>Update Status</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="o" items="${SubjectSettingList}">
                                                <tr>
                                                    <td>${o.setting_id}</td>
                                                    <td>${o.subject_id}</td>
                                                    <td>${o.type_id}</td>
                                                    <td>${o.setting_title}</td>
                                                    <td>${o.setting_value}</td>
                                                    <td>${o.display_order}</td>
                                                    <td>
                                                        <c:if test="${o.status == 1}">
                                                            <% out.print("Activate"); %>
                                                        </c:if>
                                                        <c:if test="${o.status == 2}">
                                                            <% out.print("Deactivate"); %>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <a href="SubjectSettingDetail?go=UpdateSubjectSetting&setting_id=${o.setting_id}&Type=${o.type_id}"><i class="bi bi-pencil-square"></i></a>      
                                                    </td>
                                                    <td>
                                                        <form method="POST" action="SubjectSettingList">
                                                            <input type="hidden" name="go" value="updateStatus">
                                                            <c:if test="${o.status == 2}">
                                                                <input type="hidden" name="settingId" value="${o.setting_id}" readonly>
                                                                <input type="submit" name="submit" value="Activate">
                                                            </c:if>
                                                            <c:if test="${o.status == 1}">
                                                                <input type="hidden" name="settingId" value="${o.setting_id}" readonly>
                                                                <input type="submit" name="submit" value="Deactivate">
                                                            </c:if>
                                                        </form>  
                                                    </td>
                                                </tr>                    
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <jsp:include page="../LogOut.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        
        <script src="js/SenJS.js"></script>
            <script src="js/fnon.min.js"></script>
            <script>
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        Fnon.Hint.Init({
                                                            zIndex: 9900,
                                                        });
                                                        // Hint
                                                        var message = "${message}";
                                                        var theme = "${theme}";
                                                        var title = "${title}";
                                                        var position = "right-top";
                                                        var animation = "slide-left";
                                                        Fnon.Hint[theme](message, {
                                                            title,
                                                            position,
                                                            animation,
                                                        })
                                                    });
        </script>

    </body>
</html>
