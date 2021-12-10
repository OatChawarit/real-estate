<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="project-sales-management.aspx.cs" Inherits="real_estate.pages.project.project_sales_managementaspx" %>
 
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
                            <h1 class="h3 mb-2 text-gray-800 d-sm-inline-block">บันทึกโครงการลงขาย</h1> 
                        </div> 
                        <div class="text-end">
                            <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none" ></i>&nbsp;Create</a>
                            <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                        </div>
                    </div> 
                    <form runat="server" action="project-sales-management.aspx" method="post" enctype="multipart/form-data">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class="row col-12">
                                    <h5 class="m-0 font-weight-bold text-primary mr-5">รายการโครงการที่ลงขาย</h5>                        
                                </div> 
                               
                            </div>
                            <div class="card-body">
                                <div class="form-group row">

                                <div class="table-responsive" style="padding-bottom:30px">
                                    <%--<table class="table table-bordered dataTable js-exportable" id="orderTable" width="100%" cellspacing="0">--%>
                                    <table class="table table-striped " id="register_project" width="100%" cellspacing="0" >
                                        <thead class="table-dark" align="center">
                                            <tr>
                                                <th style="width: 60px; min-width: 60px; max-width: 60px; vertical-align: middle;"></th>
                                                <th style="width: 40px;">รหัสโครงการ</th>
                                                <th style="width: 80px;">ชื่อบริษัท</th>
                                                <th style="width: 80px;">ชื่อโครงการ</th> 
                                                <th style="width: 40px;">ประเภทโครงการ</th>
                                                <th style="width: 80px;">ทำเล</th>                                             
                                                <th style="width: 50px;">สถานะประเภทโครงการ</th>
                                                <%--<th style="width: 30px;">สถานะโครงการ</th>--%>
                                            
                                            </tr>
                                        </thead>
                                        <!--js-exportable -->
                                        <tbody>
                                        </tbody>
                                        <tfoot align="center" style="background-color:black;">
                                            
                                        </tfoot>
                                    </table>
                                </div>
                                </div>
                            </div>

                        </div>

                        <%--MODAL Create EDIT--%>
                        <div class="modal fade " id="FormModal_Project" tabindex="-1" role="dialog" aria-labelledby="FormModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header setting-modal">
                                        <h5 class="modal-title topic-text" id="topic_Modal"> เพิ่มโครงการ</h5>
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
                                                        <h6 class="m-0 font-weight-bold text-primary">ข้อมูลโครงการ</h6>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form-group row ">
                                                            <div id="divProjectInfo" class="row col-12 setting-row" >

                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">เลือกบริษัท* </div> 
                                                                    <select id="pro_company_id" class="w-100 "   >
                                                                        <option value="" selected disabled >-- เลือกบริษัท --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwCompany(); 
                                                                        %>
                                                                    </select> 
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">ชื่อโครงการ* </div>
                                                                    <input type="text" id="pro_name" placeholder=" " class="setting-form" maxlength="100" />
                                                                </div>
                                                               

                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">ประเภทโครงการ*</div>
                                                                    <select id="pro_type_id" class="w-100">
                                                                        <option value="" selected disabled>-- เลือกประเภทโครงการ --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwProjectType();
                                                                        %>
                                                                    </select>
                                                                </div>
                                                                  <div class="col-lg-3">
                                                                    <div class="inputText setting-font">โซน/ทำเล* </div>
                                                                    <select id="pro_location_id" class="w-100">
                                                                        <option value="" selected disabled>-- เลือกโซน/ทำเล --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwProjectLocation();
                                                                        %>
                                                                    </select>
                                                                </div>  
                                                                
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">พื้นที่โครงการทั้งหมด </div>
                                                                    <input type="text" id="pro_total_area" placeholder="[ไร่-งาน-ตารางวา]" class="setting-form" maxlength="30" />
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">พื้นที่ดิน (ตร.วา)</div>
                                                                    <input type="text" id="pro_land_area" placeholder="" class="setting-form" maxlength="30" />
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">พื้นที่ใช้สอย (ตร.ม)</div>
                                                                    <input type="text" id="pro_usable_area" placeholder="" class="setting-form" maxlength="30" />
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">จำนวนยูนิต </div>
                                                                    <input type="number" id="pro_unit" placeholder="" class="setting-form"  />
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">ราคาเปิดโครงการ </div>
                                                                    <input type="text" id="pro_opening_price" placeholder="(x-xx ล้านบาท) " class="setting-form" maxlength="30" />
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">วันที่เปิดขาย</div>
                                                                    <input type="date" id="pro_opening_date"  class="setting-form" />
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">สถานะประเภทโครงการ* </div>
                                                                    <select id="pro_statusType_id" class="w-100">
                                                                        <option value="" selected disabled>-- สถานะประเภทโครงการ --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwProjectStatusType();
                                                                        %>
                                                                    </select>
                                                                </div>

                                                                 <div class="col-lg-6">
                                                                    <div class="inputText setting-font">รายละเอียดโครงการ </div>
                                                                    <textarea id="pro_description" name="pro_description" rows="4" cols="50" maxlength="255" >
                                                                         
                                                                    </textarea>

                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="inputText setting-font">Link ตำแหน่ง Google Map </div>
                                                                    <textarea id="pro_LinkGoogleMap" name="pro_LinkGoogleMap" rows="2" cols="50"  >
                                                                         
                                                                    </textarea>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="labelAddress" class="card shadow mb-4">
                                                    <div class="card-header py-3">
                                                        <h6 class="m-0 font-weight-bold  " style="color:#dc3545">ข้อมูลที่ตั้งโครงการ</h6>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form-group row ">
                                                            <div id="divProjectAddress" class="row col-12 setting-row">
                                                                 <div class="col-lg-12">
                                                                    <div class="inputText setting-font">ที่ตั้งโครงการ [บ้านเลขที่, หมู่, ซอย, ถนน]* </div>
                                                                    <input type="text" id="pro_address" placeholder=" " class="setting-form" maxlength="100" />
                                                                </div>
                                                                <div class="col-lg-3 ">
                                                                    <div class="inputText setting-font">เลือกจังหวัด*</div>
                                                                    <select id="drdwProvince" class="w-100" onchange="drdwProvinceChange(this.value)">
                                                                        <option value="" selected disabled>-- เลือกจังหวัด --</option>
                                                                        <%
                                                                            real_estate.ClassData.DropDownData.drdwProvince();
                                                                        %>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">เลือกอำเภอ/เขต* </div>
                                                                    <select id="drdwDistrict" class="w-100" onchange="drdwDistrictChange(this.value)">
                                                                        <option value="" selected disabled>-- เลือกอำเภอ/เขต --</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">เลือกตำบล/แขวง* </div>
                                                                    <select id="drdwSubDistrict" class="w-100">
                                                                        <option value="" selected disabled>-- เลือกตำบล/แขวง --</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">รหัสไปรษณีย์* </div>
                                                                    <input type="text" id="pro_postal_code" placeholder="รหัสไปรษณีย์*" class="setting-form" maxlength="100" />
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                  <div id="labelBank" class="card shadow mb-4">
                                                    <div class="card-header py-3">
                                                        <h6 class="m-0 font-weight-bold " ><span style="color:#198754" >ข้อมูลบัญชีธนาคาร </span> <span style="font-weight:400">*สำหรับให้ลูกค้าโอน</span></h6>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form-group row ">
                                                            <div id="divProjectBank" class="row col-12 setting-row">
                                                                
                                                                <div class="col-lg-3">
                                                                    <div class="inputText setting-font">ชื่อธนาคาร </div>
                                                                    <input type="text" id="pro_bank_name" placeholder="" class="setting-form" maxlength="100" />
                                                                </div>
                                                                 <div class="col-lg-3">
                                                                    <div class="inputText setting-font">ชื่อสาขาธนาคาร </div>
                                                                    <input type="text" id="pro_bank_branchName" placeholder="" class="setting-form" maxlength="100" />
                                                                </div>
                                                                 <div class="col-lg-3">
                                                                    <div class="inputText setting-font">เลขบัญชีธนาคาร </div>
                                                                    <input type="text" id="pro_bank_number" placeholder="" class="setting-form" maxlength="100" />
                                                                </div>
                                                                 <div class="col-lg-3">
                                                                    <div class="inputText setting-font">รูป QR Code </div>
                                                                    <input type="file" id="pro_bank_qrCodeImg" class="setting-form theme-btn-3 btn-setting w-100"  accept="image/*" onchange="upload_qrCode(event)" />
                                                                       <%--<input  type="file" class="setting-form theme-btn-3 btn-setting w-100" accept="image/*" multiple="multiple" id="fileUploader">--%>
                                                                     <div id="display_image">
                                                                          <img id='output'  >  
                                                                     </div>
                                                                   

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
    const sale_id = JSON.parse(userLocal)[0].sale_id;

    $(document).ready(function () { 
        checkLogin(3);
    
 
        $('#FormModal_Project').modal({ backdrop: 'static', keyboard: false })  

        $('#footer_callme').addClass('d-none');   
 
        //console.log('sale_id' , sale_id);

        let jsonData = JSON.stringify({
            "sale_id" : sale_id
        }); 
        //เรียก api
        $.get("../../api/projectList", { jsonData: jsonData, types: "listProjectTableBysale" })
            .done(function (data) {

                let resData = JSON.parse(data);
                
                /// สร้างตาราง 
                createProjectDataTable(resData, "");
                 
            });


     
    });

    // ตั้งค่าเมื่อกดปุ่ม Create
    function btnAddClick() {
        $('#btnSave').val('Create');
        HideTopbar(1);
        ClearModal("#FormModal_Project");  
        clearpic();
        $("#FormModal_Project").modal("show");
        LockModal("#FormModal_Project"); 
    };

    // Save ข้อมูล รับค่า action type ( Create , Edit) มาเช็ค
    function btnSaveData(e) {
    
        let action = e;             
        const d = new Date();
        let time = d.getTime(); 
  
       
        if (action == "Create") {
            //let sale_id = logInData[0].sale_id;
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
            let pro_bank_qrCodeImg = qrCodeImg ;
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
                                "pro_land_area" : pro_land_area,
                                "pro_usable_area" : pro_usable_area,
                                "pro_unit" : pro_unit,
                                "pro_opening_price" : pro_opening_price,
                                "pro_opening_date" : pro_opening_date,
                                "pro_address" : pro_address,
                                "pro_sub_district_id" : pro_sub_district_id,
                                "pro_district_id" : pro_district_id,
                                "pro_province_id" : pro_province_id,
                                "pro_postal_code" : pro_postal_code,
                                "pro_LinkGoogleMap" : pro_LinkGoogleMap.trim(),
                                "pro_bank_name" : pro_bank_name,
                                "pro_bank_branchName" : pro_bank_branchName,
                                "pro_bank_number" : pro_bank_number,
                                "pro_bank_qrCodeImg": pro_bank_qrCodeImg ,
                                "pro_statusType_id" : pro_statusType_id,
                               
                            }); 
                             
                            console.log(JSON.parse(jsonData) )
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
                                        "type": "",
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
  

        } else if(action == "Edit") {





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
        $('#FormModal_Project').modal('hide'); 
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
            "bLengthChange": true,
            "bInfo": true,
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

        //console.log('e', e.value)
        window.location.href = "../project/project-sales-details-management?id=" + e.value ;

    }
    

</script>
</html>
