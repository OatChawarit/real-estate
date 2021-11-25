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
                            <h3 class="">ลงชื่อเข้าใช้งาน<br />ไปยังบัญชีของคุณ</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="account-login-inner">
                            
                                <input type="text" id="uName" value="" placeholder="รหัสผู้ใช้งาน" />
                                <input type="password" id="uPassword" value="" placeholder="รหัสผ่าน" />
                                <div class="btn-wrapper mt-0">
                                    <button class="theme-btn-1 btn btn-block" type="submit">ลงทะเบียนเข้าใช้งาน</button>
                                </div>
                               <!-- <div class="go-to-btn mt-20">
                                    <a href="#"><small>ลืมรหัสผ่านเข้าใช้งาน</small></a>
                                </div> -->
                           
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="account-create text-center pt-50">
                            <h4>ไม่มีบัญชีใช่ไหม ?</h4>
                            <p>
                               สมัครเป็นสมาชิกรับชมข่าวสาร เรื่องราวที่น่าสนใจได้ที่เว็บไซต์ของเรา หรือต้องการสมัครเป็นตัวแทนขายเพื่อ ลงประกาศขาย อสังหาริมทรัพย์ บ้าน ทาวน์โฮม คอนโดมีเนียม
                            </p>
                            <div class="btn-wrapper">
                                <a href="../register-user.aspx" class="theme-btn-2 btn black-btn">สมัครสมาชิก</a>
                                <a href="../register-sale.aspx" class="theme-btn-3 btn black-btn">สมัครตัวแทนขาย</a>
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
</html>
