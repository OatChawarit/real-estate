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

                <div class="row col-12">

                    <div class="col-lg-6">
                        <input type="text" id="sale_firstName" placeholder="ชื่อ*" class="form-control" maxlength="50"/>
                    </div>
                    <div class="col-lg-6">
                        <input type="text" id="sale_lastName" placeholder="นามสกุล*" maxlength="50"/>
                    </div>


                    <div class="col-lg-6">
                        <input type="text" id="sale_idCard" placeholder="เลขบัตรประชาชน*" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />

                    </div>
                    <div class="col-lg-6">
                        <input type="text" id="sale_phone" placeholder="เบอร์ติดต่อ" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                    </div>
                     <div class="col-lg-6">
                        <input type="text" id="sale_line" placeholder="Line Id" maxlength="30"  />
                    </div>
                    <%-- <div class="col-lg-6">
                        <input type="text" id="sale_mail" placeholder="Email สำหรับใช้ติดต่องาน" maxlength="60"  />
                    </div>--%>
                     <div class="col-lg-6">
                        <input type="text" id="sale_company" placeholder="ชื่อบริษัท" maxlength="50"  />
                    </div>
                     <div class="col-lg-6">
                        <input type="text" id="sale_position" placeholder="ตำแหน่ง" maxlength="50"  />
                    </div>
                     <div class="col-lg-6">
                        <input type="text" id="sale_AgentApproveNo" placeholder="ใบอนุญาตขายตัวแทนเลขที่" maxlength="20"  />
                    </div>

                    <div class="col-lg-6">
                        <label>Email*  สำหรับใช้เข้าสู่ระบบ <span id="WarnEmail" ></span></label>
                        <input type="email" id="eMail" placeholder="Email* " onchange="checkEmail( $('#eMail').val() )"   maxlength="60" />
                    </div>
                    <div class="col-lg-6">
                        <label>วันเกิด (ค.ศ.)</label>
                        <input type="date" id="dateOfBirth" />
                    </div>


                    <div class="col-lg-6">
                        <input type="password" id="uPass" placeholder="Password*" maxlength="50"/>
                    </div>
                    <div class="col-lg-6">
                        <input type="password" id="confirmPass" placeholder="Confirm Password*" maxlength="50"/>
                    </div>
                    <div class="btn-wrapper col-lg-12">

                        <button class="theme-btn-1 btn reverse-color btn-block" onclick="btnRegisterClick()">สมัครสมาชิก</button>

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
<script>

    let chkEmail = 1;

    const d = new Date();
    let yearNow = d.getFullYear();

    $(document).ready(function () {
     
    });


    function btnRegisterClick() {

        let sale_firstName = $('#sale_firstName').val();
        let sale_lastName = $('#sale_lastName').val();
        let sale_idCard = $('#sale_idCard').val(); 
        let sale_phone = $('#sale_phone').val();
        let sale_line = $('#sale_line').val();
        let sale_mail = $('#eMail').val(); 
        let sale_company = $('#sale_company').val();
        let sale_position = $('#sale_position').val();
        let sale_AgentApproveNo = $('#sale_AgentApproveNo').val();

        let eMail = $('#eMail').val();
        let dateOfBirth = $('#dateOfBirth').val();
        let uPass = $('#uPass').val();
        let confirmPass = $('#confirmPass').val();

        let yearPick = new Date(dateOfBirth).getFullYear();
         
        if (!sale_firstName) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'ชื่อ'
            });
        } else if (!sale_lastName) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'นามสกุล'
            });
        } else if (!sale_idCard || (sale_idCard.length != 13)) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'รหัสบัตรประชาชนให้ถูกต้อง'
            });
        }
        else if (!eMail) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'Email'
            });
        }
        else if (!dateOfBirth) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'วันเกิด '
            });
        }
        else if (yearPick > yearNow) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'วันเกิดเป็นคริสต์ศักราช (ค.ศ.)'
            });
        }
        else if (!uPass) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'Password'
            });
        }
        else if (!confirmPass) {
            Swal.fire({
                type: 'warning',
                title: 'กรุณาระบุ!!',
                text: 'ยืนยัน Password'
            });
        }

        else if (uPass != confirmPass) {

            Swal.fire({
                type: 'warning',
                title: 'กรุณายืนยันรหัสผ่านใหม่!!',

                onAfterClose: () => {
                    $('#confirmPass').val('');
                    $('#uPass').val('');
                    setTimeout(() => $("#uPass").focus(), 110);
                }
            });

        } else if (chkEmail == 1) {
            console.log(chkEmail);

            Swal.fire({
                type: 'warning',
                title: 'Email ดังกล่าวไม่สามารถใช้ได้',

            });
        } else {

            Swal.fire({ //alert confirm 
                title: 'ยืนยันการสมัคร ?',
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'ตกลง',
                cancelButtonText: 'ยกเลิก',
            })
                .then((val) => {
                    if (val.value) {

                        var jsonData = JSON.stringify({
                            "user_email": eMail,
                            "user_password": uPass,

                            "sale_firstName": sale_firstName,
                            "sale_lastName": sale_lastName,
                            "sale_idCard": sale_idCard,
                            "sale_phone": sale_phone,
                            "sale_dateOfBirth": dateOfBirth,

                            "sale_line": sale_line,
                            "sale_mail": sale_mail,
                            "sale_company": sale_company,
                            "sale_position": sale_position,
                            "sale_AgentApproveNo": sale_AgentApproveNo 

                        });

                        //เรียก api
                        $.ajax({
                            type: 'POST',
                            url: "../../api/register",
                            data: { "data": jsonData },
                            headers: {
                                "types": "AddRegisterUserSale"
                            }
                        }).done(function (data) {
                            console.log('data', data);
                            if (data == "success") {
                                swal.fire({
                                    type: 'success',
                                    title: 'บันทึกข้อมูลเรียบร้อย'
                                }).then((value) => {
                                    location.reload();
                                });
                            } else {
                                swal.fire({
                                    type: 'warning',
                                    title: 'พบข้อผิดพลาด',
                                    text: data
                                }).then((value) => {
                                    //location.reload();
                                });
                            }
                        });

                    }
                }); 
        } 

    }; 

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
