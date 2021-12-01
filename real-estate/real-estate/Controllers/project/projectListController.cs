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
                sqltext += "SELECT pro_id, sale_id, pro_company_id, pro_name";
                sqltext += ", pro_description, pro_type_id, pro_location_id";
                sqltext += ", pro_total_area, pro_land_area, pro_usable_area";
                sqltext += ", pro_unit, pro_opening_price, pro_opening_date";
                sqltext += ", pro_address, pro_sub_district_id, pro_district_id";
                sqltext += ", pro_province_id, pro_postal_code, pro_LinkGoogleMap";
                sqltext += ", pro_bank_name, pro_bank_branchName, pro_bank_number";
                sqltext += ", create_date, create_by, update_date, update_by, pro_status";
                sqltext += " FROM realestate..re_ProjectTable Order by pro_id desc";

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
