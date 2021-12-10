<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage-project.aspx.cs" Inherits="real_estate.pages.admin.manage_project" %>


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
        <div class="container-xl " style="font-size: 13px;">
            <!-- Page Heading -->
            <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                <div>
                    <h1 class="h3 mb-2 text-gray-800 d-sm-inline-block">จัดการโครงการ</h1>
                </div>
                <div class="text-end">
                    <%--<a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>--%>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                </div>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row col-12">
                        <h5 class="m-0 font-weight-bold text-primary mr-5">จัดการโครงการ</h5>
                    </div>

                </div>
                <div class="card-body">
                    <div class="form-group row">

                        <div class="table-responsive" style="padding-bottom: 30px">
                            <%--<table class="table table-bordered dataTable js-exportable" id="orderTable" width="100%" cellspacing="0">--%>
                            <table class="table table-striped " id="pro-table" width="100%" cellspacing="0" style="overflow-x: auto;">
                                <thead class="table-dark" align="center">
                                    <tr id="trPro">
                                        <th style="width: 100px; min-width: 60px; max-width: 100px; vertical-align: middle;">#</th>
                                        <th>รูปภาพ</th>
                                        <th>รหัสแปลน</th>
                                        <th>ชื่อแปลน</th>
                                        <th>ขนาดพื้นที่แปลน</th>
                                        <th>รหัสโครงการ</th>
                                        <th>ชื่อโครงการ</th>
                                        <!-- <th>จำนวนยูนิต</th> -->
                                        <th>ราคา</th>
                                        <th style="width: 80px;">วันเดือนปีที่เปิดขาย</th>
                                        <th class="text-center">ผู้เข้าชม</th>
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
        <!-- เนื้อหา -->

        <div class="modal fade " id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModal" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header setting-modal">
                        <h5 class="modal-title topic-text" id="topic_Modal">รายละเอียดโครงการ</h5>
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
                                        <h6 class="m-0 font-weight-bold text-primary">ข้อมูลโครงการ</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row ">
                                            <div id="divProjectInfo" class="row col-12 setting-row">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="inputText setting-font">รหัสโครงการ *</div>
                                                        <input type="text" id="pro_id" placeholder="" class="setting-form" value="" readonly="true" />
                                                    </div>

                                                    <div class="col-lg-6">
                                                        <div class="inputText setting-font">ชื่อโครงการ *</div>
                                                        <input type="text" id="pro_name" placeholder="" class="setting-form" value="" readonly="true" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">โซน/ทำเล/ปริมณฑล</div>
                                                    <select id="drdwProjectLocation" class="w-100" disabled="disabled">
                                                        <option value="">เลือกโซน/ทำเล/ปริมณฑล</option>
                                                        <%
                                                            real_estate.ClassData.DropDownData.drdwProjectLocation();
                                                        %>
                                                    </select>
                                                </div>


                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">สถานะโครงการ *</div>
                                                    <input type="text" id="pro_statusType_name" placeholder=" " class="setting-form" value="" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">ตัวแทนขาย *</div>
                                                    <input type="text" id="sale_fullName" placeholder=" " class="setting-form" value="" readonly="true" />
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">โทรติดต่อ *</div>
                                                    <input type="text" id="sale_phone" placeholder=" " class="setting-form" value="" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">ประเภทโครงการ</div>
                                                    <input type="text" id="pro_type_name" placeholder=" " class="setting-form" value="" readonly="true" />
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">จำนวนยูนิต</div>
                                                    <input type="text" id="pro_unit" placeholder=" " class="setting-form" value="" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="inputText setting-font">บริษัทเจ้าของโครงการ</div>
                                                    <input type="text" id="com_name" placeholder=" " class="setting-form" value="" readonly="true" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="labelPass" class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold  " style="color: #dc3545">ข้อมูลแปลน</h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row ">

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="inputText setting-font">รหัสแปลน</div>
                                                <input type="text" id="plan_type_id" placeholder=" " class="setting-form" value="" readonly="true" />
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="inputText setting-font">ชื่อแปลน</div>
                                                <input type="text" id="plan_name" placeholder=" " class="setting-form" value="" readonly="true" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="inputText setting-font">ราคา</div>
                                                <input type="text" id="plan_price" placeholder=" " class="setting-form" value="" readonly="true" />
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="inputText setting-font">พื้นที่</div>
                                                <input type="text" id="plan_useable_area" placeholder=" " class="setting-form" value="" readonly="true" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="inputText setting-font">ห้องนอน</div>
                                                <input type="text" id="plan_bed_room" placeholder=" " class="setting-form" value="" readonly="true" />
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="inputText setting-font">ห้องน้ำ</div>
                                                <input type="text" id="plan_bath_room" placeholder=" " class="setting-form" value="" readonly="true" />
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
                        <!--  <button id="btnSave" type="button" class="btn-setting btn btn-primary btnSave" onclick="onConfirm(this.value)" value="Edit"><i class="far fa-save"></i>&nbsp;Save</button>  -->
                        <button type="button" class="btn-setting btn-secondary close" data-dismiss="modal"><i class="fas fa-times"></i>&nbsp;Close</button>
                    </div>
                </div>
            </div>
        </div>

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
    let userData = JSON.parse(LogIn)

    $(document).ready(function () {

        checkLogin(1);
        loadProject();

        $('#pro-table').DataTable({
            "destroy": true,
            "responsive": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            pageLength: 10,

            "order": [[2, "asc"]]
        });
    });

    //$(document).on("click", "#trPro", function () {
    //    loadProject();
    //});


    $(document).on("click", ".btnEdit", function () {
        var pid = $(this).data('value');
        //console.log(pid);
        //HideTopbar(1);
        ClearModal("#detailModal");

        $("#detailModal").modal("show");
        LockModal("#detailModal");

        var jsonData = JSON.stringify({
            plan_type_id: pid,
        });

        $.get("../../api/findProject", { jsonData: jsonData, types: "AdminGetProject", username: userData[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);
                if (Sdata.length > 0) {
                    //console.log(Sdata);
                    $("#pro_id").val(Sdata[0].pro_id);
                    $("#pro_name").val(Sdata[0].pro_name);
                    $("#pro_location_name").val(Sdata[0].pro_location_name);
                    $("#pro_statusType_name").val(Sdata[0].pro_statusType_name);

                    $("#sale_fullName").val(Sdata[0].sale_fullName);
                    $("#sale_phone").val(Sdata[0].sale_phone);
                    $("#com_name").val(Sdata[0].com_name);

                    $('#drdwProjectLocation').val(Sdata[0].pro_location_id);
                    $("#pro_type_name").val(Sdata[0].pro_type_name);
                    $("#pro_unit").val(Sdata[0].pro_unit);

                    $('#plan_name').val(Sdata[0].plan_name);
                    $("#plan_type_id").val(Sdata[0].plan_type_id);
                    $("#plan_useable_area").val(Sdata[0].plan_useable_area);
                    $('#plan_price').val(Sdata[0].plan_price);
                    $("#plan_bed_room").val(Sdata[0].plan_bed_room);
                    $("#plan_bath_room").val(Sdata[0].plan_bath_room);

                    $('#drdwProjectLocation').niceSelect('update');
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


    $(document).on("click", ".btnApprove", function () {
        var pid = $(this).data('value');
        //console.log(uid);
        //HideTopbar(1);
        var jsonData = JSON.stringify({
            plan_type_id: pid,
            username: userData[0].user_id
        });
        Swal.fire({
            title: 'คุณต้องอนุมัติขายโครงการแล้ว !',
            html: '<p>รหัส : ' + pid + ' ใช่หรือไม่ ? </p>',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ตกลง',
            cancelButtonText: 'ยกเลิก',
        }).then((result) => {
            if (result.value) {
                $.get("../../api/findProject", { jsonData: jsonData, types: "AdminApproveProject", username: userData[0].user_id })
                    .done(function (data) {
                        Sdata = data;
                        //console.log(Sdata);
                        if (Sdata == "success") {
                            Swal.fire(
                                "Success", //title
                                "อนุมัติข้อมูล เรียบร้อย!", //main text
                                "success" //icon
                            );
                            loadProject();
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

    $(document).on("click", ".btnCanCel", function () {
        var pid = $(this).data('value');
        //console.log(uid);
        //HideTopbar(1);
        var jsonData = JSON.stringify({
            plan_type_id: pid,
            username: userData[0].user_id
        });
        Swal.fire({
            title: 'คุณต้องยกเลิกโครงการ !',
            html: '<p>รหัส : ' + pid + ' ใช่หรือไม่ ? </p>',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ตกลง',
            cancelButtonText: 'ยกเลิก',
        }).then((result) => {
            if (result.value) {
                $.get("../../api/findProject", { jsonData: jsonData, types: "AdminCancelProject", username: userData[0].user_id })
                    .done(function (data) {
                        Sdata = data;
                        //console.log(Sdata);
                        if (Sdata == "success") {
                            Swal.fire(
                                "Success", //title
                                "ยกเลิกข้อมูล เรียบร้อย!", //main text
                                "success" //icon
                            );
                            loadProject();
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

    function loadProject() {
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

        let tb = $("#pro-table").DataTable();
        $("#pro-table").DataTable().clear().draw();

        $.get("../../api/findProject", { jsonData: jsonData, types: "AdminProject", username: userData[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);
                console.log(Sdata);
                if (Sdata.length > 0) {

                    createTable(Sdata, "");
                    //Sdata.forEach((item, rows) => {
                    //    let Status = "";
                    //    let Cancel = "";
                    //    let Approve = "";

                    //    if (item.plan_status == 'A') {
                    //        Status = '<span class="bg-green" style="padding: 5px;">On Sold</span>';
                    //        Cancel = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='ยกเลิก' disabled><i class='fas fa-trash-alt'></i></button>`;
                    //        Approve = `<button type='button' class='btn-success btn-sm btnApprove' id='btnApprove` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='อนุมัติขายแล้ว' disabled><i class="fas fa-check"></i></button>`;
                    //    }
                    //    else if (item.plan_status == 'C') {
                    //        Status = '<span class="bg-red" style="padding: 5px;">Cancel</span>';
                    //        Cancel = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='ยกเลิก' disabled><i class='fas fa-trash-alt'></i></button>`;
                    //        Approve = `<button type='button' class='btn-success btn-sm btnApprove' id='btnApprove` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='อนุมัติขายแล้ว' disabled><i class="fas fa-check"></i></button>`;
                    //    }
                    //    else if (item.plan_status == 'N') {
                    //        Status = '<span class="bg-blue" style="padding: 5px;">On Sale</span>';
                    //        Approve = `<button type='button' class='btn-success btn-sm btnApprove' id='btnApprove` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='อนุมัติขายแล้ว'><i class="fas fa-check"></i></button>`;
                    //        Cancel = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='ยกเลิก'><i class='fas fa-trash-alt'></i></button>`;
                    //    }

                    //    tb.row.add([
                    //        `<div class="text-center">
                    //        <button type='button' class='btn-primary btn-sm btnEdit' id='btnEdit` + item.plan_type_id + `' data-value='` + item.plan_type_id + `' title='ดูรายละเอียด'><i class='fas fa-eye'></i></button>
                    //        ${Cancel} ${Approve}</div>`,
                    //        `<div class="text-center"><img src='../../image/project/${item.plan_image_profile}' id="news_image" alt="Image" style='width:80px;height:60px' /></div>`,
                    //        `<div class="text-center">${item.plan_type_id}</div>`,
                    //        `<div >${item.plan_name}</div>`,
                    //        `<div >${item.plan_useable_area}</div>`,
                    //        `<div >${item.pro_id}</div>`,
                    //        `<div >${item.pro_name}</div>`,
                    //        //`<div >${item.pro_unit}</div>`,
                    //        `<div class="text-center">${money_format(item.plan_price)}</div >`,
                    //        `<div >${nowDateString(item.pro_opening_date)}</div >`,
                    //        `<div class="text-center">${item.plan_view}</div>`,
                    //        `<div class="text-center">${Status}</div>`,
                    //    ]).draw(false);

                    //    Swal.close();
                    //});
                } else {
                    Swal.fire(
                        "Found an Error", //title
                        "ไม่พบข้อมูล", //main text
                        "error" //icon
                    );
                }

            });
    }

    function createTable(data, type) {

        $("#pro-table").dataTable({
            "destroy": true,
            data: data,
            "responsive": true,
            "bLengthChange": true,
            "bInfo": true,
            "searching": true,
            "bPaginate": true,
            columns: [
                {
                    render: function (data, type, row, meta) {
                        let Cancel = "";
                        let Approve = "";

                        if (row.plan_status == 'A') {
                            Cancel = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='ยกเลิก' disabled><i class='fas fa-trash-alt'></i></button>`;
                            Approve = `<button type='button' class='btn-success btn-sm btnApprove' id='btnApprove` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='อนุมัติขายแล้ว' disabled><i class="fas fa-check"></i></button>`;
                        }
                        else if (row.plan_status == 'C') {
                            Cancel = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='ยกเลิก' disabled><i class='fas fa-trash-alt'></i></button>`;
                            Approve = `<button type='button' class='btn-success btn-sm btnApprove' id='btnApprove` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='อนุมัติขายแล้ว' disabled><i class="fas fa-check"></i></button>`;
                        }
                        else if (row.plan_status == 'N') {
                            Cancel = `<button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='ยกเลิก'><i class='fas fa-trash-alt'></i></button>`;
                            Approve = `<button type='button' class='btn-success btn-sm btnApprove' id='btnApprove` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='อนุมัติขายแล้ว'><i class="fas fa-check"></i></button>`;
                        }
                        let chk = `<button type='button' class='btn-primary btn-sm btnEdit' id='btnEdit` + row.plan_type_id + `' data-value='` + row.plan_type_id + `' title='ดูรายละเอียด'><i class='fas fa-eye'></i></button> ${Cancel} ${Approve}`;

                        return chk;  //" <td>" + chk + "</td>";
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        let imgp = `<img src='../../image/project/` + row.plan_image_profile + `' id="news_image" alt="Image" style='width:80px;height:60px' />`;
                        return imgp
                    },

                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        return row.plan_type_id
                    },
                    //className: "text-center"
                },
                 {
                    render: function (data, type, row, meta) {
                       return row.plan_name
                    },

                    //className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        return row.plan_useable_area
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        return row.pro_id
                    },
                    //className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        return row.pro_name
                    },
                    //className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        return money_format(row.plan_price)
                    },
                    className: "text-center"
                },

                {
                    render: function (data, type, row, meta) {
                        return dateFormat(row.pro_opening_date)
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        return row.plan_view
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {
                        let Status;
                        if (row.plan_status == 'A') {
                            Status = '<span class="bg-green" style="padding: 5px;">On Sold</span>';

                        }
                        else if (row.plan_status == 'C') {
                            Status = '<span class="bg-red" style="padding: 5px;">Cancel</span>';

                        }
                        else if (row.plan_status == 'N') {
                            Status = '<span class="bg-blue" style="padding: 5px;">On Sale</span>';

                        }
                        return Status
                    },
                    className: "text-center"
                }

            ],
            pageLength: 10
        });

        Swal.close();
    }

    $('.close').click(() => {
        HideTopbar(0);
        $('#detailModal').modal('hide');
    });


    $(".btn-Refresh").click(function () {
        location.reload();
    });
</script>
</html>
