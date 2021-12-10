<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="real_estate.pages.home.order_list" %>

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
        <!-- #include virtual ="../include/topbar.html" -->

        <!-- เนื้อหา -->
        <!-- Profile -->
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../vendor/img/bg/24.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">โปรไฟล์</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="main.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>หน้าแรก</a></li>
                                    <li>โปรไฟล์</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->
        <form runat="server" action="project-sales-management.aspx" method="post" enctype="multipart/form-data">
            <!-- Profile -->
            <div class="liton__wishlist-area pb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- PRODUCT TAB AREA START -->
                            <div class="ltn__product-tab-area">
                                <div class="container">
                                    <div class="row">

                                        <div class="col-lg-4">
                                            <div class="ltn__tab-menu-list mb-50">
                                                <div class="nav">
                                                    <a class="active show" data-bs-toggle="tab" href="#profiles" id="tab-profiles">ข้อมูลส่วนตัว<i class="fas fa-user"></i></a>
                                                    <a data-bs-toggle="tab" href="#addr" id="tab-addr" onclick="getAddress()">ที่อยู่<i class="fas fa-home"></i></a>
                                                    <a href="../sales/order-list.aspx" id="tab-order">รายการใบสั่งจอง<i class="fas fa-file-alt"></i></a>
                                                    <a data-bs-toggle="tab" href="#re-pass" id="tab-re-pass">เปลี่ยนรหัสผ่าน<i class="fas fa-redo-alt"></i></a>
                                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#logoutModal">ออกจากระบบ<i class="fas fa-sign-out-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-8">
                                            <div class="tab-content">
                                                <input type="hidden" id="u_id" />

                                                <div class="tab-pane fade active show" id="profiles">
                                                    <div class="ltn__myaccount-tab-content-inner">

                                                        <div class="ltn__form-box">
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ชื่อ*</div>
                                                                    <input type="text" id="cus_firstName" placeholder="" class="setting-form" maxlength="50" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">นามสกุล*</div>
                                                                    <input type="text" id="cus_lastName" placeholder="" class="setting-form" maxlength="50" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">เลขบัตรประชาชน*</div>
                                                                    <input type="text" id="cus_idCard" placeholder="" class="setting-form" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" readonly="true" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">เบอร์ติดต่อ</div>
                                                                    <input type="text" id="cus_phone" placeholder="" class="setting-form" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                                                </div>

                                                                <div class="col-lg-6" id="c_marital_status">
                                                                    <div class="inputText setting-font">สถานภาพ</div>
                                                                    <select id="cus_marital_status" class="w-100">
                                                                        <option value="">-- เลือกสถานภาพ --</option>
                                                                        <option value="โสด">โสด</option>
                                                                        <option value="หย่าร้าง">หย่าร้าง</option>
                                                                        <option value="สมรส">สมรส</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6" id="c_nationality">
                                                                    <div class="inputText setting-font">สัญชาติ</div>
                                                                    <input type="text" id="cus_nationality" placeholder="" class="setting-form" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">วันเกิด (ค.ศ.)</div>
                                                                    <input type="date" id="cus_dateOfBirth" class="setting-form" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">Email*  สำหรับใช้เข้าสู่ระบบ <span id="WarnEmail"></span></div>
                                                                    <input type="email" id="eMail" placeholder=" " class="setting-form" onchange="checkEmail( $('#eMail').val() )" maxlength="60" readonly="true" />
                                                                </div>

                                                                <div class="col-lg-6" id="c_occupation">
                                                                    <div class="inputText setting-font">อาชีพ</div>
                                                                    <input type="text" id="cus_occupation" placeholder="" class="setting-form" />
                                                                </div>
                                                                <div class="col-lg-6" id="c_income">
                                                                    <div class="inputText setting-font">รายได้</div>
                                                                    <input type="number" id="cus_income" value="0" class="setting-form" />
                                                                </div>

                                                                <div class="col-lg-6" id="s_line">
                                                                    <div class="inputText setting-font">Line Id</div>
                                                                    <input type="text" id="sale_line" placeholder="" class="setting-form" maxlength="30" />
                                                                </div>
                                                                <div class="col-lg-6" id="s_company">
                                                                    <div class="inputText setting-font">ชื่อบริษัท</div>
                                                                    <input type="text" id="sale_company" placeholder="" class="setting-form" maxlength="50" />
                                                                </div>

                                                                <div class="col-lg-6" id="s_position">
                                                                    <div class="inputText setting-font">ตำแหน่ง</div>
                                                                    <input type="text" id="sale_position" placeholder="" class="setting-form" maxlength="50" />
                                                                </div>
                                                                <div class="col-lg-6" id="s_AgentApproveNo">
                                                                    <div class="inputText setting-font">ใบอนุญาตขายตัวแทนเลขที่</div>
                                                                    <input type="text" id="sale_AgentApproveNo" placeholder="" class="setting-form" maxlength="20" />
                                                                </div>
                                                            </div>

                                                            <div class="mt-2">
                                                                <button type="button" class="btn theme-btn-1 btn-effect-1" onclick="onEditDetail()">บันทึก</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="addr">
                                                    <div class="ltn__myaccount-tab-content-inner">

                                                        <div class="ltn__form-box">
                                                            <h4>ที่อยู่ปัจจุบัน</h4>
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ที่อยู่ [บ้านเลขที่, หมู่, ซอย, ถนน] *</div>
                                                                    <input type="text" id="cus_address" placeholder="" class="setting-form" title="บ้านเลขที่" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">จังหวัด</div>
                                                                    <select id="drdwProvince" class="w-100 setting-form" onchange="drdwProvinceChange(this.value)">
                                                                        <option value="">-- เลือกจังหวัด --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwProvince();
                                                                        %>
                                                                    </select>
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">อำเภอ/เขต</div>
                                                                    <select id="drdwDistrict" class="w-100 setting-form ignore" onchange="drdwDistrictChange(this.value)">
                                                                        <option value="">-- เลือกอำเภอ/เขต --</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ตำบล/แขวง</div>
                                                                    <select id="drdwSubDistrict" class="w-100 setting-form">
                                                                        <option value="">-- เลือกตำบล/แขวง --</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6 mt-2">
                                                                    <div class="inputText setting-font">รหัสไปรษณีย์</div>
                                                                    <input type="text" id="cus_postal_code" placeholder="" title="รหัสไปรษณีย์" class="setting-form" maxlength="50" />
                                                                </div>
                                                            </div>

                                                            <br />
                                                            <h4>ที่อยู่ตามทะเบียนบ้าน</h4>
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ที่อยู่ [บ้านเลขที่, หมู่, ซอย, ถนน] *</div>
                                                                    <input type="text" id="cus_home_address" placeholder="" class="setting-form" title="บ้านเลขที่" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">จังหวัด</div>
                                                                    <select id="drdwProvinceHome" class="w-100 setting-form" onchange="drdwProvinceHomeChange(this.value)">
                                                                        <option value="">-- เลือกจังหวัด --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwProvince();
                                                                        %>
                                                                    </select>
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">อำเภอ/เขต</div>
                                                                    <select id="drdwDistrictHome" class="w-100 setting-form" onchange="drdwDistrictHomeChange(this.value)">
                                                                        <option value="">-- เลือกอำเภอ/เขต --</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ตำบล/แขวง</div>
                                                                    <select id="drdwSubDistrictHome" class="w-100 setting-form">
                                                                        <option value="">-- เลือกตำบล/แขวง --</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6 mt-2">
                                                                    <div class="inputText setting-font">รหัสไปรษณีย์</div>
                                                                    <input type="text" id="cus_home_postal_code" placeholder="" title="รหัสไปรษณีย์" class="setting-form" maxlength="50" />
                                                                </div>
                                                            </div>

                                                            <div class="mt-2">
                                                                <button type="button" class="btn theme-btn-1 btn-effect-1" onclick="onEditAddr()">บันทึก</button>

                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="re-pass">
                                                    <div class="ltn__myaccount-tab-content-inner">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label>รหัสผ่านเก่า :</label>
                                                                    <input type="password" id="old_pass" class="setting-form" />
                                                                    <label>รหัสผ่านใหม่ :</label>
                                                                    <input type="password" id="user_password" class="setting-form" />
                                                                    <label>ยืนยันรหัสผ่านใหม่ :</label>
                                                                    <input type="password" id="confirm_user_password" class="setting-form" />
                                                                </div>
                                                            </div>
                                                            <div class="mt-2">
                                                                <button type="button" class="btn theme-btn-1 btn-effect-1" onclick="rePassword()">บันทึก</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- PRODUCT TAB AREA END -->

                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--  -->
        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>

<script>
    const profiles = JSON.parse(localStorage.getItem("LogInData"));
    let Sdata;

    $(document).ready(function () {
        if (profiles != "" || profiles != null) {
            //console.log(profiles);
            $("#u_id").val(profiles[0].user_id);

            if (profiles[0].user_role_id == "2") {
                //customer
                $("#s_line").addClass('d-none');
                $("#s_company").addClass('d-none');
                $("#s_position").addClass('d-none');
                $("#s_AgentApproveNo").addClass('d-none');
                getUserDetail(profiles[0].user_id);
            } else {
                //sale
                $("#tab-addr").addClass('d-none');
                $("#c_occupation").addClass('d-none');
                $("#c_income").addClass('d-none');
                $("#c_marital_status").addClass('d-none');
                $("#c_nationality").addClass('d-none');
                getSaleDetail(profiles[0].user_id);
            }
        }
    });



    function getAddress() {
        let uid = $("#u_id").val();
        var jsonData = JSON.stringify({
            user_id: uid
        });
        $('select').niceSelect();

        $.get("../../api/userData", { jsonData: jsonData, types: "list_customer", username: profiles[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);

                if (Sdata.length > 0) {
                    console.log(Sdata);
                    if (Sdata[0].cus_province_id != "") {
                        drdwProvinceChange(Sdata[0].cus_province_id);
                        $('#drdwDistrict').val(Sdata[0].cus_district_id);
                    }
                      if (Sdata[0].cus_district_id != "") {
                          drdwDistrictChange(Sdata[0].cus_district_id);
                           $('#drdwSubDistrict').val(Sdata[0].cus_sub_district_id);
                    }

                    $('#cus_address').val(Sdata[0].cus_address);
                   
                    
                    $('#drdwProvince').val(Sdata[0].cus_province_id);
                    $("#cus_postal_code").val(Sdata[0].cus_postal_code);

                    $("#cus_home_address").val(Sdata[0].cus_home_address);
                    $("#drdwSubDistrictHome").val(Sdata[0].cus_home_sub_district_id);
                    $("#drdwDistrictHome").val(Sdata[0].cus_home_district_id);
                    $("#drdwProvinceHome").val(Sdata[0].cus_home_province_id);
                    $('#cus_home_postal_code').val(Sdata[0].cus_home_postal_code);

                    $('#drdwProvince').niceSelect('update');
                     $('#drdwSubDistrict').niceSelect();
                     $('#drdwSubDistrict').niceSelect();
                    $('#drdwProvinceHome').niceSelect('update');
                    $('#drdwSubDistrictHome').niceSelect('update');
                    $('#drdwDistrictHome').niceSelect('update');

              
              
                }
                else {
                    $('#cus_address').val("");
                    $('#drdwSubDistrict').val("");
                    $('#drdwDistrict').val("");
                    $('#drdwProvince').val("");
                    $("#cus_postal_code").val("");

                    $("#cus_home_address").val("");
                    $("#drdwSubDistrictHome").val("");
                    $("#drdwDistrictHome").val("");
                    $("#drdwProvinceHome").val("");
                    $('#cus_home_postal_code').val("");

                    $('#drdwProvince').niceSelect('update');
                    $('#drdwSubDistrict').niceSelect('update');
                    $('#drdwDistrict').niceSelect('update');
                    $('#drdwProvinceHome').niceSelect('update');
                    $('#drdwSubDistrictHome').niceSelect('update');
                    $('#drdwDistrictHome').niceSelect('update');
                }
            });
    }


    function onEditAddr() {
        var postJson = JSON.stringify({
            user_id: profiles[0].user_id,
            cus_address: $('#cus_address').val(),
            cus_sub_district_id: $('#drdwSubDistrict').val(),
            cus_district_id: $('#drdwDistrict').val(),
            cus_province_id: $('#drdwProvince').val(),
            cus_postal_code: $("#cus_postal_code").val(),

            cus_home_address: $("#cus_home_address").val(),
            cus_home_sub_district_id: $("#drdwSubDistrictHome").val(),
            cus_home_district_id: $("#drdwDistrictHome").val(),
            cus_home_province_id: $("#drdwProvinceHome").val(),
            cus_home_postal_code: $('#cus_home_postal_code').val(),
            typedata: "address"
        });

        console.log(postJson);
    }


    function onEditDetail() {
        if (profiles[0].user_role_id == "2") {
            //customer
            var postJson = JSON.stringify({
                user_id: profiles[0].user_id,
                cus_firstName: $('#cus_firstName').val(),
                cus_lastName: $('#cus_lastName').val(),
                cus_idCard: $('#cus_idCard').val(),
                cus_dateOfBirth: $("#cus_dateOfBirth").val(),
                cus_phone: $("#cus_phone").val(),
                cus_marital_status: $("#cus_marital_status").val(),
                cus_nationality: $("#cus_nationality").val(),
                cus_occupation: $("#cus_occupation").val(),
                cus_income: $('#cus_income').val(),
                typedata: "detail"
            });

            //console.log(postJson);

            $.get("../../api/userData", { jsonData: postJson, types: "update_customer", username: profiles[0].user_id })
                .done(function (data) {
                    let respone = data;
                    if (respone == "success") {
                        Swal.fire(
                            "Success", //title
                            "แก้ไขข้อมูล เรียบร้อย!", //main text
                            "success" //icon
                        );
                        getUserDetail(profiles[0].user_id);
                    } else {
                        Swal.fire(
                            "Found an Error", //title
                            "แก้ไข ไม่สำเร็จ!", //main text
                            "error" //icon
                        );
                    }
                });
        }
        else {
            //sale
            var postJson = JSON.stringify({
                user_id: profiles[0].user_id,
                sale_firstName: $('#cus_firstName').val(),
                sale_idCard: $('#cus_lastName').val(),
                cus_idCard: $('#cus_idCard').val(),
                sale_dateOfBirth: $("#cus_dateOfBirth").val(),
                sale_phone: $("#cus_phone").val(),
                sale_line: $("#sale_line").val(),
                sale_company: $("#sale_company").val(),
                sale_position: $("#sale_position").val(),
                sale_AgentApproveNo: $('#sale_AgentApproveNo').val(),
            });

            //console.log(postJson);

            $.get("../../api/saleData", { jsonData: postJson, types: "update_sale", username: profiles[0].user_id })
                .done(function (data) {
                    let respone = data;
                    if (respone == "success") {
                        Swal.fire(
                            "Success", //title
                            "แก้ไขข้อมูล เรียบร้อย!", //main text
                            "success" //icon
                        );
                        getUserDetail(profiles[0].user_id);
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

    function getSaleDetail(uid) {
        var jsonData = JSON.stringify({
            user_id: uid
        });
        $.get("../../api/saleData", { jsonData: jsonData, types: "list_sale", username: profiles[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);

                if (Sdata.length > 0) {
                    console.log(Sdata);
                    $('#cus_firstName').val(Sdata[0].sale_firstName);
                    $('#cus_lastName').val(Sdata[0].sale_lastName);
                    $('#cus_idCard').val(Sdata[0].sale_idCard);
                    $("#cus_dateOfBirth").val(dateFormat(Sdata[0].sale_dateOfBirth));
                    $("#cus_phone").val(Sdata[0].sale_phone);
                    $("#sale_line").val(Sdata[0].sale_line);
                    $("#eMail").val(Sdata[0].sale_mail);
                    $("#sale_position").val(Sdata[0].sale_position);
                    $("#sale_company").val(Sdata[0].sale_company);
                    $("#sale_AgentApproveNo").val(Sdata[0].sale_AgentApproveNo);
                } else {
                    $('#cus_firstName').val("");
                    $('#cus_lastName').val("");
                    $('#cus_idCard').val("");
                    $("#cus_dateOfBirth").val("");
                    $("#cus_phone").val("");
                    $("#sale_line").val("");
                    $("#sale_mail").val("");
                    $("#sale_position").val("");
                    $("#sale_company").val("");
                    $("#sale_AgentApproveNo").val("");
                }
            });
    }

    function getUserDetail(uid) {
        //console.log(uid);
        var jsonData = JSON.stringify({
            user_id: uid
        });
        $.get("../../api/userData", { jsonData: jsonData, types: "list_customer", username: profiles[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);

                if (Sdata.length > 0) {
                    //console.log(Sdata);
                    $('#cus_firstName').val(Sdata[0].cus_firstName);
                    $('#cus_lastName').val(Sdata[0].cus_lastName);
                    $('#cus_idCard').val(Sdata[0].cus_idCard);
                    $('#cus_income').val(Sdata[0].cus_income);
                    $("#cus_dateOfBirth").val(dateFormat(Sdata[0].cus_dateOfBirth));
                    $("#cus_phone").val(Sdata[0].cus_phone);
                    $("#cus_marital_status").val(Sdata[0].cus_marital_status);
                    $("#cus_nationality").val(Sdata[0].cus_nationality);
                    $("#cus_occupation").val(Sdata[0].cus_occupation);
                    $("#eMail").val(Sdata[0].user_email);

                    $('#cus_marital_status').niceSelect('update');
                } else {
                    $('#cus_firstName').val("");
                    $('#cus_lastName').val("");
                    $('#cus_idCard').val("");
                    $('#cus_income').val("");
                    $("#cus_dateOfBirth").val("");
                    $("#cus_phone").val("");
                    $("#cus_marital_status").val("");
                    $("#cus_nationality").val("");
                    $("#cus_occupation").val("");
                    $("#eMail").val("")

                    $('#cus_marital_status').niceSelect('update');
                }
            });
    }


    function rePassword() {
        let oldpass = $('#old_pass').val();
        let pass = $('#user_password').val();
        let confirmpass = $('#confirm_user_password').val();

        var jsonData = JSON.stringify({
            user_password: oldpass
        });

        $.get("../../api/userData", { jsonData: jsonData, types: "check_pass", username: profiles[0].user_id })
            .done(function (data) {
                Sdata = JSON.parse(data);

                if (Sdata.length > 0) {
                    if (pass == confirmpass) {
                        var postData = JSON.stringify({
                            user_id: $("#u_id").val(),
                            user_password: $('#user_password').val(),
                            user_status: "A",
                            forgot: "1"
                        });

                        $.get("../../api/userData", { jsonData: postData, types: "update_user", username: profiles[0].user_id })
                            .done(function (data) {
                                let respone = data;
                                if (respone == "success") {
                                    Swal.fire(
                                        "Success", //title
                                        "แก้ไขข้อมูล เรียบร้อย!", //main text
                                        "success" //icon
                                    );
                                    setTimeout(() => { location.reload(); }, 400);
                                }
                            });
                    } else {
                        Swal.fire(
                            "Warning", //title
                            "รหัสผ่านใหม่ และยืนยันรหัสผ่าน ไม่ตรงกัน!", //main text
                            "warning" //icon
                        );
                    }
                } else {
                    Swal.fire(
                        "Warning", //title
                        "รหัสผ่านเก่า ไม่ถูกต้อง!", //main text
                        "warning" //icon
                    );
                }

            });
    }

    $('#confirm_user_password').on("keypress", function (e) {
        if (e.keyCode == 13) {
            rePassword()
        }
    });


    function checkEmail(e) {

        let currentEmail = e;

        var jsonData = JSON.stringify({
            "user_email": currentEmail,
            "user_role_id": 3

        });

        let resData;
        //เรียก api
        $.get("../../api/register", { jsonData: jsonData, types: "chkDuplicateEmail" })
            .done(function (data) {
                resData = JSON.parse(data);

                if (resData.length > 0) {
                    $('#WarnEmail').text('[email ดังกล่าวไม่สามารถใช้ได้]');
                    $('#WarnEmail').css("color", "red");
                    chkEmail = 1;
                } else {

                    $('#WarnEmail').text('[email สามารถใช้ได้]');
                    $('#WarnEmail').css("color", "green");
                    chkEmail = 0;
                }
            });
    };

    function drdwProvinceHomeChange(e) {
        let province_id = e;
        $("#drdwDistrictHome").niceSelect();
        $("#drdwDistrictHome").empty();
        $("#drdwDistrictHome").val("");

        $.get("../../api/drdwData", { id: province_id, types: "District" })
            .done(function (data) {
                let JsondropdownData = JSON.parse(data);
                //console.log('JsondropdownData', JsondropdownData) 
                if (JsondropdownData.length == 0) {
                    $("#drdwDistrictHome").html('');
                    $('#drdwDistrictHome').niceSelect('update');
                } else {
                    $("#drdwDistrictHome").html('');
                    $("#drdwDistrictHome").append('<option value="" selected disabled>-- เลือกอำเภอ/เขต --</option>');

                    JsondropdownData.forEach((item, i) => {
                        $("#drdwDistrictHome").append('<option value="' + item.district_id + '">' + item.district_name + ' </option>');
                    });
                    $('#drdwDistrictHome').niceSelect('update');
                }

            });
    }


    function drdwDistrictHomeChange(e) {
        let district_id = e;
        $("#drdwSubDistrictHome").niceSelect();
        $("#drdwSubDistrictHome").empty();
        $("#drdwSubDistrictHome").val("");

        $.get("../../api/drdwData", { id: district_id, types: "SubDistrict" })
            .done(function (data) {
                let JsondropdownData = JSON.parse(data);
                //console.log('JsondropdownData', JsondropdownData) 
                if (JsondropdownData.length == 0) {
                    $("#drdwSubDistrictHome").html('');
                    $('#drdwSubDistrictHome').niceSelect('update');
                } else {
                    $("#drdwSubDistrictHome").html('');
                    $("#drdwSubDistrictHome").append('<option value="" selected disabled>-- เลือกตำบล/แขวง --</option>');

                    JsondropdownData.forEach((item, i) => {
                        $("#drdwSubDistrictHome").append('<option value="' + item.sub_district_id + '">' + item.sub_district_name + ' </option>');
                    });
                    $('#drdwSubDistrictHome').niceSelect('update');
                }

            });
    }

    function drdwProvinceChange(e) {
        let province_id = e;
        $("#drdwDistrict").niceSelect();
        $("#drdwDistrict").empty();
        $("#drdwDistrict").val("");

        $.get("../../api/drdwData", { id: province_id, types: "District" })
            .done(function (data) {
                let JsondropdownData = JSON.parse(data);
                //console.log('JsondropdownData', JsondropdownData) 
                if (JsondropdownData.length == 0) {
                    $("#drdwDistrict").html('');
                    $('#drdwDistrict').niceSelect('update');
                } else {
                    $("#drdwDistrict").html('');
                    $("#drdwDistrict").append('<option value="" selected disabled>-- เลือกอำเภอ/เขต --</option>');

                    JsondropdownData.forEach((item, i) => {
                        $("#drdwDistrict").append('<option value="' + item.district_id + '">' + item.district_name + ' </option>');
                    });
                    $('#drdwDistrict').niceSelect('update');
                }

            });
    }


    function drdwDistrictChange(e) {
        let district_id = e;
        $("#drdwSubDistrict").niceSelect();
        $("#drdwSubDistrict").empty();
        $("#drdwSubDistrict").val("");

        $.get("../../api/drdwData", { id: district_id, types: "SubDistrict" })
            .done(function (data) {
                let JsondropdownData = JSON.parse(data);
                //console.log('JsondropdownData', JsondropdownData) 
                if (JsondropdownData.length == 0) {
                    $("#drdwSubDistrict").html('');
                    $('#drdwSubDistrict').niceSelect('update');
                } else {
                    $("#drdwSubDistrict").html('');
                    $("#drdwSubDistrict").append('<option value="" selected disabled>-- เลือกตำบล/แขวง --</option>');

                    JsondropdownData.forEach((item, i) => {
                        $("#drdwSubDistrict").append('<option value="' + item.sub_district_id + '">' + item.sub_district_name + ' </option>');
                    });
                    $('#drdwSubDistrict').niceSelect('update');
                }

            });
    }
</script>

</html>
