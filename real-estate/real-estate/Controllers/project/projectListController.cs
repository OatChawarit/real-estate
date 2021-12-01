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

                sqltext += "   FROM [realestate].[dbo].[re_ProjectTable] PJ  ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_PlanType] PJL ON PJL.pro_id = PJ.pro_id ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Type_Table]  pType ON pType.pro_type_id = PJ.pro_type_id   ";
                sqltext += "   INNER JOIN [realestate].[dbo].[re_Project_Location_Table] pLo ON pLo.pro_location_id = PJ.pro_location_id ";
                sqltext += "   INNER JOIN realestate..re_Project_StatusType pS ON pS.pro_statusType_id = PJ.pro_statusType_id          "; 

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
            else
            {
                rs = "ไม่ข้อมูล";
            }

            return rs;
        }

        // POST: api/projectList
        public void Post([FromBody]string value)
        {
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
