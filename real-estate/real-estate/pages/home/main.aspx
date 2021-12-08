<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="main.aspx.cs" Inherits="real_estate.pages.home._default" %>

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

        <!-- สไลด์ -->
        <div class="ltn__slider-area ltn__slider-3  section-bg-1">
            <div class="ltn__slide-one-active slick-slide-arrow-1 slick-slide-dots-1">
                <!-- ltn__slide-item -->
                <div class="ltn__slide-item ltn__slide-item-2 ltn__slide-item-3-normal ltn__slide-item-3">

                    <div class="ltn__slide-item-inner">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 align-self-center">
                                    <div class="slide-item-info">
                                        <div class="slide-item-info-inner ltn__slide-animation">
                                            <div class="slide-video mb-50 d-none">
                                                <a class="ltn__video-icon-2 ltn__video-icon-2-border" href="#" data-rel="lightcase:myCollection">
                                                    <i class="fa fa-play"></i>
                                                </a>
                                            </div>
                                            <h6 class="slide-sub-title white-color--- animated"><span><i class="fas fa-home"></i></span>&nbsp;ผู้ช่วยเลือกซื้อ-ขาย</h6>
                                            <h1 class="slide-title animated ">ค้นหาบ้านในฝัน<br />
                                                ของคุณ</h1>
                                            <div class="slide-brief animated">
                                                <p>เราสามารถช่วยให้คุณตระหนักถึงความฝันของบ้านใหม่</p>
                                            </div>
                                            <!-- <div class="btn-wrapper animated">
                                                <a href="about.html" class="theme-btn-1 btn btn-effect-1">Make An Enquiry</a>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="slide-item-img">
                                        <img src="../../vendor/img/slider/21.png" alt="#" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ltn__slide-item -->
                <div class="ltn__slide-item ltn__slide-item-2  ltn__slide-item-3-normal ltn__slide-item-3">
                    <div class="ltn__slide-item-inner  text-right text-end">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 align-self-center">
                                    <div class="slide-item-info">
                                        <div class="slide-item-info-inner ltn__slide-animation">
                                            <h6 class="slide-sub-title white-color--- animated"><span><i class="fas fa-home"></i></span>&nbsp;ผู้ช่วยเลือกซื้อ-ขาย</h6>
                                            <h1 class="slide-title animated ">รวบรวมอสังหาริมทรัพย์<br />
                                                ที่เหมาะสมกับคุณ</h1>
                                            <div class="slide-brief animated">
                                                <p>ค้นหาบ้านที่เหมาะสมกับคุณได้ที่นี้</p>
                                            </div>
                                            <!-- <div class="btn-wrapper animated">
                                                <a href="service.html" class="theme-btn-1 btn btn-effect-1">OUR SERVICES</a>
                                                <a href="about.html" class="btn btn-transparent btn-effect-3">LEARN MORE</a>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="slide-item-img slide-img-left">
                                        <img src="../../vendor/img/slider/21.png" alt="#" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  -->
            </div>
        </div>
        <!-- สไลด์ -->
        <form runat="server" id="mains">
            <!-- ค้นหา -->
            <div class="ltn__car-dealer-form-area mt--65 mt-60 pb-60">
                <div class="container">
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
                                                    <select id="drdwDistrict" class="w-100">
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
                                                        <a href="shop-right-sidebar.html" class="btn theme-btn-1 btn-effect-1 text-uppercase">ค้นหา</a>
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
                                                    <select id="drdwDistrictMob" class="w-100">
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
                                                        <a href="shop-right-sidebar.html" class="btn theme-btn-1 btn-effect-1 text-uppercase">ค้นหา</a>
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

            <!-- พื้นหลังสีขาว  -->
            <!--<div class="ltn__about-us-area pt-120 pb-90 ">
        </div> -->

            <!-- พื้นหลังสีขาว โครงการ -->
            <div class="ltn__product-slider-area ltn__product-gutter pt-60 pb-60 plr--7">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title-area ltn__section-title-2--- text-center">
                                <h2 class="section-title">โครงการของเรา</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row ltn__product-slider-item-four-active-full-width slick-arrow-1" id="product_grid">

                        <%
                            var tb = new real_estate.ClassData.projectData();
                            Response.Write(tb.getListProductHome());
                        %>
                    </div>
                </div>
                <div class="text-center">
                    <h4><a class="section-subtitle section-subtitle-2 ltn__secondary-color" href="../project/project-list.aspx">ดูโครงการอสังหาฯทั้งหมด</a></h4>
                </div>
            </div>



            <!-- พื้นหลังสีเทา  -->
            <!-- <div class="ltn__counterup-area section-bg-1 pt-120 pb-70">
            
        </div>  -->

            <!-- พื้นหลังสีเทา  -->
            <div class="ltn__feature-area section-bg-1 pt-90 pb-90 mb-120---">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title-area ltn__section-title-2--- text-center">
                                <!-- <h6 class="section-subtitle section-subtitle-2 ltn__secondary-color">บริการของเรา</h6>  -->
                                <h2 class="section-title">บริการของเรา</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row ltn__custom-gutter--- justify-content-center">
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="ltn__feature-item ltn__feature-item-6 text-center bg-white  box-shadow-1">
                                <div class="ltn__feature-icon">
                                    <!-- <span><i class="flaticon-house"></i></span> -->
                                    <i class="flaticon-house"></i>
                                </div>
                                <div class="ltn__feature-info">
                                    <h3><a href="service-details.html">ซื้อบ้าน</a></h3>
                                    <p>มีบ้านขายมากมายบนเว็บไซต์ ที่เหมาะสมกับคุณ</p>
                                    <!-- <a class="ltn__service-btn" href="service-details.html">Find A Home <i class="flaticon-right-arrow"></i></a> -->
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="ltn__feature-item ltn__feature-item-6 text-center bg-white  box-shadow-1">
                                <div class="ltn__feature-icon">
                                    <!-- <span><i class="flaticon-deal-1"></i></span> -->
                                    <i class="flaticon-house-3"></i>
                                </div>
                                <div class="ltn__feature-info">
                                    <h3><a href="service-details.html">ลงขายบ้าน</a></h3>
                                    <p>ลงประกาศขายบ้าน ทาวน์โฮม คอนโดมีเนียมกับเรา</p>
                                    <!-- <a class="ltn__service-btn" href="service-details.html">Find A Home <i class="flaticon-right-arrow"></i></a> -->
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="ltn__feature-item ltn__feature-item-6 text-center bg-white  box-shadow-1 active">
                                <div class="ltn__feature-icon">
                                    <!-- <span><i class="flaticon-house-3"></i></span> -->
                                    <i class="flaticon-operator"></i>
                                </div>
                                <div class="ltn__feature-info">
                                    <h3><a href="service-details.html">ติดต่อสอบถาม</a></h3>
                                    <p>สามารถสอบถามผู้ขาย เพื่อความมั่นใจในการซื้อ-ขาย</p>
                                    <!-- <a class="ltn__service-btn" href="service-details.html">Find A Home <i class="flaticon-right-arrow"></i></a> -->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>

        <!-- News -->
        <div class="ltn__blog-area pt-115--- pb-70 pt-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area ltn__section-title-2--- text-center">
                            <h2 class="section-title">ข่าวสารน่ารู้</h2>
                        </div>
                    </div>
                </div>
                <div id="news_blog" class="row ltn__blog-slider-one-active slick-arrow-1 ltn__blog-item-3-normal">
                </div>
                <div class="text-center">
                    <h4><a class="section-subtitle section-subtitle-2 ltn__secondary-color" href="news.aspx">ดูข่าวสารทั้งหมด</a></h4>
                </div>
            </div>
        </div>
        <!-- News -->


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

        let resData;
        //เรียก api
        $.get("../../api/news", { jsonData: jsonData, types: "listNews" })
            .done(function (data) {
                resData = JSON.parse(data);
                let img_path = '../../../image/news/' + resData[1].news_image;

                $('#news_image1').attr('src', img_path);
                console.log(resData);
                loadNews(resData);
            });


        //$.get("../../api/projectList", { jsonData: jsonData, types: "listProject" })
        // .done(function (data) {
        //     let listProject = JSON.parse(data);
        //     console.log('listProject', listProject);
        //     loadProject(listProject);
        // }); 
        Swal.close();
    });

    function loadNews(arrData) {
        var html = "";
        arrData.forEach((item, i) => {
            html += '<div class="col-lg-4 ">';
            html += '<div class="ltn__blog-item ltn__blog-item-3">';
            html += '<div class="ltn__blog-img">';
            html += '<a href="news-detail.aspx?newsid=' + item.news_id + '">  <img src="../../../image/news/' + item.news_image + '" alt="' + item.news_image + '" /></a>';
            html += '</div>';
            html += '<div class="ltn__blog-brief">';
            html += '<div class="ltn__blog-meta">';
            html += '<ul><li class="ltn__blog-author"><a href="javascript:void(0)"><i class="far fa-user"></i>ผู้เขียน: ' + item.create_by + '</a></li></ul>';
            html += '</div>';
            html += '<h3 class="ltn__blog-title"><a href="news-detail.aspx?newsid=' + item.news_id + '">' + item.news_topic + '</a></h3>';
            html += '<div class="ltn__blog-meta-btn">';
            html += ' <div class="ltn__blog-meta"><ul><li class="ltn__blog-date"><i class="far fa-calendar-alt"></i>' + dateFormat(item.create_date) + '</li></ul>';
            html += '</div>';
            html += '<div class="ltn__blog-btn">';
            html += '<a href="news-detail.aspx?newsid=' + item.news_id + '">อ่านเพิ่มเติม</a>';
            html += '</div>';
            html += '</div></div></div></div>';
        });

        //console.log(html);
        $('#news_blog').append(html);
        loadCSS();

        /* setTimeout(function () {
            //loadCSS();
            //loadScript();
        }, 200); */
    }

    //drdw เขต/แขวง หน้าเว็บ
    //$("#drdwProvince").change(function () {
    //    $("#drdwDistrict").empty();
    //    $(".drdwDis").empty();
    //    $("#drdwDistrict").val("");


    //    let html1 = '<option value=""> เลือกทำเลที่ตั้งในจังหวัด</option>';
    //    let html2 = '<li data-value="" class="option focus"></li>';
    //    $.get("../../api/drdwData", { id: $(this).val(), types: "District" })
    //        .done(function (data) {
    //            Listdata = JSON.parse(data);
    //            //console.log(Listdata)
    //            Listdata.forEach((item, i) => {
    //                html1 += '<option value="' + item.district_id + '">' + item.district_name + '</option>';
    //                html2 += '<li data-value="' + item.district_id + '" class="option focus">' + item.district_name + '</li>';

    //            });
    //            $(".drdwDis").append(html2);
    //            $("#drdwDistrict").append(html1);
    //            $('.drdwDis').niceSelect('update');
    //        });
    //});

    //drdw เขต/แขวง หน้ามือถือ
    //$("#drdwProvinceMob").change(function () {
    //    $("#drdwDistrictMob").empty();
    //    $(".drdwDisMob").empty();
    //    $("#drdwDistrictMob").val("");

    //    let Listdata;
    //    let html1 = '<option value=""> เลือกทำเลที่ตั้งในจังหวัด</option>';
    //    let html2 = '<li data-value="" class="option focus"></li>';
    //    $.get("../../api/drdwData", { id: $(this).val(), types: "District" })
    //        .done(function (data) {
    //            Listdata = JSON.parse(data);
    //            //console.log(Listdata)
    //            Listdata.forEach((item, i) => {
    //                html1 += '<option value="' + item.district_id + '">' + item.district_name + '</option>';
    //                html2 += '<li data-value="' + item.district_id + '" class="option focus">' + item.district_name + '</li>';

    //            });
    //            $(".drdwDisMob").append(html2);
    //            $("#drdwDistrictMob").append(html1);
    //            $('.drdwDisMob').niceSelect('update');
    //        });
    //});

    function loadProject(arrData) {
        var htmlgrid = '';

        arrData.forEach((item, i) => {
            htmlgrid += '<div class="col-lg-12">';
            htmlgrid += '<div class="ltn__product-item ltn__product-item-4">';
            htmlgrid += '<div class="product-img"><a href="../project/project-details.aspx?id=' + item.plan_type_id + '"><img src="../../vendor/img/project/' + item.plan_image_profile + '" alt="' + item.plan_type_id + '" /></a>';
            if (item.pro_statusType_name == "โครงการพร้อมอยู่") {
                htmlgrid += '<div class="product-badge"><ul><li class="sale-badge bg-green">' + item.pro_statusType_name + '</li></ul></div></div>';
            } else {
                htmlgrid += '<div class="product-badge"><ul><li class="sale-badge">' + item.pro_statusType_name + '</li></ul></div></div>';
            }
            htmlgrid += '<div class="product-info"><div class="product-price"><span>' + money_format(item.plan_price) + '<label>&nbsp;/บาท</label></span></div>';
            htmlgrid += '<h2 class="product-title"><a href="../project/project-details.aspx?id=' + item.plan_type_id + '">' + item.pro_name + '</a></h2>';
            htmlgrid += '<div class="product-description">' + item.pro_type_name + ' : ' + item.plan_type_id + ' ' + item.plan_name + '</div>';
            htmlgrid += '<ul class="ltn__list-item-2 ltn__list-item-2-before">';
            htmlgrid += '<li><span>' + item.plan_bed_room + ' ห้องนอน <i class="flaticon-bed"></i></span></li>';
            htmlgrid += '<li><span>' + item.plan_bath_room + ' ห้องน้ำ <i class="flaticon-clean"></i></span></li>';
            htmlgrid += '<li><span>' + item.plan_useable_area + ' <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span></li>';
            htmlgrid += '</ul></div>';
            htmlgrid += '<div class="product-info-bottom"><div class="real-estate-agent">';
            htmlgrid += '<div class="agent-brief"><h6>' + item.sale_fullName + '</h6><small>ตัวแทนขาย</small></div></div>';
            htmlgrid += '<div class="product-hover-action"><ul><li style="width: 100px;"><a href="tel:' + item.sale_phone + '" title="ติดต่อตัวแทนขาย"><i class="fas fa-phone">&nbsp;โทร</i></a></li></ul>';
            htmlgrid += '</div></div></div></div>';

        });
        $('#product_grid').append(htmlgrid);
        loadCSS();

    }

    //โหลด javascript
    function loadScript() {
        let jss = [
            { jsPath: "../../vendor/js/plugins.js" }, { jsPath: "../../vendor/js/bootstrap.js" }
        ];
        jss.forEach((item, i) => {
            var script = document.createElement('script');
            script.onload = function () {
            };
            script.src = item.jsPath;
            document.head.appendChild(script); //or something of the likes
            //console.log(document.head.appendChild(script));
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
