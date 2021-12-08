<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="project-sales-details-management.aspx.cs" Inherits="real_estate.pages.project.project_sales_details_management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="../../vendor/img/favicon.png" type="image/x-icon" />
    <style>
        .btn-setting {
            padding: 5px 25px !important;
        }

        .modal-dialog {
            /*margin-top: 0px !important;*/
            margin-top: 25px !important;
        }

        .setting-form {
            height: 45px !important;
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
        }

        .list {
            max-height: 500px;
            overflow: auto !important;
        }
        .set-disabled {
   
            background:#dddddd33 !important;

        }
        .checkbox-item .checkmark {
            height: 20px !important;
            width: 20px !important;
        }

            .checkbox-item .checkmark:after {
                left: 7px !important;
                top: 2px !important;
                width: 5px !important;
                height: 12px !important;
            }

        .set-label-checkbox {
      
            height: 45px !important;
        }

    </style>

    <!-- นำเข้าส่วนหัว -->
    <!-- #include virtual ="../include/header.html" -->


</head>
<body>
    <!-- Body main wrapper start -->
    <div class="body-wrapper">
        <!-- นำเข้าเมนู -->
        <!-- #include virtual ="../include/topbar.html" -->

        <!-- เนื้อหา -->
        <!-- Begin Page Content -->
        <div class="container-xl " style="font-size: 13px;">
            <!-- Page Heading -->
            <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                <div>
                    <h1 class="h3 mb-2 text-gray-800 d-sm-inline-block">บันทึกประเภทแบบแปลนโครงการ</h1>
                       
                </div>
                <div class="text-end">
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-danger shadow-sm btn-Back btn-setting" onclick="history.back()"><i class="fas fa-arrow-left fa-sm text-white-50"></i>&nbsp;Back</a>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                </div>
            </div>
            <div id="labelProjectTopic" class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold  ">
                        ข้อมูลโครงการ
                        <span id="topic_pro_id" class="mx-3"></span>
                        <span id="topic_com_name"></span>


                    </h6>
                </div>
                <div class="card-body">
                    <div class="form-group row ">
                        <div id="divProjectInfoTopic" class="row col-12 setting-row">

                            <div class="col-sm-3">
                                <div class="inputText setting-font">ชื่อโครงการ </div>
                                <input type="text" id="topic_pro_name" placeholder=" " class="setting-form set-disabled" maxlength="100" disabled />
                            </div>

                            <div class="col-sm-3">
                                <div class="inputText setting-font">ประเภทโครงการ </div>
                                <input type="text" id="topic_pro_type_name" placeholder=" " class="setting-form set-disabled" maxlength="100" disabled />
                            </div>

                            <div class="col-sm-3">
                                <div class="inputText setting-font">โซน/ทำเล </div>
                                <input type="text" id="topic_pro_location_name" placeholder=" " class="setting-form set-disabled" maxlength="100" disabled />
                            </div>

                            <div class="col-sm-3">
                                <div class="inputText setting-font">ประเภทสถานะโครงการ </div>
                                <input type="text" id="topic_pro_statusType_name" placeholder=" " class="setting-form set-disabled" maxlength="100" disabled />
                            </div>



                        </div>
                    </div>
                </div>
            </div>
            <form runat="server" action="project-sales-management.aspx" method="post" enctype="multipart/form-data">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div class="row col-12">
                            <h5 class="m-0 font-weight-bold text-primary mr-5">รายการประเภทแบบแปลน</h5>

                        </div>
                              
                    </div>
                    <div class="card-body">
                        <div class="form-group row">

                            <div class="table-responsive" style="padding-bottom: 30px">                            
                                <table class="table table-bordered " id="register_project_plan" width="100%" cellspacing="0">
                                    <thead class="table-dark" align="center">
                                        <tr>
                                            <th style="width: 60px; min-width: 60px; max-width: 60px; vertical-align: middle;"></th>
                                            <th style="width: 40px;">รหัสแบบแปลนโครงการ</th>
                                            <th style="width: 80px;">พื้นที่ใช้สอย</th>
                                            <th style="width: 80px;">จำนวนชั้น</th>
                                            <th style="width: 40px;">ห้องนอน</th>
                                            <th style="width: 80px;">ห้องน้ำ</th>
                                            <th style="width: 50px;">ห้องอเนกประสงค์</th>
                                            <th style="width: 50px;">ที่จอดรถ</th>
                                            <th style="width: 50px;">ราคาขาย</th>   
                                            <th style="width: 50px;">สถานะ</th>
                                            <th style="width: 50px;">ยอดวิว</th> 
                                           
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                    </tbody>
                                    <tfoot align="center" style="background-color: black;">
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

                <%--MODAL Create EDIT--%>
                <div class="modal fade " id="FormModal_Project_Details" tabindex="-1" role="dialog" aria-labelledby="FormModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header setting-modal">
                                <h5 class="modal-title topic-text" id="topic_Modal">เพิ่มแบบแปลนโครงการ</h5>
                                <button class="close " type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>

                            <div class="modal-body">

                                <ul class="nav nav-tabs d-none" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"> </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="upimg-tab" data-toggle="tab" href="#upimg" role="tab" aria-controls="profile" aria-selected="false"></a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                        <div id="labelProject" class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold text-primary">ข้อมูลแบบแปลนโครงการ <span id="modalTopic" style="color:#071c1f"></span></h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group row ">
                                                    <div id="divProjectInfo" class="row col-12 setting-row">

                                                       <div class="col-lg-6">
                                                            <div class="inputText setting-font">ชื่อแบบแปลน* </div>
                                                            <input type="text" id="plan_name" placeholder=" " class="setting-form" maxlength="100" />
                                                        </div> 
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">พื้นที่ใช้สอย </div>
                                                            <input type="text" id="plan_useable_area" placeholder=" " class="setting-form" maxlength="20" />
                                                        </div> 
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ราคาขาย*</div>
                                                            <input type="text" id="plan_price"   class="setting-form" maxlength="30" onkeyup="onPriceChange(this)" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                                        </div> 
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนชั้น </div>
                                                            <input type="number" id="plan_floor"  class="setting-form"  />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนห้องนอน</div>
                                                            <input type="number" id="plan_bed_room"   class="setting-form"   />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนห้องน้ำ</div>
                                                            <input type="number" id="plan_bath_room"   class="setting-form"   />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนห้องอเนกประสงค์</div>
                                                            <input type="number" id="plan_multiFunction_room"   class="setting-form"   />
                                                        </div>
                                                        

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="labelAddress" class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold  " style="color: #dc3545">ข้อมูล Promotion</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group row ">
                                                    <div id="divProjectPromotion" class="row col-12 setting-row">
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ส่วนลด(เปอร์เซ็น)</div>
                                                            <input type="number" id="promotion_discount_percent" class="setting-form" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">บัตรของขวัญมูลค่า (บาท)</div>
                                                            <input type="number" id="promotion_giftVoucher_price" class="setting-form" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ส่วนลดวันโอน (บาท)</div>
                                                            <input type="number" id="promotion_discount_transferDate" class="setting-form" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ฟรีค่าบริการสาธารณะ (ปี)</div>
                                                            <input type="number" id="promotion_publicServicefeeYear_free" class="setting-form" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ฟรีแอร์(เครื่อง)</div>
                                                            <input type="number" id="promotion_airConditioner_free" class="setting-form" />
                                                        </div>
                                                          <div class="col-lg-3"> 
                                                            <div class="inputText setting-font"> <br /> </div>                                                        
                                                              <label class="set-label-checkbox setting-font checkbox-item">ฟรีค่าติดตั้งมิเตอร์ไฟฟ้า
                                                                  <input type="checkbox"   id="promotion_IsElectricMeter_free" class="setting-form" />
                                                                  <span class="checkmark"></span>
                                                              </label>
                                                        </div>
                                                          <div class="col-lg-3">
                                                                <div class="inputText setting-font"> <br /> </div>
                                                               <label class="set-label-checkbox setting-font checkbox-item">ฟรีค่าติดตั้งมิเตอร์น้ำประปา
                                                                  <input type="checkbox"   id="promotion_IsWaterMeter_free" class="setting-form" />
                                                                  <span class="checkmark"></span>
                                                              </label>
                                                               
                                                        </div>
                                                     

                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">รายละเอียดฟรีแอร์ </div>
                                                            <textarea id="promotion_airConditioner_remark" name="promotion_airConditioner_remark" rows="3" cols="50" maxlength="255">
                                                                         
                                                            </textarea>

                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">promotion อื่นๆ </div>
                                                            <textarea id="promotion_other" name="promotion_other" rows="3" cols="50" maxlength="255">
                                                                         
                                                             </textarea>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div id="labelBank" class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold "><span style="color: #198754">สิ่งอำนวยความสะดวก </span> </h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group row ">
                                                    <div id="divProjectBank" class="row col-12 setting-row">
                                                        <div class="col-lg-3">                                                           
                                                                <br />                                                       
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                    ลิฟต์
                                                                  <input type="checkbox" id="facilities_IsLift" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">                                                             
                                                                <br />                                                           
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ที่จอดรถ
                                                                  <input type="checkbox" id="facilities_IsParking" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">                                                         
                                                                <br />                                                        
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ฟิตเนส
                                                                  <input type="checkbox" id="facilities_IsFitness" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                       
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                คลับเฮ้าส์
                                                                  <input type="checkbox" id="facilities_IsClubHouse" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ห้องซักรีด
                                                                  <input type="checkbox" id="facilities_IsLaunDry" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                        
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                CCTV
                                                                  <input type="checkbox" id="facilities_IsCCTV" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                Co-working space
                                                                  <input type="checkbox" id="facilities_IsCoWorkingSpace" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div> 
                                                      
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                สระว่ายน้ำ
                                                                  <input type="checkbox" id="facilities_IsSwimmingPool" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                สวนสาธารณะ
                                                                  <input type="checkbox" id="facilities_IsParks" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                          <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                สวนดาดฟ้า
                                                                  <input type="checkbox" id="facilities_IsRoofGarden" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div> 

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                คีย์การ์ดและสแกนนิ้ว
                                                                  <input type="checkbox" id="facilities_IsKeyCard" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ใกล้สถานีรถไฟฟ้า
                                                                  <input type="checkbox" id="facilities_IsNearBySkyTrain" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                         <div class="col-lg-4">                                                         
                                                                <br />                                                      
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ระบบรักษาความปลอดภัย24ชม.
                                                                  <input type="checkbox" id="facilities_IsSecuritySystem" class="setting-form" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>


                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- แถบเพิ่มข้อมูล -->
                                    <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
                                        <p></p>
                                        <div class="container">
                                            <div class="form-group col-12">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- close nav tabs -->
                                </div>
                            </div>
                            <!-- close modal body -->
                            <div class="modal-footer">
                                <button id="btnSave" type="button" class="btn-setting btn btn-primary btnSave" onclick="btnSaveData(this.value)" value="Create">Save</button>
                                <button type="button" class="btn-setting btn btn-danger close" data-dismiss="modal"><i class="fas fa-times"></i>&nbsp;Close</button>
                            </div>
                        </div>
                    </div>
                </div>



            </form>
            <!-- /.container-fluid -->
            <%-- #endregion --%>
        </div>
        <!-- End of Main Content -->



        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>

    const d = new Date();
    let yearNow = d.getFullYear();
    let qrCodeImg = "";
    let qrCodeData = [];

    $(document).ready(function () {
        checkLogin(3);

        $('#FormModal_Project_Details').modal({ backdrop: 'static', keyboard: false })
        $('#footer_callme').addClass('d-none');

        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const pro_id = urlParams.get('id');

        console.log('pro_id', pro_id);

        let jsonTopic = JSON.stringify({
            "pro_id": pro_id
        });
        //เรียก api
        $.get("../../api/projectList", { jsonData: jsonTopic, types: "listTopicByProID" })
            .done(function (data) {

                let listTopic = JSON.parse(data);
                $('#topic_pro_id').html(` [รหัส ${listTopic[0].pro_id}]`);
                $('#topic_com_name').html(` [${listTopic[0].com_name}]`);

                $('#topic_pro_name').val(listTopic[0].pro_name);
                $('#topic_pro_type_name').val(listTopic[0].pro_type_name);
                $('#topic_pro_location_name').val(listTopic[0].pro_location_name);
                $('#topic_pro_statusType_name').val(listTopic[0].pro_statusType_name);
  
                /// สร้างตาราง 
                //createProjectDataTable(resData, "");

            });



    });
    // แปลง format ราคา
    function onPriceChange(e){         
        let price = money_unformat(e.value);
        $('#plan_price').val(money_format(price));
    }

    // ตั้งค่าเมื่อกดปุ่ม Create
    function btnAddClick() {
        let modalTopic = $('#topic_pro_name').val();
        $('#btnSave').val('Create');
        $('#modalTopic').html(`[${modalTopic}]`)

        HideTopbar(1);
        //ClearModal("#FormModal_Project_Details");

        $("#FormModal_Project_Details").modal("show");
        LockModal("#FormModal_Project_Details");
    };

    // Save ข้อมูล รับค่า action type ( Create , Edit) มาเช็ค
    function btnSaveData(e) {

        let action = e;
        const d = new Date();
        let time = d.getTime();


        if (action == "Create") {
            let sale_id = logInData[0].sale_id;
            let pro_company_id = $('#pro_company_id').val();
            let pro_name = $('#pro_name').val();
            let pro_description = $('#pro_description').val();
            let pro_type_id = $('#pro_type_id').val();
            let pro_location_id = $('#pro_location_id').val();
            let pro_total_area = $('#pro_total_area').val();
            let pro_land_area = $('#pro_land_area').val();
            let pro_usable_area = $('#pro_usable_area').val();
            let pro_unit = $('#pro_unit').val();
            let pro_opening_price = $('#pro_opening_price').val();
            let pro_opening_date = $('#pro_opening_date').val();
            let pro_address = $('#pro_address').val();
            let pro_sub_district_id = $('#drdwSubDistrict').val();
            let pro_district_id = $('#drdwDistrict').val();
            let pro_province_id = $('#drdwProvince').val();
            let pro_postal_code = $('#pro_postal_code').val();
            let pro_LinkGoogleMap = $('#pro_LinkGoogleMap').val().trim();
            let pro_bank_name = $('#pro_bank_name').val();
            let pro_bank_branchName = $('#pro_bank_branchName').val();
            let pro_bank_number = $('#pro_bank_number').val();
            let pro_bank_qrCodeImg = qrCodeImg;
            let pro_statusType_id = $('#pro_statusType_id').val();

            if (!pro_company_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'บริษัท'
                });
            }
            else if (!pro_name) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ชื่อโครงการ'
                });
            } else if (!pro_type_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ประเภทโครงการ'
                });
            } else if (!pro_location_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'โซน/ทำเล'
                });
            } else if (!pro_statusType_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'สถานะประเภทโครงการ'
                });
            } else if (!pro_address) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ที่ตั้งโครงการ'
                });
            } else if (!pro_sub_district_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ตำบล/แขวง'
                });
            } else if (!pro_district_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'อำเภอ/เขต'
                });
            } else if (!pro_province_id) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'จังหวัด'
                });
            } else if (!pro_postal_code) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'รหัสไปรษณีย์'
                });
            }

            else {

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

                            if (qrCodeImg) {

                                pro_bank_qrCodeImg = "BY_" + sale_id + "_" + time + "_" + qrCodeImg;
                            } else {

                                pro_bank_qrCodeImg = "";
                            }


                            var jsonData = JSON.stringify({
                                "sale_id": sale_id,
                                "pro_company_id": pro_company_id,
                                "pro_name": pro_name,
                                "pro_description": pro_description,
                                "pro_type_id": pro_type_id,
                                "pro_location_id": pro_location_id,
                                "pro_total_area": pro_total_area,
                                "pro_land_area": pro_land_area,
                                "pro_usable_area": pro_usable_area,
                                "pro_unit": pro_unit,
                                "pro_opening_price": pro_opening_price,
                                "pro_opening_date": pro_opening_date,
                                "pro_address": pro_address,
                                "pro_sub_district_id": pro_sub_district_id,
                                "pro_district_id": pro_district_id,
                                "pro_province_id": pro_province_id,
                                "pro_postal_code": pro_postal_code,
                                "pro_LinkGoogleMap": pro_LinkGoogleMap.trim(),
                                "pro_bank_name": pro_bank_name,
                                "pro_bank_branchName": pro_bank_branchName,
                                "pro_bank_number": pro_bank_number,
                                "pro_bank_qrCodeImg": pro_bank_qrCodeImg,
                                "pro_statusType_id": pro_statusType_id,

                            });

                            console.log(JSON.parse(jsonData))
                            if (qrCodeData != "") {

                                var formData = new FormData();
                                formData.append("file", qrCodeData);
                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles',
                                    type: 'POST',
                                    data: formData,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (fileName) {
                                        //console.log('fileName', fileName)

                                    }
                                })
                            }

                            //เรียก api
                            $.ajax({
                                type: 'POST',
                                url: "../../api/projectList",
                                data: { "data": jsonData },
                                headers: {
                                    "types": "addProject"
                                }
                            }).done(function (data) {

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


        } else if (action == "Edit") {





        };




    }
    function upload_qrCode(e) {

        let input = e.target;

        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output');
            output.src = dataURL;
        };

        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            qrCodeImg = input.files[0].name;
            qrCodeData = input.files[0];
        } else {
            qrCodeImg = "";
            qrCodeData = [];
            clearpic();
        }


    }
    function clearpic() {
        $("#output").attr("src", "");
        $("#pro_bank_qrCodeImg").val('');

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



    $('.close').click(() => {
        HideTopbar(0);
        $('#FormModal_Project_Details').modal('hide');
    });
    $(".btn-Refresh").click(function () {
        location.reload();
    });


    //สร้างตาราง
    function createProjectDataTable(data, type) {


        $("#register_project").dataTable({
            "destroy": true,
            data: data,
            "responsive": true,
            "bLengthChange": false,
            "bInfo": false,
            "searching": true,
            "bPaginate": true,
            columns: [

                {
                    render: function (data, type, row, meta) {

                        let chk = `
                                  <td>                                 
                                        <button type='button' class='btn-warning sm btnView  ' id="btnView${meta.row}"  value="${row.pro_id}" title='รายละเอียดประเภทแปลนโครงการ'  onclick="onBtnViewClick(this)"   ><i class='fas fa-eye' style="color:white" ></i>  </button>
                                                  
                                  </td> 
                                  `;

                        return "" + chk + "";
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.pro_id
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.com_name
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.pro_name
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.pro_type_name
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.pro_location_name
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.pro_statusType_name
                    },
                    className: "text-center"
                },
                //{
                //    render: function (data, type, row, meta) {

                //        return row.pro_status
                //    },
                //    className: "text-center"
                //},


            ],
            pageLength: 10
        });


    }

    function onBtnViewClick(e) {


        console.log('e', e.value)

    }


</script>
</html>
