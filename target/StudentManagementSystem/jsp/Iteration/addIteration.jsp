<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : addSetting
    Created on : May 18, 2022, 3:54:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Group 1 - Add Setting</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/CaiNayCuaThanh.css" rel="stylesheet">

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

                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-gray-800">Add more Iteration here</h1>
                        <div class="InputForm">
                            <form method="POST" action="IterationListServlet">
                                <input type="hidden" name="go" value="addIteration">
                                <table >
                                    <tbody>
                                        <tr>
                                            <td>Subject Code: <td>
                                                <select class="form-control form-control-user id" id="subjectId" name="subjectId">
                                                <c:forEach var="o" items="${listSubCode}">
                                                    <option value="${o.subject_id}">${o.subject_code}</option>
                                                </c:forEach>
                                                
                                                </select>                                            
                                            
                                        </tr>
                                        <tr>
                                            <td> Iteration Name: </td>
                                            <td><input class="form-control form-control-user id" type="text" name="name" required></td>
                                        </tr>
                                        <tr>
                                            <td>Duration: </td>
                                            <td><input class="form-control form-control-user id" type="text" name="duration" placeholder="Ex: 1 day/month,...." required></td>
                                        </tr>                                     
                                        <tr>
                                            <td>Status: </td>
                                            <td><input type="radio" name="status" value="1" checked>Active
                                                <input type="radio" name="status" value="2">Deactive</td>
                                        </tr>
                                        <tr>
                                            <td>Note </td>
                                            <td><textarea class="form-control form-control-user id" name="note"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input class="SubBut" type="submit" value="Add" name="submit"></td>
                                        </tr>
                                    </tbody>
                                    <p style="color: red">${thongbao}</p>
                                </table>                     
                            </form>
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

    </body>
</html>
