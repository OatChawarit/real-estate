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
                                            <h6 class="slide-sub-title white-color--- animated"><span><i class="fas fa-home"></i></span>ตัวแทนอสังหาริมทรัพย์</h6>
                                            <h1 class="slide-title animated ">ค้นหาบ้านในฝัน
                                                <br />
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
                                            <h6 class="slide-sub-title white-color--- animated"><span><i class="fas fa-home"></i></span>ตัวแทนอสังหาริมทรัพย์</h6>
                                            <h1 class="slide-title animated ">รวบรวมอสังหาริมทรัพย์
                                                <br />
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

        <!-- ค้นหา -->
        <div class="ltn__car-dealer-form-area mt--65 mt-120 pb-115---">
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
                                <div class="tab-pane fade active show" id="ltn__form_tab_1_1">
                                    <div class="car-dealer-form-inner">
                                        <form action="#" class="ltn__car-dealer-form-box row">
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon---- ltn__icon-car---- col-lg-3 col-md-6">
                                                <select class="nice-select">
                                                    <option>Choose Area</option>
                                                    <option>chicago</option>
                                                    <option>London</option>
                                                    <option>Los Angeles</option>
                                                    <option>New York</option>
                                                    <option>New Jersey</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon---- ltn__icon-meter---- col-lg-3 col-md-6">
                                                <select class="nice-select">
                                                    <option>Property Status</option>
                                                    <option>Open house</option>
                                                    <option>Rent</option>
                                                    <option>Sale</option>
                                                    <option>Sold</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon---- ltn__icon-calendar---- col-lg-3 col-md-6">
                                                <select class="nice-select">
                                                    <option>Property Type</option>
                                                    <option>Apartment</option>
                                                    <option>Co-op</option>
                                                    <option>Condo</option>
                                                    <option>Single Family Home</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon ltn__icon-calendar col-lg-3 col-md-6">
                                                <div class="btn-wrapper text-center mt-0">
                                                    <!-- <button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase">Search Inventory</button> -->
                                                    <a href="shop-right-sidebar.html" class="btn theme-btn-1 btn-effect-1 text-uppercase">ค้นหา</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="ltn__form_tab_1_2">
                                    <div class="car-dealer-form-inner">
                                        <form action="#" class="ltn__car-dealer-form-box row">
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon---- ltn__icon-car---- col-lg-3 col-md-6">
                                                <select class="nice-select">
                                                    <option>Choose Area</option>
                                                    <option>chicago</option>
                                                    <option>London</option>
                                                    <option>Los Angeles</option>
                                                    <option>New York</option>
                                                    <option>New Jersey</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon---- ltn__icon-meter---- col-lg-3 col-md-6">
                                                <select class="nice-select">
                                                    <option>Property Status</option>
                                                    <option>Open house</option>
                                                    <option>Rent</option>
                                                    <option>Sale</option>
                                                    <option>Sold</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon---- ltn__icon-calendar---- col-lg-3 col-md-6">
                                                <select class="nice-select">
                                                    <option>Property Type</option>
                                                    <option>Apartment</option>
                                                    <option>Co-op</option>
                                                    <option>Condo</option>
                                                    <option>Single Family Home</option>
                                                </select>
                                            </div>
                                            <div class="ltn__car-dealer-form-item ltn__custom-icon ltn__icon-calendar col-lg-3 col-md-6">
                                                <div class="btn-wrapper text-center mt-0">
                                                    <!-- <button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase">Search Inventory</button> -->
                                                    <a href="shop-right-sidebar.html" class="btn theme-btn-1 btn-effect-1 text-uppercase">Search Properties</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
        <div class="ltn__product-slider-area ltn__product-gutter pt-115 pb-90 plr--7">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area ltn__section-title-2--- text-center">
                            <h1 class="section-title">โครงการของเรา</h1>
                        </div>
                    </div>
                </div>
                <div class="row ltn__product-slider-item-four-active-full-width slick-arrow-1">
                    <!-- ltn__product-item -->
                    <div class="col-lg-12">
                        <div class="ltn__product-item ltn__product-item-4 text-center---">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img src="../../vendor/img/product-3/1.jpg" alt="#" /></a>
                                <div class="product-badge">
                                    <ul>
                                        <li class="sale-badge bg-green">โครงการพร้อมอยู่</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="product-info">
                                <div class="product-price">
                                    <span>1,200,000<label> /บาท</label></span>
                                </div>
                                <h2 class="product-title"><a href="product-details.html">New Apartment Nice View</a></h2>
                                <div class="product-description">
                                    <p>
                                        Beautiful Huge 1 Family House In Heart Of
                                        <br />
                                        Westbury. Newly Renovated With New Wood
                                    </p>
                                </div>
                                <ul class="ltn__list-item-2 ltn__list-item-2-before">
                                    <li><span>3 <i class="flaticon-bed"></i></span>
                                        Bedrooms
                                    </li>
                                    <li><span>2 <i class="flaticon-clean"></i></span>
                                        Bathrooms
                                    </li>
                                    <li><span>3450 <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span>
                                        square Ft
                                    </li>
                                </ul>
                            </div>
                            <div class="product-info-bottom">
                                <div class="real-estate-agent">
                                    <div class="agent-brief">
                                        <h6><a href="team-details.html">William Seklo</a></h6>
                                        <small>Tel : 089-00905005</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- ltn__product-item -->
                    <div class="col-lg-12">
                        <div class="ltn__product-item ltn__product-item-4 text-center---">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img src="../../vendor/img/product-3/2.jpg" alt="#" /></a>
                                <div class="product-badge">
                                    <ul>
                                        <li class="sale-badge bg-green---">โครงการใหม่</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="product-info">
                                <div class="product-price">
                                    <span>1,200,000<label> /บาท</label></span>
                                </div>
                                <h2 class="product-title"><a href="product-details.html">Modern Apartments</a></h2>
                                <div class="product-description">
                                    <p>
                                        Beautiful Huge 1 Family House In Heart Of
                                        <br />
                                        Westbury. Newly Renovated With New Wood
                                    </p>
                                </div>
                                <ul class="ltn__list-item-2 ltn__list-item-2-before">
                                    <li><span>3 <i class="flaticon-bed"></i></span>
                                        Bedrooms
                                    </li>
                                    <li><span>2 <i class="flaticon-clean"></i></span>
                                        Bathrooms
                                    </li>
                                    <li><span>3450 <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span>
                                        square Ft
                                    </li>
                                </ul>
                            </div>
                            <div class="product-info-bottom">
                                <div class="real-estate-agent">
                                    <div class="agent-brief">
                                        <h6><a href="team-details.html">William Seklo</a></h6>
                                        <small>Tel : 089-00905005</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- ltn__product-item -->
                    <div class="col-lg-12">
                        <div class="ltn__product-item ltn__product-item-4 text-center---">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img src="../../vendor/img/product-3/3.jpg" alt="#" /></a>
                                <div class="product-badge">
                                    <ul>
                                        <li class="sale-badge bg-green">โครงการพร้อมอยู่</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="product-info">
                                <div class="product-price">
                                    <span>1,200,000<label> /บาท</label></span>
                                </div>
                                <h2 class="product-title"><a href="product-details.html">Comfortable Apartment</a></h2>
                                <div class="product-description">
                                    <p>
                                        Beautiful Huge 1 Family House In Heart Of
                                        <br />
                                        Westbury. Newly Renovated With New Wood
                                    </p>
                                </div>
                                <ul class="ltn__list-item-2 ltn__list-item-2-before">
                                    <li><span>3 <i class="flaticon-bed"></i></span>
                                        Bedrooms
                                    </li>
                                    <li><span>2 <i class="flaticon-clean"></i></span>
                                        Bathrooms
                                    </li>
                                    <li><span>3450 <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span>
                                        square Ft
                                    </li>
                                </ul>
                            </div>
                            <div class="product-info-bottom">
                                <div class="real-estate-agent">
                                    <div class="agent-brief">
                                        <h6><a href="team-details.html">William Seklo</a></h6>
                                        <small>Tel : 089-00905005</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- ltn__product-item -->
                    <div class="col-lg-12">
                        <div class="ltn__product-item ltn__product-item-4 text-center---">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img src="../../vendor/img/product-3/4.jpg" alt="#" /></a>
                                <div class="product-badge">
                                    <ul>
                                        <li class="sale-badge bg-green">โครงการพร้อมอยู่</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="product-info">
                                <div class="product-price">
                                    <span>1,200,000<label> /บาท</label></span>
                                </div>
                                <h2 class="product-title"><a href="product-details.html">Luxury villa in Rego Park </a></h2>
                                <div class="product-description">
                                    <p>
                                        Beautiful Huge 1 Family House In Heart Of
                                        <br />
                                        Westbury. Newly Renovated With New Wood
                                    </p>
                                </div>
                                <ul class="ltn__list-item-2 ltn__list-item-2-before">
                                    <li><span>3 <i class="flaticon-bed"></i></span>
                                        Bedrooms
                                    </li>
                                    <li><span>2 <i class="flaticon-clean"></i></span>
                                        Bathrooms
                                    </li>
                                    <li><span>3450 <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span>
                                        square Ft
                                    </li>
                                </ul>
                            </div>
                            <div class="product-info-bottom">
                                <div class="real-estate-agent">
                                    <div class="agent-brief">
                                        <h6><a href="team-details.html">William Seklo</a></h6>
                                        <small>Tel : 089-00905005</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- ltn__product-item -->
                    <div class="col-lg-12">
                        <div class="ltn__product-item ltn__product-item-4 text-center---">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img src="../../vendor/img/product-3/5.jpg" alt="#" /></a>
                                <div class="product-badge">
                                    <ul>
                                        <li class="sale-badge bg-green">โครงการพร้อมอยู่</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="product-info">
                                <div class="product-price">
                                    <span>1,200,000<label> /บาท</label></span>
                                </div>
                                <h2 class="product-title"><a href="product-details.html">Beautiful Flat in Manhattan </a></h2>
                                <div class="product-description">
                                    <p>
                                        Beautiful Huge 1 Family House In Heart Of
                                        <br />
                                        Westbury. Newly Renovated With New Wood
                                    </p>
                                </div>
                                <ul class="ltn__list-item-2 ltn__list-item-2-before">
                                    <li><span>3 <i class="flaticon-bed"></i></span>
                                        Bedrooms
                                    </li>
                                    <li><span>2 <i class="flaticon-clean"></i></span>
                                        Bathrooms
                                    </li>
                                    <li><span>3450 <i class="flaticon-square-shape-design-interface-tool-symbol"></i></span>
                                        square Ft
                                    </li>
                                </ul>
                            </div>
                            <div class="product-info-bottom">
                                <div class="real-estate-agent">
                                    <div class="agent-brief">
                                        <h6><a href="team-details.html">William Seklo</a></h6>
                                        <small>Tel : 089-00905005</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="text-center"><h4><a class="section-subtitle section-subtitle-2 ltn__secondary-color" href="#">ดูโครงการอสังหาฯทั้งหมด</a></h4></div>        </div>



        <!-- พื้นหลังสีเทา  -->
        <!-- <div class="ltn__counterup-area section-bg-1 pt-120 pb-70">
            
        </div>  -->

        <!-- พื้นหลังสีเทา  -->
        <div class="ltn__feature-area section-bg-1 pt-120 pb-90 mb-120---">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area ltn__section-title-2--- text-center">
                            <!-- <h6 class="section-subtitle section-subtitle-2 ltn__secondary-color">บริการของเรา</h6>  -->
                            <h1 class="section-title">บริการของเรา</h1>
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


        <!-- News -->
        <div class="ltn__blog-area pt-115--- pb-70 pt-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-area ltn__section-title-2--- text-center">
                            <h1 class="section-title">ข่าวสาร</h1>
                        </div>
                    </div>
                </div>
                <div id="news_blog" class="row  ltn__blog-slider-one-active slick-arrow-1 ltn__blog-item-3-normal">

                    <!-- Blog Item -->
                    <div class="col-lg-12 ">
                        <div class="ltn__blog-item ltn__blog-item-3">
                            <div class="ltn__blog-img">
                                <a href="blog-details.html">
                                    <%--<img src="../../vendor/img/blog/1.jpg" alt="#" /></a>--%>
                                    <img id="news_image1" src="../../../image/news/1.jpg" alt="#" /></a>

                            </div>
                            <div class="ltn__blog-brief">
                                <div class="ltn__blog-meta">
                                    <ul>
                                        <li class="ltn__blog-author">
                                            <a href="#"><i class="far fa-user"></i>ผู้เขียน: Admin</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3 class="ltn__blog-title"><a href="blog-details.html">10 Brilliant Ways To Decorate Your Home</a></h3>
                                <div class="ltn__blog-meta-btn">
                                    <div class="ltn__blog-meta">
                                        <ul>
                                            <li class="ltn__blog-date"><i class="far fa-calendar-alt"></i>2021-11-24</li>
                                        </ul>
                                    </div>
                                    <div class="ltn__blog-btn">
                                        <a href="blog-details.html">อ่านเพิ่มเติม</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog Item -->
                    <div class="col-lg-12 ">
                        <div class="ltn__blog-item ltn__blog-item-3">
                            <div class="ltn__blog-img">
                                <a href="blog-details.html">
                                    <%--<img src="../../vendor/img/blog/2.jpg" alt="#" />--%>

                                    <img src="../../../image/news/2.jpg" alt="#" />
                                </a>
                            </div>
                            <div class="ltn__blog-brief">
                                <div class="ltn__blog-meta">
                                    <ul>
                                        <li class="ltn__blog-author">
                                            <a href="#"><i class="far fa-user"></i>ผู้เขียน: Admin</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3 class="ltn__blog-title"><a href="blog-details.html">The Most Inspiring Interior Design Of 2021</a></h3>
                                <div class="ltn__blog-meta-btn">
                                    <div class="ltn__blog-meta">
                                        <ul>
                                            <li class="ltn__blog-date"><i class="far fa-calendar-alt"></i>2021-11-24</li>
                                        </ul>
                                    </div>
                                    <div class="ltn__blog-btn">
                                        <a href="blog-details.html">อ่านเพิ่มเติม</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog Item -->
                    <div class="col-lg-12 ">
                        <div class="ltn__blog-item ltn__blog-item-3">
                            <div class="ltn__blog-img">
                                <a href="blog-details.html">
                                    <img src="../../vendor/img/blog/3.jpg" alt="#" /></a>
                            </div>
                            <div class="ltn__blog-brief">
                                <div class="ltn__blog-meta">
                                    <ul>
                                        <li class="ltn__blog-author">
                                            <a href="#"><i class="far fa-user"></i>ผู้เขียน: Admin</a>
                                        </li>

                                    </ul>
                                </div>
                                <h3 class="ltn__blog-title"><a href="blog-details.html">Recent Commercial Real Estate Transactions</a></h3>
                                <div class="ltn__blog-meta-btn">
                                    <div class="ltn__blog-meta">
                                        <ul>
                                            <li class="ltn__blog-date"><i class="far fa-calendar-alt"></i>2021-11-24</li>
                                        </ul>
                                    </div>
                                    <div class="ltn__blog-btn">
                                        <a href="blog-details.html">อ่านเพิ่มเติม</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                
                </div>
                 <div class="text-center"><h4><a class="section-subtitle section-subtitle-2 ltn__secondary-color" href="news.aspx">ดูข่าวสารทั้งหมด</a></h4></div>
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




            //เรียก api
            $.get("../../api/news", { jsonData: jsonData, types: "listNews" })
                .done(function (data) {

                  

                    let Meedata = JSON.parse(data);
     

                    let img_path = '../../../image/news/' + Meedata[1].news_image; 

                    $('#news_image1').attr('src', img_path);

                    console.log('Meedata', Meedata);






                });
           


        });


    </script>
 

</html>
