<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project-details.aspx.cs" Inherits="real_estate.pages.project.project_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="../../vendor/img/favicon.png" type="image/x-icon" />

    <!-- นำเข้าส่วนหัว -->
    <!-- #include virtual ="../include/header.html" -->
    <style>
        .proimg {
            width: 600px;height: 400px;
        }

        @media (max-width: 767px) {
            .proimg {
               width: 500px; height : 300px;
            }
        }
    </style>
</head>
<body>
    <!-- Body main wrapper start -->
    <div class="body-wrapper">
        <!-- นำเข้าเมนู -->
        <!-- #include virtual ="../include/topbar.html" -->

        <!-- เนื้อหา -->
        <!-- Project -->
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../vendor/img/bg/8.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">โครงการของเรา</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="project-list.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>โครงการอสังหาฯ</a></li>
                                    <li>รายละเอียดโครงการ</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Project -->

        <!-- IMAGE SLIDER  -->
        <form runat="server">
            <div class="ltn__img-slider-area">
                <div class="container-fluid">
                    <div class="row  ltn__image-slider-2-active slick-arrow-1 slick-arrow-1-inner">
                        <%

                            string id = HttpContext.Current.Request.QueryString.Get("id");
                            //Response.Write(id);
                            var tb = new real_estate.ClassData.projectData();
                            Response.Write(tb.getProductDetail(id));
                     
                        %>
                    </div>
                </div>
            </div>
        </form>
        <!-- IMAGE SLIDER  -->

        <!--  DETAILS  -->
        <div class="ltn__shop-details-area pb-10">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="ltn__shop-details-inner ltn__page-details-inner mb-60">
                            <div class="ltn__blog-meta">
                                <ul>
                                    <li class="ltn__blog-category" id="pro_category">
                                        
                                    </li>
                                    <li class="ltn__blog-date" id="pro_date">
                                        
                                    </li>
                                </ul>
                            </div>
                            <h1 id="pro_price"> </h1>
                            <h3 id="pro_head"> </h3>
                            <h4 class="title-2">รายละเอียด</h4>
                            <p id="pro_detail">
                               
                            </p>

                            <h4 class="title-2">รายละเอียดทรัพย์สิน</h4>
                            <div class="property-detail-info-list section-bg-1 clearfix mb-60">
                                <ul>
                                    <li>
                                        <label>รหัสที่ : </label>
                                        <span>HZ29</span></li>
                                    <li>
                                        <label>พื้นที่ทั้งหมด : </label>
                                        <span>120 sqft</span></li>
                                    <li>
                                        <label>ห้องนอน : </label>
                                        <span>2</span></li>
                                    <li>
                                        <label>ห้องน้ำ : </label>
                                        <span>3</span></li>
                                </ul>
                                <ul>
                                    <li>
                                        <label>ปีที่สร้าง  :</label>
                                        <span>1992</span></li>
                                    <li>
                                        <label>ราคา : </label>
                                        <span>2,200,000</span></li>
                                    <li>
                                        <label>สถานะ : </label>
                                        <span>โครงการใหม่</span></li>
                                </ul>
                            </div>

                            <h4 class="title-2 mb-10">สิ่งอำนวยความสะดวก</h4>
                            <div class="property-details-amenities mb-60">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="ltn__menu-widget">
                                            <ul>
                                                <li>
                                                    <label class="checkbox-item">
                                                        เครื่องปรับอากาศ
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label class="checkbox-item">
                                                        ห้องฟิตเนส
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label class="checkbox-item">
                                                        สระว่ายน้ำ
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6">
                                        <div class="ltn__menu-widget">
                                            <ul>
                                                <li>
                                                    <label class="checkbox-item">
                                                        สวนสาธารณะ
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label class="checkbox-item">
                                                        ที่จอดรถ
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label class="checkbox-item">
                                                        ลิฟต์
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6">
                                        <div class="ltn__menu-widget">
                                            <ul>
                                                <li>
                                                    <label class="checkbox-item">
                                                        WiFi
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label class="checkbox-item">
                                                        พื้นที่ส่วนกลาง
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label class="checkbox-item">
                                                        รักษาความปลอดภัย 24 ชม.
                                                    <input type="checkbox" checked="checked">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h4 class="title-2">Location</h4>
                            <div class="property-details-google-map mb-60" id="pro_map">
                               
                            </div>
                            <br />
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="widget-2 ltn__menu-widget">
                            <ul>
                                <li class=""><a href="#" class="btn btn-success">ซื้อโครงการ / จองโครงการ</a></li>
                            </ul>
                        </div>

                        <aside class="sidebar ltn__shop-sidebar ltn__right-sidebar">
                            <!-- Author Widget -->
                            <div class="widget ltn__author-widget">
                                <div class="ltn__author-widget-inner">
                                    <!-- <img src="img/team/4.jpg" alt="Image"> -->
                                    <h5 class="text-center" id="pro_sale"></h5>
                                    <p class="text-center">ตัวแทนขายอสังหาริมทรัพย์</p>
                                    <p id="pro_mail"></p>
                                    <p id="pro_tel"></p>
                                    <p id="pro_line"></p>
                                    <p id="pro_tel2"></p>
                                </div>
                            </div>
                        </aside>

                    </div>
                </div>
            </div>
        </div>
        <!--  DETAILS END -->

        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>

    $(document).ready(function () {



        //Swal.fire({
        //    title: 'โปรดรอสักครู่',
        //    html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
        //    allowOutsideClick: false,
        //    onBeforeOpen: () => {
        //        Swal.showLoading()
        //    },
        //});

        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const pro_id = urlParams.get('id');
        //console.log(news_id);

        var jsonData = JSON.stringify({
            "plan_type_id": pro_id
        });

        let listProjectDetails;
        $.get("../../api/ProjectList", { jsonData: jsonData, types: "listProjectDetails" })
            .done(function (data) {
                listProjectDetails = JSON.parse(data);
                console.log('listProjectDetails', listProjectDetails);

//                plan_name: "MERIDIAN"
//plan_parking: "4"
//plan_price: "25000000"
//plan_type_id: "PJL-test0001"
//plan_useable_area: "454 ตร.ม."
//pro_location_id: "22"
//pro_location_name: "ราชพฤกษ์ - พระราม 5"
//pro_name: "โครงการเศรษฐสิริ พระราม 5"
//pro_statusType_name: "โครงการใหม่"
//pro_type_name: "บ้านเดี่ยว"
//promotion_IsElectricMeter_free: "1"
//promotion_IsWaterMeter_free: "1"
//promotion_airConditioner_free: "2"
//promotion_airConditioner_remark: "แอร์ 9200BTU จำนวน 1 เครื่อง , แอร์ 23000BTU จำนวน 1 เครื่อง"
//promotion_discount_percent: "10"
//promotion_discount_transferDate: "500000"
//promotion_giftVoucher_price: "100000"
//promotion_other: ""
//promotion_publicServicefeeYear_free: "3"
//sale_fullName: "เพทาย[sale] ประพฤติดี"
//sale_phone: "0882812968"

                listProjectDetails.forEach((item, i) => {
                    if (item.pro_statusType_name == "โครงการใหม่") {
                       $('#pro_category').append("<a class='bg-orange'>"+ item.pro_statusType_name +"</a>"); 
                    } else {
                       $('#pro_category').append("<a class='bg-green'>"+ item.pro_statusType_name +"</a>");
                    }

                    $('#pro_date').append("<i class='far fa-calendar-alt'></i>" + dateFormat(item.create_date) + "");
                    $('#pro_head').append(item.pro_name);
                    $('#pro_price').append("฿ " + money_format(item.plan_price));

                    let details = "ชื่อแปลน : " + item.plan_name + "<br />ประเภทบ้าน : " + item.pro_type_name + "<br />ทำเลที่ตั้ง : " + item.pro_location_name + "<br />เพิ่มเติม : " + item.promotion_airConditioner_remark;
                    details += "<br />โปรโมชั่นส่วนลดโอนวันที่ : " + money_format(item.promotion_discount_transferDate) + "<br />โปรโมชั่น gift Voucher ราคา : " + money_format(item.promotion_giftVoucher_price);
                    
                    $('#pro_detail').append(details);

                    $('#pro_sale').append( item.sale_fullName);
                    $('#pro_mail').append("<i class='far fa-envelope'></i>&nbsp;Email : " + item.sale_mail);
                    $('#pro_line').append("<i class='fab fa-line'></i>&nbsp;Line : " + item.sale_line);
                    $('#pro_tel').append("<i class='fas fa-phone'></i>&nbsp;เบอร์โทร : " + item.sale_phone);
                    $('#pro_tel2').append("<a href='tel:"+ item.sale_phone +"' class='btn btn-outline-success btn-sm'><i class='fas fa-phone'></i>&nbsp;โทร</a>");
                    $('#pro_map').append(item.pro_LinkGoogleMap);
                });
            });

        //setTimeout(function () {
        //    loadCSS();
        //    loadScript();
        //}, 500);
    });


    //โหลด javascript
    function loadScript() {
        let jss = [
            { jsPath: "../../../vendor/js/plugins.js" }, { jsPath: "../../../vendor/js/bootstrap.js" }, { jsPath: "../../../vendor/js/helper.js" }
        ];
        jss.forEach((item, i) => {
            var script = document.createElement('script');
            script.onload = function () {
                console.log(script);
            };
            script.src = item.jsPath;
            document.head.appendChild(script); //or something of the likes
            //console.log(document.head.appendChild(script));
        });
    }

    //โหลด css
    function loadCSS() {
        let csss = [
            { cssPath: "../../../vendor/css/plugins.css" }, { cssPath: "../../../vendor/css/bootstrap.css" }, { cssPath: "../../../vendor/css/style.css" }
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
