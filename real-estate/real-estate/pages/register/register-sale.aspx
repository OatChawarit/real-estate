<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="register-sale.aspx.cs" Inherits="real_estate.pages.register_sale" %>
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
        <div class="mt-80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="../home/login.aspx"><span class="ltn__secondary-color"><i class="fas fa-sign-in-alt"></i></span> เข้าสู่ระบบ</a></li>
                                    <li>สมัครตัวแทนขาย</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- register -->
        <div class="ltn__login-area pb-65">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area text-center">
                            <h3 class="">สมัครสมาชิกเป็นตัวแทนขาย<br />
                                บัญชีของคุณ</h3>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-6">
                        <input type="text" id="fName" placeholder="ชื่อ" class="form-control" />
                        <input type="text" id="idCard" placeholder="เลขประจำตัวประชาชน*" />
                        <input type="text" id="tel" placeholder="เบอร์โทร.*" />

                        <input type="password" id="uPass" placeholder="Password*" />
                        <div class="btn-wrapper">
                            <button class="theme-btn-1 btn reverse-color btn-block" type="submit">สมัครสมาชิก</button>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <input type="text" id="lastName" placeholder="นามสกุล" />
                        <input type="email" id="eMail" placeholder="Email*" />
                        <input type="text" id="uName" placeholder="รหัสผู้ใช้งาน*" />
                        <input type="password" id="confirmPass" placeholder="Confirm Password*" />
                    </div>

                </div>

            </div>
        </div>
        <!-- register -->
        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
</html>
