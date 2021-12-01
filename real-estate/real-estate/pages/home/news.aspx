<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="news.aspx.cs" Inherits="real_estate.pages.home.news" %>

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
                                    <li><a href="main.aspx"><span class="ltn__secondary-color"><i class="fas fa-home"></i></span>หน้าหลัก</a></li>
                                    <li>ข่าวสารน่ารู้</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- News -->
        <form runat="server">
            <!-- Blog News -->
            <div class="ltn__blog-area ltn__blog-item-3-normal mb-100">
                <div class="container">
                    <div class="row">
                        <%
                            var tb = new real_estate.ClassData.News();
                            Response.Write(tb.listAllNews());

                            //string id = HttpContext.Current.Request.QueryString.Get("id");
                            //Response.Write(id);
                        %>
                    </div>

                    <!-- <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__pagination-area text-center">
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
                        </div>
                    </div>
                </div> -->

                </div>
            </div>
            <!-- Blog News -->
        </form>
        <!-- เนื้อหา -->`

        <!-- นำเข้าส่วนท้าย -->
        <!-- #include virtual ="../include/footcontent.html" -->
    </div>
    <!-- นำเข้าส่วนท้าย JS -->
    <!-- #include virtual ="../include/footer.html" -->
</body>
<script>
    $(document).ready(function () {
        //let username = JSON.parse(sessionStorage.getItem("LogInData"));
        //console.log(logInData);
    });
</script>
</html>
