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

        public string getProductDetail(string proid)
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
                        str.AppendLine("<img src='../../image/project/" + reader["plan_image_profile"].ToString() + "' id='imgMains' alt='ImageMain'  /></a></div></div>");

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
    }
}