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
        <div class="ltn__breadcrumb-area text-left bg-overlay-white-30 bg-image " data-bs-bg="../../vendor/img/bg/24.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner">
                            <h1 class="page-title">ข่าวสารน่ารู้</h1>
                            <div class="ltn__breadcrumb-list">
                                <ul>
                                    <li><a href="news.aspx"><span class="ltn__secondary-color"><i class="fas fa-list-ol"></i></span> ข่าวสารทั้งหมด</a></li>
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
                                <img src="../../vendor/img/blog/1.jpg" alt="Image">
                            </div>
                            <p>
                                <span class="ltn__first-letter">L</span>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
                                incidi dunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc itation ullamco laboris nisi 
                                ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque 
                                ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
                                voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                    Excepteur sint occaecat cupidatat non proident.
                            </p>
                            <div class="ltn__service-list-menu text-uppercase mt-50 d-none">
                                <ul>
                                    <li><i class="fas fa-car"></i>Front Brakes Repair <span class="service-price">$225.95 <span>Plus Parts</span></span> </li>
                                    <li><i class="fas fa-life-ring"></i>Rear Brakes Repair <span class="service-price">$225.95 <span>Plus Parts</span></span> </li>
                                    <li><i class="fas fa-cog"></i>Axle <span class="service-price">$225.95 <span>Plus Parts</span></span> </li>
                                    <li><i class="fas fa-car"></i>Starters / Alternators <span class="service-price">$225.95 <span>Plus Parts</span></span> </li>
                                </ul>
                            </div>

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
        <!-- details -->

        <!-- เนื้อหา -->

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
</html>
