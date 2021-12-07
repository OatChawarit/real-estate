<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order-list.aspx.cs" Inherits="real_estate.pages.sales.order_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="../../vendor/img/favicon.png" type="image/x-icon" />

    <!-- นำเข้าส่วนหัว -->
    <!-- #include virtual ="../include/header.html" -->

    <style>
        .btn-setting {
            padding: 5px 25px !important;
        }

        .modal-dialog {
            /*margin-top: 0px !important;*/
            margin-top: 25px !important;
        }

        .setting-form {
            height: 50px !important;
        }

        .setting-modal {
            padding: 1rem 1rem !important;
            border-bottom: 1px solid #dee2e6 !important;
        }

        .setting-row {
            margin: 0 !important;
            padding: 0 !important;
        }

        .setting-font {
            font-size: 15px !important;
            padding: 0 10px 0 10px;
        }

        .list {
            max-height: 500px;
            overflow: auto !important;
        }
    </style>

</head>
<body>
    <!-- Body main wrapper start -->
    <div class="body-wrapper">
        <!-- นำเข้าเมนู -->
        <!-- #include virtual ="../include/topbar.html" -->

        <!-- เนื้อหา -->
        <!-- Order -->
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../vendor/img/bg/24.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">รายการใบสั่งจอง</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="main.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>หน้าแรก</a></li>
                                    <li>รายการใบสั่งจอง</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->

        <!-- Begin Page Content -->
        <div class="container-xl " style="font-size: 13px;">
            <!-- Page Heading -->
            <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                <div class="text-end">
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                </div>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row col-12">
                        <h5 class="m-0 font-weight-bold text-primary mr-5">ข้อมูลรายการใบสั่งจอง</h5>
                    </div>

                </div>
                <div class="card-body">
                    <div class="form-group row">

                        <div class="table-responsive" style="padding-bottom: 30px">
                            <%--<table class="table table-bordered dataTable js-exportable" id="orderTable" width="100%" cellspacing="0">--%>
                            <table class="table table-bordered " id="register_project" width="100%" cellspacing="0">
                                <thead class="table-dark" align="center">
                                    <tr>
                                        <th style="width: 60px; min-width: 60px; max-width: 60px; vertical-align: middle;"></th>
                                        <th>รหัสสั่งจอง</th>
                                        <th>วันที่สั่งจอง</th>
                                        <th>ชื่อผู้สั่งจอง</th>
                                        <th>รหัสโครงการ</th>
                                        <th>ชื่อโครงการ</th>
                                        <th>ประเภทโครงการ</th>
                                        <th>ราคา</th>
                                        <th>ชื่อตัวแทนขาย</th>
                                        <th>เบอร์โทรติดต่อ</th>
                                        <th>สถานะสั่งจอง</th>
                                    </tr>
                                </thead>
                                <!--js-exportable -->
                                <tbody>
                                </tbody>
                                <tfoot align="center" style="background-color: black;">
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- Begin Page Content -->
        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>

<script>

    const d = new Date();
    let yearNow = d.getFullYear();

    $(document).ready(function () {
        //checkLogin(3);

        $('#FormModal_Project').modal({ backdrop: 'static', keyboard: false })

        $('#footer_callme').addClass('d-none');
        $('#register_project').DataTable({
            "destroy": true,
            "responsive": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            pageLength: 10,

            "order": [[1, "asc"]]
        });

    });
</script>
</html>
