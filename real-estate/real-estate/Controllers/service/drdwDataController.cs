using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using real_estate.ConnectDB;


namespace real_estate.Controllers.service
{
    public class drdwDataController : ApiController
    {
        // GET: api/drdwData
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/drdwData/5
        public string Get(string id, string types)
        {
            string rs = "";
            var db = new DBClass();

            if (types == "District")
            {
                string strsql = "";
                strsql += " SELECT district_id, district_name, province_id";
                strsql += " FROM realestate..sa_AddressDistrict Where province_id = '" + id + "'";
                strsql += " Order By district_name Asc";

                SqlDataReader dr;
                dr = db.GetSqlDataReader(strsql);
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
            else if (types == "SubDistrict")
            {
                string strsql = "";
                strsql += " SELECT  [sub_district_id] ,[sub_district_name] , [district_id] ";
                strsql += " FROM [realestate].[dbo].[sa_AddressSubDistrict] ";
                strsql += " Where [district_id] = '" + id + "' ";
                strsql += " Order By sub_district_id Asc";

                SqlDataReader dr;
                dr = db.GetSqlDataReader(strsql);
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

        // POST: api/drdwData
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/drdwData/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/drdwData/5
        public void Delete(int id)
        {
        }
    }
}
