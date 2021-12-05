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
            width: 600px;
            height: 400px;
        }

        @media (max-width: 767px) {
            .proimg {
                width: 500px;
                height: 300px;
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
                            Response.Write(tb.getProductSilde(id));

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
                                    <li class="ltn__blog-category" id="pro_category"></li>
                                    <li class="ltn__blog-date" id="pro_date"></li>
                                    <li id="pro_views"></li>
                                </ul>
                            </div>

                            <h1 id="pro_price"></h1>
                            <h3 id="pro_head"></h3>

                            <h4 class="title-2">รายละเอียด</h4>

                            <p id="pro_detail">
                            </p>

                            <h4 class="title-2">รายละเอียดทรัพย์สิน</h4>
                            <div class="property-detail-info-list section-bg-1 clearfix mb-60" id="property_details">
                            </div>

                            <h4 class="title-2 mb-10">สิ่งอำนวยความสะดวก</h4>
                            <div class="property-details-amenities mb-60">
                                <div class="row" id="facilities-list">
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
                                <li class=""><a href="purchase-order.aspx" class="btn btn-success">สั่งจองโครงการ</a></li>
                            </ul>
                        </div>

                        <aside class="sidebar ltn__shop-sidebar ltn__right-sidebar">
                            <!-- Author Widget -->
                            <div class="widget ltn__author-widget">
                                <div class="ltn__author-widget-inner">
                                    <!-- <img src="img/team/4.jpg" alt="Image"> -->
                                    <h5 class="text-center" id="pro_sale"></h5>
                                    <p class="text-center">ตัวแทนขาย <span id="pro_comp"></span></p>

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

        <!-- Modal -->
        <div class="modal fade" id="sendModalCenter" tabindex="-1" role="dialog" aria-labelledby="sendModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title mx-2" id="sendModalCenterTitle">ติดต่อตัวแทนขายเพื่อสอบถามข้อมูลเพิ่มเติม</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-form-label">ชื่อ-สกุล :</label>
                            <input type="text" class="form-control" id="contactName" />
                        </div>
                         <div class="form-group">
                            <label class="col-form-label">อีเมล :</label>
                            <input type="text" class="form-control" id="contactEmail" />
                        </div>
                         <div class="form-group">
                            <label class="col-form-label">เบอร์โทร :</label>
                            <input type="text" class="form-control" id="contactTel" />
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">ข้อความสอบถาม :</label>
                            <textarea class="form-control" id="mesText"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btm-sm"><i class="fas fa-paper-plane"></i> ส่งข้อมูล</button>
                        <button type="button" class="btn btn-secondary btm-sm" data-dismiss="modal"><i class="fas fa-times"></i> ปิด</button>
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
        Swal.fire({
            title: 'โปรดรอสักครู่',
            html: 'กำลังโหลดข้อมูล..',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });

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

                loadfacilities(listProjectDetails);

                listProjectDetails.forEach((item, i) => {
                    if (item.pro_statusType_name == "โครงการใหม่") {
                        $('#pro_category').append("<a class='bg-orange'>" + item.pro_statusType_name + "</a>");
                    } else {
                        $('#pro_category').append("<a class='bg-green'>" + item.pro_statusType_name + "</a>");
                    }

                    $('#pro_date').append("<i class='far fa-calendar-alt'></i>" + dateFormat(item.create_date) + "");
                    $('#pro_head').append(item.pro_name);
                    $('#pro_views').append("<i class='fas fa-eye'></i>ผู้เข้าชม : 300");
                    $('#pro_price').append("฿ " + money_format(item.plan_price));

                    let details = "รูปแบบแปลนโครงการ : " + item.plan_name + "<br />ประเภทบ้าน : " + item.pro_type_name + "<br />ทำเลที่ตั้ง : " + item.pro_location_name + "<br />เพิ่มเติม : " + item.promotion_airConditioner_remark;
                    details += "<br />โปรโมชั่นส่วนลดวันโอน : " + money_format(item.promotion_discount_transferDate) + "<br />โปรโมชั่น gift Voucher ราคา : " + money_format(item.promotion_giftVoucher_price);
                    $('#pro_detail').append(details);

                    $('#pro_sale').append(item.sale_fullName);
                    $('#pro_comp').append(" : " + item.sale_company);
                    $('#pro_mail').append("<i class='far fa-envelope'></i>&nbsp;Email : " + item.sale_mail);
                    $('#pro_line').append("<i class='fab fa-line'></i>&nbsp;Line : " + item.sale_line);
                    $('#pro_tel').append("<i class='fas fa-phone'></i>&nbsp;เบอร์โทร : " + item.sale_phone);

                    let dialogTel = "<a href='tel:" + item.sale_phone + "' class='btn btn-outline-success btn-sm' style='font-size:14px'><i class='fas fa-phone'></i>&nbsp;โทร</a>";
                    dialogTel += "<a href='javascript:void(0)' data-toggle='modal' data-target='#sendModalCenter' class='btn btn-outline-primary btn-sm' style='font-size:14px'><i class='far fa-comment'></i>&nbsp;สอบถาม</a>";
                    $('#pro_tel2').append(dialogTel);

                    let prop = "";
                    prop += "<ul><li><label>รหัส : </label><span>" + item.plan_type_id + "</span></li>";
                    prop += "<li><label>พื้นที่ทั้งหมด : </label><span>" + item.plan_useable_area + "</span></li>";
                    prop += "<li><label>ห้องนอน : </label><span>" + item.plan_bed_room + "</span></li>";
                    prop += "<li><label>ห้องน้ำ : </label><span>" + item.plan_bath_room + "</span></li>";
                    if (item.promotion_IsElectricMeter_free == "1") {
                        prop += "<li><label>มิเตอร์ไฟฟ้า : </label><span>ฟรีค่าติดตั้ง</span></li>";
                    } else {
                        prop += "<li><label>มิเตอร์ไฟฟ้า : </label><span>มีค่าติดตั้ง</span></li></ul>";
                    }

                    if (item.promotion_IsWaterMeter_free == "1") {
                        prop += "<li><label>มิเตอร์น้ำปะปา : </label><span>ฟรีค่าติดตั้ง</span></li></ul>";
                    } else {
                        prop += "<li><label>มิเตอร์น้ำปะปา : </label><span>มีค่าติดตั้ง</span></li></ul>";
                    }
                    prop += "<ul><li><label>ชั้นที่ / จำนวนชั้น : </label><span>" + item.plan_floor + "</span></li>";
                    prop += "<li><label>เครื่องปรับอากาศ : </label><span>" + item.promotion_airConditioner_free + " (เครื่อง)</span></li>";
                    prop += "<li><label>ค่าบริการสาธารณะ : </label><span>" + item.promotion_publicServicefeeYear_free + " (ปี)</span></li>";
                    prop += "<li><label>ราคา : </label><span>" + money_format(item.plan_price) + " (บาท)</span></li>";
                    prop += "<li><label>ส่วนลด % : </label><span>" + item.promotion_discount_percent + "</span></li></ul>";
                    $('#property_details').append(prop);

                    $('#pro_map').append(item.pro_LinkGoogleMap);
                });
                Swal.close();
            });

        //setTimeout(function () {
        //    loadCSS();
        //    loadScript();
        //}, 500);
    });


    function loadfacilities(arrDara) {

        let facilities = "";

        arrDara.forEach((item, i) => {
            facilities += "<div class='col-lg-4 col-md-6'><div class='ltn__menu-widget'>";
            if (item.facilities_IsNearBySkyTrain == "1") {
                facilities += "<ul><li><label class='checkbox-item'>ใกล้สถานีรถไฟฟ้า<input type='checkbox' checked='checked'><span class='checkmark'></span></label>";
            } else {
                facilities += "<ul><li><label class='checkbox-item'>ใกล้สถานีรถไฟฟ้า<input type='checkbox'><span class='checkmark'></span></label>";
            }

            if (item.facilities_IsParks == "1") {
                facilities += "</li><li><label class='checkbox-item'>สวนสาธารณะ<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "<li><label class='checkbox-item'>สวนสาธารณะ<input type='checkbox' ><span class='checkmark'></span></label></li>";
            }

            if (item.facilities_IsSwimmingPool == "1") {
                facilities += "<li><label class='checkbox-item'>สระว่ายน้ำ<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "<li><label class='checkbox-item'>สระว่ายน้ำ<input type='checkbox'><span class='checkmark'></span></label></li>";
            }


            if (item.facilities_IsRoofGarden == "1") {
                facilities += "<li><label class='checkbox-item'>สวนดาดฟ้า<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "<li><label class='checkbox-item'>สวนดาดฟ้า<input type='checkbox'><span class='checkmark'></span></label></li>";
            }

            if (item.facilities_IsFitness == "1") {
                facilities += "<li><label class='checkbox-item'>ฟิตเนส<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
                facilities += "</ul></div></div>";
            } else {
                facilities += "<li><label class='checkbox-item'>ฟิตเนส<input type='checkbox' ><span class='checkmark'></span></label></li>";
                facilities += "</ul></div></div>";
            }

            facilities += "<div class='col-lg-4 col-md-6'><div class='ltn__menu-widget'>";
            if (item.facilities_IsLift == "1") {
                facilities += "<ul><li><label class='checkbox-item'>ลิฟต์<input type='checkbox' checked='checked'><span class='checkmark'></span></label>";
            } else {
                facilities += "<ul><li><label class='checkbox-item'>ลิฟต์<input type='checkbox'><span class='checkmark'></span></label>";
            }

            if (item.facilities_IsParking == "1") {
                facilities += "</li><li><label class='checkbox-item'>ที่จอดรถ<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "</li><li><label class='checkbox-item'>ที่จอดรถ<input type='checkbox'><span class='checkmark'></span></label></li>";
            }

            if (item.facilities_IsCoWorkingSpace == "1") {
                facilities += "<li><label class='checkbox-item'>Co-working Space<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "<li><label class='checkbox-item'>Co-working Space<input type='checkbox' ><span class='checkmark'></span></label></li>";
            }

            if (item.facilities_IsLaunDry == "1") {
                facilities += "<li><label class='checkbox-item'>ห้องซักรีด<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
                facilities += "</ul></div></div>";
            } else {
                facilities += "<li><label class='checkbox-item'>ห้องซักรีด<input type='checkbox'><span class='checkmark'></span></label></li>";
                facilities += "</ul></div></div>";
            }

            facilities += "<div class='col-lg-4 col-md-6'><div class='ltn__menu-widget'>";
            if (item.facilities_IsKeyCard == "1") {
                facilities += "<ul><li><label class='checkbox-item'>คีย์การ์ดและสแกนนิ้ว<input type='checkbox' checked='checked'><span class='checkmark'></span></label>";
            } else {
                facilities += "<ul><li><label class='checkbox-item'>คีย์การ์ดและสแกนนิ้ว<input type='checkbox' ><span class='checkmark'></span></label>";
            }

            if (item.facilities_IsCCTV == "1") {
                facilities += "</li><li><label class='checkbox-item'>CCTV<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "</li><li><label class='checkbox-item'>CCTV<input type='checkbox' ><span class='checkmark'></span></label></li>";
            }

            if (item.facilities_IsSecuritySystem == "1") {
                facilities += "<li><label class='checkbox-item'>ระบบรักษาความปลอดภัย 24 ชม.<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
            } else {
                facilities += "<li><label class='checkbox-item'>ระบบรักษาความปลอดภัย 24 ชม.<input type='checkbox' ><span class='checkmark'></span></label></li>";
            }

            if (item.facilities_IsClubHouse == "1") {
                facilities += "<li><label class='checkbox-item'>คลับเฮ้าส์<input type='checkbox' checked='checked'><span class='checkmark'></span></label></li>";
                facilities += "</ul></div></div>";
            } else {
                facilities += "<li><label class='checkbox-item'>คลับเฮ้าส์<input type='checkbox' ><span class='checkmark'></span></label></li>";
                facilities += "</ul></div></div>";
            }

        });
        $('#facilities-list').append(facilities);
    }


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
