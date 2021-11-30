<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="login.aspx.cs" Inherits="real_estate.pages.home.login" %>

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
        <!-- LOGIN -->
        <div class="ltn__login-area pb-65 mt-120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area text-center">
                            <h3 class="">ลงชื่อเข้าใช้งาน<br />
                                ไปยังบัญชีของคุณ</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">

                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="theme-btn-2 btn active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">เข้าสู่ระบบสมาชิก</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="theme-btn-3 btn mx-2" id="pills-sale-tab" data-bs-toggle="pill" data-bs-target="#pills-sale" type="button" role="tab" aria-controls="pills-sale" aria-selected="false">เข้าสู่ระบบตัวแทนขาบ</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                <div class="account-login-inner">
                                    <input type="text" id="uName" value="" placeholder="รหัสผู้ใช้งาน" />
                                    <input type="password" id="uPassword" value="" placeholder="รหัสผ่าน" />
                                    <div class="btn-wrapper mt-0">
                                        <button class="theme-btn-1 btn btn-block" type="button" id="btn-users" onclick="onBtnLoginClick()">เข้าสู่ระบบ</button>
                                    </div>
                                    <!-- <div class="go-to-btn mt-20">
                                    <a href="#"><small>ลืมรหัสผ่านเข้าใช้งาน</small></a>
                                </div> -->
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-sale" role="tabpanel" aria-labelledby="pills-sale-tab">
                                <div class="account-login-inner">
                                    <input type="text" id="sName" value="" placeholder="รหัสผู้ใช้งานตัวแทนขาย" />
                                    <input type="password" id="sPassword" value="" placeholder="รหัสผ่าน" />
                                    <div class="btn-wrapper mt-0">
                                        <button class="theme-btn-1 btn btn-block" type="button" id="btn-sale" onclick="onBtnLoginClick()">เข้าสู่ระบบตัวแทนขาย</button>
                                    </div>
                                    <!-- <div class="go-to-btn mt-20">
                                    <a href="#"><small>ลืมรหัสผ่านเข้าใช้งาน</small></a>
                                </div> -->
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-6">
                        <div class="account-create text-center pt-50">
                            <h4>ไม่มีบัญชีใช่ไหม ?</h4>
                            <p>
                               สมัครเป็นสมาชิกรับชมข่าวสาร เรื่องราวที่น่าสนใจได้ที่เว็บไซต์ของเรา หรือต้องการสมัครเป็นตัวแทนขายเพื่อ ลงประกาศขาย อสังหาริมทรัพย์ บ้าน ทาวน์โฮม คอนโดมีเนียม
                            </p>
                            <div class="btn-wrapper">
                                <a href="../register/register-user.aspx" class="theme-btn-2 btn black-btn">สมัครสมาชิก</a>
                                <a href="../register/register-sale.aspx" class="theme-btn-3 btn black-btn">สมัครตัวแทนขาย</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- LOGIN  -->

        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>

    $(document).ready(function () {

    });


    function onBtnLoginClick() {

        let uName = $('#uName').val();
        let uPassword = $('#uPassword').val();

        if (!uName) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'ระบุรหัสผู้ใช้งาน'
            });
        } else if (!uPassword) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'ระบุรหัสผ่าน'
            });
        } else {

            var jsonData = JSON.stringify({
                "user_name": uName,
                "user_password": uPassword,
            });

            //เรียก api
            $.ajax({
                type: 'POST',
                url: "../../api/register",
                data: { "data": jsonData },
                headers: {
                    "types": "login"
                }
            }).done(function (data) {

                let resData = JSON.parse(data);
                if (resData.length > 0) {

                    console.log('Pass')
                    console.log(resData)

                    sessionStorage.setItem("resData", data);
                    //localStorage.setItem("lastname", "Smith");
                } else {
                    Swal.fire({
                        type: 'info',
                        html: ` <h3 style=" "> <i>  ชื่อผู้ใช้ หรือ รหัสผ่านไม่ถูกต้อง </i></h3>`
                    });
                }
            });
        }
    };

</script>
</html>
