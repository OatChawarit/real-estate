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
        /* Solid border */
        hr.solid {
            border-top: 3px solid #bbb;
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
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick()"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>
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
                                            <th style="width: 100px;">รหัสแบบแปลน</th>
                                            <th style="width: 80px;">ชื่อแบบแปลน </th>
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

                                                       <div class="col-lg-3">
                                                            <div class="inputText setting-font">ชื่อแบบแปลน* </div>
                                                            <input type="text" id="plan_name" placeholder=" " class="setting-form pro-input" maxlength="100" />
                                                        </div> 
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">พื้นที่ใช้สอย </div>
                                                            <input type="text" id="plan_useable_area" placeholder=" " class="setting-form pro-input" maxlength="20" />
                                                        </div> 
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ราคาขาย*</div>
                                                            <input type="text" id="plan_price"   class="setting-form pro-input" maxlength="30" onkeyup="onPriceChange(this)" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                                        </div> 
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนชั้น </div>
                                                            <input type="number" id="plan_floor"  class="setting-form pro-input"  />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนห้องนอน</div>
                                                            <input type="number" id="plan_bed_room"   class="setting-form pro-input"   />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนห้องน้ำ</div>
                                                            <input type="number" id="plan_bath_room"   class="setting-form pro-input"   />
                                                        </div>
                                                         <div class="col-lg-3">
                                                            <div class="inputText setting-font">ที่จอดรถ</div>
                                                            <input type="number" id="plan_parking"   class="setting-form pro-input"   />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">จำนวนห้องอเนกประสงค์</div>
                                                            <input type="number" id="plan_multiFunction_room"   class="setting-form pro-input"   />
                                                        </div>
                                                        

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="labelPromotion" class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold  " style="color: #dc3545">ข้อมูล Promotion</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group row ">
                                                    <div id="divProjectPromotion" class="row col-12 setting-row">
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ส่วนลด(เปอร์เซ็น)</div>
                                                            <input type="number" id="promotion_discount_percent" class="setting-form pro-input" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">บัตรของขวัญมูลค่า (บาท)</div>
                                                            <input type="number" id="promotion_giftVoucher_price" class="setting-form pro-input" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ส่วนลดวันโอน (บาท)</div>
                                                            <input type="number" id="promotion_discount_transferDate" class="setting-form pro-input" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ฟรีค่าบริการสาธารณะ (ปี)</div>
                                                            <input type="number" id="promotion_publicServicefeeYear_free" class="setting-form pro-input" />
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="inputText setting-font">ฟรีแอร์(เครื่อง)</div>
                                                            <input type="number" id="promotion_airConditioner_free" class="setting-form pro-input" />
                                                        </div>
                                                          <div class="col-lg-3"> 
                                                            <div class="inputText setting-font"> <br /> </div>                                                        
                                                              <label class="set-label-checkbox setting-font checkbox-item">ฟรีค่าติดตั้งมิเตอร์ไฟฟ้า
                                                                  <input type="checkbox"   id="promotion_IsElectricMeter_free" class="setting-form pro-chk-input" />
                                                                  <span class="checkmark"></span>
                                                              </label>
                                                        </div>
                                                          <div class="col-lg-3">
                                                                <div class="inputText setting-font"> <br /> </div>
                                                               <label class="set-label-checkbox setting-font checkbox-item">ฟรีค่าติดตั้งมิเตอร์น้ำประปา
                                                                  <input type="checkbox"   id="promotion_IsWaterMeter_free" class="setting-form pro-chk-input" />
                                                                  <span class="checkmark"></span>
                                                              </label>
                                                               
                                                        </div>
                                                     

                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">รายละเอียดฟรีแอร์ </div>
                                                            <textarea id="promotion_airConditioner_remark" name="promotion_airConditioner_remark" rows="3" cols="50" maxlength="255" class="pro-input">
                                                                         
                                                            </textarea>

                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">promotion อื่นๆ </div>
                                                            <textarea id="promotion_other" name="promotion_other" rows="3" cols="50" maxlength="255" class="pro-input">
                                                                         
                                                             </textarea>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div id="labelFacilities" class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold "><span style="color: #198754">สิ่งอำนวยความสะดวก </span> </h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group row ">
                                                    <div id="divProjectFacilities" class="row col-12 setting-row">
                                                        <div class="col-lg-3">                                                           
                                                                <br />                                                       
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                    ลิฟต์
                                                                  <input type="checkbox" id="facilities_IsLift" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">                                                             
                                                                <br />                                                           
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ที่จอดรถ
                                                                  <input type="checkbox" id="facilities_IsParking" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">                                                         
                                                                <br />                                                        
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ฟิตเนส
                                                                  <input type="checkbox" id="facilities_IsFitness" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                       
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                คลับเฮ้าส์
                                                                  <input type="checkbox" id="facilities_IsClubHouse" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ห้องซักรีด
                                                                  <input type="checkbox" id="facilities_IsLaunDry" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                        
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                CCTV
                                                                  <input type="checkbox" id="facilities_IsCCTV" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                Co-working space
                                                                  <input type="checkbox" id="facilities_IsCoWorkingSpace" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div> 
                                                      
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                สระว่ายน้ำ
                                                                  <input type="checkbox" id="facilities_IsSwimmingPool" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                สวนสาธารณะ
                                                                  <input type="checkbox" id="facilities_IsParks" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                          <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                สวนดาดฟ้า
                                                                  <input type="checkbox" id="facilities_IsRoofGarden" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div> 

                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                คีย์การ์ดและสแกนนิ้ว
                                                                  <input type="checkbox" id="facilities_IsKeyCard" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <br />
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ใกล้สถานีรถไฟฟ้า
                                                                  <input type="checkbox" id="facilities_IsNearBySkyTrain" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                         <div class="col-lg-4">                                                         
                                                                <br />                                                      
                                                            <label class="set-label-checkbox setting-font checkbox-item">
                                                                ระบบรักษาความปลอดภัย24ชม.
                                                                  <input type="checkbox" id="facilities_IsSecuritySystem" class="setting-form pro-chk-input" />
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>


                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                          <div id="labelImage" class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold  " style="color: #ffc107">ข้อมูลภาพแบบแปลน</h6>
                                            </div>
                                            <div class="card-body">
                                                
                                                <div class="form-group row ">
                                                    <div id="divPlanImageProfile" class="row col-12 setting-row">
                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">รูปโปรไฟล์ แปลนโครงการ </div>  
                                                            <input type="file" id="plan_image_profile" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile(event)" />                                                        
                                                            <div id="display_image">
                                                                <img id='output'>  
                                                            </div> 
                                                              <br />

                                                        </div>                                                         
                                                    </div>      
                                                
                                                    <hr class="solid">
                                               <%--     <div class="row col-12 setting-row">
                                                        <div class="col-lg-6">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ </div>
                                                            <input type="file" id="plan_image_profileArray" class="my-3 setting-form theme-btn-3 btn-setting w-100" multiple="multiple" accept="image/*" onchange="upload_image_profileArray(event)" />
                                                         <asp:FileUpload ID="FileUpload1" runat="server"   class="my-3 setting-form theme-btn-3 btn-setting w-100" multiple="multiple" accept="image/*" onchange="upload_image_profileArray(event)"  />
                                                            <asp:Button ID="btnUpload1111" runat="server" Text="Upload" class=" " OnClick="btnUpload_Click"   />
                                                        </div>
                                                    </div>--%>
                                                    <%--<div class="row col-12 setting-row" id="display_imageArray">
                                                     

                                                    </div>--%>
                                                    <div id="divPlanImage1" class="row col-12 setting-row">
                                                        <div class="col-lg-4">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ 1 </div>
                                                            <input type="file" id="plan_image_1" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile1(event)" />
                                                            <div id="display_image1">
                                                                <img id='output1'>
                                                            </div>
                                                            <br />
                                                        </div>
                                                         <div class="col-lg-4">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ 2 </div>
                                                            <input type="file" id="plan_image_2" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile2(event)" />
                                                            <div id="display_image2">
                                                                <img id='output2'>
                                                            </div>
                                                            <br />
                                                        </div>
                                                         <div class="col-lg-4">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ 3 </div>
                                                            <input type="file" id="plan_image_3" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile3(event)" />
                                                            <div id="display_image3">
                                                                <img id='output3'>
                                                            </div>
                                                            <br />
                                                        </div>
                                                         <div class="col-lg-4">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ 4 </div>
                                                            <input type="file" id="plan_image_4" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile4(event)" />
                                                            <div id="display_image4">
                                                                <img id='output4'>
                                                            </div>
                                                            <br />
                                                        </div> 
                                                         <div class="col-lg-4">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ 5 </div>
                                                            <input type="file" id="plan_image_5" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile5(event)" />
                                                            <div id="display_image5">
                                                                <img id='output5'>
                                                            </div>
                                                            <br />
                                                        </div> 
                                                         <div class="col-lg-4">
                                                            <div class="inputText setting-font">รูปแปลนโครงการ 6</div>
                                                            <input type="file" id="plan_image_6" class="my-3 setting-form theme-btn-3 btn-setting w-100" accept="image/*" onchange="upload_image_profile6(event)" />
                                                            <div id="display_image6">
                                                                <img id='output6'>
                                                            </div>
                                                            <br />
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
    let pf_img = "";
    let pf_img1 = "";
    let pf_img2 = "";
    let pf_img3 = "";
    let pf_img4 = "";
    let pf_img5 = "";
    let pf_img6 = "";

    let pf_imgData = [];
    let pf_imgData1 = [];
    let pf_imgData2 = [];
    let pf_imgData3 = [];
    let pf_imgData4 = [];
    let pf_imgData5 = [];
    let pf_imgData6 = [];


    let pf_imgArray = [];
    let pf_imgDataArray = []; 
     

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const pro_id = urlParams.get('id');
    const sale_id = JSON.parse(userLocal)[0].sale_id  ;
    let inputArray = [];
  
    $(document).ready(function () {
        checkLogin(3);
        $('#FormModal_Project_Details').modal({ backdrop: 'static', keyboard: false })
        $('#footer_callme').addClass('d-none');

        console.log('pro_id', pro_id);
         
        ////// topic 
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
   
            });

        let jsonPlanTable = JSON.stringify({
            "pro_id": pro_id, 
            "sale_id" : sale_id
        });

        $.get("../../api/projectList", { jsonData: jsonPlanTable, types: "listPlanTable" })
            .done(function (data) {
                let listPlanTable = JSON.parse(data);
               
                console.log('listPlanTable' , listPlanTable)
                /// สร้างตาราง 
                createProjectPlanDataTable(listPlanTable, "");
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
        // Clear input
        $('.pro-input').val('');
        $('.pro-chk-input').prop('checked', false);
        clearpic();
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
                   
            let plan_name = $('#plan_name').val();
            let plan_useable_area = $('#plan_useable_area').val();
            let plan_price = $('#plan_price').val();
            let plan_floor = $('#plan_floor').val();
            let plan_bed_room = $('#plan_bed_room').val();
            let plan_bath_room = $('#plan_bath_room').val();
            let plan_multiFunction_room = $('#plan_multiFunction_room').val();
            let plan_parking = $('#plan_parking').val();

            let promotion_discount_percent = $('#promotion_discount_percent').val();
            let promotion_giftVoucher_price = $('#promotion_giftVoucher_price').val();
            let promotion_discount_transferDate = $('#promotion_discount_transferDate').val();
            let promotion_publicServicefeeYear_free = $('#promotion_publicServicefeeYear_free').val();
            let promotion_airConditioner_free = $('#promotion_airConditioner_free').val();

            let promotion_IsElectricMeter_free = 0;
            let promotion_IsWaterMeter_free = 0;
            if ($("#promotion_IsElectricMeter_free").prop("checked")) {
                promotion_IsElectricMeter_free = 1;
            } else {
                promotion_IsElectricMeter_free = 0;
            }
            if ($("#promotion_IsWaterMeter_free").prop("checked")) {
                  promotion_IsWaterMeter_free = 1;            
            } else {
                  promotion_IsWaterMeter_free = 0;          
            }       
            let promotion_airConditioner_remark = $('#promotion_airConditioner_remark').val().trim();
            let promotion_other = $('#promotion_other').val().trim();

            let facilities_IsLift = 0;
            if ($("#facilities_IsLift").prop("checked")) {
                facilities_IsLift = 1;
            } else {
                facilities_IsLift = 0;
            }  
            let facilities_IsParking = 0;
            if ($("#facilities_IsParking").prop("checked")) {
                facilities_IsParking = 1;
            } else {
                facilities_IsParking = 0;
            }  
            let facilities_IsFitness = 0;
            if ($("#facilities_IsFitness").prop("checked")) {
                facilities_IsFitness = 1;
            } else {
                facilities_IsFitness = 0;
            }  
            let facilities_IsClubHouse = 0;
            if ($("#facilities_IsClubHouse").prop("checked")) {
                facilities_IsClubHouse = 1;
            } else {
                facilities_IsClubHouse = 0;
            }  
            let facilities_IsLaunDry = 0;
            if ($("#facilities_IsLaunDry").prop("checked")) {
                facilities_IsLaunDry = 1;
            } else {
                facilities_IsLaunDry = 0;
            }  
            let facilities_IsCCTV = 0;
            if ($("#facilities_IsCCTV").prop("checked")) {
                facilities_IsCCTV = 1;
            } else {
                facilities_IsCCTV = 0;
            }  
            let facilities_IsCoWorkingSpace = 0;
            if ($("#facilities_IsCoWorkingSpace").prop("checked")) {
                facilities_IsCoWorkingSpace = 1;
            } else {
                facilities_IsCoWorkingSpace = 0;
            }  
            let facilities_IsSwimmingPool = 0;
            if ($("#facilities_IsSwimmingPool").prop("checked")) {
                facilities_IsSwimmingPool = 1;
            } else {
                facilities_IsSwimmingPool = 0;
            }  
            let facilities_IsParks = 0;
            if ($("#facilities_IsParks").prop("checked")) {
                facilities_IsParks = 1;
            } else {
                facilities_IsParks = 0;
            }  
            let facilities_IsRoofGarden = 0;
            if ($("#facilities_IsRoofGarden").prop("checked")) {
                facilities_IsRoofGarden = 1;
            } else {
                facilities_IsRoofGarden = 0;
            }  
            let facilities_IsKeyCard = 0;
            if ($("#facilities_IsKeyCard").prop("checked")) {
                facilities_IsKeyCard = 1;
            } else {
                facilities_IsKeyCard = 0;
            }  
            let facilities_IsNearBySkyTrain = 0;
            if ($("#facilities_IsNearBySkyTrain").prop("checked")) {
                facilities_IsNearBySkyTrain = 1;
            } else {
                facilities_IsNearBySkyTrain = 0;
            }  
            let facilities_IsSecuritySystem = 0;
            if ($("#facilities_IsSecuritySystem").prop("checked")) {
                facilities_IsSecuritySystem = 1;
            } else {
                facilities_IsSecuritySystem = 0;
            }   

            let plan_image_profile = pf_img;
            //let plan_image_Array = inputArray;
            let plan_image_Array = pf_imgArray;
 

            if (!plan_name) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ชื่อแปลน'
                });
            }
            else if (!plan_price) {
                Swal.fire({
                    type: 'warning',
                    title: 'กรุณาระบุ!!',
                    text: 'ราคาขาย'
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
                
                            if (pf_img) {

                                plan_image_profile = "ProFile_BY_" + sale_id + "_" + time + "_" + pf_img;
                            } else {

                                plan_image_profile = "";
                            }
                            let plan_img_seq = [];

                            pf_img1 ? plan_img_seq.push({ "plan_img_seq": "1-BY_" + sale_id + "_" + time + "_" + pf_img1 })  : pf_img1 = ""
                            pf_img2 ? plan_img_seq.push({ "plan_img_seq": "2-BY_" + sale_id + "_" + time + "_" + pf_img2 }) : pf_img2 = ""
                            pf_img3 ? plan_img_seq.push({ "plan_img_seq": "3-BY_" + sale_id + "_" + time + "_" + pf_img3 }) : pf_img3 = ""
                            pf_img4 ? plan_img_seq.push({ "plan_img_seq": "4-BY_" + sale_id + "_" + time + "_" + pf_img4 }) : pf_img4 = ""
                            pf_img5 ? plan_img_seq.push({ "plan_img_seq": "5-BY_" + sale_id + "_" + time + "_" + pf_img5 }) : pf_img5 = ""
                            pf_img6 ? plan_img_seq.push({ "plan_img_seq": "6-BY_" + sale_id + "_" + time + "_" + pf_img6 }) : pf_img6 = ""
                             
                            //if (plan_image_Array.length > 0) {

                            //    plan_image_Array.forEach((item , index) => { 
                            //        let prefix = `${index + 1}-BY_${sale_id}_${time}_`
                            //        item.plan_img_path = prefix + item.plan_img_path;
                                     
                            //    });

                            //} else {
                            //    plan_image_Array = [];
                            //}

                            var jsonData = JSON.stringify({
                                "sale_id": sale_id,
                                "pro_id": pro_id,

                                "plan_name": plan_name,
                                "plan_useable_area": plan_useable_area,
                                "plan_price": money_unformat(plan_price) ,
                                "plan_floor": plan_floor,
                                "plan_bed_room": plan_bed_room,
                                "plan_bath_room": plan_bath_room,
                                "plan_multiFunction_room": plan_multiFunction_room,
                                "plan_parking": plan_parking,

                                "promotion_discount_percent": promotion_discount_percent,
                                "promotion_giftVoucher_price": promotion_giftVoucher_price,
                                "promotion_discount_transferDate": promotion_discount_transferDate,
                                "promotion_publicServicefeeYear_free": promotion_publicServicefeeYear_free,
                                "promotion_airConditioner_free": promotion_airConditioner_free,
                                "promotion_IsElectricMeter_free": promotion_IsElectricMeter_free,
                                "promotion_IsWaterMeter_free": promotion_IsWaterMeter_free,
                                "promotion_airConditioner_remark": promotion_airConditioner_remark,
                                "promotion_other": promotion_other,

                                "facilities_IsLift": facilities_IsLift,
                                "facilities_IsParking": facilities_IsParking,
                                "facilities_IsFitness": facilities_IsFitness,
                                "facilities_IsClubHouse": facilities_IsClubHouse,
                                "facilities_IsLaunDry": facilities_IsLaunDry,
                                "facilities_IsCCTV": facilities_IsCCTV,
                                "facilities_IsCoWorkingSpace": facilities_IsCoWorkingSpace,
                                "facilities_IsSwimmingPool": facilities_IsSwimmingPool,
                                "facilities_IsParks": facilities_IsParks,
                                "facilities_IsRoofGarden": facilities_IsRoofGarden,
                                "facilities_IsKeyCard": facilities_IsKeyCard,
                                "facilities_IsNearBySkyTrain": facilities_IsNearBySkyTrain,
                                "facilities_IsSecuritySystem": facilities_IsSecuritySystem,  

                                "plan_image_profile": plan_image_profile, 
                                "plan_img_seq": plan_img_seq
                                                  
                            });
                            let json = JSON.parse(jsonData) ;

                            console.log('json', json.plan_img_seq);
                            //console.log(JSON.parse(jsonData))

                            if (pf_imgData != "") {
                                console.log('pf_imgData' , pf_imgData)
                                var formData = new FormData();
                                formData.append("file", pf_imgData);
                                 
                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles',
                                    type: 'POST',
                                    data: formData,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Profile',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                        console.log('postedFile', postedFile)

                                    }
                                })
                            }
                            if (pf_imgData1 != "") {
                                console.log('pf_imgData1', pf_imgData1)
                                var formData1 = new FormData();
                                formData1.append("file", pf_imgData1);
                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles1',
                                    type: 'POST',
                                    data: formData1,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Array',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                        console.log('postedFile', postedFile)

                                    }
                                })
                            }
                            if (pf_imgData2 != "") {
                                console.log('pf_imgData2', pf_imgData2)
                                var formData2 = new FormData();
                                formData2.append("file", pf_imgData2);

                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles2',
                                    type: 'POST',
                                    data: formData2,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Array',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                        console.log('postedFile', postedFile)

                                    }
                                })
                            }
                            if (pf_imgData3 != "") {
                                console.log('pf_imgData3', pf_imgData3)
                                var formData3 = new FormData();
                                formData3.append("file", pf_imgData3);

                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles3',
                                    type: 'POST',
                                    data: formData3,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Array',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                        console.log('postedFile', postedFile)

                                    }
                                })
                            }
                            if (pf_imgData4 != "") {
                                console.log('pf_imgData4', pf_imgData4)
                                var formData4 = new FormData();
                                formData4.append("file", pf_imgData4);

                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles4',
                                    type: 'POST',
                                    data: formData4,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Array',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                        console.log('postedFile', postedFile)

                                    }
                                })
                            }
                            if (pf_imgData5 != "") {
                                console.log('pf_imgData5', pf_imgData5)
                                var formData5 = new FormData();
                                formData5.append("file", pf_imgData5);

                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles5',
                                    type: 'POST',
                                    data: formData5,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Array',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                        console.log('postedFile', postedFile)

                                    }
                                })
                            }
                            if (pf_imgData6 != "") {
                                console.log('pf_imgData6', pf_imgData6)
                                var formData6 = new FormData();
                                formData6.append("file", pf_imgData6);

                                $.ajax({
                                    url: '/api/ImageAPI/UploadFiles6',
                                    type: 'POST',
                                    data: formData6,
                                    headers: {
                                        "sale_id": sale_id,
                                        "time": time,
                                        "type": 'Array',
                                    },
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    success: function (postedFile) {
                                     console.log('postedFile', postedFile)

                                    }
                                })
                            }
 
                            //if (pf_imgDataArray.length > 0) {

                            //    //$('#btnUpload').click();
                               
                            //    var formDataArr = new FormData();                              
                            //    formDataArr.append("file1", pf_imgDataArray);
                            //    $.ajax({
                            //        url: '/api/ImageAPI/UploadFilesArray',
                            //        type: 'POST',
                            //        data: formDataArr,
                            //        headers: {
                            //            "sale_id": sale_id,
                            //            "time": time,
                            //            "data": pf_imgDataArray,
                            //            "countIndex": pf_imgDataArray.length

                                  
                            //        },
                            //        cache: false,
                            //        contentType: false,
                            //        processData: false,
                            //        success: function (result ) {
                            //            console.log('result', result)

                            //        }
                            //    })
                            //}

                            ///เรียก api
                            $.ajax({
                                type: 'POST',
                                url: "../../api/projectList",
                                data: { "data": jsonData },
                                headers: {
                                    "types": "addProjectPlan"
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
 
    function upload_image_profile(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img = input.files[0].name;
            pf_imgData = input.files[0];
        } else {
            pf_img = "";
            pf_imgData = [];
            clearpic(0);
        }
    }
    function upload_image_profile1(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output1');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img1 = input.files[0].name;
            pf_imgData1 = input.files[0];
        } else {
            pf_img1 = "";
            pf_imgData1 = [];
            clearpic(0);
        }
    }
    function upload_image_profile2(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output2');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img2 = input.files[0].name;
            pf_imgData2 = input.files[0];
        } else {
            pf_img2 = "";
            pf_imgData2 = [];
            clearpic(0);
        }
    }
    function upload_image_profile3(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output3');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img3 = input.files[0].name;
            pf_imgData3 = input.files[0];
        } else {
            pf_img3 = "";
            pf_imgData3 = [];
            clearpic(0);
        }
    }
    function upload_image_profile4(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output4');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img4 = input.files[0].name;
            pf_imgData4 = input.files[0];
        } else {
            pf_img4 = "";
            pf_imgData4 = [];
            clearpic(0);
        }
    }
    function upload_image_profile5(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output5');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img5 = input.files[0].name;
            pf_imgData5 = input.files[0];
        } else {
            pf_img5 = "";
            pf_imgData5 = [];
            clearpic(0);
        }
    }
    function upload_image_profile6(e) {

        let input = e.target;
        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            var output = document.getElementById('output6');
            output.src = dataURL;
        };
        if (input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            pf_img6 = input.files[0].name;
            pf_imgData6 = input.files[0];
        } else {
            pf_img6 = "";
            pf_imgData6 = [];
            clearpic(0);
        }
    }




    function upload_image_profileArray(e) {
        
        let input = e.target;
        let innerHtml = "";
        pf_imgArray = [];
       
        inputArray = input.files; 

        if (inputArray.length == 0) {
            console.log('clearpic'); 
            pf_imgArray = [];
            pf_imgDataArray = [];
            clearpic(1);
        }  

        for (let i = 0; i < inputArray.length; i++) {
 
            innerHtml += `
                    <div class="col-lg-3">
                         <img id='outputArray${i}' >
                    </div>
                 
            `;
            $('#display_imageArray').html(innerHtml); 

            setTimeout(function () {

                let reader = new FileReader();
                reader.onload = function () {
                    let dataURL = reader.result;
                    let output = document.getElementById('outputArray' + i);
                    output.src = dataURL;
                }; 

                reader.readAsDataURL(input.files[i]);
                pf_imgArray.push({ "plan_img_path": input.files[i].name  });
                //pf_imgArray.push( input.files[i].name  );
                pf_imgDataArray.push(input.files[i]);
                //pf_imgDataArray.push({ "pf_imgDataArray": input.files[i]  } );

           
            }, 400);
             
           
        }
 

        //console.log('inputArray', inputArray); 
        //console.log('pf_imgArray', pf_imgArray);
        //console.log('pf_imgDataArray', pf_imgDataArray);
  
    }
 

    function clearpic(type) {

        if (type == 0) {
            $("#output").attr("src", "");
            $("#plan_image_profile").val('');

        } else if (type == 1) {

            $("#plan_image_profileArray").val('');
            $("#display_imageArray").html("");

        } else {
            $("#output").attr("src", "");
            $("#plan_image_profile").val('');
            $("#plan_image_profileArray").val('');
            $("#display_imageArray").html("");
        }
 
 
  
    }
     

    $('.close').click(() => {
        HideTopbar(0);
        $('#FormModal_Project_Details').modal('hide');
    });
    $(".btn-Refresh").click(function () {
        location.reload();
    });


    //สร้างตาราง
    function createProjectPlanDataTable(data, type) {


        $("#register_project_plan").dataTable({
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
                                        <button type='button' class='btn-warning sm btnView d-none ' id="btnView${meta.row}"  value="${row.plan_type_id}" title='รายละเอียดประเภทแปลนโครงการ'  onclick="onBtnEditClick(this)"   ><i class='fas fa-eye' style="color:white" ></i>  </button>
                                                  
                                  </td> 
                                  `;

                        return "" + chk + "";
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_type_id
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_name
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_useable_area
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_floor
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_bed_room
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_bath_room
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_multiFunction_room
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_parking
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_price
                    },
                    className: "text-right"
                },
                {
                    render: function (data, type, row, meta) {

                        let status = "";

                        if (row.plan_status == 'N') {

                            status = `<span class="badge badge-success" style="background-color:#198754"> ปกติ </span>`;

                        } else {

                            status = `<span class="badge badge-danger" style="background-color:red"> ยกเลิก </span>`;


                        }
                         
                        return status
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.plan_view
                    },
                    className: "text-center"
                },
       


            ],
            pageLength: 10
        });


    }

    function onBtnViewClick(e) {


        console.log('e', e.value)

    }


</script>
</html>
