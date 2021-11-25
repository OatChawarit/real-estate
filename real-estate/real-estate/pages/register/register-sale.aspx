<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="register-sale.aspx.cs" Inherits="real_estate.pages.register_sale" %>

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
        <!-- register -->
        <div class="ltn__login-area pb-65 mt-120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area text-center">
                            <h1 class="section-title">Register
                                <br />
                                Your Account</h1>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-6 offset-lg-3">
                        <div class="account-login-inner">
                            <form action="#" class="ltn__form-box contact-form-box">
                                <input type="text" name="firstname" placeholder="First Name">
                                <input type="text" name="lastname" placeholder="Last Name">
                                <input type="text" name="email" placeholder="Email*">
                                <input type="password" name="password" placeholder="Password*">
                                <input type="password" name="confirmpassword" placeholder="Confirm Password*">
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="">
                                    I consent to Herboil processing my personal data in order to send personalized marketing material in 
                                    accordance with the consent form and the privacy policy.
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="">
                                    By clicking "create account", I consent to the privacy policy.
                                </label>
                                <div class="btn-wrapper">
                                    <button class="theme-btn-1 btn reverse-color btn-block" type="submit">CREATE ACCOUNT</button>
                                </div>
                            </form>
                        </div>
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
