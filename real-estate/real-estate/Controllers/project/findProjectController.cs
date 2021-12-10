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
    public class findProjectController : ApiController
    {
        // GET: api/findProject
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/findProject/5
        public string Get(string jsonData, string types)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "findProject")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "SELECT Top 3  ";
                sqltext += "  PJL.plan_type_id,  ";
                sqltext += "  pro_name,   ";
                sqltext += "  pType.pro_type_id,  ";
                sqltext += "  pType.pro_type_name,   ";
                sqltext += "  pLo.pro_location_id ,   ";
                sqltext += "  pLo.pro_location_name,   ";
                sqltext += "  PJL.plan_name ,   ";
                sqltext += "  PJL.plan_useable_area,   ";
                sqltext += "  PJL.plan_floor,   ";
                sqltext += "  PJL.plan_bed_room,   ";
                sqltext += "PJL.plan_bath_room,   ";
                sqltext += "  PJL.plan_multiFunction_room,  ";
                sqltext += "   PJL.plan_parking ,   ";
                sqltext += "   PJL.plan_price,   ";
                sqltext += "  pS.pro_statusType_id,   ";
                sqltext += "  pS.pro_statusType_name,   ";
                sqltext += "  s.sale_firstName + ' ' + s.sale_lastName as sale_fullName,   ";
                sqltext += "  s.sale_phone  ,  ";
                sqltext += "  s.sale_line  ,   ";
                sqltext += "  s.sale_mail  ,   ";
                sqltext += "  s.sale_company,   ";
                sqltext += "  PJL.plan_image_profile  ,  ";
                sqltext += "  PJL.plan_view,  ";
                sqltext += "  PJ.pro_province_id, PJ.pro_opening_date  ";
                sqltext += " FROM[realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += " INNER JOIN[realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id   ";
                sqltext += " INNER JOIN[realestate].[dbo].[re_Project_Type_Table] pType ON pType.pro_type_id = PJ.pro_type_id   ";
                sqltext += " INNER JOIN[realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id   ";
                sqltext += " INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id   ";
                sqltext += " INNER JOIN realestate..re_SaleTable s ON s.sale_id = PJ.sale_id AND s.sale_status = 'A'   ";
                sqltext += " WHERE PJ.pro_status = 'N' ";

                if (stuff.pro_province_id != "")
                {
                    sqltext += " AND PJ.pro_province_id = '" + stuff.pro_province_id + "' ";
                }
                else { }

                if (stuff.pro_location_id != "")
                {
                    sqltext += " AND pLo.pro_location_id = '" + stuff.pro_location_id + "' ";
                }
                else { }

                if (stuff.pro_type_id != "")
                {
                    sqltext += " AND pType.pro_type_id = '" + stuff.pro_type_id + "' ";
                }
                else { }

                if (stuff.pro_statusType_id != "")
                {
                    sqltext += " AND pS.pro_statusType_id = '" + stuff.pro_statusType_id + "' ";
                }
                else { }

                if (stuff.price_low != "" && stuff.price_hight != "")
                {
                    sqltext += " AND PJL.plan_price Between '" + stuff.price_low + "' And '" + stuff.price_hight + "' ";
                }
                else if (stuff.price_low != "" && stuff.price_hight == "")
                {
                    sqltext += " AND PJL.plan_price Between '0' And '" + stuff.price_low + "' ";
                }
                else if (stuff.price_low == "" && stuff.price_hight != "")
                {
                    sqltext += " AND PJL.plan_price Between '0' And '" + stuff.price_hight + "' ";
                }
                else { }
                sqltext += " Order by PJL.plan_view Desc ";
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
            else if (types == "AdminProject")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT [plan_type_id] ";
                sqltext += "  ,pt.[pro_name]  ";
                sqltext += "  ,pt.[pro_id], pt.[pro_unit]  ";
                sqltext += "  ,[plan_name]  ";
                sqltext += "  ,[plan_useable_area]  ";
                sqltext += "  ,[plan_price]  ";
                sqltext += "  ,[plan_status]  ";
                sqltext += "  ,[plan_image_profile]  ";
                sqltext += "  ,[plan_view], pt.pro_opening_date  ";
                sqltext += "  FROM [realestate].[dbo].[re_Project_PlanType] pp  ";
                sqltext += "  Inner Join [realestate].[dbo].[re_ProjectTable] pt On pp.pro_id=pt.pro_id Order by plan_type_id Asc ";
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
            else if (types == "AdminCancelProject")
            {
                string sqltext = "";
                sqltext += "  Update [realestate].[dbo].[re_Project_PlanType] Set  ";
                sqltext += "  plan_status='C',  ";
                sqltext += "  update_date=GETDATE(),  ";
                sqltext += "  update_by='" + stuff.username + "'  ";
                sqltext += "  Where plan_type_id='" + stuff.plan_type_id + "'  ";
                try
                {
                    db.SqlExecute(sqltext.ToString());
                    rs = "success";
                }
                catch (SqlException ex) { rs = ex.ToString(); }
            }
            else if (types == "AdminApproveProject")
            {
                string sqltext = "";
                sqltext += "  Update [realestate].[dbo].[re_Project_PlanType] Set  ";
                sqltext += "  plan_status='A',  ";
                sqltext += "  update_date=GETDATE(),  ";
                sqltext += "  update_by='" + stuff.username + "'  ";
                sqltext += "  Where plan_type_id='" + stuff.plan_type_id + "'  ";
                try
                {
                    db.SqlExecute(sqltext.ToString());
                    rs = "success";
                }
                catch (SqlException ex) { rs = ex.ToString(); }
            }
            else if (types == "AdminGetProject")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "SELECT ";
                sqltext += "	  PJL.plan_type_id                   ";
                sqltext += "      , pro_name , PJ.pro_id  , PJ.pro_unit      ";
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
                sqltext += "      , PJL.plan_view , PJ.pro_company_id, Comp.com_name      ";
                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id        ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id            ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_CompanyTable] Comp ON Comp.com_id = PJ.pro_company_id ";
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
            else
            {
                rs = "ระบบผิดพลาด ไม่สามารถเข้าถึงข้อมูลได้";
            }

            return rs;
        }

        // POST: api/findProject
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/findProject/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/findProject/5
        public void Delete(int id)
        {
        }
    }
}
