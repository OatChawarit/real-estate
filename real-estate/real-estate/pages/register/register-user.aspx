<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="register-user.aspx.cs" Inherits="real_estate.pages.home.register_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="../../vendor/img/favicon.png" type="image/x-icon" />

    <!-- นำเข้าส่วนหัว -->
    <!-- #include virtual ="../include/header.html" -->

     <style>

      

    </style>
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
                                    <li>สมัครสมาชิก</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- register -->
        <div class="container ltn__login-area pb-65">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area text-center">
                            <h3 class="">สมัครสมาชิก<br />
                                บัญชีของคุณ</h3>
                        </div>
                    </div>
                </div>

                <div class="row col-12">

                    <div class="col-lg-6">                       
                        <input type="text" id="fName" placeholder="ชื่อ*" class="form-control" />
                    </div>
                    <div class="col-lg-6">                      
                        <input type="text" id="lastName" placeholder="นามสกุล*" />
                    </div>

                    
                    <div class="col-lg-6">                       
                        <input type="text" id="idCard" placeholder="เลขบัตรประชาชน*"  maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />


                        <%--<input type="text" id="idCard" placeholder="เลขบัตรประชาชน*" maxlength="13" pattern="[0-9]{10}" />--%>
                    </div>
                    <div class="col-lg-6">                      
                        <input type="text" id="uPhone" placeholder="เบอร์ติดต่อ" maxlength="10"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  />
                    </div>

                    <div class="col-lg-6">
                        <label>Email*  สำหรับใช้เข้าสู่ระบบ <span id="WarnEmail"></span></label>
                        <input type="email" id="eMail" placeholder="Email*  "  onchange="checkEmail( $('#eMail').val() )" />
                    </div>
                    <div class="col-lg-6">
                        <label>วันเกิด (ค.ศ.)</label>
                          <input type="date" id="dateOfBirth"  />
                    </div>
                    

                    <div class="col-lg-6">
                        <input type="password" id="uPass" placeholder="Password*" />
                    </div>
                    <div class="col-lg-6">
                        <input type="password" id="confirmPass" placeholder="Confirm Password*" />
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

            let fName = $('#fName').val();
            let lastName = $('#lastName').val();
            let idCard = $('#idCard').val();
            let uPhone = $('#uPhone').val();
            let eMail = $('#eMail').val();
            let dateOfBirth = $('#dateOfBirth').val();
            let uPass = $('#uPass').val();
            let confirmPass = $('#confirmPass').val(); 

            let yearPick = new Date(dateOfBirth).getFullYear() ;
             
            console.log('chkEmail', chkEmail);
 
            if (!fName) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ชื่อ'
                });
            } else if (!lastName) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'นามสกุล'
                });
            } else if (!idCard || ( idCard.length != 13 )) {
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
            else if (yearPick > yearNow  ) {
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
            else if (!lastName) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ยืนยัน Password'
                });
            }

            else if (  uPass != confirmPass  )  {

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
                                "user_name": eMail,
                                "user_password": uPass,

                                "cus_firstName": fName,
                                "cus_lastName": lastName,
                                "cus_idCard": idCard,
                                "cus_phone": uPhone,                                
                                "cus_dateOfBirth": dateOfBirth, 
                            });

                            //เรียก api
                            $.ajax({
                                type: 'POST',
                                url: "../../api/register",
                                data: { "data": jsonData },
                                headers: {
                                    "types": "AddRegisterUser"
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
                                        location.reload();
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
                "user_name": currentEmail
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
