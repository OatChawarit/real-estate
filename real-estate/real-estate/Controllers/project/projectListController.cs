using real_estate.ConnectDB;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace real_estate.Controllers.project
{
    public class projectListController : ApiController
    {
        // GET: api/projectList
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/projectList/5
        public string Get(string jsonData, string types)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "listProject")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "SELECT ";
                sqltext += "	  PJL.plan_type_id                   ";
                sqltext += "      , pro_name                         ";
                sqltext += "      , pType.pro_type_name	             ";
                sqltext += "	  , pLo.pro_location_id              ";
                sqltext += "	  , pLo.pro_location_name            ";
                sqltext += "	  , PJL.plan_name                    "; 
                sqltext += "      , PJL.plan_useable_area            ";
                sqltext += "      , PJL.plan_floor                   ";
                sqltext += "      , PJL.plan_bed_room                ";
                sqltext += "      , PJL.plan_bath_room               "; 
                sqltext += "      , PJL.plan_multiFunction_room      ";
                sqltext += "      , PJL.plan_parking                 ";
                sqltext += "      , PJL.plan_price                   ";
                sqltext += "      , pS.pro_statusType_name           ";
                sqltext += "      , s.sale_firstName +' '+ s.sale_lastName as sale_fullName        ";
                sqltext += "      , s.sale_phone                                                   ";
                sqltext += "      , s.sale_company                   ";
                sqltext += "      , PJL.plan_image_profile                                         "; 

                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'N'                   ";


                sqltext += "   WHERE PJ.pro_status = 'N' ";
                 
                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());
                    }
                    arr.Add(result);
                }
                rs = JsonConvert.SerializeObject(arr);
            }
            else if (types == "getProject")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "";
                sqltext += "";

                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());
                    }
                    arr.Add(result);
                }
                rs = JsonConvert.SerializeObject(arr);
            }
            else if (types == "getPlanType_ImgTransaction")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "  SELECT                                                          ";
                sqltext += " 		[plan_img_id]                                             ";
                sqltext += "       ,[plan_img_path]                                           ";
                sqltext += "       ,[plan_img_description]                                    ";
                sqltext += "       ,[plan_type_id]                                            ";

                sqltext += "   FROM [realestate].[dbo].[re_PlanType_ImgTransaction] a         ";

                sqltext += "   WHERE a.plan_type_id = '"+ stuff.plan_type_id + "'             ";

                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());
                    }
                    arr.Add(result);
                }
                rs = JsonConvert.SerializeObject(arr);
            } 
            else if (types == "listProjectDetails")
            {             

                SqlDataReader dr;
                string sqltext = "";
                sqltext += "SELECT ";
                sqltext += "	  PJL.plan_type_id                   ";
                sqltext += "      , pro_name                         ";
                sqltext += "      , pType.pro_type_name	             ";
                sqltext += "	  , pLo.pro_location_id              ";
                sqltext += "	  , pLo.pro_location_name            ";
                sqltext += "	  , PJL.plan_name                    ";
                sqltext += "      , PJL.plan_useable_area            ";
                sqltext += "      , PJL.plan_floor                   ";
                sqltext += "      , PJL.plan_bed_room                ";
                sqltext += "      , PJL.plan_bath_room               ";
                sqltext += "      , PJL.plan_multiFunction_room      ";
                sqltext += "      , PJL.plan_parking                 ";
                sqltext += "      , PJL.plan_price                   ";
                sqltext += "      , pS.pro_statusType_name           ";
                sqltext += "      , s.sale_firstName +' '+ s.sale_lastName as sale_fullName        ";
                sqltext += "      , s.sale_phone                  ";
                sqltext += "      , s.sale_line                  ";
                sqltext += "      , s.sale_mail                  ";
                sqltext += "      , s.sale_company               ";
                sqltext += "      , PJL.plan_image_profile                  ";
                sqltext += "      , PJ.create_date                  ";
                sqltext += "      , PJ.pro_LinkGoogleMap                  "; 
                 sqltext += "	  , PJL.promotion_discount_percent                   ";
                sqltext += "      , PJL.promotion_giftVoucher_price                  ";
                sqltext += "      , PJL.promotion_discount_transferDate              ";
                sqltext += "      , PJL.promotion_publicServicefeeYear_free          ";
                sqltext += "      , PJL.promotion_IsElectricMeter_free               ";
                sqltext += "      , PJL.promotion_IsWaterMeter_free                  ";
                sqltext += "      , PJL.promotion_airConditioner_free                ";
                sqltext += "      , PJL.promotion_airConditioner_remark              ";
                sqltext += "      , PJL.promotion_other                              ";
                sqltext += "      , PJL.facilities_IsLift                            ";
                sqltext += "      , PJL.facilities_IsParking                         ";
                sqltext += "      , PJL.facilities_IsFitness                         ";
                sqltext += "      , PJL.facilities_IsSecuritySystem                  ";
                sqltext += "      , PJL.facilities_IsClubHouse                       ";
                sqltext += "      , PJL.facilities_IsLaunDry                         ";
                sqltext += "      , PJL.facilities_IsCCTV                            ";
                sqltext += "      , PJL.facilities_IsCoWorkingSpace                  ";
                sqltext += "      , PJL.facilities_IsSwimmingPool                    ";
                sqltext += "      , PJL.facilities_IsParks                           ";
                sqltext += "      , PJL.facilities_IsRoofGarden                      ";
                sqltext += "      , PJL.facilities_IsKeyCard                         ";
                sqltext += "      , PJL.facilities_IsNearBySkyTrain                  "; 
                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'N'                   ";
                sqltext += "   WHERE PJ.pro_status = 'N' ";
                sqltext += "      AND PJL.plan_type_id = '" + stuff.plan_type_id + "'       ";

                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    { 
                            result.Add(dr.GetName(i), dr[i].ToString());
                         
                    }
                    arr.Add(result);
                } 

                 rs = JsonConvert.SerializeObject(arr);
            }
            else if (types == "getSaleId")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT [sale_id]   ,[user_id]               ";
                sqltext += "        FROM [realestate].[dbo].[re_SaleTable] a    ";
                sqltext += "        WHERE a.sale_status = 'N'                   ";
                sqltext += "        AND a.user_id = '"+ stuff.user_id +"'                   ";


                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());
                    }
                    arr.Add(result);
                }
                rs = JsonConvert.SerializeObject(arr);
            }
            else
            {
                rs = "ไม่ข้อมูล";
            }

            return rs;
        }

        public class Project_Result
        {
            public string data { get; set; }
        }

        // POST: api/projectList 
        public string Post(Project_Result value)
        {
            dynamic stuff = JsonConvert.DeserializeObject(value.data.ToString());
            string types = Request.Headers.GetValues("types").FirstOrDefault().ToString();
            var db = new DBClass();
            string rs = "";

            if (types == "listProjectDetails") 
            { 
                SqlDataReader dr;
                string sqltext = ""; 
                sqltext += "SELECT ";
                sqltext += "	  PJL.plan_type_id                   ";
                sqltext += "      , pro_name                         ";
                sqltext += "      , pType.pro_type_name	             ";
                sqltext += "	  , pLo.pro_location_id              ";
                sqltext += "	  , pLo.pro_location_name            ";
                sqltext += "	  , PJL.plan_name                    ";
                sqltext += "      , PJL.plan_useable_area            ";
                sqltext += "      , PJL.plan_floor                   ";
                sqltext += "      , PJL.plan_bed_room                ";
                sqltext += "      , PJL.plan_bath_room               ";
                sqltext += "      , PJL.plan_multiFunction_room      ";
                sqltext += "      , PJL.plan_parking                 ";
                sqltext += "      , PJL.plan_price                   ";
                sqltext += "      , pS.pro_statusType_name           ";
                sqltext += "      , s.sale_firstName +' '+ s.sale_lastName as sale_fullName        ";
                sqltext += "      , s.sale_phone                                                   ";
                sqltext += "      , PJL.plan_image_profile                                         ";
                sqltext += "	  , PJL.promotion_discount_percent                   ";
                sqltext += "      , PJL.promotion_giftVoucher_price                  ";
                sqltext += "      , PJL.promotion_discount_transferDate              ";
                sqltext += "      , PJL.promotion_publicServicefeeYear_free          ";
                sqltext += "      , PJL.promotion_IsElectricMeter_free               ";
                sqltext += "      , PJL.promotion_IsWaterMeter_free                  ";
                sqltext += "      , PJL.promotion_airConditioner_free                ";
                sqltext += "      , PJL.promotion_airConditioner_remark              ";
                sqltext += "      , PJL.promotion_other                              ";
                sqltext += "      , PJL.facilities_IsLift                            ";
                sqltext += "      , PJL.facilities_IsParking                         ";
                sqltext += "      , PJL.facilities_IsFitness                         ";
                sqltext += "      , PJL.facilities_IsSecuritySystem                  ";
                sqltext += "      , PJL.facilities_IsClubHouse                       ";
                sqltext += "      , PJL.facilities_IsLaunDry                         ";
                sqltext += "      , PJL.facilities_IsCCTV                            ";
                sqltext += "      , PJL.facilities_IsCoWorkingSpace                  ";
                sqltext += "      , PJL.facilities_IsSwimmingPool                    ";
                sqltext += "      , PJL.facilities_IsParks                           ";
                sqltext += "      , PJL.facilities_IsRoofGarden                      ";
                sqltext += "      , PJL.facilities_IsKeyCard                         ";
                sqltext += "      , PJL.facilities_IsNearBySkyTrain                  ";
                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'N'                   ";
                sqltext += "   WHERE PJ.pro_status = 'N' ";
                sqltext += "      AND PJL.plan_type_id = '" + stuff.plan_type_id + "'       ";

                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());

                    }
                    arr.Add(result);
                }
                 
                rs = JsonConvert.SerializeObject(arr);



            }
            else if (types == "Test") 
            {
              

            }
          


            return rs;
        }

        // PUT: api/projectList/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/projectList/5
        public void Delete(int id)
        {
        }
    }
}
