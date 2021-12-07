using real_estate.ConnectDB;
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

namespace real_estate.Controllers.main
{
    public class userDataController : ApiController
    {
        // GET: api/userData
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/userData/5
        public string Get(string jsonData, string types)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "get_user")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext = " SELECT[user_id] ";
                sqltext += " ,[user_email] ";
                sqltext += " ,[user_password] ";
                sqltext += " ,[user_role_id] ";
                sqltext += " ,[user_status] ";
                sqltext += " ,[last_login] ";
                sqltext += " ,[user_image] ";
                sqltext += " ,[user_firstName] ";
                sqltext += " ,[user_lastName]  ";
                sqltext += "  FROM [realestate].[dbo].[sa_user] Order By user_id Asc ";
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
            else if (types == "get_customer")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "  SELECT[cus_id] ";
                sqltext += " ,[user_id] ";
                sqltext += " ,[cus_firstName] ";
                sqltext += " ,[cus_lastName] ";
                sqltext += " ,[cus_dateOfBirth] ";
                sqltext += " ,[cus_idCard] ";
                sqltext += " ,[cus_phone] ";
                sqltext += " ,[cus_status] ";
                sqltext += " FROM [realestate].[dbo].[re_CustomerTable] Order by cus_id asc ";
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

        // POST: api/userData
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/userData/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/userData/5
        public void Delete(int id)
        {
        }
    }
}
