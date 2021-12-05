<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="purchase-order.aspx.cs" Inherits="real_estate.pages.project.purchase_order" %>

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

        <!-- Order -->
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../vendor/img/bg/24.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">กรอกสั่งจองโครงการ</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="project-list.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>โครงการอสังหาฯ</a></li>
                                    <li>สั่งจองโครงการ</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->

        <div class="ltn__appointment-area pt-115--- pb-120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <form action="#">
                            <div class="ltn__tab-menu ltn__tab-menu-3 ltn__tab-menu-top-right-- text-uppercase--- text-center">
                                <div class="nav">
                                    <a class="active show" data-bs-toggle="tab" href="#liton_tab_3_1">รายละเอียดข้อมูลสั่งจอง</a>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="liton_tab_3_1">
                                    <div class="ltn__apartments-tab-content-inner">


                                        <h6>ข้อมูลส่วนตัวผู้สั่งจอง</h6>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ชื่อ-สกุล *</div>
                                                <div class="input-item input-item-name ltn__custom-icon">
                                                    <input type="text" id="fullName" placeholder="ชื่อ-สกุล" class="setting-form" title="ชื่อ-สกุล" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">เลขบัตรประจำตัวประชาชน *</div>
                                                <div class="input-item input-item-name ltn__custom-icon">
                                                    <input type="text" id="cus_idCard" placeholder="เลขบัตรประจำตัวประชาชน" class="setting-form" title="เลขบัตรประจำตัวประชาชน" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ที่อยู่ [บ้านเลขที่, หมู่, ซอย, ถนน] *</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="cus_address" placeholder="บ้านเลขที่" class="setting-form" title="บ้านเลขที่" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">จังหวัด</div>
                                                <div class="input-item ltn__custom-icon">
                                                    <select id="drdwProvince" class="w-100 setting-form" onchange="drdwProvinceChange(this.value)">
                                                        <option value="">-- เลือกจังหวัด --</option>
                                                        <%
                                                            real_estate.ClassData.DropDownData.drdwProvince();
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">อำเภอ/เขต</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <select id="drdwDistrict" class="w-100 setting-form" onchange="drdwDistrictChange(this.value)">
                                                        <option value="">-- เลือกอำเภอ/เขต --</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ตำบล/แขวง</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <select id="drdwSubDistrict" class="w-100 setting-form">
                                                        <option value="">-- เลือกตำบล/แขวง --</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">รหัสไปรษณีย์</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="cus_postal_code" placeholder="รหัสไปรษณีย์" title="รหัสไปรษณีย์" class="setting-form" maxlength="50" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">เบอร์โทร. *</div>
                                                <div class="input-item input-item-phone ltn__custom-icon">
                                                    <input type="text" id="cus_phone" placeholder="เบอร์โทร." class="setting-form" title="เบอร์โทร." />
                                                </div>
                                            </div>
                                        </div>

                                        <h6>รายละเอียดโครงการ</h6>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">รหัสโครงการ</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="plan_type_id" placeholder="รหัสโครงการ" class="setting-form" title="รหัสโครงการ" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ชื่อโครงการ</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="pro_name" placeholder="ชื่อโครงการ"  class="setting-form" title="ชื่อโครงการ" readonly="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ประเภทบ้าน</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="pro_type_name" placeholder="ประเภทบ้าน"  class="setting-form" title="ประเภทบ้าน" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">รูปแบบแปลน</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="plan_name" placeholder="รูปแบบแปลน"  class="setting-form" title="รูปแบบแปลน"  readonly="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ทำเลที่ตั้ง</div>
                                                <div class="input-item input-item-textarea ltn__custom-icon">
                                                    <input type="text" id="pro_location_name" placeholder="ทำเลที่ตั้ง"  class="setting-form" title="ทำเลที่ตั้ง" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ราคา</div>
                                                <div class="input-item input-item-number ltn__custom-icon">
                                                    <input type="number" id="plan_price" value="0"  class="setting-form" title="ราคา" readonly="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">บริษัทเจ้าของโครงการ</div>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" id="sale_company" placeholder="บริษัทเจ้าของโครงการ"  class="setting-form" title="บริษัทเจ้าของโครงการ" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">ตัวแทนขายบริษัท</div>
                                                <div class="input-item input-item-name ltn__custom-icon">
                                                    <input type="text" id="sale_fullName" placeholder="ตัวแทนขายบริษัท"  class="setting-form" title="ตัวแทนขายบริษัท" readonly="true" />
                                                </div>
                                            </div>
                                        </div>
                                           <div class="row">
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">เบอร์โทรติดต่อ</div>
                                                <div class="input-item input-item-phone ltn__custom-icon">
                                                    <input type="text" id="sale_phone" placeholder="เบอร์โทรติดต่อ"  class="setting-form" title="เบอร์โทรติดต่อ" readonly="true" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="inputText setting-font">อีเมล</div>
                                                <div class="input-item input-item-email ltn__custom-icon">
                                                    <input type="email" id="sale_mail" placeholder="อีเมล"  class="setting-form" title="อีเมล" readonly="true" />
                                                </div>
                                            </div>
                                        </div>
                                   

                                        <div class="btn-wrapper text-center--- mt-0">
                                            <!-- <button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase" >Next Step</button> -->
                                            <a href="#" class="btn theme-btn-1 btn-effect-1 text-uppercase">จองโครงการ</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>
    


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
