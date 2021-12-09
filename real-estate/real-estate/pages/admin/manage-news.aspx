<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage-news.aspx.cs" Inherits="real_estate.pages.admin.manage_news" %>

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
        <!-- #include virtual ="../include/topbar-admin.html" -->

        <!-- เนื้อหา -->
        <!-- Begin Page Content -->
        <div class="container-xl " style="font-size: 13px;">
            <!-- Page Heading -->
            <div class="row d-sm-flex align-items-center justify-content-between mb-2 my-4">
                <div>
                    <h1 class="h3 mb-2 text-gray-800 d-sm-inline-block">จัดการข่าวสาร</h1>
                </div>
                <div class="text-end">
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick()"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-success shadow-sm btn-Refresh btn-setting"><i class="fas fa-redo fa-sm text-white-50"></i>&nbsp;Refresh</a>
                </div>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row col-12">
                        <h5 class="m-0 font-weight-bold text-primary mr-5">ข้อมูลข่าวสาร</h5>
                    </div>

                </div>
                <div class="card-body">
                    <div class="form-group row">

                        <div class="table-responsive" style="padding-bottom: 30px">
                            <%--<table class="table table-bordered dataTable js-exportable" id="orderTable" width="100%" cellspacing="0">--%>
                            <table class="table table-striped" id="news-table" width="100%" cellspacing="0">
                                <thead class="table-dark" align="center">
                                    <tr id="trNews">
                                        <th style="width: 60px; min-width: 60px; max-width: 60px; vertical-align: middle;">#</th>
                                        <th>ภาพข่าว</th>
                                        <th>รหัสข่าว</th>
                                        <th>หัวข้อเรื่อง</th>
                                        <th>วันที่สร้าง</th>
                                        <th>ผู้สร้าง</th>
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

            <div class="modal fade " id="addNewsModal" tabindex="-1" role="dialog" aria-labelledby="addNewsModal" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header setting-modal">
                            <h5 class="modal-title topic-text" id="topic_Modal">แก้ไขข้อมูลผู้ใช้งาน</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <div class="modal-body">

                            <ul class="nav nav-tabs d-none" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"></a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                    <div id="labelNews" class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">รายละเอียดข่าวสาร</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group row ">

                                                <div id="divProjectInfo" class="row col-12 setting-row">
                                                    <div class="row mx-auto">
                                                        <div class="col-lg-12">
                                                            <div class="inputText setting-font">หัวข้อข่าวสาร *</div>
                                                            <input type="text" id="news_topic" placeholder="" class="setting-form" value="" readonly="true" />
                                                        </div>
                                                    </div>
                                                    <div class="row mx-auto">
                                                        <div class="col-lg-12">
                                                            <div class="inputText setting-font">เนื้อหาของข่าว *</div>
                                                            <textarea class="form-control" id="news_content" rows="5"></textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="labelimg" class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold  " style="color: #dc3545">รูปภาพข่าวสาร *</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row mx-auto">
                                            <input type="file" id="news_image" class="my-3 setting-form theme-btn-3 btn-setting w-80" accept="image/*" onchange="upload_image_profile(event)" />
                                            <div id="display_image">
                                                <img id='output'>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!-- close nav tabs -->
                        </div>

                        <!-- close modal body -->
                        <div class="modal-footer">
                            <button id="btnSave" type="button" class="btn-setting btn btn-primary btnSave" onclick="onSaveNews(this.value)" value="Add"><i class="far fa-save"></i>&nbsp;Save</button>
                            <button type="button" class="btn-setting btn-secondary close" data-dismiss="modal"><i class="fas fa-times"></i>&nbsp;Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Begin Page Content -->
        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent-admin.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>
    let Sdata;

    $(document).ready(function () {
        checkLogin(1);
        loadNews();

        $('#news-table').DataTable({
            "destroy": true,
            "responsive": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            pageLength: 10,

            "order": [[2, "asc"]]
        });
    });

    $(document).on("click", ".btnAdd", function () {
        $("#addNewsModal").modal("show");
        LockModal("#addNewsModal");
        clearpic(0);


    });

    $(document).on("click", ".btnCanCel", function () {
        var uid = $(this).data('value');
        //console.log(uid);
        //HideTopbar(1);
        var jsonData = JSON.stringify({
            user_id: uid,
        });
        Swal.fire({
            title: 'คุณต้องยกเลิกข่าวสาร!',
            html: '<p>ข่าวสารเลขที่ : ' + uid + ' ใช่หรือไม่ ? </p>',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ตกลง',
            cancelButtonText: 'ยกเลิก',
        }).then((result) => {
            if (result.value) {
                $.get("../../api/userData", { jsonData: jsonData, types: "AdminCancelProject", username: userData[0].user_id })
                    .done(function (data) {
                        Sdata = data;
                        //console.log(Sdata);
                        if (Sdata == "success") {
                            Swal.fire(
                                "Success", //title
                                "ยกเลิกข้อมูล เรียบร้อย!", //main text
                                "success" //icon
                            );
                            loadUser();
                        } else {
                            Swal.fire(
                                "Found an Error", //title
                                "แก้ไข ไม่สำเร็จ!", //main text
                                "error" //icon
                            );
                        }
                    });
            }
        });
    });


    $(document).on("click", "#trNews", function () {
        loadNews();
    });

    function loadNews() {
        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });

        var jsonData = JSON.stringify({

        });

        let tb = $("#news-table").DataTable();
        $("#news-table").DataTable().clear().draw();

        $.get("../../api/news", { jsonData, types: "listNews" })
            .done(function (data) {
                Sdata = JSON.parse(data);
                //console.log(Sdata);
                if (Sdata.length > 0) {
                    Sdata.forEach((item, rows) => {
                        let Status = "";
                        //let Action = `<button type='button' class='btn-primary btn-sm btnEdit' id='btnEdit` + item.news_id + `' data-value='` + item.news_id + `' title='แก้ไข'><i class='fas fa-eye'></i></button>`;
                        tb.row.add([
                            `<div class="text-center">
                             <button type='button' class='btn-danger btn-sm btnCanCel' id='btnCanCel` + item.news_id + `' data-value='` + item.news_id + `' title='ยกเลิก'><i class='fas fa-trash-alt'></i></button></div>`,
                            `<div class="text-center"> <img src='../../../image/news/${item.news_image}' id="news_image" alt="Image" style='width:80px;height:60px' /></div>`,
                            `<div >${item.news_id}</div>`,
                            `<div >${item.news_topic}</div>`,
                            `<div class="text-center">${nowDateString(item.create_date)}</div >`,
                            `<div class="text-center">${item.create_by}</div>`,
                        ]).draw(false);

                        Swal.close();
                    });
                } else {
                    Swal.fire(
                        "Found an Error", //title
                        "ไม่พบข้อมูล", //main text
                        "error" //icon
                    );
                }

            });
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


    function clearpic(type) {
        if (type == 0) {
            $("#output").attr("src", "");
            $("#plan_image_profile").val('');

        } else {
            $("#output").attr("src", "");
            $("#plan_image_profile").val('');
        }
    }

    $('.close').click(() => {
        HideTopbar(0);
        $('#addNewsModal').modal('hide');
    });


    $(".btn-Refresh").click(function () {
        location.reload();
    });

</script>
</html>
