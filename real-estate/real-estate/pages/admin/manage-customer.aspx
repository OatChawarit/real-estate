<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage-customer.aspx.cs" Inherits="real_estate.pages.admin.manage_customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="../../vendor/img/favicon.png" type="image/x-icon" />

    <!-- นำเข้าส่วนหัว -->
    <!-- #include virtual ="../include/header.html" -->
</head>
<body>
    <!-- Body main wrapper start -->
    <div class="body-wrapper">
        <!-- นำเข้าเมนู -->
        <!-- #include virtual ="../include/topbar-admin.html" -->

        <!-- เนื้อหา -->
        <!-- Begin Page Content -->
        <div class="container-xl " style="font-size: 13px;">
            <!-- Page Heading -->
            <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                <div>
                    <h1 class="h3 mb-2 text-gray-800 d-sm-inline-block">จัดการสมาชิก</h1>
                </div>
                <div class="text-end">
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                </div>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row col-12">
                        <h5 class="m-0 font-weight-bold text-primary mr-5">ข้อมูลสมาชิก</h5>
                    </div>

                </div>
                <div class="card-body">
                    <div class="form-group row">

                        <div class="table-responsive" style="padding-bottom: 30px">
                            <%--<table class="table table-bordered dataTable js-exportable" id="orderTable" width="100%" cellspacing="0">--%>
                            <table class="table table-striped " id="customer-table" width="100%" cellspacing="0">
                                <thead class="table-dark" align="center">
                                    <tr>
                                        <th style="width: 60px; min-width: 60px; max-width: 60px; vertical-align: middle;">#</th>
                                        <th>รหัสสมาชิก</th>
                                        <th>รหัสผู้ใช้</th>
                                        <th>ชื่อ</th>
                                        <th>นามสกุล</th>
                                        <th>เลขบัตรประจำตัวประชาชน</th>
                                        <th>เบอร์โทร</th>
                                        <th>สถานะ</th>
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
        <!-- #include virtual ="../include/footcontent-admin.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>

    const d = new Date();
    let yearNow = d.getFullYear();
    let Sdata;
    const userData = JSON.parse(localStorage.getItem("LogInData"));

    $(document).ready(function () {
        checkLogin(1);
        loadCustomer();

        $('#customer-table').DataTable({
            "destroy": true,
            "responsive": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            pageLength: 10,

            "order": [[1, "asc"]]
        });

    });

    $(document).on("click", ".btnEdit", function () {
        var uid = $(this).data('value');
        HideTopbar(1);
        console.log(uid);
        //$("#Edit-UserModal").modal("show");
    });

    function loadCustomer() {
        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });

        var jsonData = JSON.stringify({

        });

        let tb = $("#customer-table").DataTable();

        $.get("../../api/userData", { jsonData: jsonData, types: "list_customer", username : userData[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);
                console.log(Sdata);

                if (Sdata.length > 0) {
                    Sdata.forEach((item, rows) => {
                        let Status = "";
                        if (item.cus_status == 'A') {
                            Status = '<span class="bg-green" style="padding: 5px;">Active</span>';
                        }
                        else if (item.cus_status == 'C') {
                            Status = '<span class="bg-red" style="padding: 5px;">InActive</span>';
                        }
                        else if (item.cus_status == 'N' && item.user_role_id == "3") {
                            Status = '<span class="bg-blue" style="padding: 5px;">Panding</span>';
                        }

                        tb.row.add([
                            `<div class="text-center"><button type='button' class='btn-primary btn-sm btnEdit' id='btnEdit' data-value='` + item.cus_id + `' title='แก้ไข'><i class='fas fa-eye'></i></button></div>`,
                            `<div class="text-center">${item.cus_id}</div>`,
                            `<div class="text-center">${item.user_id}</div>`,
                            `<div >${item.cus_firstName}</div>`,
                            `<div >${item.cus_lastName}</div>`,
                            `<div >${item.cus_idCard}</div>`,
                            `<div class="text-center">${item.cus_phone}</div >`,
                            `<div class="text-center">${Status}</div>`,
                        ]).draw(false);

                        Swal.close();
                    });
                } else {
                    Swal.fire(
                        "Found an Error", //title
                        "ไม่พบข้อมูล", //main text
                        "error" //icon
                    );
                }

            });
    }

    $('.close').click(() => {
        HideTopbar(0);
        $('#Edit-UserModal').modal('hide');
    });


    $(".btn-Refresh").click(function () {
        location.reload();
    });
</script>
</html>
