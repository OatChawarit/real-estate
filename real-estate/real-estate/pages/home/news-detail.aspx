<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="news-detail.aspx.cs" Inherits="real_estate.pages.home.news_detail" %>


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

        <!-- เนื้อหา -->
        <!-- News -->
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../../vendor/img/bg/24.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">ข่าวสารน่ารู้</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="news.aspx"><span class="ltn__secondary-color"><i class="fas fa-list-ol"></i></span>ข่าวสารทั้งหมด</a></li>
                                    <li>รายละเอียดข่าวสาร</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- News -->


        <!-- details -->
        <div class="ltn__page-details-area ltn__service-details-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="ltn__page-details-inner ltn__service-details-inner">
                            <div class="ltn__blog-img">
                                <img src="" id="news_image" alt="Image" />
                            </div>
                            <div class="ltn__blog-meta">
                                <ul>
                                    <li class="ltn__blog-author"><a href="javascript:void(0)"><i class="far fa-user"></i>ผู้เขียน: <span id="blogCreate"></span></a></li>
                                    <li class="ltn__blog-date">
                                        <i class="far fa-calendar-alt"></i><span id="blogDate"></span>
                                    </li>
                                </ul>
                            </div>
                            <h3 id="headerNews"></h3>
                            <p id="detailNews">
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <aside class="sidebar-area ltn__right-sidebar">
                            <!-- Menu Widget -->
                            <div class="widget-2 ltn__menu-widget ltn__menu-widget-2 text-uppercase">
                                <ul>
                                    <li><a href="#">ลงประกาศขายบ้าน</a></li>
                                    <li><a href="../home/contact.aspx">ติดต่อเรา</a></li>
                                    <li><a href="../register/register-user.aspx">สมัครสมาชิก</a></li>
                                    <li><a href="../register/register-sale.aspx">สมัครตัวแทนขาย</a></li>
                                </ul>
                            </div>
                        </aside>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <!-- details -->

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
        //loadScript();
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const news_id = urlParams.get('newsid');
        //console.log(news_id);

        var jsonData = JSON.stringify({
            id: news_id
        });

        let Listdata;
        $.get("../../api/news", { jsonData, types: "getNews" })
            .done(function (data) {
                Listdata = JSON.parse(data);
                console.log(Listdata);

                let img_path = '../../../image/news/' + Listdata[0].news_image;
                $("#news_image").attr('src', img_path);
                $('#headerNews').append(Listdata[0].news_topic);
                $('#detailNews').append(Listdata[0].news_content);
                $("#blogDate").append(dateFormat(Listdata[0].create_date));
                $("#blogCreate").append(Listdata[0].create_by);
                Swal.close();
                //loadNews(Listdata);
            });
    });

    function loadNews(arrData) {
        let html = "";
        arrData.forEach((item, i) => {
            $('#headerNews').append(item.news_topic);
            $('#detailNews').append(item.news_content);
        });
        loadCSS();
    }

    //โหลด javascript
    function loadScript() {
        let jss = [
            { jsPath: "../../vendor/js/plugins.js" }, { jsPath: "../../vendor/js/bootstrap.js" }, { jsPath: "../../vendor/js/helper.js" }
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
