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
                                                    <a data-bs-toggle="tab" href="#addr" id="tab-addr">ที่อยู่<i class="fas fa-home"></i></a>
                                                    <a href="../sales/order-list.aspx" id="tab-order">รายการใบสั่งจอง<i class="fas fa-file-alt"></i></a>
                                                    <a data-bs-toggle="tab" href="#re-pass" id="tab-re-pass">เปลี่ยนรหัสผ่าน<i class="fas fa-redo-alt"></i></a>
                                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#logoutModal">ออกจากระบบ<i class="fas fa-sign-out-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-8">
                                            <div class="tab-content">

                                                <div class="tab-pane fade active show" id="profiles">
                                                    <div class="ltn__myaccount-tab-content-inner">

                                                        <div class="ltn__form-box">
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ชื่อ*</div>
                                                                    <input type="text" id="firstName" placeholder="" class="setting-form" maxlength="50" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">นามสกุล*</div>
                                                                    <input type="text" id="lastName" placeholder="" class="setting-form" maxlength="50" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">เลขบัตรประชาชน*</div>
                                                                    <input type="text" id="idCard" placeholder="" class="setting-form" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">เบอร์ติดต่อ</div>
                                                                    <input type="text" id="phoneNum" placeholder="" class="setting-form" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">สถานภาพ</div>
                                                                    <select id="status" class="w-100">
                                                                        <option value="">-- เลือกสถานภาพ --</option>
                                                                        <option value="โสด">โสด</option>
                                                                        <option value="หย่าร้าง">หย่าร้าง</option>
                                                                        <option value="สมรส">สมรส</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">สัญชาติ</div>
                                                                    <input type="text" id="nationality" placeholder="" class="setting-form" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">วันเกิด (ค.ศ.)</div>
                                                                    <input type="date" id="dateOfBirth" class="setting-form" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">Email*  สำหรับใช้เข้าสู่ระบบ <span id="WarnEmail"></span></div>
                                                                    <input type="email" id="eMail" placeholder=" " class="setting-form" onchange="checkEmail( $('#eMail').val() )" maxlength="60" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">อาชีพ</div>
                                                                    <input type="text" id="occupation" placeholder="" class="setting-form" />
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">รายได้</div>
                                                                    <input type="number" id="income" value="0" class="setting-form" />
                                                                </div>

                                                                <div class="col-lg-6" id="s_line">
                                                                    <div class="inputText setting-font">Line Id @</div>
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
                                                                <button type="button" class="btn theme-btn-1 btn-effect-1">บันทึก</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="addr">
                                                    <div class="ltn__myaccount-tab-content-inner">

                                                        <div class="ltn__form-box">
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
                                                                    <select id="drdwDistrict" class="w-100 setting-form" onchange="drdwDistrictChange(this.value)">
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

                                                            <div class="mt-2">
                                                                <button type="button" class="btn theme-btn-1 btn-effect-1">บันทึก</button>
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
                                                                <button type="button" class="btn theme-btn-1 btn-effect-1">บันทึก</button>
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
    const profiles = JSON.parse(sessionStorage.getItem("LogInData"));

    $(document).ready(function () {
        if (profiles) {
            //console.log(profiles);
            if (profiles[0].user_role_id == "2") {
                //customer
                $("#s_line").addClass('d-none');
                $("#s_company").addClass('d-none');
                $("#s_position").addClass('d-none');
                $("#s_AgentApproveNo").addClass('d-none');
            } else {
                //sale
                $("#tab-addr").addClass('d-none');
            }

            getUserDetail(profiles[0].user_id);
        }
    });


    function getUserDetail(uid) {
        console.log(uid);
    }

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
