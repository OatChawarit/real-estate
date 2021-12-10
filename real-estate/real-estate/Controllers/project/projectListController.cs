using real_estate.ConnectDB;
using real_estate.ClassData;
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
using System.IO;
using System.Web;
  

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
                sqltext += "      , PJ.pro_statusType_id, pS.pro_statusType_name           ";
                sqltext += "      , s.sale_firstName +' '+ s.sale_lastName as sale_fullName        ";
                sqltext += "      , s.sale_phone                                                   ";
                sqltext += "      , s.sale_company                   ";
                sqltext += "      , PJL.plan_image_profile, PJL.plan_view                          ";

                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'A'                   ";


                sqltext += "   WHERE PJ.pro_status = 'N' ";

                sqltext += "  ORDER BY  PJL.plan_view DESC";

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

                sqltext += "   WHERE a.plan_type_id = '" + stuff.plan_type_id + "'             ";

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
                sqltext += "      , PJL.plan_view                                    ";
                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'A'                   ";
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
                sqltext += "        WHERE a.sale_status = 'A'                   ";
                sqltext += "        AND a.user_id = '" + stuff.user_id + "'                   ";


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
            else if (types == "listProjectTableBysale")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT   a.pro_id        , b.com_name     , a.pro_name                                            ";
                sqltext += "                ,c.pro_type_name , d.pro_location_name     , e.pro_statusType_name                        ";

                sqltext += "                ,a.pro_status                                                     ";
                sqltext += "  FROM [realestate].[dbo].[re_ProjectTable] a                                                             ";
                sqltext += "  INNER JOIN realestate..re_CompanyTable b ON a.pro_company_id = b.com_id                                 ";
                sqltext += "  INNER JOIN realestate..re_Project_Type_Table c ON c.pro_type_id = a.pro_type_id                         ";
                sqltext += "  INNER JOIN realestate..re_Project_Location_Table d ON d.pro_location_id = a.pro_location_id             ";
                sqltext += "  INNER JOIN [realestate].[dbo].[re_Project_StatusType] e ON e.pro_statusType_id = a.pro_statusType_id    ";

                sqltext += "  WHERE a.sale_id = '" + stuff.sale_id + "'                                                               ";
                sqltext += "  ORDER BY a.pro_id    desc                                                                               ";




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
            else if (types == "listTopicByProID")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT   pj.pro_id , ct.com_name , pj.pro_name , ty.pro_type_name                                 ";
                sqltext += "               	, lo.pro_location_name , st.pro_statusType_name                   ";

                sqltext += "  FROM [realestate].[dbo].[re_ProjectTable] PJ                                                           ";
                sqltext += "  INNER JOIN realestate..re_CompanyTable ct ON ct.com_id = PJ.pro_company_id                             ";
                sqltext += "  INNER JOIN realestate..re_Project_Type_Table ty ON ty.pro_type_id = pj.pro_type_id                      ";
                sqltext += "  INNER JOIN realestate..re_Project_Location_Table lo ON lo.pro_location_id = pj.pro_location_id            ";
                sqltext += "  INNER JOIN realestate..re_Project_StatusType st ON st.pro_statusType_id = pj.pro_statusType_id   ";

                sqltext += "  WHERE PJ.pro_id  = '" + stuff.pro_id + "'                                                               ";





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
            else if (types == "listPlanTable")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT   pro_id , plan_type_id    ,plan_name    ,plan_useable_area    ,plan_floor                                ";
                sqltext += "               	,plan_bed_room    ,plan_bath_room   ,plan_multiFunction_room   ,plan_parking                  ";
                sqltext += "               	 ,format( plan_price , 'N2' ) as plan_price   ,plan_status    ,plan_view         , create_by                                            ";
                sqltext += "  FROM realestate.dbo.re_Project_PlanType                                                          ";
                sqltext += "  WHERE pro_id  = '" + stuff.pro_id + "'   AND  create_by = '" + stuff.sale_id + "'                                                           ";






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
            else if (types == "getCustomerInformation")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT   a.[user_id] ,a.[user_firstName]  ,a.[user_lastName]                         ";
                sqltext += "               	,b.cus_idCard , b.cus_phone                                                  ";

                sqltext += "  FROM [realestate].[dbo].[sa_user] a                                                         ";
                sqltext += "  LEFT JOIN realestate..re_CustomerTable b ON a.user_id = b.user_id                           ";

                sqltext += "  WHERE a.user_id  = '" + stuff.user_id + "'                                                 ";



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
            else if (types == "getProjectInformation")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT  b.plan_type_id , a.pro_id 	, a.pro_name , a.pro_type_id                       ";
                sqltext += "               , c.pro_type_name ,b.plan_name , d.pro_location_name , FORMAT( b.plan_price , 'N2') as plan_price                       ";
                sqltext += "  , e.com_name , f.sale_company , f.sale_phone , f.sale_mail  , f.sale_firstName +' '+ f.sale_lastName +' ['+f.sale_id+']' as sale_fullName                  ";

                sqltext += "  FROM [realestate].[dbo].[re_ProjectTable] a                        ";
                sqltext += "   inner join  realestate..re_Project_PlanType b ON a.pro_id = b.pro_id                           ";
                sqltext += "  INNER JOIN realestate..re_Project_Type_Table c ON c.pro_type_id = a.pro_type_id                          ";
                sqltext += "  INNER JOIN realestate..re_Project_Location_Table d ON d.pro_location_id = a.pro_location_id                         ";
                sqltext += "   INNER JOIN realestate..re_CompanyTable e ON e.com_id = a.pro_company_id                        ";
                sqltext += "   INNER JOIN realestate..re_SaleTable f ON f.sale_id = a.sale_id                         ";

                sqltext += "  WHERE b.plan_type_id  = '" + stuff.plan_type_id + "'                                      ";


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
            else if (types == "listBookingCustomer")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT  a.[book_id] , format(a.[create_date], 'dd/MM/yyyy') as 	create_date, a.book_firstName +' ' + a.book_lastName as book_fullName                                  ";
                sqltext += "              , c.pro_id , c.pro_name , b.plan_type_id , b.plan_name , d.pro_type_name , FORMAT( b.plan_price , 'N2' ) as plan_price         ";
                sqltext += "              , c.sale_id , e.sale_firstName +' '+ e.sale_lastName as sale_fullName     , e.sale_phone , a.book_status                       "; 
                sqltext += "  FROM [realestate].[dbo].[re_Project_Booking] a                                                                                         ";
                sqltext += "  INNER JOIN realestate..re_Project_PlanType b ON a.plan_type_id = b.plan_type_id                                                       ";
                sqltext += "  INNER JOIN realestate..re_ProjectTable c ON c.pro_id = b.pro_id                                                                       ";
                sqltext += "  INNER JOIN realestate..re_Project_Type_Table d ON d.pro_type_id = c.pro_type_id                                                       ";
                sqltext += "  INNER JOIN realestate..re_SaleTable e ON e.sale_id = c.sale_id                                                             "; 

                sqltext += "  WHERE a.user_id  = '" + stuff.user_id + "'                                      ";


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

            else if (types == "getView")
            {
                SqlDataReader dr;
                string sqltext = "  SELECT  [plan_view] + 1      as      plan_view                       ";
                sqltext += "        FROM [realestate].[dbo].[re_Project_PlanType]       ";  
                sqltext += "  WHERE  plan_type_id  = '" + stuff.plan_type_id + "'          "; 

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
        public string Post(Project_Result value ) 
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
                sqltext += "      , PJL.plan_view                                    ";
                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'A'                   ";
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
            else if (types == "addProject") 
            {
                string pid = PrefixID.RunPrefixID("gen_projectId", "Add");

                StringBuilder sqlInsert = new StringBuilder();
                sqlInsert.Clear();
                sqlInsert.Append("INSERT INTO [realestate].[dbo].[re_ProjectTable] ( ");
                sqlInsert.AppendLine("       [pro_id]                      ");
                sqlInsert.AppendLine("     ,[sale_id]                      ");
                sqlInsert.AppendLine("     ,[pro_company_id]               ");
                sqlInsert.AppendLine("     ,[pro_name]                     ");
                sqlInsert.AppendLine("     ,[pro_description]              ");
                sqlInsert.AppendLine("     ,[pro_type_id]                  ");
                sqlInsert.AppendLine("     ,[pro_location_id]              ");
                sqlInsert.AppendLine("     ,[pro_total_area]               ");
                sqlInsert.AppendLine("     ,[pro_land_area]                ");
                sqlInsert.AppendLine("     ,[pro_usable_area]              ");
                sqlInsert.AppendLine("     ,[pro_unit]                     ");
                sqlInsert.AppendLine("     ,[pro_opening_price]            ");
                sqlInsert.AppendLine("     ,[pro_opening_date]             ");
                sqlInsert.AppendLine("     ,[pro_address]                  ");
                sqlInsert.AppendLine("     ,[pro_sub_district_id]          ");
                sqlInsert.AppendLine("     ,[pro_district_id]              ");
                sqlInsert.AppendLine("     ,[pro_province_id]              ");
                sqlInsert.AppendLine("     ,[pro_postal_code]              ");
                sqlInsert.AppendLine("     ,[pro_LinkGoogleMap]            ");
                sqlInsert.AppendLine("     ,[pro_bank_name]                ");
                sqlInsert.AppendLine("     ,[pro_bank_branchName]          ");
                sqlInsert.AppendLine("     ,[pro_bank_number]              ");
                sqlInsert.AppendLine("     ,[create_date]                  ");
                sqlInsert.AppendLine("     ,[create_by]                    ");
                sqlInsert.AppendLine("     ,[pro_status]                   ");
                sqlInsert.AppendLine("     ,[pro_statusType_id]            ");
                sqlInsert.AppendLine("     ,[pro_bank_qrCodeImg]           ");
                sqlInsert.AppendLine(" )                                ");
                sqlInsert.AppendLine(" VALUES (                         ");
                sqlInsert.AppendLine(" '" + pid + "',                   ");
                sqlInsert.AppendLine(" '" + stuff.sale_id + "',         ");
                sqlInsert.AppendLine(" '" + stuff.pro_company_id + "',              ");
                sqlInsert.AppendLine(" '" + stuff.pro_name + "',                    ");
                sqlInsert.AppendLine(" '" + stuff.pro_description + "',             ");
                sqlInsert.AppendLine(" '" + stuff.pro_type_id + "',                 ");
                sqlInsert.AppendLine(" '" + stuff.pro_location_id + "',             ");
                sqlInsert.AppendLine(" '" + stuff.pro_total_area + "',              ");
                sqlInsert.AppendLine(" '" + stuff.pro_land_area + "',               ");
                sqlInsert.AppendLine(" '" + stuff.pro_usable_area + "',             ");
                sqlInsert.AppendLine(" '" + stuff.pro_unit + "',                    ");
                sqlInsert.AppendLine(" '" + stuff.pro_opening_price + "',           ");
                sqlInsert.AppendLine(" '" + stuff.pro_opening_date + "',            ");
                sqlInsert.AppendLine(" '" + stuff.pro_address + "',                 ");
                sqlInsert.AppendLine(" '" + stuff.pro_sub_district_id + "',         ");
                sqlInsert.AppendLine(" '" + stuff.pro_district_id + "',             ");
                sqlInsert.AppendLine(" '" + stuff.pro_province_id + "',             ");
                sqlInsert.AppendLine(" '" + stuff.pro_postal_code + "',             ");
                sqlInsert.AppendLine(" '" + stuff.pro_LinkGoogleMap + "',           ");
                sqlInsert.AppendLine(" '" + stuff.pro_bank_name + "',               ");
                sqlInsert.AppendLine(" '" + stuff.pro_bank_branchName + "',         ");
                sqlInsert.AppendLine(" '" + stuff.pro_bank_number + "',             ");
                sqlInsert.AppendLine(" getdate(),                                   ");
                sqlInsert.AppendLine(" '" + stuff.sale_id + "',                     ");
                sqlInsert.AppendLine(" 'N' ,                                        ");
                sqlInsert.AppendLine(" '" + stuff.pro_statusType_id + "' ,          ");
                sqlInsert.AppendLine(" '" + stuff.pro_bank_qrCodeImg + "'           ");
                sqlInsert.AppendLine(" ) ");

                try
                {
                    db.SqlExecute(sqlInsert.ToString());

                    rs = "success";

                    //rs = sqlInsert.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }


            }
            else if (types == "addProjectPlan")
            {
                string planId = PrefixID.RunPrefixID("gen_planId", "Add");

                dynamic arr = JsonConvert.DeserializeObject(stuff.plan_img_seq.ToString());

                rs = "success";

                StringBuilder sqlInsert = new StringBuilder();
                sqlInsert.Clear();
                sqlInsert.Append("INSERT INTO [realestate].[dbo].[re_Project_PlanType] ( ");
                sqlInsert.AppendLine("       [plan_type_id]                         ");
                sqlInsert.AppendLine("     ,[pro_id]                                ");
                sqlInsert.AppendLine("     ,[plan_name]                             ");
                sqlInsert.AppendLine("     ,[plan_useable_area]                     ");
                sqlInsert.AppendLine("     ,[plan_floor]                            ");
                sqlInsert.AppendLine("     ,[plan_bed_room]                         ");
                sqlInsert.AppendLine("     ,[plan_bath_room]                        ");
                sqlInsert.AppendLine("     ,[plan_multiFunction_room]               ");
                sqlInsert.AppendLine("     ,[plan_parking]                          ");
                sqlInsert.AppendLine("     ,[plan_price]                            ");
                sqlInsert.AppendLine("     ,[promotion_discount_percent]            ");
                sqlInsert.AppendLine("     ,[promotion_giftVoucher_price]            ");
                sqlInsert.AppendLine("     ,[promotion_discount_transferDate]        ");
                sqlInsert.AppendLine("     ,[promotion_publicServicefeeYear_free]   ");
                sqlInsert.AppendLine("     ,[promotion_IsElectricMeter_free]          ");
                sqlInsert.AppendLine("     ,[promotion_IsWaterMeter_free]              ");
                sqlInsert.AppendLine("     ,[promotion_airConditioner_free]          ");
                sqlInsert.AppendLine("     ,[promotion_airConditioner_remark]       ");
                sqlInsert.AppendLine("     ,[promotion_other]                       ");
                sqlInsert.AppendLine("     ,[facilities_IsLift]                     ");
                sqlInsert.AppendLine("     ,[facilities_IsParking]                  ");
                sqlInsert.AppendLine("     ,[facilities_IsFitness]                   ");
                sqlInsert.AppendLine("     ,[facilities_IsSecuritySystem]            ");
                sqlInsert.AppendLine("     ,[facilities_IsClubHouse]                 ");
                sqlInsert.AppendLine("     ,[facilities_IsLaunDry]                   ");
                sqlInsert.AppendLine("     ,[facilities_IsCCTV]                      ");
                sqlInsert.AppendLine("     ,[facilities_IsCoWorkingSpace]           ");
                sqlInsert.AppendLine("     ,[facilities_IsSwimmingPool]             ");
                sqlInsert.AppendLine("     ,[facilities_IsParks]                    ");
                sqlInsert.AppendLine("     ,[facilities_IsRoofGarden]               ");
                sqlInsert.AppendLine("     ,[facilities_IsKeyCard]                  ");
                sqlInsert.AppendLine("     ,[facilities_IsNearBySkyTrain]           ");
                sqlInsert.AppendLine("     ,[create_date]                           ");
                sqlInsert.AppendLine("     ,[create_by]                             ");
                sqlInsert.AppendLine("     ,[plan_status]                           ");
                sqlInsert.AppendLine("     ,[plan_image_profile]                    ");
                sqlInsert.AppendLine("     ,[plan_view]                             ");

                sqlInsert.AppendLine(" )                                            ");
                sqlInsert.AppendLine(" VALUES (                                     ");
                sqlInsert.AppendLine(" '" + planId + "',                            ");
                sqlInsert.AppendLine(" '" + stuff.pro_id + "',                      ");
                sqlInsert.AppendLine(" '" + stuff.plan_name + "',                   ");
                sqlInsert.AppendLine(" '" + stuff.plan_useable_area + "',           ");
                sqlInsert.AppendLine(" '" + stuff.plan_floor + "',                  ");
                sqlInsert.AppendLine(" '" + stuff.plan_bed_room + "',               ");
                sqlInsert.AppendLine(" '" + stuff.plan_bath_room + "',              ");
                sqlInsert.AppendLine(" '" + stuff.plan_multiFunction_room + "',      ");
                sqlInsert.AppendLine(" '" + stuff.plan_parking + "',                ");
                sqlInsert.AppendLine(" '" + stuff.plan_price + "',                  ");

                sqlInsert.AppendLine(" '" + stuff.promotion_discount_percent + "',              ");
                sqlInsert.AppendLine(" '" + stuff.promotion_giftVoucher_price + "',             ");
                sqlInsert.AppendLine(" '" + stuff.promotion_discount_transferDate + "',         ");
                sqlInsert.AppendLine(" '" + stuff.promotion_publicServicefeeYear_free + "',     ");
                sqlInsert.AppendLine(" '" + stuff.promotion_IsElectricMeter_free + "',          ");
                sqlInsert.AppendLine(" '" + stuff.promotion_IsWaterMeter_free + "',             ");
                sqlInsert.AppendLine(" '" + stuff.promotion_airConditioner_free + "',           ");
                sqlInsert.AppendLine(" '" + stuff.promotion_airConditioner_remark + "',         ");
                sqlInsert.AppendLine(" '" + stuff.promotion_other + "',                         ");

                sqlInsert.AppendLine(" '" + stuff.facilities_IsLift + "',                       ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsParking + "',                    ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsFitness + "',                    ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsSecuritySystem + "',             ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsClubHouse + "',                  ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsLaunDry + "',                    ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsCCTV + "',                       ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsCoWorkingSpace + "',             ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsSwimmingPool + "',               ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsParks + "',                      ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsRoofGarden + "',                 ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsKeyCard + "',                    ");
                sqlInsert.AppendLine(" '" + stuff.facilities_IsNearBySkyTrain + "',             ");
                sqlInsert.AppendLine("      getdate(),                                          ");
                sqlInsert.AppendLine(" '" + stuff.sale_id + "',                                 ");

                sqlInsert.AppendLine(" 'N' ,                                        ");
                sqlInsert.AppendLine(" '" + stuff.plan_image_profile + "' ,          ");
                sqlInsert.AppendLine(" 1           ");
                sqlInsert.AppendLine(" ) ");

                for (int i = 0; i < arr.Count; i++)
                {
                    StringBuilder sql_insertDT = new StringBuilder();
                    sql_insertDT.Append("INSERT INTO  [realestate].[dbo].[re_PlanType_ImgTransaction] (");                   
                    sql_insertDT.AppendLine(" plan_img_path,");
                    sql_insertDT.AppendLine(" [plan_type_id],");
                    sql_insertDT.AppendLine(" Create_by,");
                    sql_insertDT.AppendLine(" Create_date");
                    sql_insertDT.AppendLine(" ) VALUES ( ");                  
                    sql_insertDT.AppendLine("'" + arr[i].plan_img_seq + "',              ");
                    sql_insertDT.AppendLine(" '" + planId + "',                            ");
                    sql_insertDT.AppendLine(" '" + stuff.sale_id + "',                   ");
                    sql_insertDT.AppendLine(" getdate() ) ");        
                    try
                    {
                        db.SqlExecute(sql_insertDT.ToString());
                        //rs = sql_insertDT.ToString();
                    }
                    catch (SqlException ex) { rs = ex.ToString(); }
                }

                try
                {
                    db.SqlExecute(sqlInsert.ToString()); 

                    //rs = sqlInsert.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }


            }
            else if (types == "addBooking")
            {
                string bookId = PrefixID.RunPrefixID("gen_booking", "Add"); 

                StringBuilder sqlUpdate = new StringBuilder();
                sqlUpdate.Clear();
                sqlUpdate.Append(" UPDATE [realestate].[dbo].[re_CustomerTable] SET");
                sqlUpdate.AppendLine(" cus_firstName ='" + stuff.user_firstName + "' ,");
                sqlUpdate.AppendLine(" cus_lastName ='" + stuff.user_lastName + "' ,");
                sqlUpdate.AppendLine(" cus_idCard ='" + stuff.cus_idCard + "' ,");
                sqlUpdate.AppendLine(" cus_phone ='" + stuff.cus_phone + "' ,");
                sqlUpdate.AppendLine(" cus_address ='" + stuff.cus_address + "' ,");
                sqlUpdate.AppendLine(" cus_province_id ='" + stuff.cus_province_id + "' ,");
                sqlUpdate.AppendLine(" cus_district_id ='" + stuff.cus_district_id + "' ,");
                sqlUpdate.AppendLine(" cus_sub_district_id ='" + stuff.cus_sub_district_id + "' ,");
                sqlUpdate.AppendLine(" cus_postal_code ='" + stuff.cus_postal_code + "' ,"); 
                sqlUpdate.AppendLine(" cus_company_name ='" + stuff.cus_company_name + "'  ");
                sqlUpdate.AppendLine(" WHERE user_id='" + stuff.user_id +  "' ");

                StringBuilder sqlInsert = new StringBuilder();
                sqlInsert.Clear();
                sqlInsert.Append("INSERT INTO [realestate].[dbo].[re_Project_Booking] ( ");
                sqlInsert.AppendLine("      [book_id]                         ");
                sqlInsert.AppendLine("     ,[user_id]                         ");
                sqlInsert.AppendLine("     ,[plan_type_id]                    ");
                sqlInsert.AppendLine("     ,[book_firstName]                  ");
                sqlInsert.AppendLine("     ,[book_lastName]                    ");
                sqlInsert.AppendLine("      ,[book_type]                      ");
                sqlInsert.AppendLine("      ,[book_mail]                      ");
                sqlInsert.AppendLine("      ,[book_phone]                     ");
                sqlInsert.AppendLine("     ,[book_status]                        ");           
                sqlInsert.AppendLine("     ,[create_date]                           ");
                sqlInsert.AppendLine("     ,[create_by]                             ");  
                sqlInsert.AppendLine(" )                                            ");
                sqlInsert.AppendLine(" VALUES (                                     ");
                sqlInsert.AppendLine(" '" + bookId + "',                            ");          
                sqlInsert.AppendLine(" '" + stuff.user_id + "',                   ");
                sqlInsert.AppendLine(" '" + stuff.plan_type_id + "',           ");
                sqlInsert.AppendLine(" '" + stuff.book_firstName + "',                  ");
                sqlInsert.AppendLine(" '" + stuff.book_lastName + "',         ");
                sqlInsert.AppendLine(" '" + stuff.book_type + "',              ");
                sqlInsert.AppendLine(" '" + stuff.user_email + "',                ");
                sqlInsert.AppendLine(" '" + stuff.book_phone + "',                ");
                sqlInsert.AppendLine(" 'N' ,                                    "); 
             
                sqlInsert.AppendLine("      getdate(),                              ");
                sqlInsert.AppendLine(" '" + stuff.user_id + "'                      ");
 
                sqlInsert.AppendLine(" ) ");

                 
                try
                {
                    db.SqlExecute(sqlInsert.ToString());
                    db.SqlExecute(sqlUpdate.ToString());  
                    rs = "success";

                    //rs = sqlInsert.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }


            }
            else if (types == "updateView")
            {
                
                StringBuilder sqlUpdate = new StringBuilder();
                sqlUpdate.Clear();
                sqlUpdate.Append(" UPDATE [realestate].[dbo].[re_Project_PlanType] SET");
                sqlUpdate.AppendLine(" [plan_view] ='" + stuff.getView + "'  "); 
                sqlUpdate.AppendLine(" WHERE plan_type_id='" + stuff.plan_type_id + "' "); 

                try
                {                    
                    db.SqlExecute(sqlUpdate.ToString());
                    rs = "success";
                    //rs = sqlInsert.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }


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

        public static bool IsNullOrEmpty(String value)
        {
            return (value == null || value.Length == 0);
        }
    }
}
