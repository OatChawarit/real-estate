<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage-user.aspx.cs" Inherits="real_estate.pages.admin.main_admin" %>

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
            margin-bottom: 10px !important;
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
            /*color: var(--ltn__secondary-color) !important;*/
        }

        .list {
            max-height: 500px;
            overflow: auto !important;
        }

        input[type="number"] {
            background-color: var(--white);
            border: 2px solid;
            border-color: var(--border-color-9);
            height: 65px;
            box-shadow: none;
            padding-left: 20px;
            font-size: 16px;
            color: var(--ltn__paragraph-color);
            width: 100%;
            margin-bottom: 30px;
            border-radius: 0;
            padding-right: 40px;
        }

            input[type="number"]:focus {
                border-color: var(--ltn__secondary-color);
            }

        .input-item-number.ltn__custom-icon::before {
            content: "\f51e";
        }
    </style>
</head>
<body>
    <!-- Body main wrapper start -->
    <div class="body-wrapper">
        <!-- นำเข้าเมนู -->
        <!-- #include virtual ="../include/topbar-admin.html" -->

        <!-- เนื้อหา -->
        <!-- Begin Page Content -->
        <form runat="server" action="manage-user.aspx" method="post" enctype="multipart/form-data">
            <div class="container-xl " style="font-size: 13px;">
                <!-- Page Heading -->
                <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                    <div>
                        <h1 class="h3 mb-2 text-gray-800 d-sm-inline-block">จัดการผู้ใช้งาน</h1>
                    </div>
                    <div class="text-end">
                        <%--<a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>--%>
                        <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                    </div>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div class="row col-12">
                            <h5 class="m-0 font-weight-bold text-primary mr-5">จัดการผู้ใช้งาน</h5>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="form-group row">

                            <div class="table-responsive" style="padding-bottom: 30px">
                                <%--<table class="table table-bordered dataTable js-exportable" id="orderTable" width="100%" cellspacing="0">--%>
                                <table class="table table-striped " id="user-table" width="100%" cellspacing="0">
                                    <thead class="table-dark" align="center">
                                        <tr id="trUser">
                                            <th style="width: 60px; min-width: 60px; max-width: 60px; vertical-align: middle;">#</th>
                                            <th>รหัสสมาชิก</th>
                                            <th>รหัสผู้ใช้งาน</th>
                                            <th>ชื่อ</th>
                                            <th>นามสกุล</th>
                                            <th>สิทธิ์ผู้ใช้งาน</th>
                                            <th>เข้าใช้งานล่าสุด</th>
                                            <th class="text-center">สถานะ</th>
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

            <div class="modal fade " id="EditUserModal" tabindex="-1" role="dialog" aria-labelledby="EditUserModal" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header setting-modal">
                            <h5 class="modal-title topic-text" id="topic_Modal">แก้ไขข้อมูลผู้ใช้งาน</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <div class="modal-body">

                            <ul class="nav nav-tabs d-none" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"></a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                    <div id="labelUser" class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">ข้อมูลส่วนตัว</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group row ">
                                                <div id="divProjectInfo" class="row col-12 setting-row">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">รหัสสมาชิก *</div>
                                                            <input type="text" id="user_id" placeholder="รหัสสมาชิก" class="setting-form" value="" readonly="true" />
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">รหัสผู้ใช้งาน *</div>
                                                            <input type="text" id="user_email" placeholder="รหัสผู้ใช้งาน" class="setting-form" value="" readonly="true" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="inputText setting-font">ชื่อ *</div>
                                                        <input type="text" id="user_firstName" placeholder=" " class="setting-form" value="" readonly="true" />
                                                    </div>


                                                    <div class="col-lg-6">
                                                        <div class="inputText setting-font">นามสกุล *</div>
                                                        <input type="text" id="user_lastName" placeholder=" " class="setting-form" value="" readonly="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="inputText setting-font">ประเภทผู้ใช้งาน</div>
                                                        <select id="user_role_id" class="w-100" disabled="disabled">
                                                            <option value="">-- เลือกประเภทผู้ใช้งาน --</option>
                                                            <%
                                                                real_estate.ClassData.DropDownData.drdwRoleType();
                                                            %>
                                                        </select>
                                                    </div>


                                                    <div class="col-lg-6">
                                                        <div class="inputText setting-font">ประเภทผู้ใช้งาน</div>
                                                        <select id="user_status" class="w-100">
                                                            <option value="">-- เลือกประเภทผู้ใช้งาน --</option>
                                                            <option value="N">Panding</option>
                                                            <option value="A">Active</option>
                                                            <option value="C">InActive</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="labelPass" class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold  " style="color: #dc3545">เปลี่ยนรหัสผ่าน</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row ">

                                            <div id="divProjectAddress" class="row col-12 setting-row">
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">รหัสผ่านใหม่ *</div>
                                                    <input type="password" id="user_password" placeholder=" " class="setting-form" value="" maxlength="20" />
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">ยืนยันรหัสผ่านใหม่ *</div>
                                                    <input type="password" id="confirm_user_password" placeholder=" " class="setting-form" value="" maxlength="20" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!-- close nav tabs -->
                        </div>

                        <!-- close modal body -->
                        <div class="modal-footer">
                            <button id="btnSave" type="button" class="btn-setting btn btn-primary btnSave" onclick="onConfirm(this.value)" value="Edit"><i class="far fa-save"></i>&nbsp;Save</button>
                            <button type="button" class="btn-setting btn-secondary close" data-dismiss="modal"><i class="fas fa-times"></i>&nbsp;Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </form>
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
    let LogIn = localStorage.getItem("LogInData");
    let userData = JSON.parse(LogIn);

    $(document).ready(function () {

        checkLogin(1);
        loadUser();

        $('#user-table').DataTable({
            "destroy": true,
            "responsive": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            pageLength: 10,

            "order": [[1, "asc"]]
        });
    });

    function onConfirm(types) {
        //console.log(types);
        var uid = $("#user_id").val();
        var upass = $("#user_password").val();
        var ustatus = $("#user_status").val();
        var cfpass = $("#confirm_user_password").val();
        var json;

        //เปลี่ยนสถานะ
        if ((upass == "" || cfpass == "") || ((upass == null || cfpass == null))) {
            json = JSON.stringify({
                user_id: uid,
                user_password: upass,
                user_status: ustatus,
                forgot: "0" //เอาไปเช็คเพื่อเปลี่ยนสถานะ
            });

            $.get("../../api/userData", { jsonData: json, types: "update_user", username: userData[0].user_id })
                .done(function (data) {
                    Sdata = data;
                    //console.log(Sdata);
                    if (Sdata == "success") {
                        Swal.fire(
                            "Success", //title
                            "แก้ไขข้อมูล เรียบร้อย!", //main text
                            "success" //icon
                        );
                        $("#EditUserModal").modal("hide");
                        loadUser();
                    } else {
                        Swal.fire(
                            "Found an Error", //title
                            "แก้ไข ไม่สำเร็จ!", //main text
                            "error" //icon
                        );
                    }
                });

        }
        //เปลี่ยนพาสเวิร์ด
        else {
            if (upass != cfpass) {
                Swal.fire(
                    "Warning", //title
                    "กรุณากรอก รหัสผ่านใหม่และยืนยันรหัสผ่านใหม่, ให้ตรงกัน!!", //main text
                    "warning" //icon
                );
            } else {
                json = JSON.stringify({
                    user_id: uid,
                    user_password: upass,
                    user_status: ustatus,
                    forgot: "1" //เอาไปเช็คเพื่อเปลี่ยนพาสเวิร์ด
                });

                $.get("../../api/userData", { jsonData: json, types: "update_user", username: userData[0].user_id })
                    .done(function (data) {
                        Sdata = data;
                        //console.log(Sdata);
                        if (Sdata == "success") {
                            Swal.fire(
                                "Success", //title
                                "แก้ไขข้อมูล เรียบร้อย!", //main text
                                "success" //icon
                            );
                            $("#Edit-UserModal").modal("hide");
                            loadUser();
                        } else {
                            Swal.fire(
                                "Found an Error", //title
                                "แก้ไข ไม่สำเร็จ!", //main text
                                "error" //icon
                            );
                        }
                    });
            }
        }

        //console.log(json);
    }

    $(document).on("click", ".btnEdit", function () {
        var uid = $(this).data('value');
        console.log(uid);

        //HideTopbar(1);
        ClearModal("#EditUserModal");

        $("#EditUserModal").modal("show");
        LockModal("#EditUserModal");

        var json = JSON.stringify({
            user_id: uid
        });
        $.get("../../api/userData", { jsonData: json, types: "get_user", username: userData[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);
                //console.log(Sdata);
                if (Sdata.length > 0) {
                    //console.log(Sdata);
                    $("#user_id").val(Sdata[0].user_id);
                    $("#user_email").val(Sdata[0].user_email);
                    $("#user_firstName").val(Sdata[0].user_firstName);
                    $("#user_lastName").val(Sdata[0].user_lastName);
                    $("#user_role_id").val(Sdata[0].user_role_id);
                    $("#user_status").val(Sdata[0].user_status);

                    $('#user_role_id').niceSelect('update');
                    $('#user_status').niceSelect('update');
                }
                else {
                    Swal.fire(
                        "Found an Error", //title
                        "ไม่พบข้อมูล", //main text
                        "error" //icon
                    );
                }
            });
    });


    $(document).on("click", ".btnCanCel", function () {
        var uid = $(this).data('value');
        //console.log(uid);
        //HideTopbar(1);
        var jsonData = JSON.stringify({
            user_id: uid,
        });
        Swal.fire({
            title: 'คุณต้องยกเลิกผู้ใช้งาน!',
            html: '<p>รหัสสมาชิก : ' + uid + ' ใช่หรือไม่ ? </p>',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ตกลง',
            cancelButtonText: 'ยกเลิก',
        }).then((result) => {
            if (result.value) {
                $.get("../../api/userData", { jsonData: jsonData, types: "cancel_user", username: userData[0].user_id })
                    .done(function (data) {
                        Sdata = data;
                        //console.log(Sdata);
                        if (Sdata == "success") {
                            Swal.fire(
                                "Success", //title
                                "ยกเลิกข้อมูล เรียบร้อย!", //main text
                                "success" //icon
                            );
                            loadUser();
                        } else {
                            Swal.fire(
                                "Found an Error", //title
                                "แก้ไข ไม่สำเร็จ!", //main text
                                "error" //icon
                            );
                        }
                    });
            }
        });
    });


    $(document).on("click", "#trUser", function () {
        loadUser();
    });


    function loadUser() {
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

        let tb = $("#user-table").DataTable();
        $("#user-table").DataTable().clear().draw();

        $.get("../../api/userData", { jsonData: jsonData, types: "list_user", username: userData[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);
                console.log(Sdata);
                if (Sdata.length > 0) {
                    Sdata.forEach((item, rows) => {
                        let Status = "";
                        let ShowRole = "";
                        let Action = "";
                        if (item.user_status == 'A') {
                            Status = '<span class="bg-green" style="padding: 5px;">Active</span>';
                            Action = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.user_id + `' data-value='` + item.user_id + `' title='ยกเลิก'><i class='fas fa-trash-alt'></i></button>`;
                        }
                        else if (item.user_status == 'C') {
                            Status = '<span class="bg-red" style="padding: 5px;">InActive</span>';
                            Action = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.user_id + `' data-value='` + item.user_id + `' title='ยกเลิก' disabled><i class='fas fa-trash-alt'></i></button>`;
                        }
                        else if (item.user_status == 'N' && (item.user_role_id == "1" || item.user_role_id == "2" || item.user_role_id == "3")) {
                            Status = '<span class="bg-blue" style="padding: 5px;">Panding</span>';
                             Action = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.user_id + `' data-value='` + item.user_id + `' title='ยกเลิก'><i class='fas fa-trash-alt'></i></button>`;
                        }

                        if (item.user_role_id == '1') {
                            ShowRole = '<span class="bg-green" style="padding: 5px;">Administrator</span>';
                        }
                        else if (item.user_role_id == '2') {
                            ShowRole = '<span class="bg-blue" style="padding: 5px;">Customer</span>';
                        }
                        else {
                            ShowRole = '<span class="bg-orange" style="padding: 5px;">Sale</span>';
                        }

                        tb.row.add([
                            `<div class="text-center">
                            <button type='button' class='btn-primary btn-sm btnEdit' id='btnEdit` + item.user_id + `' data-value='` + item.user_id + `' title='แก้ไข'><i class='fas fa-eye'></i></button>
                            ${Action}</div>`,
                            `<div class="text-center">${item.user_id}</div>`,
                            `<div >${item.user_email}</div>`,
                            `<div >${item.user_firstName}</div>`,
                            `<div >${item.user_lastName}</div>`,
                            `<div class="text-center">${ShowRole}</div>`,
                            `<div class="text-center">${item.last_login}</div>`,
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
        $('#EditUserModal').modal('hide');
    });


    $(".btn-Refresh").click(function () {
        location.reload();
    });
</script>
</html>
