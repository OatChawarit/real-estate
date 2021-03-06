<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="find-project.aspx.cs" Inherits="real_estate.pages.project.find_project" %>

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


        <!-- ค้นหา -->
        <div class="ltn__car-dealer-form-area section-bg-1 pb-60">
            <br />
            <div class="container mt-30">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__car-dealer-form-tab">
                            <div class="ltn__tab-menu  text-uppercase d-none">
                                <div class="nav">
                                    <a class="active show" data-bs-toggle="tab" href="#ltn__form_tab_1_1"><i class="fas fa-car"></i>Find A Car</a>
                                    <a data-bs-toggle="tab" href="#ltn__form_tab_1_2" class=""><i class="far fa-user"></i>Get a Dealer</a>
                                </div>
                            </div>


                            <div class="tab-content bg-white box-shadow-1 position-relative pb-10">

                                <!-- ค้นหาเมื่อเข้าหน้าเว็บ -->
                                <div class="tab-pane fade active show" id="ltn__form_tab_1_1">
                                    <div class="car-dealer-form-inner">

                                        <div class="ltn__car-dealer-form-box row ">
                                            <div class="col-lg-3 col-md-6">
                                                <select id="drdwProvince">
                                                    <option value="">เลือกจังหวัด</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProvince();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="drdwProjectLocation" class="w-100">
                                                    <option value="">เลือกโซน/ทำเล/ปริมณฑล</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProjectLocation();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="projectType" class="w-100">
                                                    <option value="">เลือกประเภทโครงการ</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProjectType();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                            </div>
                                        </div>

                                        <div class="ltn__car-dealer-form-box row ">
                                            <div class="col-lg-3 col-md-6">
                                                <select id="proStatusType" class="w-100">
                                                    <option value="">สถานะประเภทโครงการ</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProjectStatusType();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="rangeMoneyForm" class="w-100">
                                                    <option value="">เลือกราคาขั้นต่ำ</option>
                                                    <option value="0">0.00</option>
                                                    <option value="500000">500,000.00</option>
                                                    <option value="1000000">1,000,000.00</option>
                                                    <option value="2500000">2,500,000.00</option>
                                                    <option value="5000000">5,000,000.00</option>
                                                    <option value="10000000">10,000,000.00</option>
                                                    <option value="20000000">20,000,000.00</option>
                                                    <option value="30000000">30,000,000.00</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="rangeMoneyTo" class="w-100">
                                                    <option value="">เลือกราคาสูงสุด</option>
                                                    <option value="500000">500,000.00</option>
                                                    <option value="1000000">1,000,000.00</option>
                                                    <option value="2500000">2,500,000.00</option>
                                                    <option value="5000000">5,000,000.00</option>
                                                    <option value="10000000">10,000,000.00</option>
                                                    <option value="20000000">20,000,000.00</option>
                                                    <option value="30000000">30,000,000.00</option>
                                                    <option value="> 30000000">มากกว่า 30,000,000.00</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon ltn__icon-calendar  col-lg-3 col-md-6">
                                                <div class="btn-wrapper text-center mt-0">
                                                    <!-- <button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase">Search Inventory</button> -->
                                                    <a href="javascript:void(0)" class="btn theme-btn-1 btn-effect-1 text-uppercase" onclick="loadProject()">ค้นหา</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- ค้นหาเมื่อเข้าหน้าเว็บ -->

                                <!-- ค้นหาเมื่อเข้าหน้ามือถือ -->
                                <div class="tab-pane fade" id="ltn__form_tab_1_2">
                                    <div class="car-dealer-form-inner">

                                        <div class="ltn__car-dealer-form-box row ">
                                            <div class="col-lg-3 col-md-6">
                                                <select id="drdwProvinceMob">
                                                    <option value="">เลือกจังหวัด</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProvince();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="drdwProjectLocationMob" class="w-100">
                                                    <option value="">เลือกโซน/ทำเล/ปริมณฑล</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProjectLocation();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="projectTypeMob" class="w-100">
                                                    <option value="">เลือกประเภทโครงการ</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProjectType();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                            </div>
                                        </div>

                                        <div class="ltn__car-dealer-form-box row ">
                                            <div class="col-lg-3 col-md-6">
                                                <select id="proStatusTypeMob" class="w-100">
                                                    <option value="">สถานะประเภทโครงการ</option>
                                                    <%
                                                        real_estate.ClassData.DropDownData.drdwProjectStatusType();
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="rangeMoneyFormMob" class="w-100">
                                                    <option value="">เลือกราคาขั้นต่ำ</option>
                                                    <option value="0">0.00</option>
                                                    <option value="500000">500,000.00</option>
                                                    <option value="1000000">1,000,000.00</option>
                                                    <option value="2500000">2,500,000.00</option>
                                                    <option value="5000000">5,000,000.00</option>
                                                    <option value="10000000">10,000,000.00</option>
                                                    <option value="20000000">20,000,000.00</option>
                                                    <option value="30000000">30,000,000.00</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <select id="rangeMoneyToMob" class="w-100">
                                                    <option value="">เลือกราคาสูงสุด</option>
                                                    <option value="500000">500,000.00</option>
                                                    <option value="1000000">1,000,000.00</option>
                                                    <option value="2500000">2,500,000.00</option>
                                                    <option value="5000000">5,000,000.00</option>
                                                    <option value="10000000">10,000,000.00</option>
                                                    <option value="20000000">20,000,000.00</option>
                                                    <option value="30000000">30,000,000.00</option>
                                                    <option value="> 30000000">มากกว่า 30,000,000.00</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon ltn__icon-calendar  col-lg-3 col-md-6">
                                                <div class="btn-wrapper text-center mt-0">
                                                    <!-- <button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase">Search Inventory</button> -->
                                                    <a href="javascript:void(0)" class="btn theme-btn-1 btn-effect-1 text-uppercase" onclick="loadProjectMob()">ค้นหา</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- ค้นหาเมื่อเข้าหน้ามือถือ -->

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ค้นหา -->
        <br />
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
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const provinecid = urlParams.get('provinecid');
        const locationid = urlParams.get('locationid');
        const typeid = urlParams.get('typeid');
        const statustypeid = urlParams.get('statustypeid');
        const pricelow = urlParams.get('pricelow');
        const pricehight = urlParams.get('pricehight');

        console.log(queryString);

        if (queryString == "" || queryString == undefined) {
            console.log("Null Url");
        } else {
            var urljson = JSON.stringify({
                pro_province_id: provinecid,
                pro_location_id: locationid,
                pro_type_id: typeid,
                pro_statusType_id: statustypeid,
                price_low: pricelow,
                price_hight: pricehight,
            });
            console.log(urljson);
            loadUrlProject(urljson);
        }

    });

    function loadProject() {
        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });

        var jsonData = JSON.stringify({
            pro_province_id: $("#drdwProvince").val(),
            pro_location_id: $("#drdwProjectLocation").val(),
            pro_type_id: $("#projectType").val(),
            pro_statusType_id: $("#proStatusType").val(),
            price_low: $("#rangeMoneyForm").val(),
            price_hight: $("#rangeMoneyTo").val(),
        });

        var htmlgrid = "";
        var htmllist = "";


        $.get("../../api/findProject", { jsonData: jsonData, types: "findProject" })
            .done(function (data) {
                let listProject = JSON.parse(data);
                if (listProject == "" || listProject == null) {
                    Swal.fire(
                        "Warning", //title
                        "ไม่พบข้อมูลที่ทำการค้นหา !", //main text
                        "warning" //icon
                    );
                } else {

                    $("#product_grid").empty();
                    $("#product_list").empty();

                    listProject.forEach((item, i) => {
                        htmlgrid += '<div class="col-lg-4 col-sm-6 col-12">';
                        htmlgrid += '<div class="ltn__product-item ltn__product-item-4">';
                        htmlgrid += '<div class="product-img"><a href="project-details.aspx?id=' + item.plan_type_id + '">';
                        htmlgrid += '<img src="../../image/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
                        if (item.pro_statusType_id == "1") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "2") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-green">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "3") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-blue">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-red">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        htmlgrid += '<div class="product-img-location-gallery"><div class=""><ul><li><h5 style="color:#fff;"><i class="fas fa-eye"></i> ' + item.plan_view + '</h5></li></ul></div></div></div>';
                        htmlgrid += '<div class="product-info">';
                        htmlgrid += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div>';
                        htmlgrid += '<h2 class="product-title"><a href="project-details.aspx?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2>';
                        htmlgrid += '<div class="product-img-location"><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></div>';
                        htmlgrid += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
                        htmlgrid += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
                        htmlgrid += '<li><span>' + item.plan_bed_room + ' ห้องนอน <i class="flaticon-bed"></i></span></li>';
                        htmlgrid += '<li><span>' + item.plan_bath_room + ' ห้องน้ำ <i class="flaticon-clean"></i></span></li>';
                        htmlgrid += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li>';
                        htmlgrid += '</ul></div>';
                        htmlgrid += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
                        htmlgrid += '<h6>' + item.sale_fullName + '</h6><small>' + item.sale_company + '</small></div></div>';
                        htmlgrid += '<div class="product-hover-action">';
                        htmlgrid += '<ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย"><i class="fas fa-phone">&nbsp;โทร</i></a></li></ul>';
                        htmlgrid += '</div></div></div></div>';

                        htmllist += '<div class="col-lg-12"><div class="ltn__product-item ltn__product-item-4 ltn__product-item-5">';
                        htmllist += '<div class="product-img"><a href="project-details.aspx?id=' + item.plan_type_id + '"><img src="../../image/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
                        htmllist += '<div class="product-img-location-gallery"><div class=""><ul><li><h5 style="color:#fff;"><i class="fas fa-eye"></i> ' + item.plan_view + '</h5></li></ul></div></div></div>';
                        htmllist += '<div class="product-info"><div class="product-badge-price"><div class="product-badge">';
                        if (item.pro_statusType_id == "1") {
                            htmllist += '<ul><li class="sale-badge bg-orange" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "2") {
                            htmllist += '<ul><li class="sale-badge bg-green" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "3") {
                            htmllist += '<ul><li class="sale-badge bg-blue" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else {
                            htmllist += '<ul><li class="sale-badge bg-red" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        htmllist += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div></div>';
                        htmllist += '<h2 class="product-title"><a href="project-details?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2><div class="product-img-location">';
                        htmllist += '<ul><li><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></li></ul></div>';
                        htmllist += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
                        htmllist += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
                        htmllist += '<li><span>' + item.plan_bed_room + ' <i class="flaticon-bed"></i></span> ห้องนอน</li>';
                        htmllist += '<li><span>' + item.plan_bath_room + ' <i class="flaticon-clean"></i></span> ห้องน้ำ</li>';
                        htmllist += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li></ul></div>';
                        htmllist += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
                        htmllist += '<h6>' + item.sale_fullName + '</h6><small>' + item.sale_company + '</small></div></div>';
                        htmllist += '<div class="product-hover-action"><ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย">';
                        htmllist += '<i class="fas fa-phone">&nbsp;โทร</i></a></li></ul></div></div></div></div>';

                    });
                    $('#product_grid').append(htmlgrid);
                    $('#product_list').append(htmllist);
                    loadCSS();

                    Swal.close();
                }
            });

    }


    function loadProjectMob() {
        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });

        var jsonData = JSON.stringify({
            pro_province_id: $("#drdwProvinceMob").val(),
            pro_location_id: $("#drdwProjectLocationMob").val(),
            pro_type_id: $("#projectTypeMob").val(),
            pro_statusType_id: $("#proStatusTypeMob").val(),
            price_low: $("#rangeMoneyFormMob").val(),
            price_hight: $("#rangeMoneyToMob").val(),
        });

        var htmlgrid = "";
        var htmllist = "";


        $.get("../../api/findProject", { jsonData: jsonData, types: "findProject" })
            .done(function (data) {
                let listProject = JSON.parse(data);
                if (listProject == "" || listProject == null) {
                    Swal.fire(
                        "Warning", //title
                        "ไม่พบข้อมูลที่ทำการค้นหา !", //main text
                        "warning" //icon
                    );
                } else {

                    $("#product_grid").empty();
                    $("#product_list").empty();

                    listProject.forEach((item, i) => {
                        htmlgrid += '<div class="col-lg-4 col-sm-6 col-12">';
                        htmlgrid += '<div class="ltn__product-item ltn__product-item-4">';
                        htmlgrid += '<div class="product-img"><a href="project-details.aspx?id=' + item.plan_type_id + '">';
                        htmlgrid += '<img src="../../image/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
                        if (item.pro_statusType_id == "1") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "2") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-green">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "3") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-blue">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-red">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        htmlgrid += '<div class="product-img-location-gallery"><div class=""><ul><li><h5 style="color:#fff;"><i class="fas fa-eye"></i> ' + item.plan_view + '</h5></li></ul></div></div></div>';
                        htmlgrid += '<div class="product-info">';
                        htmlgrid += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div>';
                        htmlgrid += '<h2 class="product-title"><a href="project-details.aspx?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2>';
                        htmlgrid += '<div class="product-img-location"><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></div>';
                        htmlgrid += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
                        htmlgrid += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
                        htmlgrid += '<li><span>' + item.plan_bed_room + ' ห้องนอน <i class="flaticon-bed"></i></span></li>';
                        htmlgrid += '<li><span>' + item.plan_bath_room + ' ห้องน้ำ <i class="flaticon-clean"></i></span></li>';
                        htmlgrid += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li>';
                        htmlgrid += '</ul></div>';
                        htmlgrid += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
                        htmlgrid += '<h6>' + item.sale_fullName + '</h6><small>' + item.sale_company + '</small></div></div>';
                        htmlgrid += '<div class="product-hover-action">';
                        htmlgrid += '<ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย"><i class="fas fa-phone">&nbsp;โทร</i></a></li></ul>';
                        htmlgrid += '</div></div></div></div>';

                        htmllist += '<div class="col-lg-12"><div class="ltn__product-item ltn__product-item-4 ltn__product-item-5">';
                        htmllist += '<div class="product-img"><a href="project-details.aspx?id=' + item.plan_type_id + '"><img src="../../image/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
                        htmllist += '<div class="product-img-location-gallery"><div class=""><ul><li><h5 style="color:#fff;"><i class="fas fa-eye"></i> ' + item.plan_view + '</h5></li></ul></div></div></div>';
                        htmllist += '<div class="product-info"><div class="product-badge-price"><div class="product-badge">';
                        if (item.pro_statusType_id == "1") {
                            htmllist += '<ul><li class="sale-badge bg-orange" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "2") {
                            htmllist += '<ul><li class="sale-badge bg-green" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "3") {
                            htmllist += '<ul><li class="sale-badge bg-blue" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else {
                            htmllist += '<ul><li class="sale-badge bg-red" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        htmllist += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div></div>';
                        htmllist += '<h2 class="product-title"><a href="project-details?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2><div class="product-img-location">';
                        htmllist += '<ul><li><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></li></ul></div>';
                        htmllist += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
                        htmllist += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
                        htmllist += '<li><span>' + item.plan_bed_room + ' <i class="flaticon-bed"></i></span> ห้องนอน</li>';
                        htmllist += '<li><span>' + item.plan_bath_room + ' <i class="flaticon-clean"></i></span> ห้องน้ำ</li>';
                        htmllist += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li></ul></div>';
                        htmllist += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
                        htmllist += '<h6>' + item.sale_fullName + '</h6><small>' + item.sale_company + '</small></div></div>';
                        htmllist += '<div class="product-hover-action"><ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย">';
                        htmllist += '<i class="fas fa-phone">&nbsp;โทร</i></a></li></ul></div></div></div></div>';

                    });
                    $('#product_grid').append(htmlgrid);
                    $('#product_list').append(htmllist);
                    loadCSS();

                    Swal.close();
                }
            });

    }



    function loadUrlProject(jsonPost) {
        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });

        var htmlgrid = "";
        var htmllist = "";


        $.get("../../api/findProject", { jsonData: jsonPost, types: "findProject" })
            .done(function (data) {
                let listProject = JSON.parse(data);
                if (listProject == "" || listProject == null) {
                    Swal.fire(
                        "Warning", //title
                        "ไม่พบข้อมูลที่ทำการค้นหา !", //main text
                        "warning" //icon
                    );
                } else {

                    $("#product_grid").empty();
                    $("#product_list").empty();

                    listProject.forEach((item, i) => {
                        htmlgrid += '<div class="col-lg-4 col-sm-6 col-12">';
                        htmlgrid += '<div class="ltn__product-item ltn__product-item-4">';
                        htmlgrid += '<div class="product-img"><a href="project-details.aspx?id=' + item.plan_type_id + '">';
                        htmlgrid += '<img src="../../image/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
                        if (item.pro_statusType_id == "1") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "2") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-green">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "3") {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-blue">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else {
                            htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-red">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        htmlgrid += '<div class="product-img-location-gallery"><div class=""><ul><li><h5 style="color:#fff;"><i class="fas fa-eye"></i> ' + item.plan_view + '</h5></li></ul></div></div></div>';
                        htmlgrid += '<div class="product-info">';
                        htmlgrid += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div>';
                        htmlgrid += '<h2 class="product-title"><a href="project-details.aspx?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2>';
                        htmlgrid += '<div class="product-img-location"><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></div>';
                        htmlgrid += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
                        htmlgrid += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
                        htmlgrid += '<li><span>' + item.plan_bed_room + ' ห้องนอน <i class="flaticon-bed"></i></span></li>';
                        htmlgrid += '<li><span>' + item.plan_bath_room + ' ห้องน้ำ <i class="flaticon-clean"></i></span></li>';
                        htmlgrid += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li>';
                        htmlgrid += '</ul></div>';
                        htmlgrid += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
                        htmlgrid += '<h6>' + item.sale_fullName + '</h6><small>' + item.sale_company + '</small></div></div>';
                        htmlgrid += '<div class="product-hover-action">';
                        htmlgrid += '<ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย"><i class="fas fa-phone">&nbsp;โทร</i></a></li></ul>';
                        htmlgrid += '</div></div></div></div>';

                        htmllist += '<div class="col-lg-12"><div class="ltn__product-item ltn__product-item-4 ltn__product-item-5">';
                        htmllist += '<div class="product-img"><a href="project-details.aspx?id=' + item.plan_type_id + '"><img src="../../image/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
                        htmllist += '<div class="product-img-location-gallery"><div class=""><ul><li><h5 style="color:#fff;"><i class="fas fa-eye"></i> ' + item.plan_view + '</h5></li></ul></div></div></div>';
                        htmllist += '<div class="product-info"><div class="product-badge-price"><div class="product-badge">';
                        if (item.pro_statusType_id == "1") {
                            htmllist += '<ul><li class="sale-badge bg-orange" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "2") {
                            htmllist += '<ul><li class="sale-badge bg-green" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else if (item.pro_statusType_id == "3") {
                            htmllist += '<ul><li class="sale-badge bg-blue" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        else {
                            htmllist += '<ul><li class="sale-badge bg-red" style="padding: 5px 5px 2px 5px;">' + item.pro_statusType_name + '</li></ul></div>';
                        }
                        htmllist += '<div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div></div>';
                        htmllist += '<h2 class="product-title"><a href="project-details?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2><div class="product-img-location">';
                        htmllist += '<ul><li><a href="javascript:void(0)"><i class="flaticon-pin"></i>' + item.pro_location_name + '</a></li></ul></div>';
                        htmllist += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
                        htmllist += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
                        htmllist += '<li><span>' + item.plan_bed_room + ' <i class="flaticon-bed"></i></span> ห้องนอน</li>';
                        htmllist += '<li><span>' + item.plan_bath_room + ' <i class="flaticon-clean"></i></span> ห้องน้ำ</li>';
                        htmllist += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li></ul></div>';
                        htmllist += '<div class="product-info-bottom"><div class="real-estate-agent"><div class="agent-brief">';
                        htmllist += '<h6>' + item.sale_fullName + '</h6><small>' + item.sale_company + '</small></div></div>';
                        htmllist += '<div class="product-hover-action"><ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย">';
                        htmllist += '<i class="fas fa-phone">&nbsp;โทร</i></a></li></ul></div></div></div></div>';

                    });
                    $('#product_grid').append(htmlgrid);
                    $('#product_list').append(htmllist);
                    loadCSS();

                    Swal.close();
                }
            });

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
