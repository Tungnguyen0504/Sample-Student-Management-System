
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Group 1 - Feature List</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="icon" href="img/cai nay hoi la.png" type="image/gif" sizes="16x16">
        <link href="css/SenCss.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

        <!-- Need copy for use alert-->
        <link rel="stylesheet" href="fnon.min.css">
        <!-- End Need copy for use alert-->
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
                            <h1 style="font-weight: bold" class="h3 mb-2 text-gray-800"> Feature List</h1>
                            <a style=" position: absolute;
                               display: flex;
                               align-items: flex-start;" type="submit" href="FeatureDetail?go=add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"/>Add new feature</a>
                            <ul class="spbw" style="justify-content: flex-end;" > 

                                <li>    
                                    <form style="display: flex !important; " action="FeatureSearch?go=searchClass" method="POST">
                                        <label for="class_id"></label>
                                        <select class="form-control form-control-user" name="class" onchange="this.form.submit()">

                                        <c:forEach var="o" items="${TeamList}">
                                            <option value="${o.class_id}" ${Id==o.class_id ? "selected" : ""}>${o.class_code}</option>
                                        </c:forEach>
                                    </select></form></li>
                            <form style="display: flex !important; " action="FeatureSearch?go=searchTeam" method="POST">
                                <label for="team_id"></label>
                                <select class="form-control form-control-user" name="team" onchange="this.form.submit()">

                                    <c:forEach var="o" items="${TeamList}">
                                        <option value="${o.team_id}" ${Id1==o.team_id ? "selected" : ""}>${o.team_name}</option>
                                    </c:forEach>
                                </select></form>
                            <li>    <form action="FeatureSearch?go=search" method="POST">
                                    <input style ="" type="text" name="searchName"  placeholder="Search feature name" value="${txtSearch}">
                                    <input class="btn btn-primary"type="submit" value="Search" name="submit" >
                                </form></li>
                        </ul> 


                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">                           
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                        <thead>
                                            <tr>

                                                <th>Team</th>
                                                <th>Feature</th>                                                   
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="o" items="${FeatureList}">
                                                <tr>
                                                    <td visibility: hidden>${o.feature_id}</td>

                                                    <td>${o.team_name}</td>
                                                    <td>${o.feature_name}</td>
                                                    <td visibility: hidden>${o.team_id}</td>  
                                                    <td>
                                                        <form id="idS${o.feature_id}" action="FeatureList?go=updateStatus" method="POST">
                                                            <input type="hidden" name="featureId" value="${o.feature_id}">
                                                            <select class="form-control form-control-user" name="status" onchange="submitForm(idS${o.feature_id})" >
                                                                <option ${o.status == 2 ? "selected" : ""} value="2">Deactivate</option>
                                                                <option ${o.status == 1 ? "selected" : ""} value="1">Active</option>
                                                            </select>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <a class="EditLink" href="FeatureDetail?go=Update&fid=${o.feature_id}&Tid=${o.team_id}"><span class="material-symbols-outlined">
                                                                edit
                                                            </span>
                                                        </a>

                                                    </td>
                                                </tr>                    
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                    <div class="paging">
                                        <c:forEach begin="1" end="${maxP}" var="i"  >    
                                            <a class ="active" href="FeatureSearch?index=${i}">${i}</a>                 
                                        </c:forEach>

                                    </div>
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
                            <span>Copyright &copy; Your Website 2021</span>
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
            <!-- Need copy for use alert-->
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
        <!-- End Need copy for use alert-->
        <script>
            function submitForm(form) {
                swal({
                    title: "Are you sure?",
                    text: "This form will be submitted",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then(function (isOkay) {
                            if (isOkay) {
                                form.submit();
                            }
                        });
                return false;
            }
        </script>
        <!-- End Need copy for use alert-->
        <script src="js/sweetalert.min.js"></script>
    </body>

</html>
