<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="real_estate.pages.home.order_list" %>

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
                                                <a class="active show" data-bs-toggle="tab" href="#profiles">ข้อมูลส่วนตัว<i class="fas fa-user"></i></a>
                                                <a href="../sales/order-list.aspx">รายการใบสั่งจอง<i class="fas fa-file-alt"></i></a>
                                                <a data-bs-toggle="tab" href="#re-pass">เปลี่ยนรหัสผ่าน<i class="fas fa-redo-alt"></i></a>
                                                <a href="javascript:void(0)" data-toggle="modal" data-target="#logoutModal">ออกจากระบบ<i class="fas fa-sign-out-alt"></i></a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-8">
                                        <div class="tab-content">

                                            <div class="tab-pane fade active show" id="profiles">
                                                <div class="ltn__myaccount-tab-content-inner">

                                                    <div class="ltn__form-box">
                                                        <div class="row mb-50">
                                                            <div class="col-lg-6">
                                                                <input type="text" id="firstName" placeholder="ชื่อ*" class="form-control" maxlength="50" />
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input type="text" id="lastName" placeholder="นามสกุล*" maxlength="50" />
                                                            </div>


                                                            <div class="col-lg-6">
                                                                <input type="text" id="idCard" placeholder="เลขบัตรประชาชน*" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />

                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input type="text" id="phoneNum" placeholder="เบอร์ติดต่อ" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input type="text" id="sale_line" placeholder="Line Id" maxlength="30" />
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <input type="text" id="sale_company" placeholder="ชื่อบริษัท" maxlength="50" />
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input type="text" id="sale_position" placeholder="ตำแหน่ง" maxlength="50" />
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input type="text" id="sale_AgentApproveNo" placeholder="ใบอนุญาตขายตัวแทนเลขที่" maxlength="20" />
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <label>Email*  สำหรับใช้เข้าสู่ระบบ <span id="WarnEmail"></span></label>
                                                                <input type="email" id="eMail" placeholder="Email* " onchange="checkEmail( $('#eMail').val() )" maxlength="60" />
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label>วันเกิด (ค.ศ.)</label>
                                                                <input type="date" id="dateOfBirth" />
                                                            </div>
                                                        </div>

                                                        <div class="btn-wrapper">
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
                                                                <input type="password" name="ltn__name" />
                                                                <label>รหัสผ่านใหม่ :</label>
                                                                <input type="password" name="ltn__lastname" />
                                                                <label>ยืนยันรหัสผ่านใหม่ :</label>
                                                                <input type="password" name="ltn__lastname" />
                                                            </div>
                                                        </div>
                                                        <div class="btn-wrapper">
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

            if (logInData[0].user_role_id == "2") {
                $("#sale_line").addClass('d-none');
                $("#sale_company").addClass('d-none');
                $("#sale_position").addClass('d-none');
                $("#sale_AgentApproveNo").addClass('d-none');
            } else {
                //sale
            }
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

</script>

</html>
