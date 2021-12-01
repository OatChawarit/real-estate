<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project-list.aspx.cs" Inherits="real_estate.pages.project.project_list" %>

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

        <!-- Project -->
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../vendor/img/bg/8.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">โครงการของเรา</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="../home/main.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>หน้าแรก</a></li>
                                    <li>โครงการอสังหาฯ</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Project -->

        <!-- เนื้อหา -->
        <div class="ltn__product-area ltn__product-gutter mb-100">
            <div class="container">
                <div class="row">

                    <div class="col-lg-12">
                        <div class="ltn__shop-options">
                            <ul>
                                <li>
                                    <div class="ltn__grid-list-tab-menu ">
                                        <div class="nav">
                                            <a class="active show" data-bs-toggle="tab" href="#liton_product_grid"><i class="fas fa-th-large"></i></a>
                                            <a data-bs-toggle="tab" href="#liton_product_list"><i class="fas fa-list"></i></a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="tab-content">

                            <div class="tab-pane fade active show" id="liton_product_grid">
                                <div class="ltn__product-tab-content-inner ltn__product-grid-view">
                                    <div class="row" id="product_grid">
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="liton_product_list">
                                <div class="ltn__product-tab-content-inner ltn__product-list-view">
                                    <div class="row" id="product_list">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <%--  <div class="ltn__pagination-area text-center">
                            <div class="ltn__pagination">
                                <ul>
                                    <li><a href="#"><i class="fas fa-angle-double-left"></i></a></li>
                                    <li><a href="#">1</a></li>
                                    <li class="active"><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">...</a></li>
                                    <li><a href="#">10</a></li>
                                    <li><a href="#"><i class="fas fa-angle-double-right"></i></a></li>
                                </ul>
                            </div>
                        </div>--%>
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

    $(document).ready(function () {

        var jsonData = JSON.stringify({

        });

        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });
        //เรียก api
        $.get("../../api/projectList", { jsonData: jsonData, types: "listProject" })
            .done(function (data) {
                let listProject = JSON.parse(data);
                console.log('listProject', listProject);
                loadProject(listProject);
            }); 
    });

    function loadProject(arrData) {
        var htmlgrid = "";
        var htmllist = "";

        arrData.forEach((item, i) => {
            htmlgrid += '<div class="col-lg-4 col-sm-6 col-12">';
            htmlgrid += '<div class="ltn__product-item ltn__product-item-4">';
            htmlgrid += '<div class="product-img"><a href="project-details.aspx?id='+ item.plan_type_id +'">';
            htmlgrid += '<img src="../../image/project/'+ item.plan_image_profile +'" alt="#" /></a>';
            if (item.pro_statusType_name == "โครงการพร้อมอยู่") {
                htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-green">' + item.pro_statusType_name + '</li></ul></div></div>';
            } else {
                htmlgrid += '<div class="product-badge"><ul><li class="sale-badge">' + item.pro_statusType_name + '</li></ul></div></div>';
            }
            htmlgrid += '<div class="product-info">';
            htmlgrid += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div>';
            htmlgrid += '<h2 class="product-title"><a href="project-details.aspx?id='+ item.plan_type_id +'">' + item.pro_name + '</a></h2>';
            htmlgrid += '<div class="product-img-location"><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></div>';
            htmlgrid += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
            htmlgrid += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
            htmlgrid += '<li><span>' + item.plan_bed_room + ' ห้องนอน <i class="flaticon-bed"></i></span></li>';
            htmlgrid += '<li><span>' + item.plan_bath_room + ' ห้องน้ำ <i class="flaticon-clean"></i></span></li>';
            htmlgrid += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li>';
            htmlgrid += '</ul></div>';
            htmlgrid += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
            htmlgrid += '<h6>' + item.sale_fullName + '</h6><small>ตัวแทนขาย</small></div></div>';
            htmlgrid += '<div class="product-hover-action">';
            htmlgrid += '<ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย"><i class="fas fa-phone">&nbsp;โทร</i></a></li></ul>';
            htmlgrid += '</div></div></div></div>';

            htmllist += '<div class="col-lg-12"><div class="ltn__product-item ltn__product-item-4 ltn__product-item-5">';
            htmllist += '<div class="product-img"><a href="project-details.aspx?id='+ item.plan_type_id +'"><img src="../../image/project/'+ item.plan_image_profile +'" alt="#" /></a></div>';
            htmllist += '<div class="product-info"><div class="product-badge-price"><div class="product-badge">';
            if (item.pro_statusType_name == "โครงการพร้อมอยู่") {
                htmllist += '<ul><li class="sale-badge bg-green" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
            } else {
                htmllist += '<ul><li class="sale-badge bg-orange" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
            }
            htmllist += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div></div>';
            htmllist += '<h2 class="product-title"><a href="project-details?id='+ item.plan_type_id +'">' + item.pro_name + '</a></h2><div class="product-img-location">';
            htmllist += '<ul><li><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></li></ul></div>';
            htmllist += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
            htmllist += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
            htmllist += '<li><span>' + item.plan_bed_room + ' <i class="flaticon-bed"></i></span> ห้องนอน</li>';
            htmllist += '<li><span>' + item.plan_bath_room + ' <i class="flaticon-clean"></i></span> ห้องน้ำ</li>';
            htmllist += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li></ul></div>';
            htmllist += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
            htmllist += '<h6>' + item.sale_fullName + '</h6><small>ตัวแทนขาย</small></div></div>';
            htmllist += '<div class="product-hover-action"><ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย">';
            htmllist += '<i class="fas fa-phone">&nbsp;โทร</i></a></li></ul></div></div></div></div>';

        });
        $('#product_grid').append(htmlgrid);
        $('#product_list').append(htmllist);
        loadCSS();

        Swal.close();
    }


    //โหลด css
    function loadCSS() {
        let csss = [
            { cssPath: "../../vendor/css/bootstrap.css" }, { cssPath: "../../vendor/css/style.css" }
        ];
        csss.forEach((item, i) => {
            var link = document.createElement('link');
            link.rel = "stylesheet";
            link.type = "text/css";
            link.href = item.cssPath;
            document.head.appendChild(link);
            //console.log(document.head.appendChild(link));
        });
    }
</script>
</html>
