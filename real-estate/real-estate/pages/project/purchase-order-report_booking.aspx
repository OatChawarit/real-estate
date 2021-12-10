<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="purchase-order-report_booking.aspx.cs" Inherits="real_estate.pages.project.purchase_order_report_booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>Report - Booking</title>
     
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="../css/reportPrintBooking.css?n=1" rel="stylesheet" />
   
    <style>
        .set-img {
 
            height:5rem;
        }
        .set-span-address {
            display: inline-flex; 
            width: 85%;
        }
        .set-span {
            display: inline-block;
            width: 10%; 
            padding: 0px;
            text-align: right;

        }
        p {
            font-size:14pt;
        }
        h4 {
            margin:5px;
        }
        .subpage span {
            padding: 0  ;
        }
        b {
            padding:0 12px;
        }
        .d-none {
            display:none;
        }
    </style>

</head>

<!-- นำเข้า JS -->

<%--<script src="../js/Mee/helper.js"></script>--%>
<%--<script src="../js/thaibath.js"></script>--%>

<!-- #include virtual ="../include/footer.html" -->

<body>

    <div class="book">
        <div class="page">
            <div id="content">
                 
                    <div id="ReportBooking">

                    </div>
                

                <script>
                    var arr = [] ;         
                    let book_id = "";
                    let pro_name = "";
                    let create_date = "";
                    let book_fullName = "";
                    let cus_idCard = "";
                    let cus_address_full = "";
                    let cus_phone = "";
                    let com_name = "";
                    let province_name = "";
                    let district_name = "";
                    let sub_district_name = "";

                    let pro_bank_qrCodeImg = "";
                    let pro_type_name = "";
                    let plan_useable_area = "";
                    let plan_price = "";
                    let plan_type_id = "";
                    let pro_total_area = "";

                    let promotion_discount_percent = "";
                    let promotion_giftVoucher_price = "";
                    let promotion_discount_transferDate = "";
                    let promotion_publicServicefeeYear_free = "";
                    let promotion_IsElectricMeter_free = "";
                    let promotion_IsWaterMeter_free = "";
                    let promotion_airConditioner_free = "";
                    let promotion_airConditioner_remark = "";
                    let promotion_other = "";

                    let pro_deed_id = "";
                    let pro_land_number = "";
                    let pro_survey_page = "";
                    let new_deed_id = "";
                    let new_land_number = "";
                  
      
                    var arr = JSON.parse( localStorage.getItem("arr_localPrint")) ;        
                    console.log(arr); 

                    arr.forEach((item, i) => {         
                        book_id = item.book_id;
                        //pro_name = item.pro_name;
                        pro_name = item.pro_name.replace( 'โครงการ', '');
                        
                        create_date = item.create_date;
                        book_fullName = item.book_fullName;
                        cus_idCard = item.cus_idCard;
                        cus_address_full = item.cus_address_full;
                        cus_phone = item.cus_phone;
                        com_name = item.com_name;
                        province_name = item.province_name;
                        district_name = item.district_name;
                        sub_district_name = item.sub_district_name;

                        pro_bank_qrCodeImg = item.pro_bank_qrCodeImg;
                        pro_type_name = item.pro_type_name;
                        plan_useable_area = item.plan_useable_area;
                        plan_price = item.plan_price;
                        plan_type_id = item.plan_type_id;
                        pro_total_area = item.pro_total_area;

                        promotion_discount_percent = item.promotion_discount_percent;
                        promotion_giftVoucher_price = item.promotion_giftVoucher_price;
                        promotion_discount_transferDate = item.promotion_discount_transferDate;
                        promotion_publicServicefeeYear_free = item.promotion_publicServicefeeYear_free;
                        promotion_IsElectricMeter_free = item.promotion_IsElectricMeter_free;
                        promotion_IsWaterMeter_free = item.promotion_IsWaterMeter_free;
                        promotion_airConditioner_free = item.promotion_airConditioner_free;
                        promotion_airConditioner_remark = item.promotion_airConditioner_remark;
                        promotion_other = item.promotion_other;

                        pro_deed_id = item.pro_deed_id;
                       
                        pro_survey_page = item.pro_survey_page;
                        new_deed_id = item.new_deed_id;
                        new_land_number = item.new_land_number;    
                        pro_land_number = item.pro_land_number;

                    });
   


                




                    var txthtml = "<div class= ' p-A4 '>" +

                        //headpage
                        `<div class= " " > 
                             
                         </div >
                        ` +
                        // subpage
                        `  <div class='subpage'>
<div class="txt-R">
    <p style="padding-right:30px">ใบจองเลขที่ &nbsp;&nbsp; ${book_id} &emsp;&emsp;</p>                                                 
</div>
<div class="txt-C ">
    <h4 >หนังสือจองที่ดินจัดสรรพร้อมสิ่งปลูกสร้าง</h4>
    <h4 > โครงการ  &nbsp;&nbsp;<b>${pro_name}</b> </h4>
</div>
<div class="txt-C ">
    <p  style="padding-left:150px">ทำที่ สำนักงานขายโครงการ &nbsp; <b>${pro_name}</b>  </p>
</div>


<div class="txt-R">
    <p style="padding-right:30px">วันที่  &nbsp; <b> ${create_date}</b> &emsp;&emsp;</p>
    
</div>

<div>
    <p> <span>ข้าพเจ้า &nbsp; <b>${book_fullName}</b>   </span>ผู้จอง <span style="padding-left: 200px;">บัตรประชาชนเลขที่<b>${cus_idCard}</b>  </span> </p>
</div>

<div>
    <p>ที่อยู่&nbsp;<b>${cus_address_full} </b>  </p>
</div>
<div>
    <p>หมายเลขโทรศัพท์ &nbsp;<b>${cus_phone} </b>   </p>
</div>
<div>
    <p style="padding-left: 50px;">  ผู้จองมีความประสงค์จองที่ดินจัดสรรพร้อมสิ่งปลูกสร้างของโครงการ&nbsp; <b>${pro_name}</b>
    </p>
</div>

<div>
    <p>จากบริษัท&nbsp; <b>${com_name}</b> เจ้าของโครงการซึ่งต่อไปนี้จะเรียกว่า "บริษัท" 
    </p>
</div>
 
<div>
    <p> ตั้งอยู่บนที่ดินบางส่วนของ 
        <span>โฉนดเลขที่ &nbsp;<b>${pro_deed_id}</b> </span>
        <span>เลขที่ดิน &nbsp;<b>${pro_land_number}</b></span>
        <span>หน้าสำรวจ &nbsp;<b>${pro_survey_page}</b></span>
    </p>
</div>

<div>
    <p>
        <span>แขวง/ตำบล &nbsp;<b>${sub_district_name}</b>  </span>
        <span>เขต/อำเภอ &nbsp;<b>${district_name}</b> </span>
        <span>จังหวัด &nbsp;<b>${province_name}</b> </span>
         
       
    </p>
    <p> <span>เนื้อที่ดิน &nbsp;<b>${pro_total_area}</b>  </span></p>
</div>

<div>
    <p>
        <span>ปัจจุบันได้แบ่งแยกออกเป็นโฉนดเลขที่&nbsp;<b>${new_deed_id}</b> </span>
        <span>เลขที่ดิน &nbsp;<b>${new_land_number} </b></span>
    </p>
</div>

<div>
    <p>
        <span style="padding-left: 50px;">โดยผู้จองตกลงซื้อที่ดินจัดสรรพร้อมสิ่งปลูกสร้างแปลงเลขที่&nbsp;<b>${plan_type_id}</b> </span>
        <span>แบบ&nbsp;<b> ${pro_type_name}</b></span>
       
    </p>
    <p> <span>พื้นที่ประมาณ&nbsp;<b>${plan_useable_area}</b> </span> <span>จำนวน 1 แปลง </span></p>
</div>
<div>
    <p>
        <span>  จำนวน 1 แปลง ราคาขายเป็นจำนวนเงิน &nbsp;<b>${plan_price}</b> </span>
        <span> บาท</span> 
    </p>
</div>
 
<div>
    <p>โปรโมชั่น : </p>
    <p id="promotion_discount_percent"><b>- &nbsp;ส่วนลด ${promotion_discount_percent} %</b></p>
    <p id="promotion_giftVoucher_price"><b>- &nbsp;บัตรของขวัญมูลค่า&nbsp; ${promotion_giftVoucher_price}&nbsp; บาท</b> </p>
    <p id="promotion_discount_transferDate"><b>- &nbsp;ส่วนลดวันโอน&nbsp; ${promotion_discount_transferDate}&nbsp; บาท</b> </p>
    <p id="promotion_publicServicefeeYear_free"><b>- &nbsp; ฟรีค่าบริการสาธารณะ&nbsp;${promotion_publicServicefeeYear_free}&nbsp; ปี </b></p>
    <p id="promotion_IsElectricMeter_free"><b>- &nbsp; ${promotion_IsElectricMeter_free} </b></p>
    <p id="promotion_IsWaterMeter_free"> <b>- &nbsp; ${promotion_IsWaterMeter_free} </b></p>
    <p id="promotion_airConditioner_free"><b>- &nbsp; ฟรีแอร์ ${promotion_airConditioner_free} เครื่อง</b></p> 
    <p id="promotion_other"><b>- &nbsp; อื่นๆ ${promotion_other}</b></p>

   

</div>

<div style="padding-top: 5px;"><p> ผู้จองได้อ่านและเข้าใจข้อความในหนังสือจองฉบับนี้โดยตลอดแล้วเพื่อเป็นหลักฐานข้าพเจ้าจึงได้ลงลายมือไว้ต่อหน้าพยานข้างท้ายนี้ </p></div>
<br>


<div>
<p> 
    <span>ลงชื่อ..................................................................ผู้จอง&nbsp;&nbsp;</span>
    <span>ลงชื่อ..................................................................ผู้รับจอง</span>
</p>

</div>
<div>
<p style="margin-left: 20px;"> 
    <span>(........................................................................)&nbsp;&nbsp;</span>
    <span style="margin-left: 25px;">(........................................................................)</span>
</p>

</div>

<br><br>
<div>
<p > 
    <span>ลงชื่อ..................................................................ผู้อนุมัติ&nbsp;&nbsp;</span>
    <span>ลงชื่อ..................................................................พยาน</span>
</p>

</div>
<div>
<p style="margin-left: 20px;"> 
    <span>(........................................................................)&nbsp;&nbsp;</span>
    <span style="margin-left: 25px;">(........................................................................)</span>
</p>

</div>

<img id="qrcode" src="../../image/project/${pro_bank_qrCodeImg}" style="width: 120px  ;height:120px; position: relative;     bottom: 420px; margin-left: 350px;" >
 



                        ` +
                        `
                           

                           
                            </div >
                        ` +
                        // footerpage
                        `
                            <div class= ' ' >
                                 
                                  
                            </div > `;



                         $("#ReportBooking").append(txthtml); 

                        if (!promotion_discount_percent) {
                            $('#promotion_discount_percent').addClass('d-none');
                        }
                        if (!promotion_giftVoucher_price) {
                            $('#promotion_giftVoucher_price').addClass('d-none');
                        }
                        if (!promotion_discount_transferDate) {
                            $('#promotion_discount_transferDate').addClass('d-none');
                        }
                        if (!promotion_publicServicefeeYear_free) {
                            $('#promotion_publicServicefeeYear_free').addClass('d-none');
                        }

                        if (!promotion_IsElectricMeter_free) {
                            $('#promotion_IsElectricMeter_free').addClass('d-none');
                        }
                        if (!promotion_IsWaterMeter_free) {
                            $('#promotion_IsWaterMeter_free').addClass('d-none');
                        }
                        if (!promotion_airConditioner_free) {
                            $('#promotion_airConditioner_free').addClass('d-none');
                        }
                        if (!promotion_other) {
                            $('#promotion_other').addClass('d-none');
                        }
                        if (!pro_bank_qrCodeImg) {
                            $('#qrcode').addClass('d-none');
                        }


 

                    //}
                   // window.print();

                 
                </script>

            </div>
        </div>
    </div>
    <%--</div>--%>
    <div class="no-print">
        <button onclick="window.print()" id="myBtn" class="myBtnPrint" title="พิมพ์">พิมพ์</button>
    </div>


</body>
   

</html>
 
<!-- Bootstrap core JavaScript-->
<script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../../../vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script src="../../../vendor/js/sweetalert2.all.min.js"></script>
<script src="../../../vendor/js/sweetalert2.js"></script>
<script src="../../../vendor/js/bootstrap.js"></script>

<script src="../../../vendor/js/helper.js"></script>
<script src="../../../vendor/bootstrap-select/js/bootstrap-select.js"></script>
<!-- close textmenu click -->


<script language="JavaScript">
    document.oncontextmenu = new Function("return false;")
</script>
<%--<body onselectstart="return false">--%>
</html>
 