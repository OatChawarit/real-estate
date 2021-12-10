<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="purchase-order-report_booking.aspx.cs" Inherits="real_estate.pages.project.purchase_order_report_booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>Report - MeeCapital</title>
    <link rel="shortcut icon" href="../../img/icon-logoMct.ico" type="image/png" />
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
                    let PrintDate = '';
                    let Brand = '';
                    let Model = '';
                    let EngineNumber = '';
                    let ChassisNumber = '';
                    let Color = '';
                    let CustomerName = '';
                    let AgreementId = '';
                    let Address = '';
                    let ExecutedDate = '';
                    let AgreementAmountVat = '';
                    let NumberOfPeriod = '';
                    let PayAmountTax = '';
                     

                    var ix = 0;
                    //var arr = JSON.parse(localStorage['arr_localPrint']);       
                    var arr = [] ;              
                    
                    console.log(arr);

                    arr.forEach((item, i) => {
                        PrintDate = item.PrintDate;
                        Brand = item.MakeBrand;
                        Model = item.Model;
                        EngineNumber = item.EngineNumber;
                        ChassisNumber = item.ChassisNumber;
                        Color = item.Color;
                        CustomerName = item.CustomerName;
                        AgreementId = item.AgreementId;
                        Address = item.Address;
                        ExecutedDate = item.ExecutedDate;
                        AgreementAmountVat = item.AgreementAmountVat;
                        NumberOfPeriod = item.NumberOfPeriod;
                        PayAmountTax = item.PayAmountTax;
     

                    });


                    var txthtml = "<div class= ' p-A4 '>" +

                        //headpage
                        `<div class= " " > 
                             
                         </div >
                        ` +
                        // subpage
                        `  <div class = 'subpage' >
                                   <div class="txt-R">
                                    <p style="padding-right:30px">วันที่ &nbsp;&nbsp; ${PrintDate}  &emsp;&emsp;</p>
                                    <br><br>
                                </div>
                                <div class="txt-C">
                                    <h3>หนังสือรับรองการเช่าซื้อ</h3>
                                </div>
                             
                                <div>
                                    <p>เรียน  นายทะเบียนยานพาหนะกองทะเบียนกรมการขนส่งทางบก</p>
                                </div>
                                    <br>
                                <div>
                                    <p class='txt-indent3'> โดยหนังสือฉบับนี้ บริษัทฯ ขอรับรองว่ารถยี่ห้อ <span>${Brand}</span>  รุ่น <span>${Model}</span> </p>
                                    <p> สี <span>${Color}</span>		หมายเลขเครื่องยนต์ <span>${EngineNumber}</span>		 หมายเลขตัวถัง	<span>${ChassisNumber}</span></p>
                                    <p> ซึ่งบริษัทฯได้ตกลงให้ </p>
                                </div>
                                    <br>
                                <div>
                                     <p> <span class='set-span'>  ชื่อ  &nbsp; </span> <span> ${CustomerName}</span>		 </p>
                                     <p> <span class='set-span'>  ที่อยู่  </span> <span class='set-span-address'> ${Address} </span></p>
                                </div>
                                    <br>
                                <div>
                                    <p class="txt-indent3">
                                        เป็นผู้เช่าซื้อรถยนต์คันดังกล่าวไปเมื่อวันที่  <span>${ExecutedDate}</span> ในราคาเช่าซื้อทั้งสิ้น <span>${AgreementAmountVat}</span> บาท <br>
                                        แบ่งชำระเป็น <span>${NumberOfPeriod}</span> งวด งวดละ <span>${PayAmountTax}</span> บาท
                                    </p>         
                                </div>
                                     <br>
                                <div>
                                    <p class="txt-indent3">จึงเรียนมาเพื่อขอให้ท่านได้โปรดพิจารณาอนุมัติการจดทะเบียนรถยนต์คันดังกล่าว   ในนามบริษัท </p>
                                    <p>มี แคปปิตอล จำกัด</p>
                                </div>
                                    <br><br>
                                <div>
                                    <p style="padding-left:25rem">ขอแสดงความนับถือ </p>
                                    <br><br>
                                    <p style="padding-left:24rem">บริษัท มี แคปปิตอล จำกัด</p>
                                </div>

                        ` +
                        `
                           

                           
                            </div >
                        ` +
                        // footerpage
                        `
                            <div class= 'footerpage' >
                                 <div class="row">
                                        
                                </div>
                                  
                            </div > `;



                         $("#ReportBooking").append(txthtml);



                    

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
 