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
                    <a href="javascript:void(0);" class="d-sm-inline-block  btn-sm btn-primary shadow-sm btnAdd btn-setting" data-value="" onclick="btnAddClick();"><i class="fas fa-plus fa-sm text-white-50 d-none"></i>&nbsp;Create</a>
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
                            <table class="table table-striped " id="news-table" width="100%" cellspacing="0">
                                <thead class="table-dark" align="center">
                                    <tr>
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

    $(document).on("click", ".btnEdit", function () {
        var uid = $(this).data('value');
        console.log(uid);
        $("#Edit-UserModal").modal("show");
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

        $.get("../../api/news", { jsonData, types: "listNews" })
            .done(function (data) {
                Sdata = JSON.parse(data);
                console.log(Sdata);
                if (Sdata.length > 0) {
                    Sdata.forEach((item, rows) => {
                        let Status = "";

                        tb.row.add([
                            `<div class="text-center"><button type='button' class='btn-primary btn-sm btnEdit' id='btnEdit` + item.news_id + `' data-value='` + item.news_id + `' title='แก้ไข'><i class='fas fa-eye'></i></button>
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

    $('.close').click(() => {
        HideTopbar(0);
        $('#Edit-UserModal').modal('hide');
    });


    $(".btn-Refresh").click(function () {
        location.reload();
    });

</script>
</html>
