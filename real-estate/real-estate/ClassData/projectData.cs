using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using real_estate.ClassData;

namespace real_estate.ClassData
{
    public class projectData
    {
        public string dateTo = "";
        public string dateFrom = "";

        public string username = "";
        public string password = "";
        public string firstname = "";
        public string lastname = "";

        //แสดงรูปภาพสไลด์ในแต่ละโครงการ
        public string getProductSilde(string proid)
        {
            var db = new ConnectDB.DBClass();
            StringBuilder str = new StringBuilder();
            string strSql = " SELECT a.plan_img_id, a.plan_img_path, a.plan_img_description ,b.plan_type_id, b.plan_image_profile ";
            strSql += " FROM realestate..re_PlanType_ImgTransaction a Inner Join realestate..re_Project_PlanType b On a.plan_type_id = b.plan_type_id ";
            strSql += " WHERE a.plan_type_id='"+ proid + "' ";

            SqlDataReader reader = db.GetSqlDataReader(strSql);

            if (reader.HasRows)
            {
         
                while (reader.Read())
                {
                   if(reader.GetInt32(0) == 1)
                    {
                        str.AppendLine("<div class='col-lg-12'><div class='ltn__img-slide-item-4'>");
                        str.AppendLine("<a href='../../image/project/" + reader["plan_image_profile"].ToString() + "' id='imgMain' data-rel='lightcase:myCollectionPro'>");
                        str.AppendLine("<img src='../../image/project/" + reader["plan_image_profile"].ToString() + "' id='imgMains' alt='ภาพหลักโครงการ'  /></a></div></div>");

                        str.AppendLine("<div class='col-lg-12'><div class='ltn__img-slide-item-4'>");
                        str.AppendLine("<a href='../../image/project/" + reader["plan_img_path"].ToString() + "' id='imgPro" + reader.GetInt32(0) + "' data-rel='lightcase:myCollectionPro'>");
                        str.AppendLine("<img src='../../image/project/" + reader["plan_img_path"].ToString() + "' id='imgPro-" + reader.GetInt32(0) + "' alt='" + reader["plan_img_description"].ToString() + "'  /></a></div></div>");
                    }
                    else
                    {
                        str.AppendLine("<div class='col-lg-12'><div class='ltn__img-slide-item-4'>");
                        str.AppendLine("<a href='../../image/project/" + reader["plan_img_path"].ToString() + "' id='imgPro" + reader.GetInt32(0) + "' data-rel='lightcase:myCollectionPro'>");
                        str.AppendLine("<img src='../../image/project/" + reader["plan_img_path"].ToString() + "' id='imgPro-" + reader.GetInt32(0) + "' alt='" + reader["plan_img_description"].ToString() + "' /></a></div></div>");
                    }
                   
                }
            }
            return str.ToString();
        }

        //แสดงโครงการหน้าหลัก
        public string getListProductHome()
        {
            var db = new ConnectDB.DBClass();
            StringBuilder str = new StringBuilder();

            string sqltext = "SELECT "; 
            sqltext += " PJL.plan_type_id ";
            sqltext += " , pro_name ";
            sqltext += " , pType.pro_type_name ";
            sqltext += " , pLo.pro_location_id ";
            sqltext += " , pLo.pro_location_name ";
            sqltext += " , PJL.plan_name ";
            sqltext += " , PJL.plan_useable_area ";
            sqltext += " , PJL.plan_floor ";
            sqltext += " , PJL.plan_bed_room ";
            sqltext += " , PJL.plan_bath_room ";
            sqltext += " , PJL.plan_multiFunction_room ";
            sqltext += " , PJL.plan_parking ";
            sqltext += " , PJL.plan_price ";
            sqltext += " , pS.pro_statusType_name ";
            sqltext += " , s.sale_firstName +' '+ s.sale_lastName as sale_fullName ";
            sqltext += " , s.sale_phone ";
            sqltext += " , s.sale_company "; 
            sqltext += " , PJL.plan_image_profile ";
            sqltext += " , PJL.plan_view "; 
            sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
            sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
            sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
            sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
            sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
            sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'A'                   ";
            sqltext += "   WHERE PJ.pro_status = 'N' ";

            SqlDataReader dr = db.GetSqlDataReader(sqltext);

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<div class='col-lg-12'>");
                    str.AppendLine("<div class='ltn__product-item ltn__product-item-4'>");
                    str.AppendLine("<div class='product-img'><a href='../project/project-details.aspx?id=" + dr["plan_type_id"].ToString() + "'><img src='../../image/project/" + dr["plan_image_profile"].ToString() + "' alt='" + dr["plan_type_id"].ToString() + "' /></a>");
                    if (dr["pro_statusType_name"].ToString() == "โครงการพร้อมอยู่")
                    {
                        str.AppendLine("<div class='product-badge'><ul><li class='sale-badge bg-green'>" + dr["pro_statusType_name"].ToString() + "</li></ul></div>");
                    }
                    else
                    {
                        str.AppendLine("<div class='product-badge'><ul><li class='sale-badge'>" + dr["pro_statusType_name"].ToString() + "</li></ul></div>");
                    }
                    str.AppendLine("<div class='product-img-location-gallery'><div class=''><ul><li><h5 style='color:#fff;'><i class='fas fa-eye'></i> " + dr["plan_view"].ToString() + "</h5></li></ul></div></div></div>");
                    str.AppendLine("<div class='product-info'><div class='product-price'><span>" + Convert.ToDouble(dr["plan_price"].ToString()).ToString("N2") + "<label>&nbsp;/บาท</label></span></div>");
                    str.AppendLine("<h2 class='product-title'><a href='../project/project-details.aspx?id="+ dr["plan_type_id"].ToString() +"'>" + dr["pro_name"].ToString() + "</a></h2>");
                    str.AppendLine("<div class='product-description'>" + dr["pro_type_name"].ToString() + " : " + dr["plan_type_id"].ToString() + " " + dr["plan_name"].ToString() + "</div>");
                    str.AppendLine("<ul class='ltn__list-item-2 ltn__list-item-2-before'>");
                    str.AppendLine("<li><span>" + dr["plan_bed_room"].ToString() + " ห้องนอน <i class='flaticon-bed'></i></span></li>");
                    str.AppendLine("<li><span>" + dr["plan_bath_room"].ToString() + " ห้องน้ำ <i class='flaticon-clean'></i></span></li>");
                    str.AppendLine("<li><span>" + dr["plan_useable_area"].ToString() + " <i class='flaticon-square-shape-design-interface-tool-symbol'></i></span></li>");
                    str.AppendLine("</ul></div>");
                    str.AppendLine("<div class='product-info-bottom'><div class='real-estate-agent'>");
                    str.AppendLine("<div class='agent-brief'><h6>" + dr["sale_fullName"].ToString() + "</h6><small>" + dr["sale_company"].ToString() + "</small></div></div>");
                    str.AppendLine("<div class='product-hover-action'><ul><li style='width: 100px;'><a href='tel:" + dr["sale_phone"].ToString() + "' title='ติดต่อตัวแทนขาย'><i class='fas fa-phone'>&nbsp;โทร</i></a></li></ul>");
                    str.AppendLine("</div></div></div></div>");
                }
            }
            return str.ToString();
        }

    }
}