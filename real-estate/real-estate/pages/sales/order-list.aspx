<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order-list.aspx.cs" Inherits="real_estate.pages.sales.order_list" %>

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
        }

        .list {
            max-height: 500px;
            overflow: auto !important;
        }
        .set-disa {
            background-color: #80808021 !important;
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
                            <h1 class="page-title">รายการใบสั่งจอง</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="main.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>หน้าแรก</a></li>
                                    <li>รายการใบสั่งจอง</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->

        <!-- Begin Page Content -->
        <div class="container-xl " style="font-size: 13px;">
            <!-- Page Heading -->
            <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                <div class="text-end">
                    <%--<a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick()"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>--%>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                </div>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row col-12">
                        <h5 class="m-0 font-weight-bold text-primary mr-5">ข้อมูลรายการใบสั่งจอง</h5>
                    </div>

                </div>
                <div class="card-body">
                    <div class="form-group row">

                        <div class="table-responsive" style="padding-bottom: 30px">
       
                            <table class="table table-striped  " id="order_list" width="100%" cellspacing="0">
                                <thead class="table-dark" align="center">
                                    <tr>
                                        <th style="width: 280px; vertical-align: middle;"></th>
                                        <th style="width: 100px">รหัสสั่งจอง</th>
                                        <th>วันที่สั่งจอง</th>
                                        <th style="width: 130px">ชื่อผู้สั่งจอง</th>
                                        <th style="width: 80px">รหัสโครงการ</th>
                                        <th style="width: 100px">ชื่อโครงการ</th>
                                        <th style="width: 80px">รหัสแบบแปลน</th>
                                        <th>ชื่อแบบแปลน</th> 
                                        <th>ประเภทโครงการ</th>
                                        <th>ราคา</th>
                                        <th style="width: 120px">ชื่อตัวแทนขาย</th>
                                        <th>เบอร์โทรติดต่อ</th>
                                        <th>สถานะสั่งจอง</th>
                                    </tr>
                                </thead>
                                <!--js-exportable -->
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
                        <div class="modal fade " id="FormModal_Project" tabindex="-1" role="dialog" aria-labelledby="FormModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header setting-modal">
                                        <h5 class="modal-title topic-text" id="topic_Modal">ข้อมูลก่อนพิมพ์ใบจอง</h5>
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

                                                <div id="labelBooking" class="card shadow mb-4">
                                                    <div class="card-header py-3">
                                                        <h6 class="m-0 font-weight-bold text-primary">ข้อมูลการจอง</h6>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form-group row ">
                                                            <div id="divProjectInfo" class="row col-12 setting-row" >
                                                                 
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font">ใบจองเลขที่ </div>
                                                                    <input type="text" id="book_id" placeholder=" " class="setting-form  set-disa" disabled/>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font ">ชื่อโครงการ </div>
                                                                    <input type="text" id="pro_name" placeholder=" " class="setting-form  set-disa" disabled/>
                                                                </div>
                                                                 
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font ">ชื่อผู้จอง </div>
                                                                    <input type="text" id="book_fullName" placeholder=" " class="setting-form  set-disa" disabled/>
                                                                </div>
                                                                
 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
 
                                                 <div id="labelBooking_key" class="card shadow mb-4">
                                                    <div class="card-header py-3">
                                                        <h6 class="m-0 font-weight-bold  text-danger">ข้อมูลการจองคีย์เพิ่ม</h6>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form-group row ">
                                                            <div id="divBookingKey" class="row col-12 setting-row" >
                                                                 
                                                             

                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font">โฉนดเลขที่</div>
                                                                    <input type="text" id="pro_deed_id"   class="setting-form"  />
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font">เลขที่ดินโครงการ</div>
                                                                    <input type="text" id="pro_land_number" placeholder="" class="setting-form"   />
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font">หน้าสำรวจ</div>
                                                                    <input type="text" id="pro_survey_page" placeholder="" class="setting-form"   />
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font"> แบ่งแยกออกเป็นโฉนดเลขที่ </div>
                                                                    <input type="text" id="new_deed_id"  class="setting-form"  />
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="inputText setting-font">เลขที่ดินแปลง </div>
                                                                    <input type="text" id="new_land_number"   class="setting-form"  />
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






        </div>
        <!-- Begin Page Content -->
        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>

<script>
    let arr_localPrint = []
    const d = new Date();
    let yearNow = d.getFullYear();
    
    const user_id = JSON.parse(userLocal)[0].user_id;
    const user_role_id = JSON.parse(userLocal)[0].user_role_id;
    const sale_id = JSON.parse(userLocal)[0].sale_id; 
     
    console.log('user_id', user_id, ' ', user_role_id);
    console.log('sale_id', sale_id );
      
    $(document).ready(function () {
        //checkLogin(3);
        $('#FormModal_Project').modal({ backdrop: 'static', keyboard: false })
        $('#footer_callme').addClass('d-none');         
            
        if (user_role_id == 3) {
            let jsonPlanTableSale = JSON.stringify({
                "sale_id": sale_id
            });
            $.get("../../api/projectList", { jsonData: jsonPlanTableSale, types: "listBookingSale" })
                .done(function (data) {
                    let listBookingSale = JSON.parse(data);

                    console.log('listBookingSale', listBookingSale)
                    /// สร้างตาราง 
                    createProjectPlanDataTable(listBookingSale, 3);
                });


        } else if (user_role_id == 2) {       

            let jsonPlanTableCustomer = JSON.stringify({
                "user_id": user_id
            });
            $.get("../../api/projectList", { jsonData: jsonPlanTableCustomer, types: "listBookingCustomer" })
                .done(function (data) {
                    let listBookingCustomer = JSON.parse(data);

                    console.log('listBookingCustomer', listBookingCustomer)
                    /// สร้างตาราง 
                    createProjectPlanDataTable(listBookingCustomer, 2 );
                });
             
        }
          
    });

      
    function onBtnDeleteClick(e) {
         
        let book_id = e.value;
        Swal.fire({ //alert confirm 
            title: 'ยืนยันการลบใบสั่งจอง',
            type: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ตกลง',
            cancelButtonText: 'ยกเลิก',
        })
            .then((val) => {
                if (val.value) {

                    let jsonData = JSON.stringify({
                        "book_id": book_id, 
                    });

                    //เรียก api
                    $.ajax({
                        type: 'POST',
                        url: "../../api/projectList",
                        data: { "data": jsonData },
                        headers: {
                            "types": "updateCancelBooking"
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
    function onBtnApproveClick(e) {

        let book_id = e.value;  
        Swal.fire({ //alert confirm 
            title: 'ยืนยันการดำเนินการ',
            type: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ตกลง',
            cancelButtonText: 'ยกเลิก',
        })
            .then((val) => {
                if (val.value) {

                    let jsonData = JSON.stringify({
                        "book_id": book_id,
                    
                    }); 
 
                    //เรียก api
                    $.ajax({
                        type: 'POST',
                        url: "../../api/projectList",
                        data: { "data": jsonData },
                        headers: {
                            "types": "updateApproveBooking"
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

    function onBtnPrintClick(e) {
     
        HideTopbar(1);
        ClearModal("#FormModal_Project");
 
        $("#FormModal_Project").modal("show");
        LockModal("#FormModal_Project"); 


        let book_id = e.value;     
        let book_status = $(e).data("value") 

        let jsonPrint = JSON.stringify({
            "book_id": book_id
        });

        $.get("../../api/projectList", { jsonData: jsonPrint, types: "getBookingPrint" })
            .done(function (data) {
                let getBookingPrint = JSON.parse(data);

                console.log('getBookingPrint', getBookingPrint)

                $('#book_id').val(book_id);
                $('#pro_name').val(getBookingPrint[0].pro_name);
                $('#book_fullName').val(getBookingPrint[0].book_fullName);

                arr_localPrint = getBookingPrint;

              


            });





        //window.location.href = "../project/purchase-order-report_booking?id" + e.value;

         
    }

    function btnSaveData() {

        arr_localPrint[0].pro_deed_id = $('#pro_deed_id').val();
        arr_localPrint[0].pro_land_number = $('#pro_land_number').val();
        arr_localPrint[0].pro_survey_page = $('#pro_survey_page').val();
        arr_localPrint[0].new_deed_id = $('#new_deed_id').val();
        arr_localPrint[0].new_land_number = $('#new_land_number').val();
         
        localStorage['arr_localPrint'] = JSON.stringify(arr_localPrint);
         
        console.log('arr_localPrint', arr_localPrint)
         
        window.open("../project/purchase-order-report_booking.aspx")


    }



    //สร้างตาราง
    function createProjectPlanDataTable(data, type) { 

        let role = type;

        $("#order_list").dataTable({
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
                        let chk = ``;
                        let book_status = row.book_status;

                        if (role == 2) {

                            chk = ``;

                        } else {

                            if (book_status == 'C') {

                                chk = `
                                  <td>                                 
                                         
                                        <button type='button' class='btnPrint btn-primary btn-sm d-none' id="btnPrint${meta.row}"  value="${row.book_id}" data-value="${row.book_status}" title='พิมพ์ใบสั่งจอง'  onclick="onBtnPrintClick(this )"   ><i class='fas fa-print' style="color:white" ></i>  </button>
                                        <button type='button' class='btnApprove btn-success btn-sm d-none mx-1' id="btnApprove${meta.row}"  value="${row.book_id}" title='ดำเนินการเสร็จ'  onclick="onBtnApproveClick(this )"   ><i class="fa fa-check" aria-hidden="true" style="color:white;"></i>  </button> 
                                        <button type='button' class='btnDelete btn-danger btn-sm d-none ' id="btnDelete${meta.row}"  value="${row.book_id}" title='ยกเลิกการสั่งจอง'  onclick="onBtnDeleteClick(this )"   ><i class='fas fa-trash  ' style="color:white" ></i>  </button>      
          
                                  </td> 
                                  `;

                            } else if (book_status == 'A') {


                                chk = `
                                  <td>                                 
                                         
                                        <button type='button' class='btnPrint btn-primary btn-sm d-none' id="btnPrint${meta.row}"  value="${row.book_id}" data-value="${row.book_status}" title='พิมพ์ใบสั่งจอง'  onclick="onBtnPrintClick(this )"   ><i class='fas fa-print' style="color:white" ></i>  </button>
                                        <button type='button' class='btnApprove btn-success btn-sm d-none mx-1' id="btnApprove${meta.row}"  value="${row.book_id}" title='ดำเนินการเสร็จ'  onclick="onBtnApproveClick(this )"   ><i class="fa fa-check" aria-hidden="true" style="color:white;"></i>  </button> 
                                        <button type='button' class='btnDelete btn-danger btn-sm d-none ' id="btnDelete${meta.row}"  value="${row.book_id}" title='ยกเลิกการสั่งจอง'  onclick="onBtnDeleteClick(this )"   ><i class='fas fa-trash  ' style="color:white" ></i>  </button>      
          
                                  </td> 
                                  `;


                            } else {

                                chk = `
                                  <td>                                 
                                         
                                        <button type='button' class='btnPrint btn-primary btn-sm ' id="btnPrint${meta.row}"  value="${row.book_id}" data-value="${row.book_status}" title='พิมพ์ใบสั่งจอง'  onclick="onBtnPrintClick(this )"   ><i class='fas fa-print' style="color:white" ></i>  </button>
                                        <button type='button' class='btnApprove btn-success btn-sm  mx-1' id="btnApprove${meta.row}"  value="${row.book_id}" title='ดำเนินการเสร็จ'  onclick="onBtnApproveClick(this )"   ><i class="fa fa-check" aria-hidden="true" style="color:white;"></i>  </button> 
                                        <button type='button' class='btnDelete btn-danger btn-sm ' id="btnDelete${meta.row}"  value="${row.book_id}" title='ยกเลิกการสั่งจอง'  onclick="onBtnDeleteClick(this )"   ><i class='fas fa-trash  ' style="color:white" ></i>  </button>      
          
                                  </td> 
                                  `;
                                 

                            }
                            


                        }
                        return "" + chk + "";
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.book_id
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.create_date
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.book_fullName
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

                        return row.pro_name
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

                        return row.pro_type_name
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

                        return row.sale_fullName
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        return row.sale_phone
                    },
                    className: "text-center"
                },
                {
                    render: function (data, type, row, meta) {

                        let status = "";

                        if (row.book_status == 'C') {


                            status = `<span class="badge badge-danger" style="background-color:red"> ยกเลิก </span>`;
                        } else if (row.book_status == 'A'){


                            status = `<span class="badge badge-primary" style="background-color:#6c757d"  > ดำเนินการแล้ว </span>`; 

                        }
                        else {


                            status = `<span class="badge badge-success" style="background-color:#198754"> ปกติ </span>`;

                        }

                        return status
                    },
                    className: "text-center"
                },
             


            ],
            pageLength: 10
        });


    }



    $(".btn-Refresh").click(function () {
        location.reload();
    });

    $('.close').click(() => {
        HideTopbar(0);
        $('#FormModal_Project').modal('hide');
    });
</script>
</html>
